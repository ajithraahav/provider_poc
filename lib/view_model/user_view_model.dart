import 'package:flutter/material.dart';
import 'package:provider_poc/model.dart/user_model.dart';
import 'package:provider_poc/repository/user_repositry.dart';

class UserListViewModel with ChangeNotifier {
  final List<UserModel> _userList = [];
  List<UserModel> get userList => _userList;

  getUserList() async {
    final List<UserModel>? userDetail = await UserRepositroy().getuserDetail();
    if (userDetail == null) {
      return;
    }
    _userList.addAll(userDetail);
    notifyListeners();
  }

  shuffleUserList() {
    _userList.shuffle();
    notifyListeners();
  }
}
