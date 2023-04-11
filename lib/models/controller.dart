import 'package:test/models/form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController {
  final void Function(String) callback;
  static const String URL =
      "https://script.google.com/macros/s/AKfycbwOEMpnEnw4HrBwwgKtXlJjS8KnDIjrtwXXVXoB5m86a7hQk7foA524TIVe9dkKbN79/exec";
  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(TestForm testForm) async {
    try {
      await http.get(Uri.parse(URL + testForm.toParams())).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}
