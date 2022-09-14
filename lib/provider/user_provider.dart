import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_api/model/u_model.dart';
import 'package:practice_api/service/base_client_service.dart';

import '../model/users_model.dart';

class UsersProvider extends ChangeNotifier {
  List<UsersModel> userList = [];
  List<UModel> uList = [];

  bool get getData => userList.isEmpty;

  void getApiData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    try {
      final response = await http.get(url);
      final map = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var i in map) {
          userList.add(UsersModel.fromJson(i));
          notifyListeners();
        }
      } else {}
    } catch (err) {
      rethrow;
    }
  }

  Future<List<UsersModel>> getApiData2() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);
    final map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var i in map) {
        userList.add(UsersModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  Future<List<UsersModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        // print(i['name']);
        userList.add(UsersModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  Future<List<UModel>> getUsersApiData() async {
    uList.clear();
    final response = await ServiceClient.get('/users');

    if (response != null) {
      final map = jsonDecode(response);
      for (Map i in map) {
        // print(i['name']);

        uList.add(UModel.fromJson(i));
      }
      print('Total users ${uList.length}');
      return uList;
    } else {
      return [];
    }
  }


}
