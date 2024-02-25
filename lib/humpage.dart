import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:record/record.dart';
import 'package:http/http.dart';
import 'package:Test_2/infopage.dart';
import 'package:Test_2/outputpage.dart';
import 'dart:convert';

Future getData(url) async {
  Response response = await get(url);
  return response.body;
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop ,
      appBar: AppBar(
        title: const Text('Get A Plant Rec'),
      ),
      body: Center(
        child: HumView()
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.question_mark_rounded, color:Color(0xff000000)),
          onPressed:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InfoRoute()),
            );
          }),
    );
  }
}

class HumView extends StatefulWidget {
  const HumView({super.key});

  @override
  _HumViewState createState() => _HumViewState();
}

class _HumViewState extends State<HumView> {
  bool showWave = false;
  late final String audioPath = 'aFullPath/myFile.wav';
  List<dynamic> myStringTest = ["hi", "hihi"];
  int s = 1;
  int m = 1;
  int n = 1;
  int c = 1;
  int d = 1;

  Future<List<dynamic>> getFromFlask() async{
      String apiEndpoint = 'http://127.0.0.1:5000/api?s=$s&m=$m&n=$n&c=$c&d=$d';
      final Uri url = Uri.parse(apiEndpoint);
      var data = await getData(url);
      var decodedData = jsonDecode(data);
      //setState(() {
        myStringTest = decodedData['query'];
     // });
      return myStringTest; //TODO delete setState from above
  }
  @override
  void initState() {
    getFromFlask();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(20),
      shrinkWrap: true,
      children:[ Text("How much light do you usually get?"),
        DropdownButton(
          value: s,
            items:
        [DropdownMenuItem(value: 1, child: Text("Sun"), ),
        DropdownMenuItem(value: 2, child: Text("Semi-Shade "),),
          DropdownMenuItem(value: 3, child: Text("Shade"), )], onChanged:
        (int? value){
          setState(() {
            s = value!;
          });
        }),
        Text("What level of effort are you willing to put in to care for your plant?"),
        DropdownButton(
            value: m,
            items:
            [DropdownMenuItem(value: 1, child: Text("Low"), ),
              DropdownMenuItem(value: 2, child: Text("Medium "),),
              DropdownMenuItem(value: 3, child: Text("High"), )], onChanged:
            (int? value){
          setState(() {
            m = value!;
          });
        }),
        Text("Do you want your plant to be native to the United States?"),
        DropdownButton(
            value: n,
            items:
            [DropdownMenuItem(value: 1, child: Text("Yes"), ),
              DropdownMenuItem(value: 2, child: Text("No "),),
            ], onChanged:
            (int? value){
          setState(() {
            n = value!;
          });
        }),
        Text("What type of climate zone do you live in?"),
        DropdownButton(
            value: c,
            items:
            [DropdownMenuItem(value: 1, child: Text("Dry Subtropical"), ),
              DropdownMenuItem(value: 2, child: Text("Dry Tropical"),),
              DropdownMenuItem(value: 3, child: Text("Humid Subtropical"), ),
              DropdownMenuItem(value: 4, child: Text("Humid Tropical"), )
            ],
            onChanged:
            (int? value){
          setState(() {
            c = value!;
          });
        }),
        Text("What kind of soil is present where you live?"),
        DropdownButton(
            value: d,
            items:
            [DropdownMenuItem(value: 1, child: Text("Loam"), ),
              DropdownMenuItem(value: 2, child: Text("Clay"),),
              DropdownMenuItem(value: 3, child: Text("Open Compost"), ),
              DropdownMenuItem(value: 4, child: Text("Sandy "), )
            ],
            onChanged:
                (int? value){
              setState(() {
                d = value!;
              });
            }),
        ElevatedButton(onPressed: () async {
          myStringTest = await getFromFlask();
          showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
          AlertDialog(
              content:Text(myStringTest.toString()),
              actions:[TextButton(child:Text("Done! Thanks!"), onPressed: (){
                Navigator.pop(context);
              },)]
          ));
         }, child: Text("Submit"))

      ]
    );
  }

}


