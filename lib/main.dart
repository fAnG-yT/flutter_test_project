// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;

// class PhotoHero extends StatelessWidget {
//   const PhotoHero({this.photo, this.onTap, this.width});

//   final String photo;
//   final VoidCallback onTap;
//   final double width;

//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       child: Hero(
//         tag: photo,
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: onTap,
//             child: Image.asset(
//               photo,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HeroAnimation extends StatelessWidget {
//   Widget build(BuildContext context) {
//     timeDilation = 3.0; // 1.0 means normal animation speed.
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Basic Hero Animation'),
//       ),
//       body: Center(
//         child: PhotoHero(
//           photo: 'images/menu.jpg',
//           width: 300.0,
//           onTap: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute<void>(builder: (BuildContext context) {
//               return Scaffold(
//                 appBar: AppBar(
//                   title: const Text('Flippers Page'),
//                 ),
//                 body: Container(
//                     // Set background to blue to emphasize that it's a new route.
//                     color: Colors.lightBlueAccent,
//                     padding: const EdgeInsets.all(16.0),
//                     alignment: Alignment.topLeft,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           child: PhotoHero(
//                             photo: 'images/menu.jpg',
//                             width: 100.0,
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                           top: 200,
//                           left: 50,
//                         )
//                       ],
//                     )),
//               );
//             }));
//           },
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: HeroAnimation()));
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/item_detail.dart';
import 'component/bottom_tab.dart';
import 'page/item_list.dart';
// import 'page/message_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor white = const MaterialColor(
      0xFFFFFFFF, //224, 102, 102, 100
      const <int, Color>{
        50: const Color(0xFF000000),
        100: const Color(0x000000FF),
        200: const Color(0x000000FF),
        300: const Color(0x0000000FF),
        400: const Color(0x000000FF),
        500: const Color(0x000000FF),
        600: const Color(0x000000FF),
        700: const Color(0x000000FF),
        800: const Color(0x000000FF),
        900: const Color(0x000000FF),
      },
    );
    var routes = {
      '/shopping': (context) => ItemList(),
      '/detail': (context) => ItemDetail(),
    };

    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: routes,
      theme: ThemeData(
        primarySwatch: white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<Components> component = [
  new Components("商城", ItemList()),
  new Components("我的消息", null),
  new Components("个人中心", null)
];

class _MyHomePageState extends State<MyHomePage> {
  Widget currentPage = component[0].component;
  String title = component[0].component_name;

  _toChangeView(index) {
    setState(() {
      currentPage = component[index].component;
      title = component[index].component_name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          child: Stack(
        children: [
          //内容区
          Container(
            width: MediaQuery.of(context).size.width,
            child: currentPage,
          ),
          //底部导航栏
          Positioned(
            child: new BottomTab((index) => _toChangeView(index)),
            bottom: 0,
          )
        ],
      )),
    );
  }
}

//路由传承对象
class RouteArguments {
  final Item item;
  RouteArguments(this.item);
}

class Item {
  final int item_id;
  final String item_name;
  final String photo;
  Item(this.photo, this.item_id, this.item_name);
}

class Components {
  final String component_name;
  final Widget component;

  Components(this.component_name, this.component);
}
