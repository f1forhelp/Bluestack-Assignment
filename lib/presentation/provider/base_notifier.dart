import 'package:flutter/material.dart';

enum ViewState { loading, loaded, initial, error }

class BaseNotifier extends ChangeNotifier {
  ViewState _viewState1 = ViewState.initial;

  ViewState get viewState1 => _viewState1;
  set viewState1(ViewState viewState) {
    _viewState1 = viewState;
    notifyListeners();
  }
}
