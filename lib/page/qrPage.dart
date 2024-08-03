import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer' as dev;

import '../main.dart';
import '../palette.dart';


bool _is10 = false;
class SearchObjectPage extends StatefulWidget {
  const SearchObjectPage({Key? key}) : super(key: key);

  @override
  State<SearchObjectPage> createState() => _SearchObjectPageState();
}

class _SearchObjectPageState extends State<SearchObjectPage> {

  Barcode? _result;
  QRViewController? _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 500 ||
        MediaQuery.of(context).size.height < 500)
        ? 300.0
        : 450.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor:  const Color.fromRGBO(114, 40, 57, 1),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }


  Future<void> _onQRViewCreated(QRViewController controller) async {
    setState(() {
      _controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        _result = scanData;

      });
      if ((_result != null)&((_result?.code.toString().length ?? 0)==12)) {
        Fluttertoast.showToast(
            msg: "Qr отсканирован!",
            toastLength:
            Toast.LENGTH_SHORT,
            gravity:
            ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor:
            Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        controller.pauseCamera();

        // controller.resumeCamera();

      }
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    }
    _controller!.resumeCamera();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    dev.log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(114, 40, 57, 1),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: Stack(
            children: [
              _buildQrView(context),
              Padding(
                  padding: const EdgeInsets.only(top:24,),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: GestureDetector(
                            onTap: () async {
                              await _controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: _controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return const Icon(Icons.flashlight_on,color:  Color.fromRGBO(254, 220, 143, 1),);
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: GestureDetector(
                            onTap: () async {
                              await _controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: _controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return const Icon(Icons.party_mode, color: Color.fromRGBO(254, 220, 143, 1),);
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  )),
            ],
          )),
          Container(
padding: EdgeInsets.zero,
              // height:300,
              child: Stack(
                children: [
                  SizedBox(
                 width: MediaQuery.of(context).size.width,

                    child: SvgPicture.asset(
                      'assets/bg2.svg',
                    ),
                  ),

                  Center(child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      ((_result != null))?
        const Padding (
            padding: EdgeInsets.only(top:48, bottom: 32),
            child:             Text(
                          'Успешно!',textAlign: TextAlign.center,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold, color: Color.fromRGBO(254, 220, 143, 1)),))
                          :  const Padding(
                          padding: EdgeInsets.only(top:48),
                          child:Text("Отсканируйте qr код:", textAlign: TextAlign.center,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold, color: Color.fromRGBO(254, 220, 143, 1)),)),
                      ((_result != null))?
                      ElevatedButton(
                          //style: ButtonStyle(backgroundColor: ),
                          onPressed: ()async{
                            List<String> ph = [];

                            QuerySnapshot qSnap = await FirebaseFirestore.instance.collection('visits').get();
                            int documents = qSnap.docs.length;




                            for(var i=0; i<  documents; i++){
                              ph.add(qSnap.docs[i].id.toString()) ;

                            }

                            if(ph.contains(_result?.code.toString())){
                              int phoneIndex=0;
                              phoneIndex= ph.indexOf(_result!.code.toString());
                              int phoneVisit=0;

                              await FirebaseFirestore.instance.collection("visits").get().then((snapshot) {
                                phoneVisit = int.parse(snapshot.docs[phoneIndex].get('visit').toString());
                                print('получили визиты $phoneVisit');
                              });
                              print('НАЖАЛИ $phoneIndex $phoneVisit');
                              phoneVisit++;
                              if(phoneVisit==10){
                                _is10=true;
                                await FirebaseFirestore.instance.collection("visits").doc(_result?.code.toString()).set({'visit':'0'});

                              }else {
                                FirebaseFirestore.instance
                                    .collection("visits")
                                    .doc(_result?.code.toString())
                                    .set({'visit': phoneVisit.toString()});
                              }
                              print('НАЖАЛИ новый визит!$ph');
                            }else{ FirebaseFirestore.instance.collection("visits").doc(_result?.code.toString()).set({'visit':'1'});}

                            _result=null;
                        setState(() {

                        });
                        _controller!.resumeCamera();
                            Fluttertoast.showToast(
                                msg: "Посещение отмечено!",
                                toastLength:
                                Toast.LENGTH_SHORT,
                                gravity:
                                ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                const MyHomePage(title: 'De Art 13'),
                          ),
                              (route) =>
                          false, //if you want to disable back feature set to false
                        );
                        if(_is10){     _is10=false; showDialog(context: context, builder: ( context){
                          return  AlertDialog(
                            title: Text("Бесплатное посещение!",style: TextStyle(color: Palette().red, fontSize: 18,fontWeight: FontWeight.bold),),
                            titleTextStyle:
                            const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,fontSize: 20),
                            actionsOverflowButtonSpacing: 20,
                            actions:  [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Palette().red,
                                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                  ),

                                  onPressed: (){
                                    Navigator.pop(context);
                                  }, child: const Text("Далее",style: TextStyle(color: Colors.white,fontSize: 18),)),

                            ],
                            content: SizedBox(width:MediaQuery.of(context).size.width/3,
                                child:const Text('Посетителю доступно 10-ое бесплатное посещение в подарок в одном из предложенных номеров De Art 13.')),
                          );});}

                      }, child: const Text("Отметить посещение",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(114, 40, 57, 1)),))
                          : Container(),],
                  )),







                ],
              ))
         /* Container(
            decoration: BoxDecoration(
              color:  Colors.white,
              border: Border.all(
                color:Colors.deepOrange,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],

            ),
            //fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height/3.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[

                Padding(
                    padding: EdgeInsets.only(left: 12,right: 12, top:0, bottom: 12),
                    child:   ((_result != null)&((_result?.code.toString().length ?? 0)==12))?
                    Text(
                        'Успешно!',style:TextStyle(color:  Colors.black,fontSize: 18,))
                        :
                    Text('Отсканируйте qr код:',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.black,),)

                ),

         ((_result != null)&((_result?.code.toString().length ?? 0)==12))?
                ElevatedButton(onPressed: ()async{





                  Navigator.pop(context);
                  _result=null;
                  setState(() {

                  });
                  _controller!.resumeCamera();
               *//*   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WarehouseObjectPage()));*//*

                }, child: Text("Отметить посещение",style: TextStyle(fontSize: 16,color: Colors.black,),))
                    : Container(),






              ],
            ),
          )*/

        ],
      ),
    );
  }
}
