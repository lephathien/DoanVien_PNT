import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:image_picker/image_picker.dart';




class lantoa extends StatefulWidget {
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}
class ListViewHome extends State<lantoa> {
  var checkpin=false; // kiểm tra mã pin
  var checkImage=false; // kiểm tra chọn ảnh chưa
  final databaseReference = FirebaseDatabase.instance.reference();
  var lists = [];
  var txtTrangThai =TextEditingController();
  var _image;
  var _uploadedFileURL;
  late String imageCode;
  var txtMapin =TextEditingController();
  final picker = ImagePicker();

  //Code mã hóa Ảnh sang Base64
  static String base64Encode(String data){
    var content = convert.utf8.encode(data);
    var digest = convert.base64Encode(content);
    return digest;
  }

  static Future image2Base64(String path) async {
    File file = new File(path);
    List<int> imageBytes = await file.readAsBytes();
    return convert.base64Encode(imageBytes);
  }
  //Mở ảnh trong Gallery ảnh của điện thoại
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        image2Base64(_image.path).then((data){
          imageCode=data;
        });
      } else {
        print('No image selected.');
      }
    });
  }


  //Code mã hóa Base64 sang Ảnh
  static String base64Decode(String data){
    List<int> bytes = convert.base64Decode(data);
    //String result = new String.fromCharCodes(bytes);
    String result = convert.utf8.decode(bytes);
    return result;
  }

  @override
  void initState() {



  }

  Widget build(BuildContext context) {
    return   FutureBuilder(
        future: databaseReference.child("LanToa").once(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            var tempList = [];
            tempList = snapshot.data.value;
            tempList.forEach((element) {
              print(element);
              if ( element != null) {
                lists.add(element);
              }
            });

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
                  child: Row(
                    children: [
                      Expanded( // hàm để đóng khung TextFormField lại
                        child: TextFormField(
                          controller: txtTrangThai,
                          decoration: InputDecoration(
                              hintText: "Thêm dòng trạng thái cảm xúc"
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(onPressed: ()async{
                        var tmp = await this.getImage();
                        checkImage=true;

                      }, icon: Icon(Icons.add_a_photo_rounded),label: Text("Thêm ảnh"), ),
                      SizedBox(width: 10,),
                      ElevatedButton.icon(onPressed: (){
                        if(checkImage==false){
                          final snackBar = SnackBar( content: const Text('Chưa chọn hình ảnh!'),);
                          Scaffold.of(context).showSnackBar(snackBar);
                          //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        else {
                          if (checkpin == false) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  title: Text(
                                      "Hãy nhập mã pin được cấp cho cán bộ Đoàn trường để đăng bài :"),
                                  content: Container(
                                    height: 120,
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: txtMapin,
                                          decoration: new InputDecoration(
                                            //border: InputBorder.none,
                                            filled: false,
                                            contentPadding: new EdgeInsets.only(
                                                left: 10.0,
                                                top: 10.0,
                                                bottom: 10.0,
                                                right: 10.0),
                                            hintText: ' Mã Pin 4 số',
                                            hintStyle: new TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 25.0,

                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        ElevatedButton(onPressed: () {
                                          if (txtMapin.text == "1234") {
                                            checkpin = true;
                                            Navigator.pop(context);
                                            setState(() {
                                              databaseReference.child("LanToa").child((lists.length + 1).toString()).set({
                                                'status': txtTrangThai.text,
                                                'image': imageCode,
                                                'date': DateTime.now().day.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().year.toString(),
                                                'love': 200,
                                              });
                                            });
                                            txtTrangThai.text = "";
                                          }
                                          else
                                            txtMapin.text = "SAI MÃ PIN";
                                        },
                                          child:
                                          Text("Kiểm tra mã pin",
                                            style: TextStyle(color: Colors.white,
                                                fontSize: 20),),

                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          else {
                            setState(() {
                              databaseReference.child(
                                  (lists.length + 1).toString()).set({
                                'status': txtTrangThai.text,
                                'image': imageCode,
                              });
                            });
                            txtTrangThai.text = "";
                          };
                        };

                      }, icon: Icon(Icons.add), label: Text("Đăng bài"), ),
                    ],),
                ),
                new ListView.builder(
                  physics: const NeverScrollableScrollPhysics(), // Cuộn dữ liệu
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(5.0),
                  itemCount: lists.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile( title: Text("Đoàn trường"),
                                subtitle: Text(lists[lists.length-index-1]["date"]),
                                //subtitle: Text(DateTime.now().day.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().year.toString()),
                                leading: CircleAvatar(backgroundImage: ExactAssetImage('assets/images/logo.png'),),
                                trailing: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            lists[lists.length-index-1]["love"]=lists[lists.length-index-1]["love"]+1;
                                           // printf(lists[lists.length-index-1]["love"]);
                                            databaseReference.child("LanToa").child((lists.length-index).toString()).update({
                                              'love':lists[lists.length-index-1]["love"],
                                            });
                                          });
                                        },
                                        child:
                                        Icon(EvaIcons.heart,color: Colors.red,)),
                                    Text(lists[lists.length-index-1]["love"].toString(),style: TextStyle(fontSize: 10),),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                              child: Text(lists[lists.length-index-1]["status"], textAlign: TextAlign.left, style: TextStyle(fontFamily: "DancingScript",fontSize: 19),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child : Image.memory( convert.base64Decode(lists[lists.length-index-1]["image"])),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return CircularProgressIndicator(
          );
        });
  }
}
