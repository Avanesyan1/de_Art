import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:de_art/page/select_hotel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../main.dart';
import '../service/api.dart';



late  YandexMapController mapController;
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  /// Контроллер для управления картами




  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yandex Mapkit Demo'),

      ),
      body:miniMap(context),
    );
  }






}


Widget miniMap( context){
  return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      child:YandexMap(
        scrollGesturesEnabled: true,
       gestureRecognizers:
        <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
          ),
        },
        onMapCreated: (controller) async {
          mapController = controller;
          mapController.moveCamera(
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

        },


        mapObjects: [
          /*_getClusterizedCollection(
            placemarks: _getPlacemarkObjects(context),
          ),*/
          PlacemarkMapObject(
            mapId: const MapObjectId('MapObject 1'),
            point: const Point(latitude: 55.665477, longitude: 37.547674 ),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/Map_Profsoyznaya.png',
                ),
                scale: 2,
              ),
            ),
            onTap: (_,__) async {
              await select_hotel_info("1");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>   SelectHotelPage(),
                ),
              );
            },
          ),
          PlacemarkMapObject(
            mapId: const MapObjectId('MapObject 2'),
            point: const Point(latitude: 55.737689, longitude: 37.650145),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/Map_Taganskaya.png',
                ),
                scale: 2,
              ),
            ),
            onTap: (_, __) async{
              await select_hotel_info("4");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>   SelectHotelPage(),
                ),
              );
            },
          ),
          PlacemarkMapObject(
            mapId: const MapObjectId('MapObject 3'),
            point: const Point(latitude: 55.712360, longitude: 37.882566),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/Map_Novokosino.png',
                ),
                scale: 2,
              ),
            ),
            onTap: (_, __) async{
              await select_hotel_info("2");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>   SelectHotelPage(),
                ),
              );
            },
          ),
          PlacemarkMapObject(
            mapId: const MapObjectId('MapObject 4'),
            point: const Point(latitude:  55.698995,longitude: 37.737704),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/Map_Tekstilshiki.png',
                ),
                scale: 2,
              ),
            ),
            onTap: (_, __) async
            { await select_hotel_info("5");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>   SelectHotelPage(),
                ),
              );
            },
          ),
          PlacemarkMapObject(
            mapId: const MapObjectId('MapObject 5'),
            point: const Point(latitude:55.747247, longitude: 37.609083 ),

            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/Map_Kropotinskaya.png',
                ),
                scale: 2,
              ),
            ),
            onTap: (_,__) async{
              await select_hotel_info("6");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>   SelectHotelPage(),
                ),
              );
            },
          ),
          PlacemarkMapObject(
            mapId: const MapObjectId('MapObject 6'),
            point: const Point(latitude:55.750216, longitude: 37.718489 ),

            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/Avia.png',
                ),
                scale: 2,
              ),
            ),
            onTap: (_,__) async{
              await select_hotel_info("7");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>   SelectHotelPage(),
                ),
              );
            },
          ),

       /*   PlacemarkMapObject(
            mapId: MapObjectId('MapObject 5'),
            point: Point(latitude: 55.747247, longitude: 37.609083),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/Map_Profsoyznaya.png',
                ),
                scale: 2,
              ),
            ),
            onTap: (_, __) =>    Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const SelectHotelPage(),
              ),
            ),
          ),*/

        ],

      ));
}
