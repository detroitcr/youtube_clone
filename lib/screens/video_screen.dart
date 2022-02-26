import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_u/custom_widgets/video_card.dart';
import 'package:youtube_u/custom_widgets/video_info.dart';
import 'package:youtube_u/models/data.dart';
import 'package:youtube_u/screens/nav_screen.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          context
              .read(miniPlayerControllerProvider)
              .state
              .animateToHeight(state: PanelState.MAX);
        },
        child: Scaffold(
          body: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CustomScrollView(
              controller: _scrollController,
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: Consumer(
                    builder: (context, watch, _) {
                      final selectedVideo = watch(selectedVideoProvider).state;
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                selectedVideo!.thumbnailUrl,
                                height: 220.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read(miniPlayerControllerProvider)
                                      .state
                                      .animateToHeight(state: PanelState.MIN);
                                },
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 30.0,
                              ),
                            ],
                          ),
                          const LinearProgressIndicator(
                            value: 0.4,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                          VideoInfo(
                            video: selectedVideo,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final video = suggestedVideos[index];
                      return VideoCard(
                        video: video,
                        hasPadding: true,
                        onTap: () {
                          _scrollController!.animateTo(
                            0,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                      );
                    },
                    childCount: suggestedVideos.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
