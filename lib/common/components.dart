import 'dart:ui';

import 'package:flutter/material.dart';
import 'constants.dart';

// buttons

// edit button
Widget xEditButton({required void Function() onPressed}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(small),
              side: BorderSide(color: lightColor2, width: 1.0))),
      child: Text(
        "Edit",
        style: themeData.textTheme.labelSmall!.copyWith(color: lightColor2),
      ));
}

// more
// glass bg effect
Widget xGlassBgEffect({double? height, double? width, required Widget child}){
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        color: themeData.scaffoldBackgroundColor.withOpacity(0.8),
        width: width,
        height: height,
        child: child
      ),
    ),
  );
}