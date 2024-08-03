import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../palette.dart';
import '../service/api.dart';

class CreateReviewsPage extends StatefulWidget {
  const CreateReviewsPage({Key? key}) : super(key: key);

  @override
  State<CreateReviewsPage> createState() => _CreateReviewsPageState();
}
String selectedValue ="Профсоюзная" ;
//String? selectedValue ;
bool _showHotel=false;
TextEditingController _nameController=TextEditingController();
TextEditingController _reviewController=TextEditingController();
Color dropColor = Colors.black;
List<String>_hotel=["Профсоюзная","Таганская","Новокосино","Текстильщики","Кропоткинская","Авиамоторная"];
int stars=0;
bool _agree = false;
class _CreateReviewsPageState extends State<CreateReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.65),
      body: SingleChildScrollView(child: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child:Padding(
                  padding: const EdgeInsets.only(right: 30,top:48),
                  child:GestureDetector(
                      onTap: (){Navigator.pop(context);},
                      child:const Icon(Icons.cancel_outlined,size: 48,color: Colors.white,)))),
          Container(
            padding: const EdgeInsets.only(top:24,bottom: 24,right: 24,left:24 ),
            margin: const EdgeInsets.only(top:12,bottom: 12,right: 24,left:24 ),
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            width: MediaQuery.of(context).size.width-60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
         Container(
             padding: const EdgeInsets.only(left:12,right: 12,bottom: 12,top:12),
             margin: const EdgeInsets.only(bottom: 12,top: 32),
             width: MediaQuery.of(context).size.width/1.5,
             decoration: const BoxDecoration(
               border: Border(
                 bottom: BorderSide(
                     width: 1.0, color: Colors.black),
                 top: BorderSide(
                     width: 1.0, color: Colors.black),
                 left: BorderSide(
                     width: 1.0, color: Colors.black),
                 right: BorderSide(
                     width: 1.0, color: Colors.black),
               ),
             ),
             child:      Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   selectedValue,
                   style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                 ),
                 SizedBox(
                     width: 20,
                     child:
                   GestureDetector(child:const Icon(Icons.keyboard_arrow_down),onTap: (){
                     _showHotel=!_showHotel;
                     setState(() {

                     });
                   },)

                   /*DropdownButton<String>(
                   padding: EdgeInsets.zero,
                   style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                   dropdownColor: Palette().red,
                      focusColor: Colors.green,
                      // Step 3.
                      value: selectedValue,
                      // Step 4.
                      items: <String>["Профсоюзная","Таганская","Новокосино","Текстильщики"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                          ),
                        );
                      }).toList(),
                      // Step 5.
                      onChanged: (String? newValue) {
                        setState(() {

                          selectedValue = newValue!;
                        });
                      },
                    )*/),
               ],
             )),

                _showHotel?   Container(
                  margin: const EdgeInsets.only(bottom: 12),
                 width: MediaQuery.of(context).size.width/1.5,
                  decoration: BoxDecoration(
                    color: Palette().red,

                  ),
                  child: Column(
                    children: [
                      TextButton(onPressed: (){
                        selectedValue="Профсоюзная";
                        setState(() {

                        });

                      }, child:const Text(
                        "Профсоюзная",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                      TextButton(onPressed: (){
                        selectedValue="Таганская";
                        setState(() {

                        });

                      }, child:const Text(
                        "Таганская",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                      TextButton(onPressed: (){
                        selectedValue="Новокосино";
                        setState(() {

                        });

                      }, child:const Text(
                        "Новокосино",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                      TextButton(onPressed: (){
                        selectedValue="Текстильщики";
                        setState(() {

                        });

                      }, child:const Text(
                        "Текстильщики",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                      TextButton(onPressed: (){
                        selectedValue="Кропоткинская";
                        setState(() {

                        });

                      }, child:const Text(
                        "Кропоткинская",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                      TextButton(onPressed: (){
                        selectedValue="Авиамоторная";
                        setState(() {

                        });

                      }, child:const Text(
                        "Авиамоторная",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                    ],
                  ),

                ):Container(),



                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("  Ваше имя",style: TextStyle(fontWeight: FontWeight.bold)),),
                const SizedBox(height: 6,),
                Container(
                  padding: const EdgeInsets.only(left:12),
                  margin: const EdgeInsets.only(bottom: 12),
                  width: MediaQuery.of(context).size.width/1.5,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.black),
                      top: BorderSide(
                          width: 1.0, color: Colors.black),
                      left: BorderSide(
                          width: 1.0, color: Colors.black),
                      right: BorderSide(
                          width: 1.0, color: Colors.black),
                    ),
                  ),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                    hintText: "Иван Иванович",
                    isDense: true,
                    border: InputBorder.none, ),),
                ),

             const Padding(
                 padding: EdgeInsets.only(top:12,bottom: 12),
                 child:   Align(
                  alignment: Alignment.center,
                  child: Text("Оцените это место",style: TextStyle(fontWeight: FontWeight.bold)),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                 GestureDetector(
                     onTap:(){

                       stars=1;
                       setState(() {

                       });

                     },

                     child: stars>=1 ? SizedBox(
                         height: 40,
                         width: 40,
                         child:SvgPicture.asset(
                           'assets/goldStar.svg',
                         )): SizedBox(
                         height: 40,
                         width: 40,
                         child:SvgPicture.asset(
                           'assets/greyStar.svg',
                         ))),

                  GestureDetector(
                      onTap:(){

                        stars=2;
                        setState(() {

                        });

                      },

                      child: stars>=2 ? SizedBox(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/goldStar.svg',
                          )): SizedBox(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/greyStar.svg',
                          ))),
                  GestureDetector(
                      onTap:(){

                        stars=3;
                        setState(() {

                        });

                      },

                      child: stars>=3 ? SizedBox(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/goldStar.svg',
                          )): SizedBox(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/greyStar.svg',
                          ))),
                  GestureDetector(
                      onTap:(){

                        stars=4;
                        setState(() {

                        });

                      },

                      child: stars>=4 ? SizedBox(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/goldStar.svg',
                          )): SizedBox(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/greyStar.svg',
                          ))),
                  GestureDetector(
                      onTap:(){

                        stars=5;
                        setState(() {

                        });

                      },

                      child: stars>=5 ? SizedBox(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                        'assets/goldStar.svg',
                      )): SizedBox(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/greyStar.svg',
                          ))),
                 /* SvgPicture.asset(
                    'assets/greyStar.svg',
                  ),
                  SvgPicture.asset(
                    'assets/greyStar.svg',
                  ),
                  SvgPicture.asset(
                    'assets/greyStar.svg',
                  ),
                  SvgPicture.asset(
                    'assets/greyStar.svg',
                  )*/


                ],),

                Container(
                  margin: const EdgeInsets.only(top:24),
                  padding: const EdgeInsets.only(left:12),
                  width: MediaQuery.of(context).size.width/1.5,
                  height:MediaQuery.of(context).size.height/5,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.black),
                      top: BorderSide(
                          width: 1.0, color: Colors.black),
                      left: BorderSide(
                          width: 1.0, color: Colors.black),
                      right: BorderSide(
                          width: 1.0, color: Colors.black),
                    ),
                  ),
                  child: TextField(
controller: _reviewController ,
                    maxLines: 5,
                    decoration: const InputDecoration(
                    hintText: "Текст отзыва",
                    isDense: true,
                    border: InputBorder.none, ),),
                ),
               GestureDetector(
                   onTap: () async {
                     if (_agree!=true){
                       Fluttertoast.showToast(
                           msg: "Подтвердите согласие!",
                           toastLength:
                           Toast.LENGTH_SHORT,
                           gravity:
                           ToastGravity.CENTER,
                           timeInSecForIosWeb: 1,
                           backgroundColor:
                           Colors.red,
                           textColor: Colors.white,
                           fontSize: 16.0);
                     }else {
                       if((_nameController.text!="")&(_reviewController.text!=""))
                       {
                         String idSelectelHotel = "1";
if(    selectedValue=="Профсоюзная"){idSelectelHotel = "1";}
else if(   selectedValue=="Таганская"){idSelectelHotel = "4";}
else if(selectedValue=="Новокосино"){idSelectelHotel = "2";}
else if ( selectedValue=="Текстильщики"){idSelectelHotel = "5";}
else if(selectedValue =="Корпоткинская"){idSelectelHotel = "6";}
else if(selectedValue =="Авиамоторная"){idSelectelHotel = "7";}
                       var res=  await leave_review(idSelectelHotel.toString(),_nameController.text.toString(), _reviewController.text.toString());
if (res=="success"){Fluttertoast.showToast(
    msg: "Отзыв успешно отправлен!",
    toastLength:
    Toast.LENGTH_SHORT,
    gravity:
    ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor:
    Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);
Navigator.pop(context);}else {Fluttertoast.showToast(
    msg: "Отзыв не отправлен!",
    toastLength:
    Toast.LENGTH_SHORT,
    gravity:
    ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor:
    Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);
Navigator.pop(context);}
                       }else{

                         Fluttertoast.showToast(
                             msg: "Заполните данные!",
                             toastLength:
                             Toast.LENGTH_SHORT,
                             gravity:
                             ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                             backgroundColor:
                             Colors.red,
                             textColor: Colors.white,
                             fontSize: 16.0);
                       }
                     }
                   },
                   child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  margin: const EdgeInsets.only(top: 15, bottom: 15,),
                  padding: const EdgeInsets.only(top: 15, bottom: 15,left: 24,right: 24),
                  decoration: BoxDecoration(
                    color: Palette().red,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text("Оставить отзыв", style: TextStyle(color: Colors.white,fontSize: 16 , fontWeight:FontWeight.bold, ),textAlign: TextAlign.center,),

                )),
               Padding(
                   padding: const EdgeInsets.only(bottom: 32,),
                   child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap:(){_agree=!_agree;
                        setState(() {

                        });},
                        child:_agree?SvgPicture.asset(
                          'assets/agree.svg',
                        ): SvgPicture.asset(
                          'assets/disagree.svg',
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width/1.7,
                        child: RichText(
                            text: const TextSpan(children: [

                              TextSpan(
                                text:
                                'Я согласен ',
                                style:
                                TextStyle(fontSize: 13, color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                'политикой конфиденциальности и обработки персональных данных',
                                style:
                                TextStyle(fontSize: 13, color: Colors.black,decoration: TextDecoration.underline),
                              )
                            ]))),


                  ],)),





              ],
            ),
          )
        ],
      ),),
    );
  }
}
