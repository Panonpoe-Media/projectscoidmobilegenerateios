
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:projectscoid/core/components/utility/secure/secure.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:percent_indicator/percent_indicator.dart';
// ignore: unused_import
import 'dart:io';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';



class SecureCodeScan extends StatefulWidget {
  final String? userID;
  final String? username;
  final String? raw;
  SecureCodeScan(this.userID, this.username, this.raw);
  @override
  _SecureCodeScanState createState() => _SecureCodeScanState();
}

class _SecureCodeScanState extends State<SecureCodeScan> {
  String? id = '2';
  String? decrypt;
  List<String?>? string;
  int? minuteBetween;
  bool? isloading = true;

  String? _scanBarcode = 'Unknown';

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<List<String?>?> _scanqr() async {
   // BarcodeScanningResult result;
    try {
       await scanQR();
       decrypt = SecureString.decrypt(_scanBarcode!);
       string = decrypt?.split('/');
       final dateTime = DateTime.parse(string![3]!);
       minuteBetween = DateTime.now().difference(dateTime).inMinutes;
       setState(() {
         isloading = false;
       });
    } on PlatformException catch (e) {

        setState(() {
          id = "an error occured $e";
        });

    } on FormatException {
      setState(() {
        id = " back button pressed";
      });
    } catch (e) {
      setState(() {
        id = "an error occured $e";
      });
    }
    return string;
  }


  Future<void> _scanqr1() async {
    try {
      decrypt = SecureString.decrypt(widget.raw!);
      string = decrypt!.split('/');
      final dateTime = DateTime.parse(string![3]!);
      minuteBetween = DateTime.now().difference(dateTime).inMinutes;
      setState(() {
        isloading = false;
      });
    } on PlatformException catch (e) {

        setState(() {
          id = "an error occured $e";
        });

    } on FormatException {
      setState(() {
        id = " back button pressed";
      });
    } catch (e) {
      setState(() {
        id = "an error occured $e";
      });
    }
  }
  void initState() {
    super.initState();
  }

  Widget viewButton (BuildContext context){
    final size =MediaQuery.of(context).size;
    final width =size.width;
    return  ButtonBarTheme(
      data: ButtonBarThemeData(
        alignment: MainAxisAlignment.center,
        buttonMinWidth: 0.9 * width,
      ),
      child: ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.9 * width,
          children: <Widget>[
            ElevatedButton(
                child: Text('Rescan'),

                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all<TextStyle>( const TextStyle(color: Colors.white,)),
                  overlayColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                  foregroundColor : MaterialStateProperty.all<Color>(const Color(0xFF037f51)),
                ),
                onPressed: () async {
                   await _scanqr();
                }
            )
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    List<String> image = [
      'assets/img/workerbg1.jpg',
      'assets/img/workerbg2.jpg',
      'assets/img/workerbg3.jpg',
      'assets/img/workerbg4.jpg',
      'assets/img/workerbg5.jpg',
      'assets/img/workerbg6.jpg',
      'assets/img/workerbg7.jpg',
    ];
    TextStyle _statLabelTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black45,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );

    TextStyle _statCountTextStyle = const TextStyle(
      color: Colors.black45,
      fontSize: 35.0,
      fontWeight: FontWeight.normal,
    );
    final size =MediaQuery.of(context).size;
    final height =size.height;
   isloading!? _scanqr1() : null ;
    return Scaffold(
      appBar: !isloading!?  AppBar(title: const Text('Scan Secure Code', style : TextStyle( color: Colors.white, )), iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      leading: IconButton(
        icon: Icon(Icons.close, color: Colors.white,),
        onPressed: (){

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Projectscoid(id : widget.userID!)),
                (Route<dynamic> route) => false,
          );


        },
      ),
      )
          : null ,
      body: isloading!? const SizedBox(width: 0.0, height: 0.0,):
          Column(
              children: <Widget>[
              Stack(
              children: <Widget>[
                Container(
                  height: 0.25 * height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: [0,1,2,3,4,5,6].contains(minuteBetween) ? AssetImage(image[minuteBetween!]) : AssetImage(image[1]) ,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // color: Colors.blue,

                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Center(
                        child:Padding(
                          padding: EdgeInsets.only(top: 20),
                          child :
                          Text(
                            'Projects.co.id',
                            style: TextStyle(fontSize: 52, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Center(
                        child:Padding(
                          padding: EdgeInsets.only(top: 30),
                          child :
                          Text(
                            widget.username!,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),

                        ),
                      ),

                    ]
                ),
              ]),

                string!.length== 5 &&  minuteBetween! <= 10 && string![1] != widget.userID ?
                Container(
                  height: 0.50 * height,
                  child : Column(
                           children: <Widget>[
                            const Padding(
                               padding: EdgeInsets.only(top: 10),
                               child :
                               Text(
                                 'Secure Code Anda adalah',
                                 style: TextStyle(fontSize: 20),
                               ),
                            ),
                             Padding(
                               padding: EdgeInsets.only(top: 5),
                               child :
                               Text(
                                 string![2]!,
                                 style: TextStyle(fontSize: 45),
                               ),

                             ),
                             const Padding(
                               padding: EdgeInsets.only(top: 5, bottom: 20),
                               child :
                               Text(
                                 'akan kadaluwarsa dalam: ',
                                 style: TextStyle(fontSize: 16),
                               ),
                             ),


                             Center(
                               child: CircularPercentIndicator(
                                 progressColor: Colors.blue,
                                 percent: minuteBetween! >= 0.0 ? ((10- minuteBetween!) / 10).toDouble() : 0.1,
                                 animation: true,
                                 radius: 170.0,
                                 lineWidth: 12.0,
                                 circularStrokeCap: CircularStrokeCap.round,
                                 center: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: <Widget>[
                                       Text(
                                       (10- minuteBetween!).toString(),
                                         style: _statCountTextStyle,
                                       ),
                                       Padding(
                                         padding: EdgeInsets.only(top: 10),
                                         child: Text(
                                           'Menit',
                                           style: _statLabelTextStyle,
                                         ),
                                       )


                                     ]),
                               ),
                             ),

                           ],
                  )

                )
                :string![1] != widget.userID? Padding(
                                                padding: EdgeInsets.only(top: 10, bottom: 30.0),
                                                child :
                                                        Text(
                                                        'Secure Code tidak valid untuk anda.',
                                                         style: TextStyle(fontSize: 20),
                                                         ),
                                                )
                :minuteBetween! > 10 ? Padding(
                                              padding: EdgeInsets.only(top: 10,  bottom: 30.0),
                                              child :
                                              Text(
                                                'Secure Code sudah tidak berlaku lagi.',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            )
                :Padding(
                  padding: EdgeInsets.only(top: 10,  bottom: 30.0),
                  child :
                  Text(
                    'Secure Code sudah tidak berlaku lagi.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
               viewButton (context),
              ],
      )


    );
  }
}
