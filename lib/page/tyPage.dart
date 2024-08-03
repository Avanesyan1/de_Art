import 'package:de_art/palette.dart';
import 'package:flutter/material.dart';

class TyPage extends StatefulWidget {
  const TyPage({Key? key}) : super(key: key);

  @override
  State<TyPage> createState() => _TyPageState();
}

class _TyPageState extends State<TyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.65),
      body: SingleChildScrollView(child: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child:Padding(
                  padding: EdgeInsets.only(right: 30,top:48),
                  child:GestureDetector(
                      onTap: (){Navigator.pop(context);},
                      child:Icon(Icons.cancel_outlined,size: 48,color: Colors.white,)))),
          Container(
            padding: EdgeInsets.only(top:24,bottom: 24,right: 24,left:24 ),
            margin: EdgeInsets.only(top:12,bottom: 12,right: 24,left:24 ),
            decoration: BoxDecoration(
                color: Colors.white
            ),
            width: MediaQuery.of(context).size.width-60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Padding(

                  padding:EdgeInsets.only(bottom: 12),
                  child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Спасибо!",style: TextStyle(fontWeight: FontWeight.bold,color: Palette().red,fontSize: 18)),)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Ваше сообщение успешно отправлено, с Вами свяжутся в ближайшее время.",style: TextStyle(fontWeight: FontWeight.bold)),),





              ],
            ),
          )
        ],
      ),),
    );
  }
}
