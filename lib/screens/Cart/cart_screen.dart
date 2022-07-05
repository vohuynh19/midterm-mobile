import 'package:ecommerce_midterm/utils/color_constant.dart';
import 'package:ecommerce_midterm/view_models/home_view_model.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late HomeViewModel homeVM;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeVM = Provider.of<HomeViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).toggleableActiveColor,
          title: const Text("Cart"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(slivers: [
                SliverList(
                    delegate: SliverChildListDelegate(
                  homeVM.carts
                      .map((e) => CartCard(
                            cardInfo: e,
                            key: UniqueKey(),
                          ))
                      .toList(),
                ))
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Amount: ${homeVM.totalAmount}"),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(4),
                        child: const Text("BUY")),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cardInfo}) : super(key: key);
  final Map<String, dynamic> cardInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
            color: ColorConstant.secondaryBackGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(cardInfo["name"].toString()),
              const SizedBox(
                height: 8,
              ),
              Text(cardInfo["price"].toString()),
              const SizedBox(
                height: 8,
              ),
              Text(cardInfo["category"].toString()),
            ],
          ),
          const Icon(Icons.close)
        ]),
      ),
    );
  }
}
