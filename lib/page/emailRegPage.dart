
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:de_art/main.dart';
import 'package:de_art/page/forgetPassword_page.dart';
import 'package:de_art/page/visitPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../palette.dart';

import '../service/global.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class emailRegPage extends StatefulWidget {
  const emailRegPage({super.key});

  @override
  State<emailRegPage> createState() => _emailRegPageState();
}

bool _isActive= true;
bool page1 = true;
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

TextEditingController _pass1 = TextEditingController();
TextEditingController _pass2 = TextEditingController();
TextEditingController _pass3 = TextEditingController();
TextEditingController _pass4 = TextEditingController();
TextEditingController _pass5 = TextEditingController();
TextEditingController _pass6 = TextEditingController();

FocusNode _focus1 = FocusNode();
FocusNode _focus2 = FocusNode();
FocusNode _focus3 = FocusNode();
FocusNode _focus4 = FocusNode();
FocusNode _focus5 = FocusNode();
FocusNode _focus6 = FocusNode();

class _emailRegPageState extends State<emailRegPage> {

  @override
  void initState() {
    page1=true;
    _passwordController.clear();
    super.initState();
    _loadEmail;
  }

  

  _loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
    });
  }

  _saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', _emailController.text);
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
              child:Text("Добро\nпожаловать!",       style: TextStyle(
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
                Container(
                  height: 48,
                  margin: const EdgeInsets.only(top:15),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Palette().red,
                      width: 1,
                    ),
                  ),
                  child: Center(child:TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      counterText: "",
                      hintText: "Пароль",
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Center(child: Text('Пароль должен состоять минимум из 6 символов',style: TextStyle(fontSize: 12),)),
                ),

                GestureDetector(
                    onTap: ()async{
                       try {
                          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          User? user = userCredential.user;
                          if (user != null) {
                            _saveEmail;
                          }
                        } catch (e) {
                          if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
                            try {
                              UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              User? user = userCredential.user;
                              if (user != null) {
                                _saveEmail;
                              }
                            } catch (signInError) {
                                Fluttertoast.showToast(
                                    msg: "Неверный email или пароль",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              return;
                            }
                          } else {
                             Fluttertoast.showToast(
                                    msg: "Неверный email или пароль",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                            return;
                          }
                        }
                          myInfo = _emailController.text;
                          List<String> ph = [];
                          QuerySnapshot qSnap = await FirebaseFirestore.instance.collection('visits').get();
                          int documents = qSnap.docs.length;

                          for (var i = 0; i < documents; i++) {
                            ph.add(qSnap.docs[i].id.toString());
                          }

                          if (ph.contains(myInfo)) {
                            int phoneIndex = 0;
                            phoneIndex = ph.indexOf(myInfo);
                            await FirebaseFirestore.instance.collection("visits").get().then((snapshot) {
                              myPhoneVisits = snapshot.docs[phoneIndex].get('visit').toString();
                            });
                          } else {
                            myPhoneVisits = '0';
                          }

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                            return const VisitPage();
                          }));
                        },
                       
                    child:Container(
                  height: 48,
                  margin: const EdgeInsets.only(top:12, bottom: 12),
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
color: Palette().red,
                  ),
                  child: const Center(child:Text("Войти",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),
                )),
                
                TextButton(onPressed: ()async{

                }, child: const Text("Правила программы лояльности",
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),)),
                  TextButton(onPressed: ()async{
                   Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) =>
                        const ForgetpasswordPage()));

                }, child: const Text("Не помню пароль",
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),)),

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