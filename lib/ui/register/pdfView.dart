

import 'package:flutter/material.dart';

class PdfView extends StatelessWidget {
  final String fileUrl;
  const PdfView({Key? key, required this.fileUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:
      // PdfView(fileUrl: fileUrl)
      // SfPdfViewer.file(
      //   File(
      //     fileUrl,
      //   ),
      // ),
    );
  }
}
