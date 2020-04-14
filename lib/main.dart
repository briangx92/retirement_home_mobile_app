import 'package:flutter/material.dart';
import 'package:http/http.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  String json;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  Future getRequestSender() async{
    int boom = 2;
    String url='http://10.0.2.2/retirement_home_mobile_app/get.php?id=$boom';

    Response response = await get(url);
    setState(() {
      json=response.body;
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
            Text(
              'Login',
            ),
            Text(
              '$json',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getRequestSender,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}