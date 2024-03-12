import 'package:flutter/material.dart';

 class TopAppBar extends StatelessWidget {
   final VoidCallback? onBackTap;
  const TopAppBar({super.key, this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {onBackTap!();},
          child: Container(
            width: 40.0,
            height: 40.0,
            child: const Image(
                image: AssetImage(
              "assets/images/back_btn.png",
            )),
          ),
        ),
        Image(
            width: 45.0,
            height: 45.0,
            image: AssetImage(
              "assets/images/star_img.png",
            ))
      ],
    );
  }
}
