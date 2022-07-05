import 'package:ecommerce_midterm/utils/color_constant.dart';
import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
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
                  image: const AssetImage("assets/images/doanvat/gao.jpeg"),
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
                color: ColorConstant.lightColor.withOpacity(0.85),
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
                    'Bánh gạo vị cá nhật',
                    style: TextStyleConstant.normalxxLargeText.semiBold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Mô tả sản phẩm:',
                    style: TextStyleConstant.normalLargeText.semiBold,
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
                    style: TextStyleConstant.normalLargeText.semiBold,
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
            : ColorConstant.secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
          child: Text(type,
              style: isChosen
                  ? TextStyleConstant.normalLargeText.semiBold
                      .setColor(ColorConstant.backgroundColor)
                  : TextStyleConstant.normalLargeText.semiBold)),
    );
  }
}
