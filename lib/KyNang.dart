import 'dart:io';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class kynang extends StatefulWidget {
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}

class ListViewHome extends State<kynang> {

  final TitleVideo = [
    "Lịch sử Đoàn thanh niên cộng sản Hồ Chí Minh",
    "Đoàn ca : Thanh niên làm theo lời Bác",
    'Kỹ năng tổ chức sinh hoạt Đoàn kiểu mẫu',
    'Những bài hát về Đoàn thanh niên CS Hồ Chí Minh',
    'Những bài hát về Đoàn, Thanh niên tình nguyện',
    'Kỹ năng tổ chức trò chơi:',
    'Kỹ năng phát biểu trước đám đông :',
    'Kỹ năng lập kế hoạch, mục tiêu ',
    'Kỹ năng quản lý thời gian hiệu quả:',
    'Kỹ năng thuyết trình hiệu quả  :',
    'Kỹ năng chọn nghề nghiệp  :',
    'Kỹ năng làm việc nhóm hiệu quả :',
    'Kỹ năng học tập hiệu quả, học gì cũng giỏi :',
    'Kỹ năng xây dựng sự tự tin',
    'Kỹ năng cài đặt tính tích cực, rủ bỏ tiêu cực',
  ];

  final LinkVideo = [
    "5IDgFgZ4vHQ",
    "7t7fhfSf-y0",
    '9nf5PQkBhaw',
    'pjfSKM2PBj0',
    'dEDdGTV2G_Q',
    'DjgXHFpYWFc',
    '837uwPkd44Q',
    'mImkaw48WxI',
    'VZ5tniNgFXA',
    'NEmOnGHWKPE',
    'ZrAk8wtiTA0',
    'v0_NCuLzF2E',
    'YYXqQoNvhPU',
    '2GdiQ2unvag',
    'P6t-9Yx45mM',
  ];



  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return ListView.builder(
      // padding: const EdgeInsets.all(5.0),
      itemCount: TitleVideo.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Card(
            child: Column(
              children: [
                SizedBox(height: 10),
                // ListTile( title: Text("Lịch sử Đoàn TN cộng sản Hồ Chí Minh")),
                Text(TitleVideo[index],
                  style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: (){

                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: YoutubePlayer(
                                    controller: YoutubePlayerController(
                                        initialVideoId: LinkVideo[index],
                                        flags: YoutubePlayerFlags(
                                          autoPlay: true, mute: false,  )),
                                    showVideoProgressIndicator: true,
                                    progressIndicatorColor: Colors.blueAccent,),
                                ),
                              );
                            });
                      },
                      child: Image.network('https://img.youtube.com/vi/'+LinkVideo[index]+'/0.jpg', width: size.width,   )),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}