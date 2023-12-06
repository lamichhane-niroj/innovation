import 'package:flutter/material.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginProvider extends ChangeNotifier {
  // controllers
  final RoundedLoadingButtonController _googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _facebookController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _loginController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _registerController =
      RoundedLoadingButtonController();

  // getter method for controllers
  RoundedLoadingButtonController get getGoogleCont => _googleController;
  RoundedLoadingButtonController get getFacebookCont => _facebookController;
  RoundedLoadingButtonController get getLoginCont => _loginController;
  RoundedLoadingButtonController get getRegisterCont => _registerController;

  // setter method to google
  void setSucessGoogle() {
    _googleController.success();
    notifyListeners();
  }

  // setter facebook to success
  void setSucessFacebook() {
    _facebookController.success();
    notifyListeners();
  }

  // setter login to sucess
  void setSucessLogin() {
    _loginController.success();
    notifyListeners();
  }

  // setter register to sucess
  void setSucessRegister() {
    _registerController.success();
    notifyListeners();
  }

  // reset google to reset
  void resetGoogle() {
    _googleController.reset();
    notifyListeners();
  }

  // reset login
  void resetLogin() {
    _loginController.reset();
    notifyListeners();
  }

  // setter login to reset
  void resetRegister() {
    _registerController.reset();
    notifyListeners();
  }

  // setter facebook to reset
  void resetFacebook() {
    _facebookController.reset();
    notifyListeners();
  }
}
