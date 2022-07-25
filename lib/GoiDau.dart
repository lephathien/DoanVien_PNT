import 'package:flutter/material.dart';
import 'FileSach.dart';

class goidau extends StatefulWidget {
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}
class ListViewHome extends State<goidau> {

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('** Các tài liệu này được chia sẽ miễn phí trên các trang web sách Online bản quyển **', style: TextStyle(fontSize: 18 ,fontFamily: 'DancingScript', color: Colors.redAccent),),
        SizedBox(height: 10),
        Row(
          children: [

            Image.asset("assets/images/0.png",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "0",)));
                  },
                  child:
                  Text('Lịch sử Đoàn TNCS Hồ Chí Minh', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),),
                ),
                SizedBox(height: 10),
                Text('Tác giả : Trung Ương Đoàn '),
                SizedBox(height: 10),
                Text('Thể loại : Tài liệu Đoàn'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Thanh Niên')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Image.asset("assets/images/1.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Pdf(truyen: "1",)));
                  },
                  child: Text('Điều lệ Đoàn TNCS Hồ Chí Minh', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),),
                ),
                SizedBox(height: 10),
                Text('Tác giả : Trung Ương Đoàn '),
                SizedBox(height: 10),
                Text('Thể loại : Tài liệu Đoàn'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Thanh Niên')

              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Image.asset("assets/images/5.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "2",)));
                    },
                    child: Text('Bốn bài học LLCT Đoàn Viên', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Trung ương Đoàn'),
                SizedBox(height: 10),
                Text('Thể loại : Tài liệu Đoàn'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Thanh Niên')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Image.asset("assets/images/3.png",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "3",)));
                    },
                    child: Text('Sách Bác Hồ với thanh niên', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Bảo tàng HCM'),
                SizedBox(height: 10),
                Text('Thể loại : Tâm lý - kỹ năng sống'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : NXB Tổng hợp')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Image.asset("assets/images/4.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "4",)));
                    },
                    child: Text('Sách Giá trị sống cho tuổi trẻ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Diane Tillman'),
                SizedBox(height: 10),
                Text('Thể loại : Tâm lý - kỹ năng sống'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : NXB Tổng hợp')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Image.asset("assets/images/2.PNG",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "5",)));
                    },
                    child: Text('Sách Tuổi trẻ đáng bao nhiêu', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Rose Nguyễn'),
                SizedBox(height: 10),
                Text('Thể loại : Tâm lý - kỹ năng sống'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : NXB Trẻ')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(

          children: [
            Image.asset("assets/images/6.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "6",)));
                    },
                    child: Text('Sách Hướng nghiệp thời đại 4.0', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Randol Stross'),
                SizedBox(height: 10),
                Text('Thể loại : Hướng nghiệp'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : NXB lao động')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(

          children: [
            Image.asset("assets/images/7.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "7",)));
                    },
                    child: Text('Sách sổ tay hướng nghiệp', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Các trường ĐH'),
                SizedBox(height: 10),
                Text('Thể loại : Hướng nghiệp'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Bộ GD-ĐT')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(

          children: [
            Image.asset("assets/images/8.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "8",)));
                    },
                    child: Text('Sách Sổ tay khởi nghiệp', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Deirdre Sartorelli'),
                SizedBox(height: 10),
                Text('Thể loại : Khởi nghiệp'),
                SizedBox(height: 10),
                Text('Xuất bản : Thông tin văn hóa ')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(

          children: [
            Image.asset("assets/images/9.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "9",)));
                    },
                    child: Text('Sách Quốc gia khởi nghiệp', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Dan Senor và Saul Singer'),
                SizedBox(height: 10),
                Text('Thể loại : Khởi nghiệp'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Alpha Book')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(

          children: [
            Image.asset("assets/images/10.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "10",)));
                    },
                    child: Text('Sách Trên Đường Băng', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Tony buổi sáng'),
                SizedBox(height: 10),
                Text('Thể loại : Kỹ năng - Khởi nghiệp'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Trẻ')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(

          children: [
            Image.asset("assets/images/11.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "11",)));
                    },
                    child: Text('Sách Cafe cùng Tony', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Tony buổi sáng'),
                SizedBox(height: 10),
                Text('Thể loại : Kỹ năng - Khởi nghiệp'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Trẻ')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Image.asset("assets/images/12.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "12",)));
                    },
                    child: Text('Sách Tư duy nhanh - chậm', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Daniel Kahneman'),
                SizedBox(height: 10),
                Text('Thể loại : Kỹ năng'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Alpha book')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Image.asset("assets/images/13.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "13",)));
                    },
                    child: Text('Sách học tại sao phải chần chừ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Teo Aik Choe'),
                SizedBox(height: 10),
                Text('Thể loại : Kỹ năng'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Trẻ')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Image.asset("assets/images/14.jpg",width: size.width*0.3, height: 100,   ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Pdf(truyen: "14",)));
                    },
                    child: Text('Sách học giỏi cách nào đây', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.redAccent),)),
                SizedBox(height: 10),
                Text('Tác giả : Teo Aik Choe'),
                SizedBox(height: 10),
                Text('Thể loại : Kỹ năng'),
                SizedBox(height: 10),
                Text('Nhà xuất bản : Trẻ')
              ],
            ),
          ],
        ),

      ],
    );
  }
}