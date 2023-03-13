// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///*not functional yet
class ConvertSvg extends StatefulWidget {
  const ConvertSvg({super.key});

  @override
  State<ConvertSvg> createState() => _ConvertSvgState();
}

class _ConvertSvgState extends State<ConvertSvg> {
  File? _file;

  /// Loads an SVG file from the file system.
  void _loadSVG() async {
    var result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['svg'],
      allowMultiple: false,
    );

    if (result != null) {
      setState(() => _file = File(result.files.single.path!));
    }

    // _getSvgPath();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: _loadSVG,
            child: Text('Load SVG'),
          ),
          if (_file != null) ...[
            Text(_file!.path),
            SvgPicture.file(_file!),
          ],
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
