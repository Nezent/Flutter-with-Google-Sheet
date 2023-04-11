import 'package:flutter/material.dart';
import 'package:test/models/card.dart';
import 'package:test/models/form.dart';
import 'package:test/screens/add.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DataModel> datas = <DataModel>[];
  void getData() async {
    var raw = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbxpbon6fVKayPTi_VMmA6vyDofGK9gHZYr2vxzPmjk5NSiQ7V_tTagiLFuSS4q9LA8O/exec'));
    var jsonModel = convert.jsonDecode(raw.body);
    jsonModel.map((json) => DataModel.fromJson(json));

    jsonModel.forEach((element) {
      DataModel model = DataModel(
          name: element['Name'].toString(),
          phone: element['Phone'].toString(),
          email: element['Email'].toString());
      setState(() {
        datas.add(model);
      });
    });
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (BuildContext context, int index) {
                return MyCard(
                    name: datas[index].name,
                    phone: "0${datas[index].phone.toString()}",
                    email: datas[index].email);
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
