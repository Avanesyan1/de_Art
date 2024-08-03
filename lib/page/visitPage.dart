import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../custom_widget/footer.dart';
import '../main.dart';
import '../palette.dart';
import '../service/global.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({super.key});


  @override
  State<VisitPage> createState() => _VisitPageState();
}
bool _isQr = false;
class _VisitPageState extends State<VisitPage> {
  final SfRangeValues _values = SfRangeValues(int.parse(myPhoneVisits), 9.0); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
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
                  child: GestureDetector(
                      onTap: (){Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => const MyHomePage(title: 'De Art 13'),
                        ),
                            (route) => false,//if you want to disable back feature set to false
                      );},
                      child:SizedBox(
                      height: 55,
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
            child:Container(
                padding: const EdgeInsets.only(left: 15,right: 15, top:0),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        GestureDetector(
            onTap: (){
              _isQr = !_isQr;
              setState(() {

              });
            },

            child: _isQr ?
            Container(
                margin: const EdgeInsets.only(bottom:0),
                height:300,
                child: Stack(
                  children: [
                    Center(child: Container(
                      margin: const EdgeInsets.only(top:0, ),
                      child: SvgPicture.asset(
                        'assets/bg2.svg',
                      ),
                    )),

                    Center(child:
                    Container(
                    child: QrImageView(
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                          color: Colors.white) ,
                      dataModuleStyle: const QrDataModuleStyle(color: Colors.white,dataModuleShape: QrDataModuleShape.square),
                      //backgroundColor: Colors.white,
                      data: myInfo,
                      version: QrVersions.auto,
                      size: 200,
                      gapless: false,
                    ),
                    ))
                  ],
                ))
                :Container(
            margin: const EdgeInsets.only(bottom:0),
              height:300,
              child: Stack(
             children: [
              Center(child: Container(
                  margin: const EdgeInsets.only(top:0, ),
                  child: SvgPicture.asset(
                    'assets/bg2.svg',
                  ),
                )),

                  const Center(child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
               Text("Отметить\nпосещение", textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color.fromRGBO(254, 220, 143, 1)),),
                                 Text("Нажмите для отображения\nQR-кода", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color:Colors.white),),
                               ],
                             ))
             ],
           ))),
            Text("Мои посещения",style: TextStyle(
                fontSize: 30,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.start,),
            int.parse(myPhoneVisits) == 9 
            ? const Text('Поздравляем!\nВам доступно 10-ое беcплатное\nпосещение в подарок в одном\nиз предложенных номеров De Art 13',style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                ),textAlign: TextAlign.start,)
            : Text("До бесплатного посещения осталось визитов: ${9-int.parse(myPhoneVisits)}",style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                ),textAlign: TextAlign.start,),
            SfRangeSliderTheme(
                data: const SfRangeSliderThemeData(
                  thumbColor: Color.fromRGBO(217, 217, 217, 1),
                  activeTrackColor: Color.fromRGBO(217, 217, 217, 1),
                  inactiveTrackColor: Color.fromRGBO(140, 40, 57, 1),
                  thumbRadius: 24,
                  activeTrackHeight: 19,
                  inactiveTrackHeight: 19,
                ),
                child:  SfRangeSlider(
                  min: 0.0,
                  max: 9.0,
                  values: _values,
                  onChanged: (SfRangeValues newValues){
                    setState(() {
                      //_values = newValues;
                    });
                  },
                    startThumbIcon: Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Colors.white, // Цвет фона для стартового thumb
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, left: 2),
        child: Text(
          myPhoneVisits,
          style: const TextStyle(color: Colors.black, fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    endThumbIcon: Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: myPhoneVisits == '9' ? const Color.fromRGBO(254, 220, 143, 1) : Colors.white, 
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, left: 2),
        child: Text(
          myPhoneVisits == '9' ? "9" : "9",
          style: TextStyle(
            color: myPhoneVisits == '9' ? const Color.fromRGBO(140, 40, 57, 1) : Colors.black, // Цвет текста
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
                )
            ),
           const SizedBox(height: 24,),

            Center(child: Text("Остались вопросы? Звоните!",style: TextStyle(
                fontSize: 20,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.center,)),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_phone, color: Colors.black,),
                Text("+7 (495) 988 57 94",style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),textAlign: TextAlign.start,),
              ],
            ),
            const SizedBox(height: 24,),
      Center(child:      Text("Или пишите:",style: TextStyle(
                fontSize: 20,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.start,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap:(){URL_WA();},
                    child:SizedBox(
                        height: 45,
                        width: 45,
                        child:SvgPicture.asset(
                          'assets/WA-BLACK.svg',
                        ))),
                const SizedBox(width: 15,),

                GestureDetector(
                    onTap:(){URL_TG();},
                    child:SizedBox(
                      height: 45,
                        width: 45,
                        child:SvgPicture.asset(
                          'assets/TE-BLACK.svg',
                        ))),
              ],
            ),
            const SizedBox(height: 24,),
Center(child:            TextButton(onPressed: (){}, child: const Text("Правила программы лояльности",
              style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),)))


          ],
        ))));
  }
}