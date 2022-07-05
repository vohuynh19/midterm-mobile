import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_midterm/utils/extensions/ext.dart';
import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import '../../utils/color_constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("items").get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('noData'));
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: Center(
                    child: Text(
                      'Xoá hết',
                      style: TextStyleConstant.normalLargeText
                          .setColor(ColorConstant.primaryColor)
                          .semiBold,
                    ),
                  ),
                  leadingWidth: 80,
                  pinned: true,
                  backgroundColor: ColorConstant.backgroundColor,
                  floating: true,
                  title: Text(
                    'Giỏ Hàng',
                    style: TextStyleConstant.normalLargeText
                        .setColor(ColorConstant.textColor)
                        .semiBold,
                  ),
                  centerTitle: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CartItem(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CartItem(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CartItem(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CartItem(),
                    )
                  ]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/doanvat/gao.jpeg"),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.softLight),
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text("Bánh gạo da heo siêu ngon",
                  style: TextStyleConstant.normalLargeText
                      .setColor(ColorConstant.textColor)
                      .semiBold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${7000.formatCurrency()} đ",
                  style: TextStyleConstant.normalxxLargeText
                      .setColor(ColorConstant.primaryColor)
                      .semiBold,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          backgroundColor: MaterialStateProperty.all(
                              ColorConstant.backgroundColor),
                          foregroundColor: MaterialStateProperty.all(
                              ColorConstant.textColor),
                        ),
                        onPressed: () => {},
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('1'),
                    ),
                    SizedBox(
                      width: 24,
                      height: 24,
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
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )
    ]);
  }
}
