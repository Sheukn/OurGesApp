import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatefulWidget {
  final String pdfPath;
  const PDFViewerPage({super.key, required this.pdfPath});

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  String? pdfPath;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    loadPDF();
  }

  Future<void> loadPDF() async {
    try {
      final byteData = await rootBundle.load('assets/report.pdf');

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/report.pdf');

      await tempFile.writeAsBytes(byteData.buffer.asUint8List(), flush: true);

      setState(() {
        pdfPath = tempFile.path;
        _isReady = true;
      });

      print("PDF loaded at ${tempFile.path}");
    } catch (e) {
      print("Error loading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 151, 143, 143),
          ),
          if (_isReady && pdfPath != null)
            SfPdfViewer.file(
              File(pdfPath!),
              enableDoubleTapZooming: true,
              pageSpacing: 10,
              canShowPaginationDialog: true,
            ),
          if (!_isReady)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
