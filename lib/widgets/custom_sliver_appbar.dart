import 'package:flutter/material.dart';

import '../models/data.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 100.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset(
          'assets/images/yt_logo_dark.png',
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cast,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            foregroundImage: NetworkImage(
              currentUser.profileImageUrl,
            ),
          ),
        ),
      ],
    );
  }
}
