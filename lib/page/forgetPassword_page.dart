
import 'package:de_art/main.dart';
import 'package:de_art/page/emailRegPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../palette.dart';

import 'application_Page.dart';
import 'menu_page.dart';

class ForgetpasswordPage extends StatefulWidget {
  const ForgetpasswordPage({super.key});

  @override
  State<ForgetpasswordPage> createState() => _ForgetpasswordPage();
}

bool page1 = true;
TextEditingController _emailController = TextEditingController();

class _ForgetpasswordPage extends State<ForgetpasswordPage> {

  @override
  void initState() {
    page1=true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(

          backgroundColor: Colors.white,
          leading:GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MenuPage(),
                  ),
                );
              },
              child: Container(
                  margin: const EdgeInsets.only(left: 12, top: 12),
                  height: 62,
                  child: SvgPicture.asset(
                    'assets/menu.svg',
                  ))),
          title: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MyHomePage(title: 'De Art 13',),
                  ),
                );
                },
                child: SizedBox(
                    height: 55,
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                    )),
              )),
          actions: [
            GestureDetector(

                onTap: (){   Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) =>
                        const ApplicationPage()));},
                child:Container(
                    height: 62,
                    margin: const EdgeInsets.only(right: 12, top: 12),
                    child: SvgPicture.asset(
                      'assets/call.svg',
                    )))
          ],
        )),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Divider(color: Palette().red),
        SingleChildScrollView(
          child:

          page1 ? Container(
              padding: const EdgeInsets.only(left: 15,right: 15, top:28),
              child:Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child:Text("Восстановление\nпароля",       style: TextStyle(
                fontSize: 30,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.start,),),
                Container(
                  height: 48,
                  margin: const EdgeInsets.only(top:10),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Palette().red,
                      width: 1,
                    ),
                  ),
                  child: Center(child:TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      counterText: "",
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  )),
                ),
                GestureDetector(
                    onTap: ()async{
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);
                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (BuildContext context) => emailRegPage(),
                                    
                                    //
                            ),
                          );
                      Fluttertoast.showToast(
                                    msg: "Пароль отправлен на ваш email",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                      } catch (e) {
                        Fluttertoast.showToast(
                                    msg: "Невернная почта",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                      }
                    },
                    child:Container(
                  height: 48,
                  margin: const EdgeInsets.only(top:12, bottom: 12),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
color: Palette().red,
                  ),
                  child: const Center(child:Text("Отправить пароль на email",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),
                )),
                TextButton(onPressed: ()async{

                }, child: const Text("Правила программы лояльности",
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),))

          ],))
              : Container(
              padding: const EdgeInsets.only(left: 15,right: 15, top:32),
              child:const Column(children: [
              ],))
        ),
      ],
    ),

    );
  }
}