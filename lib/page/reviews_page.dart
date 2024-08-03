import 'package:de_art/page/create_reviews_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../custom_widget/buttonModel.dart';
import '../custom_widget/footer.dart';
import '../main.dart';
import '../palette.dart';
import '../service/global.dart';
import 'Map.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final _scrollController = ScrollController();
  int _reviewsCount = 4;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gg().then(() {mapController.moveCamera(
        animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
        CameraUpdate.newCameraPosition(
          CameraPosition(
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
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(78.0),
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
                margin: EdgeInsets.only(left: 12, top: 12),
                height: 62,
                child: SvgPicture.asset(
                  'assets/menu.svg',
                ))),
            title: Center(
                child: Container(
                    height: 55,
                    child:GestureDetector
                      (
                        onTap: (){Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => MyHomePage(title: 'De Art 13'),
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
                          ApplicationPage()));},
                  child:Container(
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
                children: [   Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Отзывы",
                    style: TextStyle(
                        fontSize: 30,
                        color: Palette().red,
                        fontWeight: FontWeight.bold),
                  ),

                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                     padding: EdgeInsets.only(top:24, bottom: 40),

                     child:GestureDetector(
                         onTap: (){
                           Navigator.of(context).push(PageRouteBuilder(
                               opaque: false,
                               pageBuilder: (BuildContext context, _, __) =>
                                   CreateReviewsPage()));

                         },
                         child:RedButton(
                      Palette().red,
                      "Оставить отзыв",
                      Palette().white,
                      15,
                      FontWeight.bold)))),
                  ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: _reviewsCount,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: 12, right: 12, bottom: 12),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Palette().red,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                allReviews[index].name.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SvgPicture.asset(
                                'assets/stars.svg',
                              ),
                              Text(
                                allReviews[index].text.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                allReviews[index].dateAdd.toString().trim().substring(0, 10),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(74, 74, 74, 1)),
                              ),
                            ],
                          ),
                        );
                      }),
                Padding(
                    padding: EdgeInsets.only(top:24, bottom:48 ),
                    child:  GestureDetector(
                      onTap: (){
                        if (_reviewsCount >= allReviews.length-1){

                        } else if (_reviewsCount + 1 == allReviews.length-1){
                          _reviewsCount += 1;
                        } else if (_reviewsCount + 2 == allReviews.length-1){
                          _reviewsCount += 2;
                        } else if (_reviewsCount + 3 == allReviews.length-1){
                          _reviewsCount += 3;
                        } else {
                          _reviewsCount += 4;
                        }
                        setState(() {

                        });
                      },
                      child: RedButton(
                       Palette().red,
                        "Показать ещё",
                        Palette().white,
                        15,
                        FontWeight.bold),
                    )),

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
