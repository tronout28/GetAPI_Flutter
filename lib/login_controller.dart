import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController? cEmail;
  TextEditingController? cPass;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cEmail = TextEditingController();
    cPass = TextEditingController();
  }

  loginUser() async{
    final baseurl = "https://reqres.in/api/login";

    final response = await http.post(
      Uri.parse(baseurl), 
      body: {
        'email': cEmail!.text,
        'password' : cPass!.text,
      },
    );
    try {
       if(response.statusCode == 200){
      final Map<String, dynamic> getToken = jsonDecode(response.body);
      final token = getToken['token'];
      Get.snackbar(
        'Sukses',
        'Login Berhasil',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }else{
      Get.snackbar(
        'Error',
        'Login Gagal',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    } catch (e) {
      print(e);
    }
  }
}
