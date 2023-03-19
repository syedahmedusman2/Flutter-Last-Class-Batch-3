import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lastclass/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var email = "";
  var password = "".obs;
  var loading = false.obs;
  var products = [];
  void onInit() {
    super.onInit();
    callapi();
  }

  // api call
  // products.add(55);
  // products.add(44);
  // products.add(88);
  // products.add(5);
  callapi() async {
    loading.value = true;
    var baseUrl = "https://jsonplaceholder.typicode.com/users";
    var url = Uri.parse(baseUrl);
    var res = await http.get(url);
    var jsonRes = jsonDecode(res.body);
    print(res.body);
    for (var i in jsonRes) {
      products.add(UserModel.fromJson(i));
    }
    loading.value = false;
  }

  login() async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('email', emailcontroller.text);
    // await prefs.setString('password', passwordcontroller.text);
    // await prefs.setString('a', "aaa");
    // await prefs.setStringList('abn', ["aaa", "dd"]);

    email = emailcontroller.text;
    update();
    var a = "aaa";
    print(emailcontroller.text);
    print(passwordcontroller.text);
  }

  getsharedpreferences() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('email'));
    // print(prefs.remove('email'));
    // print(prefs.getString('email'));
  }

  userProfile({required String username, String? password}) {
    return Container(
      child: Text(password ?? ""),
    );
  }
}
