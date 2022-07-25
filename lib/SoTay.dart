
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';



class sotay extends StatefulWidget {
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}
class ListViewHome extends State<sotay> {
  List<String> subtitles = [];
  var txtTodoController =TextEditingController();
  String text="";

  _write(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/SoTay.txt');
    await file.writeAsString(text);
    print(text);

  }

  _read() async {
    int i=1;
    final Directory directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/SoTay.txt');
    Stream<String> lines = file.openRead()
        .transform(utf8.decoder)       // Decode bytes to UTF-8.
        .transform(LineSplitter());    // Convert stream to individual lines.
    try {
      //  subtitles = [];
      await for (var line in lines) {
        setState(() {
          subtitles.add(line);
        });


      }
      print(subtitles);

      print('File is now closed.');
    } catch (e) {
      print('Error: $e');
    }


  }

  var colors = [
    Colors.red,
    Colors.green,
    Colors.purpleAccent,
    Colors.blue,
    Colors.pinkAccent,
    Colors.deepPurpleAccent,
    Colors.lightGreen,
    Colors.orangeAccent,
  ];

  @override
  void initState(){
    _read();
    super.initState();


  }


  Widget build(BuildContext context) {
    setState(() {});
    return    Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded( // hàm để đóng khung TextFormField lại
                child: TextFormField(
                  controller: txtTodoController,
                  decoration: InputDecoration(
                      hintText: "Thêm nội dung công việc"
                  ),
                ),
              ),
              SizedBox(width: 20,),
              RaisedButton.icon(
                onPressed: (){
                setState(() {
                  if(txtTodoController.text!=""){
                    subtitles.add(txtTodoController.text);}
                  trailing: Icon(Icons.delete, color: Colors.red,);
                  txtTodoController.text="";
                  String text="";
                  for (var item in subtitles) { text=text+item.toString()+'\n';}
                  print(subtitles);
                  _write(text);

                });
              }, icon: Icon(Icons.add), label: Text("Thêm"), color: Colors.white,),

            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,50,0,0),
            child: ListView.builder(
                itemCount: subtitles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 400,
                          left: 400,
                          child: Text("hello"),
                        ),
                        Card(
                            color: colors[index],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                  onTap: (){
                                    //  txtTodoController.text=subtitles[index];
                                  },
                                  // title: Text('Ghi chú '+ (index+1).toString(), style: TextStyle(fontWeight:FontWeight.bold, fontFamily: "DancingScript", fontSize: 20),),

                                  subtitle: Text(subtitles[index], style: TextStyle(color: Colors.white,fontFamily: "DancingScript", fontSize: 20)),
                                  /* leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://banner2.cleanpng.com/20180403/tkw/kisspng-drawing-pin-map-computer-icons-pushpin-5ac41d6a493e23.5203408615228020263.jpg")),*/
                                  trailing: GestureDetector(
                                    child: Icon(Icons.delete, color: Colors.white, ),
                                    onTap:(){
                                      setState(() {
                                        subtitles.removeAt(index);
                                        String text="";
                                        for (var item in subtitles) { text=text+item.toString()+'\n';}
                                        print(subtitles);
                                        _write(text);
                                      });
                                    },
                                  )


                              ),
                            )),
                      ],
                    ),
                  );
                }),
          )

          // Expanded(child: TodoList()),
        ],
      ),
    );


  }
}


