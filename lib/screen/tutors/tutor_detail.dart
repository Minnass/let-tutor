import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/widgets/dialog/book_tutor_dialog.dart';
import 'package:lettutor/widgets/dialog/report_dialog.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class TutorDetailScreen extends StatefulWidget {
  const TutorDetailScreen({super.key});

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(Uri.parse(
            'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4')
        .toString());

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    'https://tse2.mm.bing.net/th?id=OIP.iMnXKOix_JvmgbMnjr7tbAHaFO&pid=Api&P=0&h=180',
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Bidden',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      Text(
                        'American',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Row(children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const Icon(Icons.star, color: Colors.amber),
                        const Icon(Icons.star, color: Colors.amber),
                        const Icon(Icons.star, color: Colors.amber),
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 1),
                        Text('(60)', style: const TextStyle(fontSize: 14))
                      ])
                    ]),
              ))
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ExpandableText(
                'Hello, my name is David, I specialize in Software Engineering. Nice to meet you, have a good day, Goodbye',
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
                  true
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.blue,
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
                    Navigator.pushNamed(context, Routes.review);
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
                            builder: (context) => const BookTutorDialog(
                                // name: 'Keegan',
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
            child: true
                ? Text('No Introduction Video',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ))
                : Chewie(controller: _chewieController),
          ),
          const SizedBox(height: 8),
          Text(
            'Languages',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(spacing: 8, runSpacing: 4, children: [
              Chip(
                backgroundColor: Colors.lightBlue[50],
                label: Text(
                  'English',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
              Chip(
                backgroundColor: Colors.lightBlue[50],
                label: Text(
                  'English for kid',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
              Chip(
                backgroundColor: Colors.lightBlue[50],
                label: Text(
                  'IELTS',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
              Chip(
                backgroundColor: Colors.lightBlue[50],
                label: Text(
                  'TOEIC',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              )
            ]),
          ),
          const SizedBox(height: 8),
          Text(
            'Specialties',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(spacing: 8, runSpacing: 4, children: [
              Chip(
                backgroundColor: Colors.lightBlue[50],
                label: Text(
                  'English',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
              Chip(
                backgroundColor: Colors.lightBlue[50],
                label: Text(
                  'English for kid',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
              Chip(
                backgroundColor: Colors.lightBlue[50],
                label: Text(
                  'IELTS',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
              Chip(
                backgroundColor: Colors.lightBlue[50],
                label: Text(
                  'TOEIC',
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              )
            ]),
          ),
          const SizedBox(height: 8),
          Text(
            'Specialties',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                      'Caring for Our Planet - A very long and detailed text that should be limited with ellipsis if it exceeds the available space.',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Detail',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    'Life in the Internet Age',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 15),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Detail',
                      style: TextStyle(fontSize: 12),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  'Caring for Our Planet',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(width: 16),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Detail',
                      style: TextStyle(fontSize: 12),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Interests',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 8),
            child: Text('No interests',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          ),
          const SizedBox(height: 12),
          Text(
            'Teaching Experiences',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 8),
            child: Text('No teaching experiences',
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
              ))
        ]),
      ),
    );
  }
}
