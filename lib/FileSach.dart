import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';


class Pdf extends StatefulWidget {
  final String truyen;


  // receive data from the FirstScreen as a parameter
  Pdf({  required this.truyen}) : super();
  @override
  _PdfState createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();

  }
  loadDocument() async {
    if(widget.truyen=="0") {
      document = await PDFDocument.fromAsset("assets/images/0.pdf");}
    else if(widget.truyen=="1") {
      document = await PDFDocument.fromAsset( "assets/images/1.pdf");
    }
    else if(widget.truyen=="2") {
      document = await PDFDocument.fromAsset("assets/images/2.pdf");
    }
    else if(widget.truyen=="3") {
      document = await PDFDocument.fromAsset("assets/images/3.pdf");
    }
    else if(widget.truyen=="4") {
      document = await PDFDocument.fromAsset("assets/images/4.pdf");
    }
    else if(widget.truyen=="5") {
      document = await PDFDocument.fromAsset("assets/images/5.pdf");
    }
    else if(widget.truyen=="6") {
      document = await PDFDocument.fromAsset("assets/images/6.pdf");
    }
    else if(widget.truyen=="7") {
      document = await PDFDocument.fromURL( "https://f2.hcm.edu.vn//Data/hcmedu/thpthanthuyen/2021_4/so-tay-2021_224202117467.pdf");
    }
    else if(widget.truyen=="8") {
      document = await PDFDocument.fromAsset( "assets/images/8.pdf");
    }
    else if(widget.truyen=="9") {
      document = await PDFDocument.fromAsset( "assets/images/9.pdf");
    }
    else if(widget.truyen=="10") {
      document = await PDFDocument.fromAsset( "assets/images/10.pdf");
    }
    else if(widget.truyen=="11") {
      document = await PDFDocument.fromAsset( "assets/images/11.pdf");
    }
    else if(widget.truyen=="12") {
      document = await PDFDocument.fromAsset( "assets/images/12.pdf");
    }
    else if(widget.truyen=="13") {
      document = await PDFDocument.fromAsset( "assets/images/13.pdf");
    }
    else if(widget.truyen=="14") {
      document = await PDFDocument.fromAsset( "assets/images/14.pdf");
    }
    setState(() => _isLoading = false);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        //appBar: AppBar(
        //title: const Text('Tài liệu'),
        // ),
        body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(
            document: document,
            zoomSteps: 1,
            scrollDirection: Axis.vertical,


          ),
        ),
      ),
    );
  }
}