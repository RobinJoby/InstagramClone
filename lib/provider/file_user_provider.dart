import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_model.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class UserProvider extends ChangeNotifier{
  UserModel? _user;

  UserModel get getUser => _user!;

  Future<void> refreshUser() async{
    final user = await AuthMethods().getUserDetail();
    _user = user;
    notifyListeners();
  }
}