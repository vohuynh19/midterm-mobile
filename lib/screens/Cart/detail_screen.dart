import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.cartInfo}) : super(key: key);
  final Map<String, dynamic> cartInfo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/male/jacket/black_jacket/khoac2.jpg")),
                ),
              ),
            ),
            Positioned(
                bottom: 100,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(children: [
                    Text(
                      "Full Shirt",
                      style: TextStyleConstant.normalLargeText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "345.000 vnd",
                      style: TextStyleConstant.normalMediumText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: TextStyleConstant.normalMediumText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    const Text(
                        "sodifj oigj sdfgoijsdofg sdfoigsdfglsdkfjgiodgsdfgiosd, dfoigdsmfgklsdfigjsdfg gisdf"),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: TextStyleConstant.normalMediumText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          color: Theme.of(context).primaryColor,
                          child: Center(child: Text("S")),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          color: Theme.of(context).primaryColor,
                          child: Center(child: Text("S")),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          color: Theme.of(context).primaryColor,
                          child: Center(child: Text("M")),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          color: Theme.of(context).primaryColor,
                          child: Center(child: Text("L")),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text("Add To Cart"),
                          ),
                        ),
                      ),
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
