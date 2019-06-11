import 'package:flutter/material.dart';
import 'dart:math';

class SortApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SortPage(title: 'Home Sort Flutter'),
    );
  }
}

class SortPage extends StatefulWidget {
  SortPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SortPageState createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  bool _btnVisible;
  bool _statusVisible;
  int _size = 10000;
  int _maxValue = 1000000;
  List _array = [];
  bool _sorted;

  @override
  void initState() {
    super.initState();
    _btnVisible = true;
    _statusVisible = false;
    _sorted = false;
    _array = initiateArray();
  }

  List initiateArray() {
    List _tempArray = [];
    for(int i = 0; i < _size; i++) {
      _tempArray.add(new Random().nextInt(_maxValue));
    }
    return _tempArray;
  }

  void sort() {
    setState(() {
      _btnVisible = false;
      _statusVisible = true;
    });

    List _items = _array;

    for(int i = 0; i < _size; i++) {
      for(int j = 0; j < (_size -i - 1); j++) {
        if (_items[j] > _items[j + 1]) {
          //Swap the numbers
          int tmp = _items[j]; //Temporary variable to hold the current number
          _items[j] = _items[j + 1]; //Replace current number with adjacent number
          _items[j + 1] = tmp; //Replace adjacent number with current number
        }
      }
    }

    setState(() {
      _statusVisible = false;
      _array = _items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: _btnVisible,
              child: RaisedButton(
                onPressed: sort,
                child: Text('Sort'),
              ),
            ),
            Visibility(
              visible: _statusVisible,
              child: RaisedButton(
                onPressed: sort,
                child: Text('Processing...'),
              ),
            ),
            Text(_array.toString())
          ],
        ),
      ),
    );
  }
}
