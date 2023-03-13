// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svg_line_standardise/normaliseSinglePath.dart';

class StandardiseSinglePath extends StatefulWidget {
  const StandardiseSinglePath({super.key});

  @override
  State<StandardiseSinglePath> createState() => _StandardiseSinglePathState();
}

class _StandardiseSinglePathState extends State<StandardiseSinglePath> {
  String _output = "";
  var _size = 500.0;
  var _svgInput = "";

  // final _controller = TextEditingController();

  void onChangedSVGPath(value) {
    if (value == null) {
      setState(() => _output = "");
      return;
    }

    setState(() => _svgInput = value);

    try {
      var result = normaliseSinglePath(value, _size);
      setState(() => _output = result);
    } on Exception catch (e) {
      setState(() => _output = "invalid format: $e");
    }
  }

  void copyToClipBoard() async {
    await Clipboard.setData(ClipboardData(text: _output));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              onChanged: (value) => onChangedSVGPath(value),
            ),
            TextFormField(
              initialValue: _size.toString(),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _size = double.parse(value);
                  _output = "";
                });
              },
            ),
            ElevatedButton(onPressed: () => onChangedSVGPath(_svgInput), child: Text("Run")),
            ElevatedButton(onPressed: copyToClipBoard, child: Text("Copy to clipboard")),
            Expanded(
              flex: 1,
              child: SelectableText(_output),
            ),
          ],
        ),
      ),
    );
  }
}
