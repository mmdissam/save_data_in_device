import 'package:flutter/material.dart';
import 'package:savedataindevice/methods/methods.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingController = TextEditingController();
  Color _color = Colors.pinkAccent;

  void saveData() {
    Methods().writeData(_textEditingController.text);
    print('Saved!!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sava Data'),
        backgroundColor: _color,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _putYourName(),
            _save(),
            FutureBuilder(
              future: Methods().readData(),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot){
              if(snapshot.hasData){
                return Text(
                  '${snapshot.data.toString()}',
                  style: TextStyle(fontSize: 25,color: _color),
                );
              }else{
                return Text('No data');
              }
            })
          ],
        ),
      ),
    );
  }

  Widget _putYourName() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          labelText: 'Please put your name',
          icon: Icon(
            Icons.storage,
            color: _color,
            size: 22,
          ),
        ),
      ),
    );
  }

  Widget _save() {
    return Padding(
      padding: EdgeInsets.all(18),
      child: RaisedButton(
        onPressed: () {
          Methods().writeData(_textEditingController.text);
        },
        child: Text(
          'Save',
          style: TextStyle(fontSize: 18),
        ),
        textColor: Colors.white,
        color: _color,
      ),
    );
  }
}
