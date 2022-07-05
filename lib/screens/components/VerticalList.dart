import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        VerticalListItem(),
        VerticalListItem(),
        VerticalListItem()
      ],
    );
  }
}

class VerticalListItem extends StatelessWidget {
  const VerticalListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage("assets/images/doanvat/gao.jpeg"),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.softLight),
              ),
            ),
          ),
          Column(
            children: [
              Text('Com Tam Co Hoa'),
              Row(
                children: [],
              )
            ],
          )
        ],
      ),
    );
  }
}
