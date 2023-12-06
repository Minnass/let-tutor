import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/models/tutor/tutor.dart';
import 'package:lettutor/providers/favorite.provider.dart';
import 'package:lettutor/screen/tutors/tutor_detail.dart';
import 'package:provider/provider.dart';

class TutorSearchCard extends StatefulWidget {
  final Tutor tutor;
  const TutorSearchCard({Key? key, required this.tutor}) : super(key: key);

  @override
  State<TutorSearchCard> createState() => _TutorSearchCardState();
}

class _TutorSearchCardState extends State<TutorSearchCard> {
  @override
  Widget build(BuildContext context) {
    FavoriteProvider favouriteRepository = context.watch<FavoriteProvider>();
    var isInfavourite =
        favouriteRepository.itemIds.contains(widget.tutor.userId);
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TutorDetailScreen(
                  tutor: widget.tutor,
                ))),
      },
      child: Card(
        elevation: 3.0,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        widget.tutor.avatar != null
                            ? widget.tutor.avatar
                            : "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.error_outline_rounded,
                          color: Colors.red,
                          size: 32,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${widget.tutor.name ?? ''}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                SvgPicture.network(
                                  widget.tutor.country != null
                                      ? "https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.4.3/flags/4x3/" +
                                          widget.tutor.country
                                              .toString()
                                              .toLowerCase() +
                                          ".svg"
                                      : "https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.4.3/flags/4x3/ph.svg", // Replace with the path to your SVG file
                                  width: 16, // Adjust the width as needed
                                  height: 16, // Adjust the height as needed
                                ),
                                const SizedBox(width: 8),
                                Text('${widget.tutor.country}',
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: List.generate(
                                (widget.tutor.rating ?? 0)
                                    .toInt(), // Casting widget.tutor.rating to int
                                (index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        isInfavourite
                            ? favouriteRepository.remove(widget.tutor.userId)
                            : favouriteRepository.add(widget.tutor.userId);
                      },
                      icon: Icon(
                        isInfavourite ? Icons.favorite : Icons.favorite_border,
                        color: isInfavourite ? Colors.red : Colors.blueAccent,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 8,
                    runSpacing: 3,
                    children: List.generate(
                      widget.tutor.specialties.length,
                      (index) => Chip(
                        backgroundColor: Colors.lightBlue[50],
                        label: Text(
                          widget.tutor.specialties[index],
                          style:
                              const TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ),
                    )),
                const SizedBox(height: 8),
                Text(
                  '${widget.tutor.bio}',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    // ... (other widgets)
                    Spacer(), // This pushes the TextButton to the right
                    TextButton(
                      onPressed: () {
                        print('Hello');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.schedule),
                          const SizedBox(width: 8),
                          Text('Book'),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
