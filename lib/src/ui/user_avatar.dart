import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const UserAvatar(
      {super.key,
      required this.imageUrl,
      this.width = 100.0,
      this.height = 100.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
            child: FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
