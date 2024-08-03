import 'package:de_art/custom_widget/phone.dart';
import 'package:de_art/page/reviews_page.dart';
import 'package:de_art/page/room_page.dart';
import 'package:de_art/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../custom_widget/buttonModel.dart';
import '../main.dart';
import '../models/Review.dart';
import '../palette.dart';
import '../service/api.dart';
import 'Map.dart';
import 'application_Page.dart';
import 'booking_page.dart';
import 'menu_page.dart';

class SelectHotelPage extends StatefulWidget {
  final String? id; 
  SelectHotelPage({Key? key,
  this.id
  }) : super(key: key);
  
  final PhoneDialer phoneDialer = PhoneDialer();
  @override
  State<SelectHotelPage> createState() => _SelectHotelPageState();
}

List<Image> fotoRoom = [
  Image.asset("assets/sea.png"),
  Image.asset("assets/1.png"),
  Image.asset("assets/2.png"),
  Image.asset("assets/3.png"),
];

final _scrollController = ScrollController();

class _SelectHotelPageState extends State<SelectHotelPage> {
  final List<bool> _filter = [false, false, false, false, false,false,false,];
  String filter = "";
  String phone = "";
  List<Review> selectReviews = [];
  bool _isLoading = true;

  @override
  void initState() {
    loadInfo();
    super.initState();
  }
 
