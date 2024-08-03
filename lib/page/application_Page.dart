import 'package:de_art/custom_widget/phone.dart';
import 'package:de_art/page/tyPage.dart';
import 'package:de_art/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../custom_widget/footer.dart';
import '../service/api.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

TextEditingController _nameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _messageController = TextEditingController();
final PhoneDialer phoneDialer = PhoneDialer();

bool _agree = false;
class _ApplicationPageState extends State<ApplicationPage> {

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
                      onTap: (){
                        Navigator.pop(context);
                      },
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Ваше имя",style: TextStyle(fontWeight: FontWeight.bold)),),
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Номер телефона",style: TextStyle(fontWeight: FontWeight.bold)),),
                Container(
                  padding: const EdgeInsets.only(left:12),
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
keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    decoration: const InputDecoration(
                    hintText: "+7 999 999 99 99",
                    isDense: true,
                    border: InputBorder.none, ),),
                ),
                Container(
                  padding: const EdgeInsets.only(left:12),
                  margin: const EdgeInsets.only(top:24),
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
                    controller: _messageController,
                    decoration: const InputDecoration(
                    hintText: "Комментарий",
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
                     if((_nameController.text!="")&(_phoneController.text!=""))
                     {

                       var res=  await recall(_nameController.text.toString(),_phoneController.text.toString(), _messageController.text.toString());
                       if (res=="success"){
                         Navigator.pop(context);
                       Navigator.of(context).push(PageRouteBuilder(
                           opaque: false,
                           pageBuilder: (BuildContext context, _, __) =>
                               const TyPage()));
                       }
                       else {Fluttertoast.showToast(
                           msg: "Запрос не отправлен!",
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

                 /*  Navigator.pop(context);
                   Navigator.of(context).push(PageRouteBuilder(
                       opaque: false,
                       pageBuilder: (BuildContext context, _, __) =>
                           TyPage()));*/
                 },
                 child:   Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  margin: const EdgeInsets.only(top: 15, bottom: 15,),
                  padding: const EdgeInsets.only(top: 15, bottom: 15,left: 24,right: 24),
                  decoration: BoxDecoration(
                    color: Palette().red,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text("Оставить заявку", style: TextStyle(color: Colors.white,fontSize: 16 , fontWeight:FontWeight.bold, ),textAlign: TextAlign.center,),

                )),
                Row(
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


                  ],),

                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(
                         children: [
                           const Icon(Icons.call,size: 16,),
                           TextButton(
                           onPressed: (){
                             phoneDialer.launchPhoneDialer('+79252883313');
                           },
                           child: const Text(
                           
                           "+7(925)-288-33-13",
                           overflow: TextOverflow.clip,
                           style: TextStyle(color: Colors.black,fontSize: 12),
                         )),
                           ]
                       ),
                      
                       Row(
                         children: [
                           const Icon(Icons.call,size: 16,),
                           TextButton(
                           onPressed: (){
                             phoneDialer.launchPhoneDialer('+7(499)-178-10-68');
                           },
                           child: const Text(
                           "+7(499)-178-10-68",
                           overflow: TextOverflow.clip,
                           style: TextStyle(color: Colors.black,fontSize: 12),
                                             )),
                         ]
                                             )
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    GestureDetector(
                        onTap:(){URL_VIBER();},
                        child:SvgPicture.asset(
                          'assets/redWa.svg',
                        )),
                    const Spacer(flex: 1),
                    GestureDetector(
                        onTap:(){URL_TG();},
                        child:SvgPicture.asset(
                          'assets/redTg.svg',
                        )),
                    const Spacer(flex: 1),
                    GestureDetector(
                        onTap:(){URL_WA();},
                        child: SvgPicture.asset(
                          'assets/redViber.svg',
                        )),
                    const Spacer(flex: 1),
                    GestureDetector(
                        onTap:(){URL_VK();},
                        child:SvgPicture.asset(
                          'assets/redVk.svg',
                        )),

                  ],
                ),



              ],
            ),
          )
        ],
      ),),
    );
  }
}
