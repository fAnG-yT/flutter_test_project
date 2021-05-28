import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatefulWidget {
  final callback;
  BottomTab(this.callback) : super();

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _activedIndex = 0;

  void _changeView(newActivedIndex) {
    print(newActivedIndex);
    setState(() {
      _activedIndex = newActivedIndex;
    });
    widget.callback(newActivedIndex);
  }

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    print(screenSize.width);
    print(orientation);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color.fromRGBO(220, 220, 220, 100),
          offset: Offset(0, -5),
          blurRadius: 10.0,
          spreadRadius: 0.0,
        )
      ]),
      // padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: [
          _Tab("商城", Icons.shopping_basket, 0),
          _Tab("消息", Icons.sms, 1),
          _Tab("个人中心", Icons.person, 2),
        ],
      ),
      // decoration: BoxDecoration(
      //     color: const Color(0xFFFFFFFF),
      //     border: Border.all(
      //         width: .5, color: const Color.fromRGBO(224, 102, 102, 100)),
      //     boxShadow: [
      //       BoxShadow(
      //         color: const Color.fromRGBO(220, 220, 220, 100),
      //         offset: Offset(0, -5),
      //         blurRadius: 10.0,
      //         spreadRadius: 0.0,
      //       )
      //     ]),
    );
  }

  Widget _Tab(String tabName, IconData tabIcon, int index) => Expanded(
      child: GestureDetector(
          onTap: () => _changeView(index),
          child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  border: Border.all(
                      width: 0.5,
                      color: index == _activedIndex
                          ? Color.fromRGBO(224, 102, 102, 100)
                          : Color(0xffffffff)),
                  //     // bottom: BorderSide(
                  //     //     width: .5,
                  //     //     color: const Color.fromRGBO(224, 102, 102, 100)),
                  //     top: BorderSide(
                  //         width: .5,
                  //         color: const Color.fromRGBO(224, 102, 102, 100))),
                  boxShadow: (index == _activedIndex
                      ? [
                          BoxShadow(
                            color: const Color.fromRGBO(220, 220, 220, 100),
                            offset: Offset(2, -5),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),
                        ]
                      : []),
                  borderRadius: (index == _activedIndex
                      ? BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular((15.0)))
                      : null)),
              height: (index == _activedIndex ? 50 : 45),
              // padding: const EdgeInsets.only(top: 5, bottom: 5),
              duration: Duration(milliseconds: 100),
              child: Column(
                children: [
                  Icon(
                    tabIcon,
                    size: 22,
                    color: (_activedIndex == index
                        ? Color.fromRGBO(241, 194, 50, 100)
                        : Color.fromRGBO(224, 102, 102, 100)),
                  ),
                  Container(
                    child: Text(tabName,
                        style: TextStyle(
                            color: _activedIndex == index
                                ? Color.fromRGBO(241, 194, 50, 100)
                                : Color.fromRGBO(224, 102, 102, 100))),
                  )
                ],
              ))));
}
