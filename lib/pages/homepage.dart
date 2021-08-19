// Home Page
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int? value;
  TextEditingController _controller = TextEditingController();
  _converter(value) {
    return (value - 273.15);
  }

  bool isReady = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('KConverter'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: new TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffix: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                  child: Text('Enter', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    int newValue = int.parse(_controller.text);
                    setState(() {
                      value = newValue;
                      isReady = true;
                      _controller.clear();
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            child: (isReady == true) ? calculations() : notice(),
          ),
        ],
      ),
    );
  }

  Container calculations() {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text('${_converter(value).toStringAsFixed(2)} Celcius'),
          ),
          TextButton(
              onPressed: () {
                final _snackBar =
                    SnackBar(content: Text('There\'s no content to undo'));
                ScaffoldMessenger.of(context).showSnackBar(_snackBar);
              },
              child: Text('Undo')),
        ],
      ),
    );
  }

  Container notice() {
    return Container(
      child: Center(
        child: Text('No Value Entered !'),
      ),
    );
  }
}
