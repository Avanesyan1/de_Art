import 'package:de_art/page/select_hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../custom_widget/buttonModel.dart';
import '../custom_widget/icon_text_container.dart';
import '../main.dart';
import '../palette.dart';
import '../service/api.dart';
import 'Map.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

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
                onTap: (){  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MenuPage(),
                  ),
                );},
                child:Container(
                margin: const EdgeInsets.only(left: 12, top: 12),
                height: 62,
                child: SvgPicture.asset(
                  'assets/menu.svg',
                ))),
            title: Center(
                child: SizedBox(
                    height: 55,
                    child: GestureDetector
                      (
                        onTap: (){Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => const MyHomePage(title: 'De Art 13'),
                          ),
                              (route) => false,//if you want to disable back feature set to false
                        );},
                        child: SvgPicture.asset(
                      'assets/logo.svg',
                    )))),
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
                      "О нас",
                      style: TextStyle(
                          fontSize: 30,
                          color: Palette().red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      "Сеть отелей “Де-Арт 13” - это шесть великолепных гостиниц, расположенных в районе метро Новокосино и Выхино, метро Профсоюзная и Новые Черемушки, Таганская и Кропоткинская, Текстильщики, Авиамоторная.",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),/*  */
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      "Удобное расположение, а именно транспортная доступность, и неизменно качественный сервис делают наши отели выгодным выбором для гостей столицы. "
                      "Во всех отелях сети действуют почасовые тарифы на некоторые категории номеров, что позволяет останавливаться у нас практичным гостям, "
                      "ценящим уют и собственное время. Также у нас есть специальные предложения для романтиков и молодоженов. Будем рады видеть Вас в числе постоянных клиентов отелей Де-Арт13!",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child:GestureDetector(
                        onTap: ()async{ await select_hotel_info("1");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>   SelectHotelPage(),
                          ),
                        );},
                        child: const Text(
                      'Гостиница на Профсоюзной',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          fontSize: 18),
                    )),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                        onTap: ()async{ await select_hotel_info("4");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>   SelectHotelPage(),
                          ),
                        );},
                        child:const Text(
                      'Гостиница на Таганской',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          fontSize: 18),
                    )),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                        onTap: ()async{
                          await select_hotel_info("2");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>   SelectHotelPage(),
                            ),
                          );

                        },
                        child:const Text(
                      'Гостиница в Новокосино',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          fontSize: 18),
                    )),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                        onTap: ()async{
                          await select_hotel_info("5");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>   SelectHotelPage(),
                            ),
                          );
                        },
                        child:const Text(
                      'Гостиница в Текстильщиках',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          fontSize: 18),
                    )),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                        onTap: ()async{ await select_hotel_info("6");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>   SelectHotelPage(),
                          ),
                        );},
                        child:const Text(
                      'Гостиница на Кропоткинской',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          fontSize: 18),
                    )),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: GestureDetector(
                        onTap: ()async{ await select_hotel_info("7");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>   SelectHotelPage(),
                          ),
                        );},
                        child:const Text(
                      'Гостиница на Авиамоторной',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          fontSize: 18),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 56),
                    child: GestureDetector(
                        onTap: (){     Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                const MyHomePage(title: 'De Art 13'),
                          ),
                              (route) =>
                          false, //if you want to disable back feature set to false
                        );},
                        child:RedButton(Palette().red, "Подобрать номера",
                        Palette().white, 15, FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: SvgPicture.asset(
                                    'assets/Icon_Time.svg',
                                  ),
                                ),
                                const Text('Возможность\nпочасовой оплаты',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(
                                  flex: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: SvgPicture.asset(
                                    'assets/Icon_Calendar.svg',
                                  ),
                                ),
                                const Text(
                                    'Оперативное\nбронирование\nи удобная оплата',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: SvgPicture.asset(
                                    'assets/Icon_dollar_down.svg',
                                  ),
                                ),
                                const Text('Недорогая цена',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(
                                  flex: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: SvgPicture.asset(
                                    'assets/Icon_servic.svg',
                                  ),
                                ),
                                const Text(
                                    'Отличный сервис,\nWi-Fi, возможность\nзаказать еду в номер',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Сегодня все больше людей ищут удобные апартаменты с почасовой оплатой или на ночь. Сеть гостиниц De Art 13 предлагает условия, которые вы наверняка оцените.",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Здесь вас ждет домашний комфорт и уют, а также море приятных ощущений. Все номера отделаны в классическом или современном стиле с использованием красивых материалов и модной мебели.",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 56),
                    child: Text(
                      "Даже самый простой стандартный номер укомплектован большой кроватью с ортопедическим матрасом и вместительными шкафчиками, "
                      "а также имеет все, что нужно для удобного времяпровождения: спутниковое ТВ (плазменная панель), ванную комнату с современной"
                      " сантехникой, а также комплекты полотенец, халаты, одноразовые тапочки, наборы принадлежностей для душа, фен.",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Image.asset("assets/picture_pool.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Номера люкс отличает дизайнерский ремонт, дорогая мебель, аксессуары и банные принадлежности более высокого качества, а также приятные бонусы: электрокамин и ванна-джакузи."
                      "Здесь приятно как отдыхать, так и принимать деловых посетителей.",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Для молодоженов есть эксклюзивные номера, оформленные в романтичном стиле. "
                      "Шикарная круглая кровать, гидромассажная ванна на двоих, изысканный дизайн — мы сделали все, "
                      "чтобы создать расслабляющую и интимную атмосферу для влюбленных.",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 56),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconTextContainer(
                                    'assets/Icon_Djakuzi.svg', "Джакузи"),
                                IconTextContainer('assets/Kamin.svg', "Камин")
                              ],
                            ),
                          ),
                          IconTextContainer(
                              'assets/Icon_Matras.svg', "Ортопедический матрас")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Ждем вас в отелях DE ART 13!",
                        style: TextStyle(
                            fontSize: 20,
                            color: Palette().red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Мы рады предложить Вам размещение в шести отелях сети «Де-Арт 13», расположенных на Профсоюзной, "
                          "в Новокосино и Текстильщиках, где всегда есть удобные номера, доступные для бронирования. "
                          "Скоро для жителей и гостей столицы будет открыт еще один мини-отель с возможностью почасовой оплаты.",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Text(
                      "De Art 13 — это отели с настоящим комфортом и доступными ценами. Добро пожаловать!",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            miniMap(context)
           /* Footer(context)*/
          ],
        ),
      ),
    );
  }
}
