import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_midterm/provider/cart-provider.dart';
import 'package:ecommerce_midterm/utils/extensions/ext.dart';
import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../utils/color_constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<CartProvider>(context);

    return SafeArea(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Center(
                child: TextButton(
                  child: Text(
                    'Xoá hết',
                    style: TextStyleConstant.normalLargeText
                        .setColor(ColorConstant.primaryColor)
                        .semiBold,
                  ),
                  onPressed: () {
                    vm.removeAll();
                  },
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
                ...(vm.itemArr.length > 0
                    ? [
                        ...vm.itemArr.map(
                          (e) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CartItem(
                              cartData: e,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              vm.submitCart();
                            },
                            child: const Text('Xác nhận đặt hàng'),
                          ),
                        )
                      ]
                    : [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.no_backpack,
                                  size: 100,
                                ),
                                Text(
                                  'No Record',
                                  style: TextStyleConstant.normalLargeText,
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final dynamic cartData;
  const CartItem({Key? key, this.cartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<CartProvider>(context);

    return Row(children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image:
                Utils.imageFromBase64String(cartData['data']['images']).image,
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
              child: Text(
                cartData['data']['title'],
                style: TextStyleConstant.normalLargeText
                    .setColor(ColorConstant.textColor)
                    .semiBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${(cartData['data']['price'] as int).formatCurrency()} đ",
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
                        onPressed: () => {
                          vm.updateItem(
                              cartData['data'], cartData['amount'] - 1)
                        },
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(cartData['amount'].toString()),
                    ),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () => {
                          vm.updateItem(
                              cartData['data'], cartData['amount'] + 1)
                        },
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
