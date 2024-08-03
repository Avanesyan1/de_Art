import 'package:de_art/custom_widget/phone.dart';
import 'package:de_art/page/booking_page.dart';
import 'package:de_art/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../custom_widget/conveniences.dart';
import '../custom_widget/footer.dart';
import '../custom_widget/icon_text_container.dart';
import '../main.dart';
import '../palette.dart';
import 'Map.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class RoomPage extends StatefulWidget {
  RoomPage({super.key});

  final PhoneDialer phoneDialer = PhoneDialer();


  @override
  State<RoomPage> createState() => _RoomPageState();
}

int chapter = 1;
SwiperController _cont= SwiperController();
class _RoomPageState extends State<RoomPage> {
  String phone = "";
  String minHour = "";

  @override
  void initState() {

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
    for (var i = 0; i < selectHotelInfo.hotel!.phone!.length; i++) {
      phone = "$phone  ${selectHotelInfo.hotel!.phone![i]}";
    }
    if (selectRoomInfo.price?.hourMin.toString() == "1") {
      minHour = "час";
    } else if (selectRoomInfo.price?.hourMin.toString() == "2" ||
        selectRoomInfo.price?.hourMin.toString() == "3" ||
        selectRoomInfo.price?.hourMin.toString() == "4") {
      minHour = "часа";
    } else {
      minHour = "часов";
    }

    super.initState();
  }


  gg(){}

