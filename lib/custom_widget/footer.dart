import 'package:de_art/custom_widget/testTabBar.dart';
import 'package:de_art/page/contacts.dart';
import 'package:de_art/page/reviews_page.dart';
import 'package:de_art/page/rules_of_accommodation.dart';
import 'package:de_art/page/select_hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../page/about_us.dart';
import '../palette.dart';

Widget Footer(context) {
  return Container(
    padding: const EdgeInsets.only(top: 24, left: 12, right: 12, bottom: 24),
    decoration: BoxDecoration(
      color: Palette().red,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'м. Профсоюзная',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      'ул. Профсоюзная, 64 корп.2',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '+7 (495) 988 57 94',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      '+7 (968) 910 37 65',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'м. Новокосино',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      'ул. Наташи Качуевской,4',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '+7 (925) 288 33 13',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      '+7 (499) 178 10 68',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'м. Таганская',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      'ул. Народная, дом 14, стр.1 ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '+7 (495) 798 09 33',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      '+7 (925) 845 90 33',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'м. Текстильщики',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      'ул. Артюхиной, 14/8, стр.1',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '+7 (925) 562 43 90',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                    Text(
                      '+7 (495) 500 00 77',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Palette().white),
                    ),
                  ],
                )),
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 12),
            child: Divider(
              color: Colors.white,
            )),
        GestureDetector(
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
              'assets/logo2.svg',
            )),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Новые Черемушки",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница м.Выхино",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Академическая",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Жулебино",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Новокосино",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Ленинский проспект",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () async {
                          final Uri url =
                              Uri.parse('https://deart-13.ru/rabota/');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Работа в De Art 13",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Профсоюзная",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Калужская",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                      SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Люберцы",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Беляево",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница Коньково",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Номера эконом класса",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Отели с почасовой оплатой Москва",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                  ],
                ))
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  const ReviewsPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Отзывы",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Номер с джакузи",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Отель метро Люблино",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Свадебный номер",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница на ночь",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Гостиница метро Печатники",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () async {
                          final Uri url =
                              Uri.parse('https://deart-13.ru/sitemap/');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Карта сайта",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AboutUs(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("О нас ",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                    Contacts(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Контакты",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () async {
                          final Uri url = Uri.parse(
                              'https://deart-13.ru/upload/obshhie-polozheniya-otelya.pdf');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Общие положения",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RulesOfAccommodation(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Правила проживания",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () async {
                          final Uri url = Uri.parse(
                              'https://deart-13.ru/upload/dop_services.pdf');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Дополнительные услуги",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () async {
                          final Uri url =
                              Uri.parse('https://deart-13.ru/upload/price.pdf');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Прайс-лист",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                    TextButton(
                        onPressed: () async {
                          final Uri url = Uri.parse(
                              'https://deart-13.ru/obrabotka-personalnyh-dannyh/');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text("Обработка персональных данных",
                            style: TextStyle(
                                fontSize: 11, color: Palette().white))),
                  ],
                ))
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(flex: 3),
            GestureDetector(
                onTap: () {
                  URL_WA();
                },
                child: SvgPicture.asset(
                  'assets/wa.svg',
                )),
            const Spacer(flex: 1),
            GestureDetector(
                onTap: () {
                  URL_TG();
                },
                child: SvgPicture.asset(
                  'assets/tg.svg',
                )),
            const Spacer(flex: 1),
            GestureDetector(
                onTap: () {
                  URL_VIBER();
                },
                child: SvgPicture.asset(
                  'assets/viber.svg',
                )),
            const Spacer(flex: 1),
            GestureDetector(
                onTap: () {
                  URL_VK();
                },
                child: SvgPicture.asset(
                  'assets/vk.svg',
                )),
            const Spacer(flex: 3),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        const Text(
          "© 2023 De Art 13",
          style: TextStyle(fontSize: 11, color: Colors.white),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          "Информационные материалы, размещенные на сайте, носят справочный характер и не являются публичной офертой",
          style: TextStyle(fontSize: 11, color: Colors.white),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}

URL_WA() async {
  final Uri url = Uri.parse('https://wa.me/79853863785');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

URL_TG() async {
  final Uri url = Uri.parse('https://t.me/deart13');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

URL_VIBER() async {
  final Uri url = Uri.parse('viber://chat?number=%2B79853863785');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

URL_VK() async {
  final Uri url = Uri.parse('https://vk.com/hoteldeart13');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
 