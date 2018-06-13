import 'package:flutter/material.dart';
import './widgets/BasicsWeigets.dart';
import './home/home.dart';
import './found/found.dart';
import './me/me.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  MainState createState() => new MainState();
}

class MainState extends State<MyApp> {
  var _currentIndex = 0;

  currentPage() {
    switch (_currentIndex) {
      case 0:
        return new Home(
          title: 'Flutter UI',
        );
        break;
      case 1:
        return new Found();
        break;
      case 2:
        return new Me();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        'BasicsWeigets': (BuildContext context) => new BasicsWeigets(),
        "/widget": (_) => new WebviewScaffold(
              url: "https://flutter.io",
              appBar: new AppBar(
                title: new Text("Widget webview"),
              ),
              withZoom: true,
              withLocalStorage: true,
            )
      },
      home: new Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              print('index: $index');
            },
            items: [
              new BottomNavigationBarItem(
                  title: new Text('首页'),
                  backgroundColor: Colors.blue,
                  icon: new Icon(
                    Icons.home,
                  )),
              new BottomNavigationBarItem(
                  title: new Text('发现'),
                  backgroundColor: Colors.blue,
                  icon: new Icon(
                    Icons.find_in_page,
                  )),
              new BottomNavigationBarItem(
                  title: new Text('我的'),
                  backgroundColor: Colors.blue,
                  icon: new Icon(
                    Icons.message,
                  )),
            ]),
        body: currentPage(),
      ),
    );
  }
}
