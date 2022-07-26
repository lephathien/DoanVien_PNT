import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class khaosat extends StatefulWidget {
  @override
  ListViewHome createState() {
    return new ListViewHome();
  }
}
class ListViewHome extends State<khaosat> {
  InAppWebViewController? webView;
  String url="";
  double progress=0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      // title: Text("Thống tin dịch COVID tỉnh Bến Tre", style: TextStyle(fontFamily: "DancingScript", fontSize: 18),)
      //   ),
      body: Container(
          child: Column(children: <Widget>[

            Container(
                child: progress < 1.0
                    ? LinearProgressIndicator(value: progress)
                    : Container()),
            Expanded(
              child: Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: Uri.parse("https://docs.google.com/forms/d/e/1FAIpQLSf-5sH3VxUwCenSgXZfsQCSDmIwDIj8_nQx3NKV7RMx-99vkg/viewform?usp=sf_link")
                  ),
                  initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(

                      ),
                      ios: IOSInAppWebViewOptions(

                      ),
                      android: AndroidInAppWebViewOptions(
                          useHybridComposition: true
                      )
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webView = controller;
                  },
                  onLoadStart: (controller, url) {
                    setState(() {
                      this.url = url?.toString() ?? '';
                    });
                  },
                  onLoadStop: (controller, url) async {
                    setState(() {
                      this.url = url?.toString() ?? '';
                    });
                  },
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ),

          ])),
    );


  }
}


