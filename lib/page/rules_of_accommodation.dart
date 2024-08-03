import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../custom_widget/duty.dart';
import '../custom_widget/footer.dart';
import '../main.dart';
import '../palette.dart';
import 'Map.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class RulesOfAccommodation extends StatefulWidget {
  const RulesOfAccommodation({super.key});

  @override
  State<RulesOfAccommodation> createState() => _RulesOfAccommodationState();
}

class _RulesOfAccommodationState extends State<RulesOfAccommodation> {
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
                child: Container(
                    height: 55,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) =>
                                  MyHomePage(title: 'De Art 13'),
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
                            ApplicationPage()));
                  },
                  child: Container(
                      height: 62,
                      margin: EdgeInsets.only(right: 12, top: 12),
                      child: SvgPicture.asset(
                        'assets/call.svg',
                      )))
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Правила проживания",
                      style: TextStyle(
                          fontSize: 30,
                          color: Palette().red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 40),
                    child: Text(
                      "Чтобы ваше пребывание в гостинице не было омрачено неприятными ситуациями, ознакомьтесь с правилами проживания:",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Гости обязаны:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Palette().red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Duty(context, 'assets/IconLightOff.svg',
                        "При выходе из номера выключить освещение, гидромассажную ванну, плазменную панель, кондиционер, закрывать подачу воды."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Duty(context, 'assets/IconPencilNote.svg',
                        "Соблюдать установленный в Отеле De Art 13 порядок, чистоту, тишину в номере."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Duty(context, 'assets/IconFireExtinguisher.svg',
                        "Строго соблюдать правила пожарной безопасности."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Duty(context, 'assets/IconBreakRoom.svg',
                        "Возмещать ущерб в случае утраты, повреждения или порчи имущества отеля. Оценка нанесенного ущерба производится на основании «Конфликт-меню»."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Duty(context, 'assets/IconPeople.svg',
                        "Нести ответственность за действия приглашенных к себе в номер посетителей."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Duty(context, 'assets/IconTimeToPay.svg',
                        "Своевременно и в полном объеме оплачивать все представленные отелем дополнительные услуги."),
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
