import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class ghichep extends StatefulWidget {
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}
class ListViewHome extends State<ghichep> {


  var txtGhichep =TextEditingController();
  // Ghi File dữ liệu
  _write(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/my_file.txt');
    await file.writeAsString(text);
  }
  //Đọc File dữ liệu
  Future<String> _read() async {
    late String text;
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/my_file.txt');
      text = await file.readAsString();
      //print(text);
      txtGhichep.text=text;
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }
  @override
  void initState(){
    super.initState();
    _read();
  }
  void dispose(){
    _write(txtGhichep.text);
  }

  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(

        body: SingleChildScrollView(

            child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                 // height: size.height*0.8,
                  child: TextFormField(

                            controller: txtGhichep,
                            //minLines: 10,
                            maxLines: 26,
                            style: TextStyle(color: Colors.black87, fontFamily: "DancingScript", fontSize: 19),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(25),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                ),
                              ),
                              hintText: "Nhật ký đoàn viên :   "
                                  "Ngày ... tháng ... năm ...",

                              hintStyle: TextStyle(color: Colors.black, fontFamily: "DancingScript", fontSize: 19),
                              fillColor: Colors.transparent,

                              filled: true,
                            ),
                          ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}


