import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sotaydoan/HocTap.dart';
import 'package:sotaydoan/HoiDap.dart';
import 'package:sotaydoan/KhaoSat.dart';
import 'package:sotaydoan/MayTinh.dart';


import '';
import 'CoCauDoan.dart';
import 'GhiChep.dart';
import 'GoiDau.dart';
import 'KyNang.dart';
import 'LanToa.dart';
import 'SoTay.dart';
class MainScreen extends StatefulWidget {
  final List thongbao;
  const MainScreen({Key? key, required this.thongbao}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;
  void ThongBaoBtn(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                    child: Column(
                      children: [
                        Text("Đoàn trường thông báo :",
                          style: TextStyle(color: Colors.red, fontSize: 26, fontFamily: "DancingScript",fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text(widget.thongbao[0],
                          style: TextStyle(color: Colors.black87,fontSize: 24, fontFamily: "DancingScript"),),
                        SizedBox(height: 5,),
                        Text(widget.thongbao[1],
                          style: TextStyle(color: Colors.black87,fontSize: 24, fontFamily: "DancingScript"),),
                        SizedBox(height: 20,),
                        Text("--Bí Thư Đoàn Trường-- ",
                          style: TextStyle(color: Colors.green,fontSize: 24, fontFamily: "DancingScript"),),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: -60,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(45)),
                          child: Image.asset("assets/images/logodoan.png")
                      ),
                    )
                ),
              ],
            )
        );
      },
    );
  }

void GhiChepBtn()
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => ghichep()));
}

  void MayTinhBtn()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => maytinh()));
  }

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
  switch (_selectedIndex) {
    case 0:   Navigator.push(context, MaterialPageRoute(builder: (context) => hoidap()));
    break;
    case 1:   Navigator.push(context, MaterialPageRoute(builder: (context) => hoctap()));
    break;
    case 2:   Navigator.push(context, MaterialPageRoute(builder: (context) => khaosat()));
    break;
  }
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              ///////////////////////////////MENU BAR/////////////////////////////////////////
              UserAccountsDrawerHeader(
/*                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.orange,
                      backgroundImage: AssetImage("assets/images/avatar.jpg") ,),
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    backgroundImage: AssetImage("assets/images/avatar.jpg") ,),
                ],*/
                accountName: Text("Xin chào !", style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: "DancingScript"),),
                accountEmail: Text("Có ý kiến đóng góp vui lòng liên hệ :",
                  style: TextStyle(color: Colors.white,
                      fontSize: 17,
                      fontFamily: "DancingScript"),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  backgroundImage: AssetImage("assets/images/logo.png",),
                  child: Text("", style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),


              ListTile(
                leading: Icon(Icons.assignment_outlined),
                title: Text('Ứng dụng : Đoàn Viên PNT'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text( "Thực hiện: Dương Tấn Phát"),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text( "Thực hiện: Trịnh Thị Minh Anh"),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(
                    'Hướng dẫn : Thầy Lê Phát Hiện'),
              ),

              ListTile(
                leading: Icon(Icons.email_rounded),
                title: Text('Email: Hplsolution@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Điện thoại : 0925701370'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 0.0),
            labelStyle: TextStyle(fontFamily: 'DancingScript', fontSize: 17),
            tabs: [
              Tab(text: "Hoạt động", icon: Icon(Icons.home_outlined)),
              Tab(text: "Tài liệu", icon: Icon(Icons.auto_stories)),
              Tab(text: "Kỹ năng", icon: Icon(Icons.videocam_outlined)),
              Tab(text: "Sổ tay", icon: Icon(Icons.event_note_rounded),),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logodoan.png", height: 30,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text('Đoàn Viên PNT',
                  style: TextStyle(fontSize: 24, fontFamily: "DancingScript"),),
              ),

            ],
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              icon: Icon(Icons.account_circle_outlined, color: Colors.white,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => cocaudoan()));
              },
            ),
          ],
        ),
////////////////////////MENU FOOTER ///////////////////////
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
              fontFamily: "DancingScript", fontSize: 17),
          unselectedLabelStyle: TextStyle(
            fontFamily: "DancingScript", fontSize: 17,),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined,),
              label: 'Hỏi-Đáp ',
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.bookOpen,color: Colors.green,),
              label: 'Học Online',
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.heart,color: Colors.red,),
              label: 'Góp sách',
            ),

          ],
             currentIndex: _selectedIndex,
              onTap:_onItemTapped,
        ),
        body: Center(
            child: TabBarView(
              children: [
                /////////////////////// TAB LAN TỎA////////////////////////////////////////////////////////////////////////////////
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child:
                    Column(
                      children: [
                        SizedBox(height: 10),
                        lantoa(),
                        //lantoa(),
                      ],
                    ),
                  ),
                ),
////////////////////////TAB GỐI ĐẦU ////////////////////////////////////////////////////////////////////// //
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: goidau(),
                  ),
                ),

//////////////////////////////TAB KỸ NĂNG ///////////////////////////////////////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: kynang(),
                ),

///////////////////////////////////TAB SỔ TAY ////////////////////////////////////////////////////
                sotay(),
              ],
            )
        ),
        ///////////////////  NÚT FLOADTING ///////////////////////
        floatingActionButton: SpeedDial(
           backgroundColor: Colors.white,
            icon: Icons.add_circle,
            foregroundColor: Colors.blue,
            activeIcon: Icons.clear,
          //  activeBackgroundColor: Colors.amber,
           overlayOpacity : 0,

            children: [
              SpeedDialChild(
                child: Icon(Icons.add_alert_rounded, color: Colors.green,),
               // label: 'Thông báo Đoàn',
                onTap: ThongBaoBtn,),
              SpeedDialChild(
                child: Icon(Icons.calculate, color: Colors.red),
               // label: 'Máy tính bỏ túi',
                onTap: MayTinhBtn,),
              SpeedDialChild(
                child: Icon(Icons.border_color_outlined, color: Colors.deepPurpleAccent),
                //label: 'Thư viện ảnh Đoàn',
                onTap: GhiChepBtn,),



            ]
        ),
      ),
    );
  }
}
