import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget HowToGet(context, String IconPath, String textBold, String text,) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        IconPath,
      ),
      Container(
        width: MediaQuery.of(context).size.width / 1.3,
        child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: textBold,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextSpan(
                text:
                text,
                style:
                TextStyle(fontSize: 16, color: Colors.black),
              )
            ]))
      ),
    ],
  );
}
