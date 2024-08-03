import 'package:de_art/custom_widget/how_to_get.dart';
import 'package:de_art/custom_widget/phone.dart';
import 'package:de_art/page/select_hotel.dart';
import 'package:de_art/service/api.dart';
import 'package:de_art/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../custom_widget/buttonModel.dart';
import '../custom_widget/footer.dart';
import '../main.dart';
import '../palette.dart';
import 'Map.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class Contacts extends StatefulWidget {
  Contacts({super.key});
  final PhoneDialer phoneDialer = PhoneDialer();
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  String _phone = "";

  loadPhone() {
    for (var i = 0; i < selectHotelInfo.hotel!.phone!.length; i++) {
      _phone = "$_phone   ${selectHotelInfo.hotel!.phone![i]}";
    }
  }

  @override
  void initState() {
    loadPhone();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gg().then(() {mapController.moveCamera(
        animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
        CameraUpdate.newCameraPosition(
          const CameraPosition(
            target: Point(
              latitude: 55.7522200,
              longitude:37.6155600,

            ),
            zoom: 10,
          ),
        ),
      );
      setState(() {});
      });
    });
    super.initState();
  }
  gg(){}
  @override
  Widget build(BuildContext context) {
    
    String phone = _phone.replaceAll(RegExp(r'\s+'), '');

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(78.0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: GestureDetector(
                onTap: () {
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
                child: SizedBox(
                    height: 55,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) =>
                                  const MyHomePage(title: 'De Art 13'),
                            ),
                            (route) =>
                                false, //if you want to disable back feature set to false
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                        )))),
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) =>
                            const ApplicationPage()));
                  },
                  child: Container(
                      height: 62,
                      margin: const EdgeInsets.only(right: 12, top: 12),
                      child: SvgPicture.asset(
                        'assets/call.svg',
                      )))
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Контакты",
                      style: TextStyle(
                          fontSize: 30,
                          color: Palette().red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await select_hotel_info("1");
                          setState(() {

                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          child: const Text(
                            "Профсоюзная",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await select_hotel_info("2");
                          setState(() {

                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          child: const Text(
                            "Новокосино",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await select_hotel_info("4");
                          setState(() {

                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          child: const Text(
                            "Таганская",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await select_hotel_info("5");
                          setState(() {

                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          child: const Text(
                            "Текстильщики",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await select_hotel_info("6");
                          setState(() {

                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          child: const Text(
                            "Кропоткинская",
                          ),
                        ),
                      ),
                     
                     
                    ],
                  ),
                  Row(
                    children :[
                       GestureDetector(
                        onTap: () async {
                          await select_hotel_info("7");
                          setState(() {

                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          child: const Text(
                            "Авиамоторная",
                          ),
                        ),
                      ),
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.place),
                        ),
                        Text(selectHotelInfo.hotel?.address.toString().trim() ?? "")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.call),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed:(){
                                    widget.phoneDialer.launchPhoneDialer(phone.substring(0,16));
                                  },
                                  child: Text(
                                    phone.substring(0,16),
                                    style: const TextStyle(color: Colors.black),
                                    overflow: TextOverflow.clip,
                                    ),
                                ),
                                TextButton(
                                  onPressed:(){
                                    widget.phoneDialer.launchPhoneDialer(phone.substring(16));
                                  },
                                  child: Text(
                                    phone.substring(16),
                                    style: const TextStyle(color: Colors.black),
                                    overflow: TextOverflow.clip,
                                    ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 36.0, bottom: 24),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Как добраться:",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  selectHotelInfo.hotel?.goTransport==""?Container():  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: HowToGet(
                        context,
                        'assets/IconBus.svg',
                        "Общественным транспортом:",
                        selectHotelInfo.hotel?.goTransport ?? ""),
                  ),
                  selectHotelInfo.hotel?.goWalking==""? Container():   Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: HowToGet(context, 'assets/IconHuman.svg', "Пешком:",
                        selectHotelInfo.hotel?.goWalking ?? ""),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                      SelectHotelPage()));
                          },
                          child: RedButton(Palette().red, "Подобрать номера",
                              Palette().white, 15, FontWeight.bold)),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    const ApplicationPage()));
                          },
                          child: RedButton(Palette().red, "Написать нам",
                              Palette().white, 15, FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24, top: 24),
                    child: Image.network(
                        "https://deart-13.ru${selectHotelInfo.hotel?.reachFacade ?? ""}"),
                  ),
                ],
              ),
            ),
            miniMap(context)
            /*Footer(context)*/
          ],
        ),
      ),
    );
  }
}
