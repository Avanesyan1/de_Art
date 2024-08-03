import 'package:flutter/cupertino.dart';

Widget RedButton(Color _color,String _text,Color _textColor, double _sizeText, FontWeight _weightText,){
  return Container(
    padding: EdgeInsets.only(top: 15, bottom: 15,left: 24,right: 24),
    decoration: BoxDecoration(
      color: _color,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Text(_text, style: TextStyle(color: _textColor,fontSize: _sizeText , fontWeight:_weightText),),

  );
}