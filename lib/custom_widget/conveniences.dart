import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget Conveniences(context, String IconPath, String text) {
  return Row(
    children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SvgPicture.asset(
            IconPath,
          ),
        ),
      Container(
        width: MediaQuery.of(context).size.width / 1.3,
        child: Text(
          text,
          overflow: TextOverflow.clip,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
