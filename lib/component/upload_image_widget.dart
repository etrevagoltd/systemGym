// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class UploadImageWidget extends StatelessWidget {
  double radius;
  double circleWidth, circleHeight;
  double smallCircleWidth, smallCircleHeight;
  String bacImage;
  UploadImageWidget(
      {super.key,
      this.radius = 47,
      this.circleWidth = 94,
      this.circleHeight = 94,
      this.smallCircleHeight = 46,
      this.smallCircleWidth = 46,
      this.bacImage = 'assets/images/black_avatar.png'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: circleWidth,
      height: circleHeight,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(bacImage),
            radius: radius,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: smallCircleHeight,
              width: smallCircleWidth,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: darkGrey,
              ),
              child: Image.asset(
                'assets/images/camera.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
