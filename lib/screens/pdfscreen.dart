import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(widget.url,
          pageSpacing: 20, canShowPaginationDialog: true, onDocumentLoaded:
              (PdfDocumentLoadedDetails pdfDocumentLoadedDetails) {
        Fluttertoast.showToast(msg: 'Pdf Loaded');
      });
  }
}
