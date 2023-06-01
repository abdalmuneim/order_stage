import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/feature/add/data/model/add_model.dart';

class AddController extends GetxController {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  bool isVisible = false;
  final TextEditingController _title = TextEditingController();
  get title => _title;
  final TextEditingController _price = TextEditingController();
  get price => _price;
  final TextEditingController _cookies = TextEditingController();
  get cookies => _cookies;

  final List<AddModel> _add = <AddModel>[];
  List<AddModel> get add => _add;

  visible() {
    isVisible = !isVisible;
    update();
  }

  addFun() {
    _add.add(
      AddModel(
        id: _add.length + 1,
        title: _title.text,
        price: double.tryParse(_price.text),
        cookies: _cookies.text,
      ),
    );

    _title.clear();
    _price.clear();
    _cookies.clear();

    update();
  }

  remove(int id) {
    _add.removeWhere((element) => element.id == id);
    update();
  }
}