  @override
  Widget build(BuildContext context) {
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
                      selectRoomInfo.title.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          color: Palette().red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.place),
                        ),
                        Text(
                          selectHotelInfo.hotel?.address.toString() ?? "",
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Row(
                              children: [
                                const Icon(Icons.call),
                                Column(
                                  children: [
                                     TextButton(
                                      onPressed: (){
                                        widget.phoneDialer.launchPhoneDialer(phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(0,14));
                                      },
                                      child: Text(
                                            phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(0, 14),
                                            style: const TextStyle(
                                              color: Colors.black
                                            ),
                                            overflow: TextOverflow.clip,
                                            ),
                                    ),    
                                    phone.replaceAll(RegExp(r'[\s\(\)]+'), '').length > 14
                                    ?
                                    TextButton(
                                      onPressed: (){
                                        widget.phoneDialer.launchPhoneDialer(phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(14,28));
                                      },
                                      child: Text(
                                            phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(14, 28),
                                            style: const TextStyle(
                                              color: Colors.black
                                            ),
                                            overflow: TextOverflow.clip,
                                            ),
                                    )
                                    : Container(),
                                    phone.replaceAll(RegExp(r'[\s\(\)]+'), '').length > 28
                                    ?
                                    TextButton(
                                      onPressed: (){
                                        widget.phoneDialer.launchPhoneDialer(phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(28,42));
                                      },
                                      child: Text(
                                            phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(28, 42),
                                            style: const TextStyle(
                                              color: Colors.black
                                            ),
                                            overflow: TextOverflow.clip,
                                            ),
                                    )
                                    : Container()
                                      
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 265,
                      child: Swiper(
                        controller: _cont,
                        itemBuilder: (context, indexPhoto) {
                          return Image.network(
                              "https://deart-13.ru${selectRoomInfo.images?[indexPhoto].photo ?? ""}");
                        },
                        itemCount: selectRoomInfo.numImages ?? 0,
                        control: const SwiperControl(
                            color: Colors.transparent,
                            iconNext: Icons.arrow_circle_right_outlined,
                            iconPrevious: Icons.arrow_circle_left_outlined),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                    child: Row(
                      children: [
                        const Spacer(flex: 3),
                      GestureDetector(
                          onTap: (){
                        /*   if(_indexPhoto!=0) _indexPhoto--;
                            setState(() {

                            });*/
                            _cont.previous();
                            setState(() {

                            });
                          },
                          child:  SvgPicture.asset(
                          'assets/left.svg',
                        )),
                        const Spacer(flex: 1),
                        GestureDetector(
                            onTap: (){   _cont.next();
                            setState(() {

                            });},
                            child:SvgPicture.asset(
                          'assets/right.svg',
                        )),
                        const Spacer(flex: 3),
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black)),
                      padding: const EdgeInsets.only(
                          left: 12, top: 12, right: 12, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12),
                              child: Text(
                                selectRoomInfo.title.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 12, top: 12, left: 12, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/time1.svg',
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Час',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "${selectRoomInfo.price?.hour.toString() ?? ""}  ₽",
                                            style: const TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                                  selectRoomInfo.price?.night.toString() == ""?Container():  Container(
                                      child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/time12.svg',
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Ночь',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "${selectRoomInfo.price?.night.toString() ?? ""}  ₽",
                                            style: const TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                                  Container(
                                      child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/time24.svg',
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Сутки',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "${selectRoomInfo.price?.price.toString() ?? ""}  ₽",
                                            style: const TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 12, top: 12, left: 12, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: SvgPicture.asset(
                                      'assets/IconClock.svg',
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 4.5,
                                    child: Text(
                                      'минимум ${selectRoomInfo.price?.hourMin.toString() ?? ""} $minHour',
                                      style: const TextStyle(fontSize: 15),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 2,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Column(
                                      children: [
                                           TextButton(
                                      onPressed: (){
                                        widget.phoneDialer.launchPhoneDialer(phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(0,14));
                                      },
                                      child: Text(
                                            phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(0, 14),
                                            style: const TextStyle(
                                              color: Colors.black
                                            ),
                                            overflow: TextOverflow.clip,
                                            ),
                                    ),    
                                    phone.replaceAll(RegExp(r'[\s\(\)]+'), '').length > 14
                                    ?
                                    TextButton(
                                      onPressed: (){
                                        widget.phoneDialer.launchPhoneDialer(phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(14,28));
                                      },
                                      child: Text(
                                            phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(14, 28),
                                            style: const TextStyle(
                                              color: Colors.black
                                            ),
                                            overflow: TextOverflow.clip,
                                            ),
                                    )
                                    : Container(),
                                    phone.replaceAll(RegExp(r'[\s\(\)]+'), '').length > 28
                                    ?
                                    TextButton(
                                      onPressed: (){
                                        widget.phoneDialer.launchPhoneDialer(phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(28,42));
                                      },
                                      child: Text(
                                            phone.replaceAll(RegExp(r'[\s\(\)]+'), '').substring(28, 42),
                                            style: const TextStyle(
                                              color: Colors.black
                                            ),
                                            overflow: TextOverflow.clip,
                                            ),
                                    )
                                    : Container()
                                      ],
                                      )
                                  ),
                                ],
                              )), 
                          Center(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) =>
                                              const BookingPage()));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 24, right: 24),
                                  decoration: BoxDecoration(
                                    color: Palette().red,
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Забронировать",
                                    style: TextStyle(
                                        color: Palette().white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 24.0, bottom: 32),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        URL_WA();
                                      },
                                      child: SizedBox(
                                          width: 32,
                                          child: SvgPicture.asset(
                                            'assets/WA-BLACK.svg',
                                          ))),
                                  const Spacer(flex: 1),
                                  GestureDetector(
                                      onTap: () {
                                        URL_TG();
                                      },
                                      child: SizedBox(
                                          width: 32,
                                          child: SvgPicture.asset(
                                            'assets/TE-BLACK.svg',
                                          ))),
                                  const Spacer(flex: 1),
                                  GestureDetector(
                                      onTap: () {
                                        URL_VIBER();
                                      },
                                      child: SizedBox(
                                          width: 32,
                                          child: Image.asset(
                                            'assets/VI-BLACK.png',
                                          ))
                                      /*SvgPicture.asset(
                                        'assets/VI-BLACK.svg',
                                      )*/
                                      ),
                                  const Spacer(flex: 1),
                                  GestureDetector(
                                      onTap: () {
                                        URL_VK();
                                      },
                                      child: SizedBox(
                                          width: 32,
                                          child: SvgPicture.asset(
                                            'assets/Vk-BLACK.svg',
                                          ))),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              chapter = 1;
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                              child: Text(
                                "О номере",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: chapter == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              chapter = 2;
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                              child: Text(
                                "Удобства в номере",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: chapter == 2
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            chapter = 3;
                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            child: Text(
                              "Удобства в отеле",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: chapter == 3
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          )),
                      ( selectRoomInfo.sectionId.toString() == "1")? GestureDetector(
                          onTap: () {
                            chapter = 4;
                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            child: Text(
                              "Рядом с отелем",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: chapter == 4
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          )):Container(),
                    ],
                  ),
                  info(chapter)
                ],
              ),
            ),
            const SizedBox(height: 12,),
            miniMap(context)
            /* Footer(context)*/
          ],
        ),
      ),
    );
  }

  Widget info(int number) {
    switch (number) {
      case 1:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 36, bottom: 36),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                         selectRoomInfo.isJacuzzi.toString()!="0" ?Padding(
                            padding:  const EdgeInsets.only(right: 16.0),
                            child: IconTextContainer(
                                'assets/Icon_Djakuzi.svg', "Джакузи"),
                          ) :Container(),
                          selectRoomInfo.isAc.toString()!="0" ? IconTextContainer(
                              'assets/Icon_Air.svg', "Кондиционер"): Container()
                        ],
                      ),
                    ),
                    IconTextContainer(
                        'assets/Icon_Matras.svg', "Ортопедический матрас")
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "О номере",
                style: TextStyle(
                    fontSize: 20,
                    color: Palette().red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                selectRoomInfo.descr?.toString() ?? "",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Удобства в номере",
                style: TextStyle(
                    fontSize: 20,
                    color: Palette().red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(context, 'assets/IconBed.svg',
                  "Большая круглая двуспальная кровать"),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "•  ортопедический матрац\n•  подушки с гипоаллергенным наполнителем\n•  одеяло с гипоаллергенным наполнителем",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconBath.svg', "Ванная комната"),
            ),
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "•  фен\n•  комплект полотен\n•  тапочки\n•  халаты (по запросу)",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "•  ",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: const Text(
                        "одноразовые гигиенические принадлежности (шампунь, гель для душа, мыло)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.clip),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "•  ",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: const Text(
                        "одноразовые гигиенические принадлежности (зубной набор, шапочка, бритва (по запросу))",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.clip),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Conveniences(context, 'assets/IconTV.svg',
                      "Плазменные телевизоры со спутниковыми телеканалами"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Conveniences(context, 'assets/IconBathMassage.svg',
                      "Гидромассажная ванная, расположенная в номере"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Conveniences(
                      context, 'assets/IconChair.svg', "Оформление номера"),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "•  журнальный столик\n•  зеркало\n•  кресла",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Conveniences(context, 'assets/IconReceptionHelp.svg',
                      "Удобства и услуги"),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "•  телефон \n•  кондиционер\n•  Бесплатное подключение к Интернету через Wi-fi",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Text(selectRoomInfo.onroom?[index] ?? "");
                    }),
              ],
            )
          ],
        );
      case 3:
        return Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Удобства в отеле",
                style: TextStyle(
                    fontSize: 20,
                    color: Palette().red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(context, 'assets/IconBed.svg',
                  "Большая круглая двуспальная кровать"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(context, 'assets/IconParking.svg',
                  "Своя собственная охраняемая парковка"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconWIFI.svg', "Бесплатный Wi-Fi"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconDish.svg', "Доставка еды в номер"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconTelevision.svg', "Спутниковое ТВ"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(context, 'assets/IconWallet.svg',
                  "Оплата картой Visa/Mastercard"),
            ),
           (( selectRoomInfo.sectionId.toString() == "2")||( selectRoomInfo.sectionId.toString() == "5")||( selectRoomInfo.sectionId.toString() == "6"))
            ?Container(): Padding(
              padding:  const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconBar.svg', "Круглосуточный бар"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconCleaning.svg', "Ежедневная уборка"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconBathrobe.svg', "Халаты, тапочки"),
            ),
          ],
        );
      case 4:
        return ( selectRoomInfo.sectionId.toString() == "1")?Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Рядом с отелем",
                  style: TextStyle(
                      fontSize: 20,
                      color: Palette().red,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(context, 'assets/IconBEST.svg',
                  "Оплата картой Visa/Mastercard"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconCH.svg', "“Чайхона номер один”"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconAB.svg', "Супермаркет “Азбука вкуса”"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Conveniences(
                  context, 'assets/IconCarWash.svg', "Круглосуточная мойка"),
            ),
          ],
        ):Container();
      default:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 36, bottom: 36),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: IconTextContainer(
                                'assets/Icon_Djakuzi.svg', "Джакузи"),
                          ),
                          IconTextContainer(
                              'assets/Icon_Air.svg', "Кондиционер")
                        ],
                      ),
                    ),
                    IconTextContainer(
                        'assets/Icon_Matras.svg', "Ортопедический матрас")
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "О номере",
                style: TextStyle(
                    fontSize: 20,
                    color: Palette().red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "212 Люкс — настоящий королевский номер, в котором каждый предмет и элемент поражают своей роскошью и особенностью. К примеру, великолепная круглая кровать, "
                "расположенная на подиуме. Такая мебель укомплектована пружинистыми ламелями и качественным ортопедическим матрасом.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 24),
              child: Text(
                "Стены номера украшают великолепные колонны и огромные зеркальные полотна, благодаря которым создается ощущение особой торжественности. "
                "Оно усиливается уникальными цветовыми решениями и, в частности, использованием позолоты в интерьере. В номере установлен кондиционер,"
                " есть джакузи. В комплектации — тапочки, фен, халаты, туалетные принадлежности.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        );
    }
  }
}

 