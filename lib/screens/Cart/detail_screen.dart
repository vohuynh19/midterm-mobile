import 'package:ecommerce_midterm/utils/color_constant.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/utils/utils.dart';
import 'package:ecommerce_midterm/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetail extends StatelessWidget {
  static String route = '/itemDetail';
  final Map<String, dynamic> cartInfo;

  const ItemDetail({Key? key, required this.cartInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<HomeViewModel>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            child: Container(
              width: width,
              height: height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      Utils.imageFromBase64String(cartInfo["images"][0]).image,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.softLight),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: ColorConstant.secondaryBackGroundColor.withOpacity(0.85),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    cartInfo['name'],
                    style: TextStyleConstant.normalLargeText
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Mô tả sản phẩm:',
                    style: TextStyleConstant.normalLargeText
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ullamcorper in non at egestas metus auctor ultricies phasellus senectus. Turpis orci donec faucibus turpis malesuada sed diam potenti nulla.',
                    style: TextStyleConstant.normalMediumText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Size',
                    style: TextStyleConstant.normalLargeText
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: const [
                        SizeBox(
                          isChosen: true,
                          type: 'X',
                        ),
                        SizeBox(
                          isChosen: false,
                          type: 'M',
                        ),
                        SizeBox(
                          isChosen: false,
                          type: 'XL',
                        ),
                        SizeBox(
                          isChosen: false,
                          type: 'XXL',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      vm.addToCart(cartInfo);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: Center(
                          child: Text("Add To Cart",
                              style: TextStyleConstant.normalMediumText
                                  .copyWith(fontWeight: FontWeight.w600)),
                        )),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class SizeBox extends StatelessWidget {
  final String type;
  final bool isChosen;

  const SizeBox({Key? key, required this.type, required this.isChosen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: isChosen
            ? ColorConstant.primaryColor
            : ColorConstant.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
          child: Text(type,
              style: isChosen
                  ? TextStyleConstant.normalLargeText.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorConstant.backgroundColor)
                  : TextStyleConstant.normalLargeText
                      .copyWith(fontWeight: FontWeight.w600))),
    );
  }
}
