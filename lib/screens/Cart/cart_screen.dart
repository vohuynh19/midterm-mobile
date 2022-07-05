import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/utils/utils.dart';
import 'package:ecommerce_midterm/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color_constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<HomeViewModel>(context);
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
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
                      child: Text('Xoá hết',
                          style: TextStyleConstant.normalLargeText.copyWith(
                              color: ColorConstant.primaryColor,
                              fontWeight: FontWeight.w600)),
                    ),
                    leadingWidth: 80,
                    pinned: true,
                    backgroundColor: ColorConstant.backgroundColor,
                    floating: true,
                    title: Text('Giỏ Hàng',
                        style: TextStyleConstant.normalLargeText.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary)),
                    centerTitle: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(vm.carts
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: CartItem(
                              cartInfo: e,
                              key: UniqueKey(),
                            ),
                          ),
                        )
                        .toList()),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.cartInfo}) : super(key: key);
  final Map<String, dynamic> cartInfo;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Utils.imageFromBase64String(cartInfo["images"][0]).image,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.softLight),
          ),
        ),
      ),
      const SizedBox(
        width: 8,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(cartInfo["name"],
                  style: TextStyleConstant.normalLargeText
                      .copyWith(color: ColorConstant.textColor)),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${cartInfo["price"]} đ",
                    style: TextStyleConstant.normalLargeText
                        .copyWith(color: ColorConstant.primaryColor)),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                          MaterialStateProperty.all(ColorConstant.buttonColor),
                      foregroundColor:
                          MaterialStateProperty.all(ColorConstant.textColor),
                    ),
                    onPressed: () => {},
                    child: const Icon(
                      Icons.remove,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
