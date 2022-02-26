// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:youtube_u/models/data.dart';

import 'package:youtube_u/widgets/custom_sliver_appbar.dart';

import '../custom_widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = videos[index];
                  return VideoCard(video: video);
                },
                childCount: videos.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



























// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           CustomSliverAppBar(),
//           SliverPadding(
//             padding: EdgeInsets.only(bottom: 60.0),
//             sliver: SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   final video = videos[index];
//                   return VideoCard(video: video);
//                 },
//                 childCount: videos.length,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
