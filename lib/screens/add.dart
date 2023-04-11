import 'package:flutter/material.dart';
import 'package:test/models/controller.dart';
import 'package:test/models/form.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  void _submitForm() {
    TestForm testForm = TestForm(
        _nameController.text, _numberController.text, _emailController.text);
    FormController formController = FormController((String response) {
      print(response);
    });
    formController.submitForm(testForm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                label: Text("Name"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _numberController,
              decoration: InputDecoration(
                label: Text("Number"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                label: Text("Email"),
              ),
            ),
            SizedBox(
              height: 64,
            ),
            ElevatedButton(
              onPressed: () {
                _submitForm();
                _clearData();
              },
              child: Text("Submit"),
            ),
          ],
        ),
      )),
    );
  }

  void _clearData() {
    _emailController.text = "";
    _numberController.text = "";
    _nameController.text = "";
  }
}
