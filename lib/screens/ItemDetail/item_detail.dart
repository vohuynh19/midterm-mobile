import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  static String route = '/itemDetail';

  const ItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
            child: const Center(child: Text('itemdetail')),
          ),
          Positioned(
            child: Container(
              width: width,
              height: height * 0.4,
              color: Colors.pink,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: width,
                height: height * 0.7,
                color: Colors.green,
              )),
        ]),
      ),
    );
  }
}
