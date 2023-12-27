import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:lettutor/data/network/apis/tutor/response/tutor_pagination.response.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/favorite.provider.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/screen/tutors/book_tutor.dart';
import 'package:lettutor/screen/tutors/videoIntro.dart';
import 'package:lettutor/utils/country_convertor.dart';
import 'package:lettutor/utils/first_character.dart';
import 'package:lettutor/widgets/dialog/feedback_dialog.dart';
import 'package:lettutor/widgets/dialog/report_dialog.dart';
import 'package:provider/provider.dart';

class TutorDetailScreen extends StatefulWidget {
  TutorResponse tutor;
  TutorDetailScreen({Key? key, required this.tutor}) : super(key: key);

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  late LanguageProvider languageProvider;
  @override
  Widget build(BuildContext context) {
    FavoriteProvider favouriteRepository = context.watch<FavoriteProvider>();
    var isInfavourite = favouriteRepository.itemIds.contains(widget.tutor.id);
    languageProvider = context.watch<LanguageProvider>();
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text(
          languageProvider.language.tutorDetails,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                width: 72,
                height: 72,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: widget.tutor.avatar != null
                    ? Image.network(
                        widget.tutor.avatar!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.error_outline_rounded,
                          color: Colors.red,
                          size: 32,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 50,
                        child: Text(
                          getFirstCharacters(widget.tutor.name),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.tutor.name ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.tutor.country != null
                            ? convertFromCodeToName(widget.tutor.country!)
                            : '',
                        style: const TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          ...List.generate(
                            (widget.tutor.rating ?? 0).toInt(),
                            (index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                          ),
                          Text(
                            ' (${widget.tutor.feedbacks?.length.toString()})', // Assuming this represents a count or some additional text
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ]),
              ))
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ExpandableText(
                widget.tutor.bio ?? '',
                expandText: languageProvider.language.more,
                collapseText: languageProvider.language.less,
                maxLines: 2,
                linkColor: Colors.blue,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              )),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                onPressed: () => {},
                child: Column(children: [
                  IconButton(
                    onPressed: () {
                      isInfavourite
                          ? favouriteRepository.remove(widget.tutor.id!)
                          : favouriteRepository.add(widget.tutor.id!);
                    },
                    icon: Icon(
                      isInfavourite ? Icons.favorite : Icons.favorite_border,
                      color: isInfavourite ? Colors.red : Colors.blueAccent,
                    ),
                  ),
                  Text(
                    languageProvider.language.favorite,
                    style: TextStyle(color: true ? Colors.red : Colors.blue),
                  )
                ]),
              )),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => FeedbackDialog(
                            feedbacks: widget.tutor.feedbacks ?? []));
                  },
                  child: Column(
                    children: [
                      Icon(Icons.reviews_outlined, color: Colors.blue),
                      Text(languageProvider.language.review,
                          style: TextStyle(color: Colors.blue))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (context) => ReportDialog(
                              name: widget.tutor.name ?? '',
                            ),
                          )
                        },
                    child: Column(
                      children: [
                        Icon(Icons.report_outlined, color: Colors.blue),
                        Text(languageProvider.language.report,
                            style: TextStyle(color: Colors.blue))
                      ],
                    )),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            height: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: widget.tutor.video == null
                ? Text(languageProvider.language.noVideo,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ))
                : ChewieDemo(
                    linkVideo: widget.tutor.video!,
                  ),
          ),
          const SizedBox(height: 8),
          Text(
            languageProvider.language.education,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 3, 0, 10),
            child: Text(
              widget.tutor.education ?? '',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),
          Text(
            languageProvider.language.language,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 10),
            child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: List.generate(
                  widget.tutor.languages?.length ?? 0,
                  (index) => Chip(
                    backgroundColor: Colors.lightBlue[50],
                    label: Text(
                      widget.tutor.languages?[index] ?? '',
                      style: const TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                )),
          ),
          const SizedBox(height: 8),
          Text(
            languageProvider.language.specialties,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: List.generate(
                    widget.tutor.specialties?.length ?? 0,
                    (index) => Chip(
                          backgroundColor: Colors.lightBlue[50],
                          label: Text(
                            widget.tutor.specialties?[index] ?? '',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.blue),
                          ),
                        ))),
          ),
          const SizedBox(height: 8),
          Text(
            languageProvider.language.experience,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 8),
            child: Text(widget.tutor.experience ?? '',
                style: TextStyle(
                  fontSize: 14,
                )),
          ),
          Booking()
        ]),
      ),
    );
  }
}
