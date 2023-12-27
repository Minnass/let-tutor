import 'dart:io';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoIntroductionStep extends StatefulWidget {
  const VideoIntroductionStep(
      {Key? key, required this.onPressPrevious, required this.onPressDone})
      : super(key: key);
  final onPressPrevious;
  final onPressDone;

  @override
  _VideoIntroductionStepState createState() => _VideoIntroductionStepState();
}

class _VideoIntroductionStepState extends State<VideoIntroductionStep> {
  late LanguageProvider languageProvider;
  VideoPlayerController? videoController;
  bool isSending = false;
  String videoPath = '';
  bool isPicked = false;
  Future<void>? initializeVideoPlayerFuture;
  final ImagePicker picker = ImagePicker();
  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/become_tutor/video_introduction_step.svg',
              height: 80,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageProvider.language.videoSetup,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ExpandableText(
                    languageProvider.language.videoHint,
                    expandText: languageProvider.language.more,
                    collapseText: languageProvider.language.less,
                    maxLines: 2,
                    linkColor: Colors.blue,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(children: [
          const Expanded(child: Divider()),
          const SizedBox(
            width: 4,
          ),
          Text(
            languageProvider.language.videoIntroduction,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 4,
          ),
          const Expanded(child: Divider()),
        ]),
        const SizedBox(
          height: 16,
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFE6F7FF),
                border: Border.all(width: 1, color: Colors.blue),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageProvider.language.tipTitle,
                  style: TextStyle(fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageProvider.language.firstStep,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        languageProvider.language.secondStep,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        languageProvider.language.thirdStep,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        languageProvider.language.fourthStep,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        languageProvider.language.fifthStep,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 16,
        ),
        Center(
            child: Card(
                child: (initializeVideoPlayerFuture != null)
                    ? FutureBuilder(
                        future: initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: videoController!.value.aspectRatio,
                              child: VideoPlayer(videoController!),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })
                    : Container())),
        const SizedBox(
          height: 32,
        ),
        Card(
          color: Colors.blue,
          child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () async {
                final XFile? video =
                    await picker.pickVideo(source: ImageSource.gallery);
                if (video != null) {
                  videoPath = video.path;
                  setState(() {
                    // TutorRegisteringProvider.of(context).videoPath = video.path;
                    videoController =
                        VideoPlayerController.file(File(video.path));
                    initializeVideoPlayerFuture = videoController?.initialize();
                    videoController?.setLooping(true);
                    videoController?.play();
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      languageProvider.language.chooseVideo,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue), // Border color
              ),
              child: Text(languageProvider.language.previous),
              onPressed: () {
                widget.onPressPrevious();
              },
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue), // Border color
              ),
              child: Text(languageProvider.language.done),
              onPressed: () {
                if (videoPath.isNotEmpty) {
                  setState(() {
                    isSending = true;
                  });
                  widget.onPressDone(videoPath);
                }
              },
            ),
          ],
        ),
        isSending
            ? const Center(child: CircularProgressIndicator(color: Colors.blue))
            : Container()
      ],
    );
  }
}
