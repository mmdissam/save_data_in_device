import 'package:flutter/material.dart';
import 'package:savedataindevice/GUI/home.dart';
import 'package:savedataindevice/methods/methods.dart';

void main() async {
  var myStoreData = await Methods().readData();
  if (myStoreData != null) {
    print(myStoreData);
  }
  runApp(MaterialApp(
    home: Home(),
  ));
}