  Future<void> loadInfo() async {
    if (widget.id != null) {
      await select_hotel_info(widget.id.toString()); 
    }
    for (var i = 0; i < selectHotelInfo.hotel!.phone!.length; i++) {
      phone = "$phone   ${selectHotelInfo.hotel!.phone![i]}";
    }
    for (var i = 0; i < allReviews.length; i++) {
      if (allReviews[i].hotelId.toString() ==
          selectHotelInfo.hotel?.id.toString()) {
        selectReviews.add(allReviews[i]);
      }
    }
    setState(() {
      _isLoading = false; 
      }
    );
  }
   

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
        body: _isLoading
          ? const Center(child: CircularProgressIndicator(),)
          :SingleChildScrollView(
              child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          selectHotelInfo.hotel?.h1.toString() ?? "",
                          style: TextStyle(
                              fontSize: 30,
                              color: Palette().red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
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
                              const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.call),
                            ),
                            SizedBox(
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
                                ))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.white,
                                                size: 48,
                                              )),
                                          AlertDialog(
                                            backgroundColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(0))),
                                            title: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Как добраться:",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Palette().red,
                                                    fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                            content: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.7 ,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  Image.network(
                                                      "https://deart-13.ru${selectHotelInfo.hotel?.reachMap ?? ""}"),
                                                  Text(
                                                    selectHotelInfo.hotel?.goWalking.toString() ?? "",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 24, bottom: 24),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.black),
                                  ),
                                ),
                                child: const Text(
                                  "Как добраться",
                                ),
                              )),
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.white,
                                                size: 48,
                                              )),
                                          AlertDialog(
                                            backgroundColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(0))),
                                            title: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "К вашим услугам",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Palette().red,
                                                    fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                            content: Container(
                                              margin: const EdgeInsets.only(top: 24),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              2,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/tv.svg',
                                                          ),
                                                          const Text(
                                                              'Спутниковое\nтелевидение',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const Spacer(
                                                            flex: 1,
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/bathrobe.svg',
                                                          ),
                                                          const Text('Халаты,\nтапочки',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const Spacer(
                                                            flex: 1,
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/cleaning.svg',
                                                          ),
                                                          const Text(
                                                              'Ежедневная\nуборка',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const Spacer(
                                                            flex: 1,
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/parking.svg',
                                                          ),
                                                          const Text(
                                                              'Охраняемая\nпарковка',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              2,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/food.svg',
                                                          ),
                                                          const Text(
                                                              'Доставка\nеды в номер',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const Spacer(
                                                            flex: 1,
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/bar.svg',
                                                          ),
                                                          const Text(
                                                              'Круглосуточный\nбар',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const Spacer(
                                                            flex: 1,
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/payment.svg',
                                                          ),
                                                          const Text(
                                                              'Оплата картой\nVisa/Mastercard',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const Spacer(
                                                            flex: 1,
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/wi-fi.svg',
                                                          ),
                                                          const Text(
                                                              'Бесплатный\nWi-Fi',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 24),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.black),
                                  ),
                                ),
                                child: const Text(
                                  "Услуги",
                                ),
                              )),
                         
                        ],
                      ),  
                      selectHotelInfo.hotel?.id == "1" ?
                      Column(
                        children: [
                            Row(
                              children: [
                                GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.white,
                                                size: 48,
                                              )),
                                          AlertDialog(
                                            backgroundColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(0))),
                                            title: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Прайс-лист бара De Art 13 Профсоюзная",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Palette().red,
                                                    fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                            content: Container(
                                              margin: const EdgeInsets.only(top: 24),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  3,
                                              child: const Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Кофе зерновой',style: TextStyle(
                                                        fontSize: 12
                                                      ),),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Вода "BonAqua" негаз.',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Вода "BonAqua" газ.',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('250 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Чай в чайнике',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Чай "Lipton"',style: TextStyle(
                                                        fontSize: 12)),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Сок "J7"',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Сок "Любимый"',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Лимонад "Frustyle" ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Кола "Evervess"',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Энергетик 0,25/0,5 ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('250/300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Круассаны',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('400 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Шоколад "Ritter Sport"',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('450 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Чипсы "Lays"',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Чипсы "Cheetos"',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  )
                                                ],
                                              )
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 24),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.black),
                                  ),
                                ),
                                child: const Text(
                                  "Прайс-лист бара",
                                ),
                              )),
                            const SizedBox(width: 10,),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.white,
                                                size: 48,
                                              )),
                                          AlertDialog(
                                            backgroundColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(0))),
                                            title: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Прайс-лист отеля De Art 13 Профсоюзная\nДоп. услуги:",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Palette().red,
                                                    fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                            content: Container(
                                              margin: const EdgeInsets.only(top: 24),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4,
                                              child: const Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Украшение лепестками ',style: TextStyle(
                                                        fontSize: 12
                                                      ),),
                                                      Text('2800 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Украшение шарами ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('5000 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Украшение свечами',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('2000 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Сырная тарелка ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('4000 руб',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Мясная тарелка',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('5000 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Заказ билетов',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('10% от стоимости',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Букет цветов ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('10% от стоимости',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Заказ такси ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('500 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Блок питания ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('500 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('USB кабель',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('500 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Ксерокс',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('15 руб./лист',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 24),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.black),
                                  ),
                                ),
                                child: const Text(
                                  "Доп. услуги",
                                ),
                              )),
                              ],
                            ),
                        Row(
                          children: [
                             GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.white,
                                                size: 48,
                                              )),
                                          AlertDialog(
                                            backgroundColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(0))),
                                            title: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Прайс-лист отеля De Art 13 Профсоюзная\nДоп. принадлежности:",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Palette().red,
                                                    fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                            content: Container(
                                              margin: const EdgeInsets.only(top: 24),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4,
                                              child: const Column(
                                                children: [
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Полотенце большое ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('200 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Полотенце малое ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('200 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Халат махровый ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('300 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Гель для душа',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('100 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Шампунь ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('100 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Зубной набор ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('150 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Расческа',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('150 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Бритвенный набор',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('200 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Бомбочка для ванны ',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('1000 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Пена для ванны',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('450 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Презервативы',style: TextStyle(
                                                        fontSize: 12
                                                      )),
                                                      Text('1100 руб.',style: TextStyle(
                                                        fontSize: 12
                                                      ))
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 24),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.black), 
                                  ),
                                ),
                                child: const Text(
                                  "Доп. принадлежности",
                                ),
                              )),
                          ],
                        )
                        ],
                      ) : const Column(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () async {
                                _filter[0] = !_filter[0];
                                for (var i = 0; i <= _filter.length - 1; i++) {
                                  if (i != 0) {
                                    _filter[i] = false;
                                  }
                                }
                                if (_filter[0]) {
                                  filter = "1";
                                  await select_hotel_info_filter(
                                      selectHotelInfo.hotel?.id ?? "", filter);
                                  setState(() {});
                                } else {
                                  filter = "";
                                  await select_hotel_info(
                                      selectHotelInfo.hotel?.id ?? "");
                                  setState(() {});
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 8,
                                ),
                                padding: const EdgeInsets.only(
                                    top: 8, bottom: 8, left: 12, right: 12),
                                decoration: BoxDecoration(
                                  color:
                                      _filter[0] ? Palette().red : Colors.white,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(100)),
                                  border: Border.all(
                                    width: 1,
                                    color: _filter[0]
                                        ? Colors.transparent
                                        : Colors.black,
                                  ),
                                ),
                                child: Text(
                                  selectHotelInfo.filter?.f1?.title?.toString() ??
                                      "",
                                  style: TextStyle(
                                    color:
                                        _filter[0] ? Colors.white : Colors.black,
                                  ),
                                ),
                              )),
                         /* selectHotelInfo.numFilter! >= 1
                              ? GestureDetector(
                                  onTap: () async {
                                    _filter[1] = !_filter[1];
                                    for (var i = 0;
                                        i <= _filter.length - 1;
                                        i++) {
                                      if (i != 1) {
                                        _filter[i] = false;
                                      }
                                    }
                                    if (_filter[1]) {
                                      filter = "2";
                                      await select_hotel_info_filter(
                                          selectHotelInfo.hotel?.id ?? "",
                                          filter);
                                      setState(() {});
                                    } else {
                                      filter = "";
                                      await select_hotel_info(
                                          selectHotelInfo.hotel?.id ?? "");
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: 8,
                                    ),
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 12, right: 12),
                                    decoration: BoxDecoration(
                                      color: _filter[1]
                                          ? Palette().red
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(100)),
                                      border: Border.all(
                                        width: 1,
                                        color: _filter[1]
                                            ? Colors.transparent
                                            : Colors.black,
                                      ),
                                    ),
                                    child: Text(
                                      selectHotelInfo.filter?.f2?.title
                                              ?.toString() ??
                                          "",
                                      style: TextStyle(
                                        color: _filter[1]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ))
                              : Container(),*/
                          selectHotelInfo.numFilter! >= 2
                              ? GestureDetector(
                                  onTap: () async {
                                    _filter[2] = !_filter[2];
                                    for (var i = 0;
                                        i <= _filter.length - 1;
                                        i++) {
                                      if (i != 2) {
                                        _filter[i] = false;
                                      }
                                    }
                                    if (_filter[2]) {
                                      filter = "3";
                                      await select_hotel_info_filter(
                                          selectHotelInfo.hotel?.id ?? "",
                                          filter);
                                      setState(() {});
                                    } else {
                                      filter = "";
                                      await select_hotel_info(
                                          selectHotelInfo.hotel?.id ?? "");
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 12, right: 12),
                                    decoration: BoxDecoration(
                                      color: _filter[2]
                                          ? Palette().red
                                          : Colors.white,
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(100)),
                                      border: Border.all(
                                        width: 1,
                                        color: _filter[2]
                                            ? Colors.transparent
                                            : Colors.black,
                                      ),
                                    ),
                                    child: Text(
                                      selectHotelInfo.filter?.f3?.title
                                              ?.toString() ??
                                          "",
                                      style: TextStyle(
                                        color: _filter[2]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ))
                              : Container(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          selectHotelInfo.numFilter! >= 3
                              ? GestureDetector(
                                  onTap: () async {
                                    _filter[3] = !_filter[3];
                                    for (var i = 0;
                                        i <= _filter.length - 1;
                                        i++) {
                                      if (i != 3) {
                                        _filter[i] = false;
                                      }
                                    }
                                    if (_filter[3]) {
                                      filter = "4";
                                      await select_hotel_info_filter(
                                          selectHotelInfo.hotel?.id ?? "",
                                          filter);
                                      setState(() {});
                                    } else {
                                      filter = "";
                                      await select_hotel_info(
                                          selectHotelInfo.hotel?.id ?? "");
                                      filter = "";
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8, top: 12),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 12, right: 12),
                                    decoration: BoxDecoration(
                                      color: _filter[3]
                                          ? Palette().red
                                          : Colors.white,
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(100)),
                                      border: Border.all(
                                        width: 1,
                                        color: _filter[3]
                                            ? Colors.transparent
                                            : Colors.black,
                                      ),
                                    ),
                                    child: Text(
                                      selectHotelInfo.filter?.f4?.title
                                              ?.toString() ??
                                          "",
                                      style: TextStyle(
                                        color: _filter[3]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ))
                              : Container(),
                          selectHotelInfo.numFilter! >= 4
                              ? GestureDetector(
                                  onTap: () async {
                                    _filter[4] = !_filter[4];
                                    for (var i = 0;
                                        i <= _filter.length - 1;
                                        i++) {
                                      if (i != 4) {
                                        _filter[i] = false;
                                      }
                                    }
                                    if (_filter[4]) {
                                      filter = "5";
                                      await select_hotel_info_filter(
                                          selectHotelInfo.hotel?.id ?? "",
                                          filter);
                                      setState(() {});
                                    } else {
                                      filter = "";
                                      await select_hotel_info(
                                          selectHotelInfo.hotel?.id ?? "");
                                      filter = "";
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 12,
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 12, right: 12),
                                    decoration: BoxDecoration(
                                      color: _filter[4]
                                          ? Palette().red
                                          : Colors.white,
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(100)),
                                      border: Border.all(
                                        width: 1,
                                        color: _filter[4]
                                            ? Colors.transparent
                                            : Colors.black,
                                      ),
                                    ),
                                    child: Text(
                                      selectHotelInfo.filter?.f5?.title
                                              ?.toString() ??
                                          "",
                                      style: TextStyle(
                                        color: _filter[4]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ))
                              : Container(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           selectHotelInfo.numFilter! >= 5
                              ? GestureDetector(
                                  onTap: () async {
                                    _filter[5] = !_filter[5];
                                    for (var i = 0;
                                        i <= _filter.length - 1;
                                        i++) {
                                      if (i != 5) {
                                        _filter[i] = false;
                                      }
                                    }
                                    if (_filter[5]) {
                                      filter = "6";
                                      await select_hotel_info_filter(
                                          selectHotelInfo.hotel?.id ?? "",
                                          filter);
                                      setState(() {});
                                    } else {
                                      filter = "";
                                      await select_hotel_info(
                                          selectHotelInfo.hotel?.id ?? "");
                                      filter = "";
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 12,
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 12, right: 12),
                                    decoration: BoxDecoration(
                                      color: _filter[5]
                                          ? Palette().red
                                          : Colors.white,
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(100)),
                                      border: Border.all(
                                        width: 1,
                                        color: _filter[5]
                                            ? Colors.transparent
                                            : Colors.black,
                                      ),
                                    ),
                                    child: Text(
                                      selectHotelInfo.filter?.f6?.title
                                              ?.toString() ??
                                          "",
                                      style: TextStyle(
                                        color: _filter[5]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ))
                              : Container(),
                              const SizedBox(width: 10,),
                               selectHotelInfo.numFilter! >= 6
                              ? GestureDetector(
                                  onTap: () async {
                                    _filter[6] = !_filter[6];
                                    for (var i = 0;
                                        i <= _filter.length - 1;
                                        i++) {
                                      if (i != 6) {
                                        _filter[i] = false;
                                      }
                                    }
                                    if (_filter[6]) {
                                      filter = "7";
                                      await select_hotel_info_filter(
                                          selectHotelInfo.hotel?.id ?? "",
                                          filter);
                                      setState(() {});
                                    } else {
                                      filter = "";
                                      await select_hotel_info(
                                          selectHotelInfo.hotel?.id ?? "");
                                      filter = "";
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 12,
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 12, right: 12),
                                    decoration: BoxDecoration(
                                      color: _filter[6]
                                          ? Palette().red
                                          : Colors.white,
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(100)),
                                      border: Border.all(
                                        width: 1,
                                        color: _filter[6]
                                            ? Colors.transparent
                                            : Colors.black,
                                      ),
                                    ),
                                    child: Text(
                                      selectHotelInfo.filter?.f7?.title
                                              ?.toString() ??
                                          "",
                                      style: TextStyle(
                                        color: _filter[6]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ))
                              : Container(),
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          controller: _scrollController,
                          itemCount: selectHotelInfo.numRooms,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  left: 12, top: 12, right: 12, bottom: 12),
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(245, 245, 245, 1)),
                              child: Column(
                                children: [
                                  GestureDetector(
                                      onTap: () async {
                                        await select_room_info(selectHotelInfo
                                                .rooms?[index].id
                                                .toString() ??
                                            "");
                                        Navigator.of(context).push(
                                            PageRouteBuilder(
                                                opaque: false,
                                                pageBuilder:
                                                    (BuildContext context, _,
                                                            __) =>
                                                          RoomPage()));
                                      },
                                      child: SizedBox(
                                          height: 265,
                                          child: Swiper(
                                            itemBuilder: (context, i) {
                                              return Image.network(
                                                  "https://deart-13.ru${selectHotelInfo.rooms?[index].images?[i].photo ?? ""}");
                                            },
                                            itemCount: selectHotelInfo
                                                    .rooms?[index]
                                                    .images
                                                    ?.length ??
                                                0,
                                            //pagination: const SwiperPagination(),
                                            control: const SwiperControl(
                                                color: Colors.white,
                                                iconNext: Icons
                                                    .arrow_circle_right_outlined,
                                                iconPrevious: Icons
                                                    .arrow_circle_left_outlined),
                                          ))),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 12,
                                          top: 12,
                                          right: 12,
                                          bottom: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, right: 12),
                                              child: Text(
                                                selectHotelInfo
                                                        .rooms?[index].title
                                                        .toString() ??
                                                    "",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 12,
                                                  top: 12,
                                                  left: 12,
                                                  right: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/time1.svg',
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            'Час',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15),
                                                          ),
                                                          Text(
                                                            "${selectHotelInfo.rooms?[index].price?.hour.toString() ?? ""}  ₽",
                                                            style: const TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  )),
                                                  selectHotelInfo.rooms?[index].price?.night.toString()=='' ?Container():  Container(
                                                      child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/time12.svg',
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            'Ночь',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15),
                                                          ),
                                                          Text(
                                                            "${selectHotelInfo.rooms?[index].price?.night.toString() ?? ""}  ₽",
                                                            style: const TextStyle(
                                                                fontSize: 15),
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            'Сутки',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15),
                                                          ),
                                                          Text(
                                                            "${selectHotelInfo.rooms?[index].price?.price.toString() ?? ""}  ₽",
                                                            style: const TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ))
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 12,
                                                  top: 12,
                                                  left: 12,
                                                  right: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/mark.svg',
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    selectHotelInfo.hotel?.titleMenu ?? "",
                                                    style:
                                                        const TextStyle(fontSize: 18),
                                                  ),
                                                  const Spacer(
                                                    flex: 2,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () async {
                                                        await select_room_info(
                                                            selectHotelInfo
                                                                    .rooms?[index]
                                                                    .id
                                                                    .toString() ??
                                                                "");
                                                        Navigator.of(context).push(
                                                            PageRouteBuilder(
                                                                opaque: false,
                                                                pageBuilder:
                                                                    (BuildContext
                                                                                context,
                                                                            _,
                                                                            __) =>
                                                                            RoomPage()));
                                                      },
                                                      child: const Text(
                                                        'Подробнее',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            decorationThickness:
                                                                2,
                                                            fontSize: 18),
                                                      )),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, right: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SvgPicture.asset(
          
                                                    'assets/stars.svg',
                                                    width: MediaQuery.of(context).size.width/3.5,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () async {
                                                        await select_room_info(
                                                            selectHotelInfo
                                                                .rooms?[index]
                                                                .id
                                                                .toString() ??
                                                                "");
                                                        Navigator.of(context).push(
                                                            PageRouteBuilder(
                                                                opaque: false,
                                                                pageBuilder: (BuildContext
                                                                            context,
                                                                        _,
                                                                        __) =>
                                                                    const BookingPage()));
                                                      },
                                                      child: RedButton(
                                                          Palette().red,
                                                          "Бронировать",
                                                          Palette().white,
                                                          15,
                                                          FontWeight.normal)),
                                                ],
                                              )),
                                        ],
                                      ))
                                ],
                              ),
                            );
                          }),
                      Padding(
                          padding: const EdgeInsets.only(
                              bottom: 12, top: 12, left: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Отзывы',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Palette().red,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const ReviewsPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Смотреть все отзывы',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 18),
                                  )),
                            ],
                          )),
                      Visibility(
                        visible: selectReviews.isNotEmpty,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width - 30,
                            height: MediaQuery.of(context).size.height / 3,
                            child: Swiper(
                              itemBuilder: (context, i) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      left: 12, right: 12, bottom: 12),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Palette().red,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectReviews[i].name.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SvgPicture.asset(
                                        'assets/stars.svg',
                                      ),
                                      Text(
                                        selectReviews[i].text.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 13),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      Text(
                                        selectReviews[i].dateAdd.toString().trim().substring(0, 10),
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Color.fromRGBO(74, 74, 74, 1)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: selectReviews.length,
                              //pagination: const SwiperPagination(),
                            )),
                      ),
                  /*    Row(
                        children: [
                          Spacer(flex: 3),
                          SvgPicture.asset(
                            'assets/left.svg',
                          ),
                          Spacer(flex: 1),
                          SvgPicture.asset(
                            'assets/right.svg',
                          ),
                          Spacer(flex: 3),
                        ],
                      ),*/
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Об отеле',
                            style: TextStyle(
                                fontSize: 20,
                                color: Palette().red,
                                fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/loc.svg',
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              padding: const EdgeInsets.only(right: 12),
                              child: RichText(
                                  text: TextSpan(children: [
                               /* TextSpan(
                                  text: 'Расположение:',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),*/
                                TextSpan(
                                  text: selectHotelInfo.hotel?.location
                                          .toString() ??
                                      "",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                )
                              ]))),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/metro.svg',
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              padding: const EdgeInsets.only(right: 12),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: selectHotelInfo.hotel?.goWalking
                                          .toString() ??
                                      "",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ]))),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 12),
                        child: Text(
                          selectHotelInfo.hotel?.about.toString() ?? "",
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 42, bottom: 16),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Преимущества',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Palette().red,
                                    fontWeight: FontWeight.bold),
                              ))),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Icon_sofa.svg',
                                  ),
                                  const Text(
                                      'Уютные номера,\nоснащенные\nсовременной мебелью\nи техникой',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/metro.svg',
                                  ),
                                  const Text('Близкое\nрасположение к метро',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Icon_interiors.svg',
                                  ),
                                  const Text('Дизайнерский\nинтерьер номеров',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/iconFood.svg',
                                  ),
                                  const Text('Прекрасный сервис',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Icon_jakuzi.svg',
                                  ),
                                  const Text('Романтические\nномера с джакузи',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/food.svg',
                                  ),
                                  const Text('Доставка завтрака\nв номер',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Icon_Tretyakovka.svg',
                                  ),
                                  const Text(
                                      'Исторические\nдостопримечательно\nсти рядом с отелем',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/payment.svg',
                                  ),
                                  const Text(
                                      'Возможность\nпочасовой\nи посуточной оплаты,\nа также оплаты за ночь',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 64, bottom: 16),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Для кого подойдет',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Palette().red,
                                    fontWeight: FontWeight.bold),
                              ))),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Icon_molodozheni.svg',
                                  ),
                                  const Text('Для молодоженов\nи семейных пар',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icon_svidanie.svg',
                                  ),
                                  const Text('Для романтических\nсвиданий',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 60),
                          child: Text(
                            selectHotelInfo.hotel?.infrastructure.toString() ??
                                "",
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.4,
                            margin: const EdgeInsets.only(bottom: 8, right: 8),
                            child: Image.network(
                                "https://deart-13.ru${selectHotelInfo.hotel?.imgAttraction ?? ""}"),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.4,
                            margin: const EdgeInsets.only(bottom: 8, right: 8),
                            child: Image.network(
                                "https://deart-13.ru${selectHotelInfo.hotel?.imgAttractionSm1 ?? ""}"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.4,
                            margin: const EdgeInsets.only(bottom: 8, right: 8),
                            child: Image.network(
                                "https://deart-13.ru${selectHotelInfo.hotel?.imgAttractionSm2 ?? ""}"),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.4,
                            margin: const EdgeInsets.only(bottom: 8, right: 8),
                            child: Image.network(
                                "https://deart-13.ru${selectHotelInfo.hotel?.imgAttractionSm3 ?? ""}"),
                          ),
                        ],
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(
                                top: 24,
                                bottom: 12,
                              ),
                              child: Text(
                                'Достопримечательности рядом с отелем',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ))),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 24,
                        ),
                        child: Text(
                            selectHotelInfo.hotel?.attraction.toString() ?? ""),
                      ),
                      /*Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" • "),
                          Container(width: MediaQuery.of(context).size.width-50,child: Text(" Третьяковская галерея;"))
                        ],
                      ),
                      Row(  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" • "),
                          Container(width: MediaQuery.of(context).size.width-50,
                              child: Text(
                                  " Котельническая и Краснохолмская набережные;"))
                        ],
                      ),
                      Row(  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" • "),
                          Container(width: MediaQuery.of(context).size.width-50,child: Text(" Театр русской драмы;"))
                        ],
                      ),
                      Row(  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" • "),
                          Container(width: MediaQuery.of(context).size.width-50,child: Text(" Студия красоты Fantasy;"))
                        ],
                      ),
                      Row(  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" • "),
                          Container(width: MediaQuery.of(context).size.width-50,
                              child: Text(" Магазин нижнего белья Crazy Beach;"))
                        ],
                      ),
                      Row(  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" • "),
                          Container(width: MediaQuery.of(context).size.width-50,child: Text(" Магазин Красное и белое;"))
                        ],
                      ),
                      Row(  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" • "),
                          Container(
                            width: MediaQuery.of(context).size.width-50,
                              child: Text(
                            " Пабы, закусочные, пекарни, кафе и бары с разным ценовым сегментом на любой вкус.",
                            style: TextStyle(overflow: TextOverflow.clip),
                          ))
                        ],
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(top: 24, ),
                        child:Text(
                          "Если вы любите искусство, шоппинг, вкусную еду и приятное времяпровождение, добраться до этих мест от нашей гостиницы вы можете даже пешком."),),*/
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 24,
                                bottom: 12,
                              ),
                              child: Text(
                                'Как доехать до отеля',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Palette().red,
                                    fontWeight: FontWeight.bold),
                              ))),
                      Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: const EdgeInsets.only(bottom: 8, right: 8),
                        child: Image.network(
                            "https://deart-13.ru${selectHotelInfo.hotel?.reachMap ?? ""}"),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 24, bottom: 24),
                          child: RichText(
                              text: TextSpan(children: [
                            //Доехать до отеля De art Art 13 можно с помощью метро Таганская и далее пешком 4 минуты (340 метров).
                            TextSpan(
                              text: selectHotelInfo.hotel?.reach.toString() ?? "",
                              style: const TextStyle(fontSize: 14, color: Colors.black,fontFamily: "CeraPro"),
                            ),
                          ]))),
                      Text(
                        selectHotelInfo.hotel?.goWalking.toString() ?? "",
                      ),
                    ],
                  )),
              miniMap(context)
              /*Footer(context)*/
            ],
          )
        ));
}
}
