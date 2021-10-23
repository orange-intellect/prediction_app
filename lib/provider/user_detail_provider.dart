import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:prediction_app/model/response_model/userDetailModel.dart';
import 'package:prediction_app/request/sports.dart';
import 'package:prediction_app/utils/images.dart';

class UserDetailProvider with ChangeNotifier {
  late bool action, wait = false;
  // ignore: unused_field
  late UserDetailModel userDetailModel;
  var data;

  Future<UserDetailModel> getUserDetail() async {
    _waitingStata(true);
    await UserDetailApi().getUserDetail().then((data) {
      print("STATUS CODE => " + data.statusCode.toString());
      print("DATA => " + data.body.toString());
      if (data.statusCode == 200) {
        setUserData(UserDetailModel.fromJson(json.decode(data.body)));
      } else if (data.statusCode == 404) {
        showMessageError(data.statusCode);
      } else if (data.statusCode == 403) {
        showMessageError(data.statusCode.toString());
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        print("Errors = " + result.toString());
        showMessageError(data.statusCode);
      }
    });
    return userDetailModel;
  }

  //CREATE LOGIN REQUEST
  // ignore: non_constant_identifier_names

  setUserData(value) {
    userDetailModel = value;
    print("Message = " + userDetailModel.message.toString());
    notifyListeners();
  }

  // _setLoginUser(value) {
  //   loginmodel = value;
  //   print("Login Message = " + loginmodel.message.toString().toUpperCase());
  //   notifyListeners();
  // }

  _waitingStata(value) {
    wait = value;
    notifyListeners();
  }
}