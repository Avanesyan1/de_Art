import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget Duty(context, String IconPath, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width / 1.2,
        child: Center(
          child: SvgPicture.asset(
            IconPath,
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 1.3,
        child: Text(
          text,
          overflow: TextOverflow.clip,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
    ],
  );
}
