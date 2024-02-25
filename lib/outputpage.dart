import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:record/record.dart';
import 'package:http/http.dart';
import 'package:Test_2/infopage.dart';
import 'dart:convert';

class OutputRoute extends StatelessWidget {
  const OutputRoute({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OutputRoute'),
      ),
      body: OutputView(path: path)

    );
  }
}

class OutputView extends StatefulWidget {
  const OutputView({super.key, required this.path});
  final String path;

  @override
  OutputViewState createState() => OutputViewState();
}

class OutputViewState extends State<OutputView> {
  @override
  Widget build(BuildContext context) {
    // return ListView(
    //     children:[Text(myStringTest),buildWaveform(showWave, doneRecording, this)]
    // );
    return Text("output for now: "+widget.path);
  }

}

