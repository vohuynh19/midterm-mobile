import 'package:ecommerce_midterm/utils/extensions/ext.dart';
import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:flutter/material.dart';

import '../../utils/color_constant.dart';
import '../../utils/text_style_constant.dart';

const foodArrData = [
  {
    "src": "assets/images/doanvat/gao.jpeg",
    "rateCounter": 7.0,
    "title": "Bánh Gạo",
    "desc": "Bánh gạo giá rẻ, uy tín chất lượng nhất TP.HCM",
    "price": 7500.0
  },
  {
    "src": "assets/images/doanvat/gao.jpeg",
    "rateCounter": 7.0,
    "title": "Bánh Gạo",
    "desc": "Bánh gạo giá rẻ, uy tín chất lượng nhất TP.HCM",
    "price": 7000.0
  },
  {
    "src": "assets/images/doanvat/gao.jpeg",
    "rateCounter": 7.0,
    "title": "Bánh Gạo",
    "desc": "Bánh gạo giá rẻ, uy tín chất lượng nhất TP.HCM",
    "price": 7000.0
  },
  {
    "src": "assets/images/doanvat/gao.jpeg",
    "rateCounter": 7.0,
    "title": "Bánh Gạo",
    "desc": "Bánh gạo giá rẻ, uy tín chất lượng nhất TP.HCM",
    "price": 7000.0
  },
  {
    "src": "assets/images/doanvat/gao.jpeg",
    "rateCounter": 7.0,
    "title": "Bánh Gạo",
    "desc": "Bánh gạo giá rẻ, uy tín chất lượng nhất TP.HCM",
    "price": 7000.0
  },
  {
    "src": "assets/images/doanvat/gao.jpeg",
    "rateCounter": 7.0,
    "title": "Bánh Gạo",
    "desc": "Bánh gạo giá rẻ, uy tín chất lượng nhất TP.HCM",
    "price": 7000.0
  },
  {
    "src": "assets/images/doanvat/gao.jpeg",
    "rateCounter": 7.0,
    "title": "Bánh Gạo",
    "desc": "Bánh gạo giá rẻ, uy tín chất lượng nhất TP.HCM",
    "price": 7000.0
  },
];

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...foodArrData.map((e) => HorizontalScrollItem(
                desc: e['desc'] as String,
                title: e['title'] as String,
                src: e['src'] as String,
                rateCounter: e['rateCounter'] as double,
                price: e['price'] as double,
              )),
          const ViewMore(
            type: 'kho',
          )
        ],
      ),
    );
  }
}

class HorizontalScrollItem extends StatelessWidget {
  final String src;
  final String title;
  final String desc;
  final double rateCounter;
  final double price;

  const HorizontalScrollItem(
      {Key? key,
      required this.src,
      required this.title,
      required this.desc,
      required this.rateCounter,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: 290,
      width: 160,
      decoration: BoxDecoration(
          color: ColorConstant.lightColor,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(src),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.softLight),
            )),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: TextStyleConstant.normalLargeText.semiBold,
          ),
          Text(
            desc,
            style: TextStyleConstant.normalxSmallText,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${price.formatCurrency()} đ',
                style: TextStyleConstant.normalxxLargeText
                    .setColor(ColorConstant.primaryColor)
                    .semiBold,
              ),
              SizedBox(
                height: 24,
                width: 24,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () => {},
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ViewMore extends StatelessWidget {
  final String type;

  const ViewMore({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: [
            ElevatedButton(
              child: const Icon(Icons.next_plan),
              onPressed: () {},
            ),
            const Text('Xem them')
          ],
        ),
      ),
    );
  }
}
