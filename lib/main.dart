import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

import 'mainscreen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // xóa debug icon
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Audio audio = Audio.load('assets/images/nhacnen.mp3');


  var lists = [];

  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState()  {
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([ // khóa màn hình luôn nằm dọc
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
    audio.play();



  }

  void dispose() {

    super.dispose();
   // audio.pause();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueAccent,

      body: Center(

        child: GestureDetector(
          onTap: (){
           audio.pause();
           Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(thongbao: lists)));

          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blueAccent,
                      Colors.greenAccent,
                    ]
                )
            ),
            child: FutureBuilder(
                future: databaseReference.child("ThongBao").once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    lists.clear();
                    var tempList = [];
                    tempList = snapshot.data?.value;
                    tempList.forEach((element) {
                      //print(element);
                      if ( element != null) {
                        lists.add(element);
                      }
                    });

                    return Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/logodoan.png',height: 210,),
                              Text('Đoàn Viên',  style: TextStyle(  color: Colors.white, fontSize: 35,  fontFamily: "DancingScript")),
                              SizedBox(height: 20),
                              Text('TRƯỜNG THPT PHAN NGỌC TÒNG',  style: TextStyle(  color: Colors.white, fontSize: 18 )),

                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              Image.asset('assets/images/wave.gif', height: 80,),
                              SizedBox(height: 30),
                            ],
                          ),
                        )

                      ],
                    );
                  }
                  return CircularProgressIndicator(
                  );
                }),

          ),
        ),
      ),
    );
  }
}
