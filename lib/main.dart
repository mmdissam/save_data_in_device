import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:savedataindevice/GUI/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Home(),
    );
  }
}
Future<String> get localPath async{
  final path = await getApplicationDocumentsDirectory();
  return path.path;
}
Future<File> get localFile async{
  final file = await localPath;
  return new File('$file/data.txt');
}
Future<File> writeData(String value) async{
  final file = await localFile;
  return file.writeAsString('$value');
}
Future<String> readData() async{
  try{
      final file = await localFile;
      String data = await file.readAsString();
      return data;
  }catch(e){
    return 'error: file not found';
  }
}
