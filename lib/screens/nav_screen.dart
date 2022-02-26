import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';

import 'package:youtube_u/custom_widgets/custom_text.dart';
import 'package:youtube_u/screens/home_screen.dart';
import 'package:youtube_u/screens/video_screen.dart';

import '../models/data.dart';

//key to manage state
final selectedVideoProvider = StateProvider<Video?>((ref) => null);
// for mini player controller

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const double _playerMinHeight = 60.0;
  // for knowing which navigationbar we are
  int _selectedIndex = 0;
  final _screens = [
    HomeScreen(),
    const Scaffold(
      body: Center(
        child: CrText(text: 'Explore'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: CrText(text: 'Add'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: CrText(text: 'Subscription'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: CrText(text: 'Library'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(
          builder: (context, watch, _) {
            final miniPlayerController =
                watch(miniPlayerControllerProvider).state;
            final selectedVideo = watch(selectedVideoProvider).state;
            print(selectedVideo);
            return Stack(
              children: _screens
                  .asMap()
                  .map(
                    (i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: _selectedIndex != i,
                        child: screen,
                      ),
                    ),
                  )
                  .values
                  .toList()
                ..add(
                  Offstage(
                    offstage: selectedVideo == null,
                    child: Miniplayer(
                      controller: miniPlayerController,
                      minHeight: _playerMinHeight,
                      maxHeight: MediaQuery.of(context).size.height,
                      builder: (height, percentage) {
                        if (selectedVideo == null)
                          return const SizedBox.shrink();

                        if (height <= _playerMinHeight + 50.0)
                          return Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      selectedVideo.thumbnailUrl,
                                      height: _playerMinHeight - 4.0,
                                      width: 120.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              
                                              child: Text(
                                                selectedVideo.title,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
// Qestion why my custom widget show error bottom over flowed
                                              // CrText(
                                              //   text: selectedVideo.title,
                                              //   overflow: TextOverflow.ellipsis,
                                              //   style: Theme.of(context)
                                              //       .textTheme
                                              //       .caption!
                                              //       .copyWith(
                                              //         color: Colors.white,
                                              //         fontWeight:
                                              //             FontWeight.w500,
                                              //       ),
                                              // ),
                                            ),


                                            
                                            Flexible(
                                              child: CrText(
                                                text:
                                                    '${selectedVideo.author.username}',
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      //color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.play_arrow),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read(selectedVideoProvider)
                                            .state = null;
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                const LinearProgressIndicator(
                                  value: 0.4,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(Colors.red),
                                ),
                              ],
                            ),
                          );
                        return VideoScreen();
                      },
                    ),
                  ),
                ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          currentIndex: _selectedIndex,
          onTap: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
              activeIcon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_outlined,
              ),
              label: "Explore",
              activeIcon: Icon(
                Icons.explore,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
              ),
              label: "Add",
              activeIcon: Icon(
                Icons.add_circle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: "Subscription",
              activeIcon: Icon(
                Icons.subscriptions,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.video_library_outlined,
              ),
              label: "Library",
              activeIcon: Icon(
                Icons.video_library,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
