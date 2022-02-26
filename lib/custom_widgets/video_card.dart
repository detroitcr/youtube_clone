import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_u/Responsive/responsive_size.dart';
import 'package:youtube_u/custom_widgets/custom_text.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_u/screens/nav_screen.dart';
import '../models/data.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final bool hasPadding;
  final VoidCallback? onTap;
  const VideoCard({
    Key? key,
    required this.video,
    this.hasPadding = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        context.read(selectedVideoProvider).state = video;
        context
            .read(miniPlayerControllerProvider)
            .state
            .animateToHeight(state: PanelState.MAX);
        if (onTap != null) onTap!();
      },
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: hasPadding ? 12.0 : 0),
                child: Image.network(
                  video.thumbnailUrl,
                  height: SizeConfig.deviceHeight * 0.291,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8.0,
                right: hasPadding ? 20.0 : 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.black,
                  child: CrText(
                    text: video.duration,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    print('tap');
                  },
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(video.author.profileImageUrl),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.deviceWidth * 0.024,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: CrText(
                          text: video.title,
                          maxlines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 15.0,
                                  ),
                        ),
                      ),
                      Flexible(
                        child: CrText(
                          text:
                              '${video.author.username} * ${video.viewCount} views * ${timeago.format(video.timestamp)}',
                          maxlines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 14.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.more_vert, size: 20.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
