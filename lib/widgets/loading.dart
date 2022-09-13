import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promethean/utils/unitls.dart';

class LoadingScreen {
  @override
  void loading(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.focusColor),
          );
        });
  }
}
