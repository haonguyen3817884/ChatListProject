import 'package:flutter/material.dart';

class CustomerImage extends StatelessWidget {
  const CustomerImage(
      {Key? key,
      required this.customerImage,
      required this.customerImageHeight,
      required this.customerImageWidth,
      this.customerImageMargin = const EdgeInsets.all(0.0)})
      : super(key: key);

  final String customerImage;

  final double customerImageHeight;

  final double customerImageWidth;

  final EdgeInsets customerImageMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(customerImage),
            ),
            Positioned(
                bottom: 0,
                right: -1,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.4),
                        color: Colors.grey,
                        border: Border.all(
                            width: 1.5,
                            color: const Color(0xFFFFFFFF),
                            style: BorderStyle.solid)),
                    height: 17.4,
                    width: 17.4)),
          ],
        ),
        height: customerImageHeight,
        width: customerImageWidth,
        margin: customerImageMargin);
  }
}
