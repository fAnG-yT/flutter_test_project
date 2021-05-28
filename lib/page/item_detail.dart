import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/util/item_hero.dart';

class ItemDetail extends StatefulWidget {
  final Item item;

  ItemDetail({this.item}) : super();

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  Widget build(BuildContext context) {
    // final query = ModalRoute.of(context).settings.arguments;
    print(widget.item);
    return Scaffold(
        appBar: AppBar(
          title: Text("ItemDetail"),
        ),
        body: Center(
            child: ItemHero(
          height: MediaQuery.of(context).size.height,
          tag: widget.item.item_id,
          width: MediaQuery.of(context).size.width * 0.8,
          // onTap: () => Navigator.of(context).pop(),
          child: Column(children: [
            Image.asset(widget.item.photo, fit: BoxFit.contain),

            Align(
              child: Text(
                '商品名:${widget.item.item_name}',
                style: TextStyle(
                    color: Color.fromRGBO(224, 102, 102, 100),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              alignment: Alignment(-0.9, 0.5),
              heightFactor: 2.0,
            ),

            Align(
              child: Text('发布者:${widget.item.item_id.toString()}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200)),
              alignment: Alignment(-0.9, 0),
              // heightFactor: 2.0,
            ),

            // ElevatedButton(
            //   child: Text("goBack"),
            //   onPressed: () => Navigator.pop(context, "goback~"),
            // ),
          ]),
        )));
  }
}
