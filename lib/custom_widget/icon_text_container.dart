import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget IconTextContainer(String iconPath, String text) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), border: Border.all(width: 1, color: Colors.black)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(
            iconPath,
          ),
        ),
        Text(text)
      ],
    ),
  );
}
