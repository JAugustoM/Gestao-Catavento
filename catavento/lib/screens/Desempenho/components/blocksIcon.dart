import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class BlocksIcon extends StatefulWidget {
  final String? title;
  final double? height;
  final double? width;
  final IconData icon;
  final double borderRadius;
  final Color color;
  final Widget child;

  BlocksIcon({
    this.title,
    this.height,
    this.width,
    this.borderRadius = 16.0,
    required this.icon,
    required this.color,
    required this.child,
  });

  @override
  State<BlocksIcon> createState() {
    return BlocksState();
  }
}

class BlocksState extends State<BlocksIcon> {
  @override
  Widget build(BuildContext context) {
    final double defaultHeight = MediaQuery.of(context).size.height * 0.75;
    final double defaultWidth = MediaQuery.of(context).size.width * 0.3;

    return Stack(
      children: [
        Container(
          height: widget.height ?? defaultHeight,
          width: widget.width ?? defaultWidth,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * widget.borderRadius)),
        ),
        if (widget.title != null)
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.icon, size: MediaQuery.of(context).size.width * 0.018, color: AppColors.blue,),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.005,),
                  Text(
                    widget.title!,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        color: AppColors.gradientDarkBlue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FredokaOne'),
                  ),
                ],
              )
               
            ),
          ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}