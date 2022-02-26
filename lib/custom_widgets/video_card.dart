import 'package:flutter/material.dart';
import 'package:youtube_u/custom_widgets/custom_text.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../models/data.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  const VideoCard({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              video.thumbnailUrl,
              height: 220.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
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
              const SizedBox(width: 8.0),
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
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
    );
  }
}
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
//                Container(
//                 padding: const EdgeInsets.all(4.0),
//                 color: Colors.black,
//                 child: CrText(
//                   text: video.duration,
//                   style: Theme.of(context).textTheme.caption!.copyWith(
//                         color: Colors.white,
//                       ),
//                 ),

//                 //  Text(
//                 //   video.duration,
//                 //   style: Theme.of(context)
//                 //       .textTheme
//                 //       .caption!
//                 //       .copyWith(color: Colors.white),
//                 // )
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       print('tap');
//                     },
//                     child: CircleAvatar(
//                       foregroundImage:
//                           NetworkImage(video.author.profileImageUrl),
//                     ),
//                   ),

//                   const SizedBox(
//                     width: 8.0,
//                   ),

//                   /// we use Expanded widget so renderflex is solverd
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Flexible(
//                           child: CrText(
//                             text: video.title,
//                             maxlines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style:
//                                 Theme.of(context).textTheme.bodyText1!.copyWith(
//                                       fontSize: 15.0,
//                                     ),
//                           ),
//                         ),
//                         Flexible(
//                           child: CrText(
//                             text:
//                                 '${video.author.username} * ${video.viewCount} views * ${timeago.format(video.timestamp)}',
//                             maxlines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style:
//                                 Theme.of(context).textTheme.caption!.copyWith(
//                                       fontSize: 14.0,
//                                     ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Icon(
//                       Icons.more_vert,
//                       size: 20.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
