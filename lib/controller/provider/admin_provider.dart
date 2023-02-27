
import 'package:flutter/material.dart';
class AdminProvider extends ChangeNotifier{
  bool admin=true;

  setAdmin(){
  this.admin=true;
    notifyListeners();
  }

}