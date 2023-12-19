import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/domains/tutor/tutor.dart';
import 'package:lettutor/data/providers/favorite.provider.dart';
import 'package:lettutor/screen/tutors/book_tutor.dart';
import 'package:lettutor/screen/tutors/videoIntro.dart';
import 'package:lettutor/utils/country_convertor.dart';
import 'package:lettutor/widgets/dialog/feedback_dialog.dart';
import 'package:lettutor/widgets/dialog/report_dialog.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class TutorDetailScreen extends StatefulWidget {
  final Tutor tutor;
  const TutorDetailScreen({Key? key, required this.tutor}) : super(key: key);

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favouriteProvider = context.watch<FavoriteProvider>();
    var isInFavourite = favouriteProvider.itemIds.contains(widget.tutor.userId);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Tutor Detail',
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
                  child: Image.network(
                    widget.tutor.avatar != null
                        ? widget.tutor.avatar
                        : "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.tutor.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.tutor.country != null
                            ? convertFromCodeToName(widget.tutor.country)
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
                            ' (${widget.tutor.feedbacks.length.toString()})', // Assuming this represents a count or some additional text
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
                widget.tutor.bio,
                expandText: 'more',
                collapseText: 'less',
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
                      isInFavourite
                          ? favouriteProvider.remove(widget.tutor.userId)
                          : favouriteProvider.add(widget.tutor.userId);
                    },
                    icon: Icon(
                      isInFavourite ? Icons.favorite : Icons.favorite_border,
                      color: isInFavourite ? Colors.red : Colors.blueAccent,
                    ),
                  ),
                  Text(
                    'Favorite',
                    style: TextStyle(color: true ? Colors.red : Colors.blue),
                  )
                ]),
              )),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            FeedbackDialog(feedbacks: widget.tutor.feedbacks));
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.reviews_outlined, color: Colors.blue),
                      Text('Reviews', style: TextStyle(color: Colors.blue))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (context) => const ReportDialog(
                              name: 'Keegan',
                            ),
                          )
                        },
                    child: Column(
                      children: [
                        Icon(Icons.report_outlined, color: Colors.blue),
                        Text('Report', style: TextStyle(color: Colors.blue))
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
                ? Text('No Introduction Video',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ))
                : ChewieDemo(
                    linkVideo: widget.tutor.video,
                  ),
          ),
          const SizedBox(height: 8),
          Text(
            'Education',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 3, 0, 10),
            child: Text(
              widget.tutor.education,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.black),
            ),
          ),
          Text(
            'Languages',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 10),
            child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: List.generate(
                  widget.tutor.languages.length,
                  (index) => Chip(
                    backgroundColor: Colors.lightBlue[50],
                    label: Text(
                      widget.tutor.languages[index],
                      style: const TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                )),
          ),
          const SizedBox(height: 8),
          Text(
            'Specialties',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: List.generate(
                    widget.tutor.specialties.length,
                    (index) => Chip(
                          backgroundColor: Colors.lightBlue[50],
                          label: Text(
                            widget.tutor.specialties[index],
                            style: const TextStyle(
                                fontSize: 14, color: Colors.blue),
                          ),
                        ))),
          ),
          const SizedBox(height: 8),
          Text(
            'Teaching Experiences',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 8),
            child: Text(widget.tutor.experience,
                style: TextStyle(
                  fontSize: 14,
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 12),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(1),
                  padding: const EdgeInsets.all(20),
                  side: const BorderSide(color: Colors.blue, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius as needed
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.bookTutor);
                },
                child: const Text(
                  'Book This Tutor',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              )),
          Booking()
        ]),
      ),
    );
  }
}
