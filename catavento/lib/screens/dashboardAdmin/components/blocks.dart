import 'package:flutter/material.dart';

class Blocks extends StatefulWidget {
  final String? title;
  final double? height;
  final double? width;
  final double borderRadius;
  final Color color;
  final Widget child;

  Blocks({
    this.title,
    this.height,
    this.width,
    this.borderRadius = 16.0,
    required this.color,
    required this.child,
  });

  @override
  State<Blocks> createState() {
    return BlocksState();
  }
}

class BlocksState extends State<Blocks> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double blockWidth = widget.width ?? screenWidth * 0.9;
    double blockHeight = widget.height ?? screenHeight * 0.5;

    return Stack(
      children: [
        Container(
          width: blockWidth,
          height: blockHeight,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(widget.borderRadius)),
        ),
        if (widget.title != null)
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                widget.title!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
