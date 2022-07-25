import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class cocaudoan extends StatefulWidget {
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}
class ListViewHome extends State<cocaudoan> {



  @override
  void initState(){
    super.initState();

  }


  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.lightGreenAccent,
                    Colors.white,
                  ]
              )
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('Cơ cấu tổ chức Đoàn trường ', style: TextStyle(fontSize: 24 ,fontFamily: "DancingScript", fontWeight: FontWeight.bold),),

                    MyTooltip(
                      message: "Lê Thị Trúc Đào - học sinh lớp 12C1, nhiều năm liền đạt các thành tích nổi bậc trong phong trào xây dựng Đoàn của trường",
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage('https://scontent.fsgn3-1.fna.fbcdn.net/v/t1.6435-9/198661028_1412936049084329_3965507524192780353_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=3vilHfK70TUAX-t1am4&_nc_ht=scontent.fsgn3-1.fna&oh=ebc5ddb26b2889fdcfd0a2947e63d338&oe=61D05913'),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),
                    Text('Bí thư: Lê Thị Trúc Đào', style: TextStyle(fontSize: 24 ,fontFamily: "DancingScript"),),
                    SizedBox(height: 20),

                    MyTooltip(
                      message: "Thầy Võ Ngọc Minh -Đại học sư phạm ngữ văn, nhiều năm liền đạt các thành tích nổi bậc trong phong trào xây dựng Đoàn của trường",
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage('https://scontent.fsgn13-2.fna.fbcdn.net/v/t1.6435-9/48266694_1136045139887221_426439833871712256_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=174925&_nc_ohc=E9rDxUbpo1QAX8F9L2J&_nc_ht=scontent.fsgn13-2.fna&oh=092384560dc3029df73044e7f3c63d55&oe=61D1E1FB'),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),
                    Text('Trợ lý thanh niên: Võ Ngọc Minh', style: TextStyle(fontSize: 24 ,fontFamily: "DancingScript"),),
                    SizedBox(height: 20),

                    MyTooltip(
                      message: "Thầy Hồ Thành Chấn -Đại học sư phạm hóa học, nhiều năm liền giữ chức vụ phó bí thư và đạt các thành tích nổi bậc trong phong trào xây dựng Đoàn của trường",
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage('https://scontent.fsgn13-1.fna.fbcdn.net/v/t31.18172-8/12795088_10153969840697988_7443524636454360056_o.jpg?_nc_cat=107&ccb=1-5&_nc_sid=730e14&_nc_ohc=AaI6vT2p50UAX9X5Aum&_nc_ht=scontent.fsgn13-1.fna&oh=060f8b35a51eaccc750b08fc37051152&oe=61D20FD1'),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),
                    Text('Phó bí thư Đoàn: Hồ Thành Chấn', style: TextStyle(fontSize: 24 ,fontFamily: "DancingScript"),),
                    SizedBox(height: 20),
                    MyTooltip(
                      message: "Thầy Nguyễn Tấn Lộc -Đại học sư phạm thể dục thể thao, nhiều năm liền giữ chức vụ phó bí thư đoàn và đạt các thành tích nổi bậc trong phong trào xây dựng Đoàn của trường",
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage('https://scontent.fsgn13-1.fna.fbcdn.net/v/t31.18172-8/10583022_1467028130240121_8591746486036317805_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=2c4854&_nc_ohc=xkTmfEDbtn0AX9iCe5w&_nc_ht=scontent.fsgn13-1.fna&oh=81ce3e599297c1d323378a90eb558342&oe=61D2CE75'),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),
                    Text('Phó bí thư Đoàn: Nguyễn Tấn Lộc', style: TextStyle(fontSize: 24 ,fontFamily: "DancingScript"),),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  MyTooltip({required this.message, required this.child});
////////ĐỊnh dạng lại tooltip//////////////
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(right: 30, left: 30),

      textStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontFamily: "DancingScript"),
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.only(topRight: Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              offset: new Offset(6.0, 6.0),
            ), //BoxShadow
          ],
          color: Colors.greenAccent[400]),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}
