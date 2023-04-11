class TestForm {
  String _name;
  String _phone;
  String _email;

  TestForm(this._name, this._phone, this._email);

  String toParams() => "?name=$_name&phone=$_phone&email=$_email";
}

class DataModel {
  String name;
  String phone;
  String email;

  DataModel({required this.name, required this.phone, required this.email});

  factory DataModel.fromJson(dynamic json) {
    return DataModel(
        name: "${json['Name']}",
        phone: "${json['Phone']}",
        email: "${json['Email']}");
  }

  Map toJson() => {"Name": name, "Phone": phone, "Email": email};
}
