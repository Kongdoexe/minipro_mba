import 'package:flutter/material.dart';
import 'package:minipro_mba/models/response/login_response_get.dart';

class Data with ChangeNotifier {
  int _period = 0;
  int _lastperiod = 0;

  Member _datauser = Member(
      memberId: 0,
      name: "",
      email: "",
      password: "",
      phone: 0,
      wallet: 0,
      isadmin: 0);

  Member get datauser => _datauser;
  int get period => _period;
  int get lastperiod => _lastperiod;

  void setDataUser(Member user) {
    _datauser = user;
    notifyListeners();
  }

  void setLastperiod(int period) {
    _lastperiod = period;
    notifyListeners();
  }

  void setPeriod(int period) {
    _period = period;
    notifyListeners();
  }

  void updateWallet(double newWalletAmount) {
    _datauser.wallet = newWalletAmount.toInt();
    notifyListeners();
  }
}
