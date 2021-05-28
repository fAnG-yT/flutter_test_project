import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/net/Album.dart';
import 'package:flutter_application_1/page/item_detail.dart';
import 'package:flutter_application_1/util/item_hero.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:http/http.dart' as http;

// var url = Uri.parse('https://example.com/whatsit/create');

// var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
// print('Response status: ${response.statusCode}');
// print('Response body: ${response.body}');

// print(await http.read('https://example.com/foobar.txt'));
Future<Album> fetchAlbum() async {
  print("~~");
  final res = await http.get(Uri.parse('https://example.com/foobar.txt'));
  print(res.statusCode);
  if (res.statusCode == 200) {
    print("succeed");
    return Album.fromJson(jsonDecode(res.body));
  } else {
    throw Exception(res.body);
  }
}

class ItemList extends StatelessWidget {
  Item item = new Item('images/menu.jpg', 0, "a");

  Future<Album> a = fetchAlbum();
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    List<Item> itemlist =
        List<Item>.generate(25, (i) => new Item('images/menu.jpg', i, "a"));

    _toNavigator(item) {
      print(item);
      // var res = await Navigator.pushNamed(context, "/detail", arguments: item);
      var res = Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ItemDetail(item: item)));
      print(res);
    }

    Widget _ItemWidget(item) {
      return Container(
        // height: (item.item_id % 5 + 1) * 100.0, //无效
        height: 500,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(bottom: 20, left: 5, right: 5, top: 20),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border.all(width: 1, color: const Color(0xffffffff)),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(220, 220, 220, 100),
                offset: Offset(0, -5),
                blurRadius: 10.0,
                spreadRadius: 0.0,
              )
            ]),
        child: Container(
            height: 500,
            child: ItemHero(
              // height: (item.item_id % 5 + 1) * 100.0,

              tag: item.item_id,
              onTap: () => _toNavigator(item),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                    flex: 0,
                    child: Image.asset(
                      item.photo,
                      fit: BoxFit.contain,
                    )),
                Expanded(
                    flex: 0,
                    child: Align(
                      child: Text('商品名：${item.item_name}'),
                      alignment: Alignment(-0.9, 0.1),
                      heightFactor: 1.5,
                    )),
                Expanded(
                  flex: 0,
                  child: Align(
                    child: Text('发布者：${item.item_id}'),
                    alignment: Alignment(-0.9, 0.1),
                    heightFactor: 1.5,
                  ),
                )
              ]),
            )),
      );
    }

    List<Widget> getItemList(itemlist) {
      return List<Widget>.generate(
          itemlist.length, (index) => _ItemWidget(itemlist[index]));
    }

    return Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: ListView(children: [
      Align(
        alignment: Alignment.centerLeft,
        // heightFactor: 1.5,

        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                border: Border.all(
                  width: 0.5,
                  color: Color.fromRGBO(220, 220, 220, 100),
                ),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromRGBO(220, 220, 220, .50),
                      offset: Offset(0, 2),
                      blurRadius: 0,
                      spreadRadius: 0)
                ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List<Widget>.generate(
                  20,
                  (i) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5,
                              color: Color.fromRGBO(220, 220, 220, 100)),
                        ),
                        width: 100,
                        height: 50,
                        padding: const EdgeInsets.all(5),
                        child: Text('类别${i}'),
                      )),
            )),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.count(

            // mainAxisSpacing: 20.0,

            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3,
            // padding: const EdgeInsets.all(10),
            children: getItemList(itemlist)),
      )
    ]));
  }
}
