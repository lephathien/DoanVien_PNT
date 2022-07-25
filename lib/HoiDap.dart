
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class hoidap extends StatefulWidget {
  const hoidap({Key? key}) : super(key: key);

  @override
  _hoidapState createState() => _hoidapState();
}

class _hoidapState extends State<hoidap> {
  var lists = [];
  // AudioPlayer player;
  final databaseReference = FirebaseDatabase.instance.reference();
  var txtTodoController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hỏi đáp :", style: TextStyle(fontSize: 24, fontFamily: "DancingScript")),),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: databaseReference.child("HoiDap").once(),
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

                      return  Column(
                        children: [
                          Image.asset("assets/images/hoidap.jpg",  ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded( // hàm để đóng khung TextFormField lại
                                      child: TextFormField(
                                        controller: txtTodoController,
                                        decoration: InputDecoration(
                                            hintText: "Nhập nội dung câu hỏi"
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    RaisedButton.icon(
                                      onPressed: (){
                                        setState(() {
                                          if(txtTodoController.text!=""){
                                            print(txtTodoController.text);
                                            setState(() {
                                              databaseReference.child("HoiDap").child((lists.length + 1).toString()).set({
                                                'Hoi': txtTodoController.text,
                                                'Dap': "Đang chờ trả lời",
                                              });
                                            });
                                          }

                                        });
                                      }, icon: Icon(Icons.add), label: Text("Gửi"), color: Colors.white,),

                                  ],
                                ),


                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(), // Cuộn dữ liệu
                                  shrinkWrap: true,
                                  //padding: const EdgeInsets.all(5.0),
                                  itemCount: lists.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              //margin: const EdgeInsets.all(15),
                                                padding: const EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  border: Border(
                                                      left: BorderSide(
                                                          color: Colors.red,
                                                          width: 3
                                                      )
                                                  ),),
                                                child: Text("Hỏi: "+ lists[lists.length-index-1]["Hoi"], textAlign: TextAlign.left, style: TextStyle(fontFamily: "DancingScript",fontSize: 19, color: Colors.white),)),
                                            Container(
                                              //margin: const EdgeInsets.all(15),
                                                padding: const EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                      left: BorderSide(
                                                          color: Colors.white,
                                                          width: 3
                                                      )
                                                  ),),

                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CircleAvatar(backgroundImage: ExactAssetImage('assets/images/logo.png'),),
                                                        Text("Trả lời: ", textAlign: TextAlign.left, style: TextStyle(fontFamily: "DancingScript",fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontSize: 19, color: Colors.black),),
                                                      ],
                                                    ),
                                                    Text( lists[lists.length-index-1]["Dap"], textAlign: TextAlign.left, style: TextStyle(fontFamily: "DancingScript",fontSize: 19, color: Colors.black),),
                                                  ],
                                                )),

                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return CircularProgressIndicator(
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
