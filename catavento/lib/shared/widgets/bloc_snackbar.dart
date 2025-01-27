import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void showBlocSnackbar(
  BuildContext context,
  String message, {
  bool postFrameCallBack = true,
}) {
  if (postFrameCallBack) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
