import 'package:ecommerce_midterm/utils/color_constant.dart';
import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/utils/utils.dart';
import 'package:ecommerce_midterm/view_models/item_detail_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetail extends StatelessWidget {
  static String route = '/itemDetail';

  const ItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ItemDetailViewModal>(context);
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
                  image: Utils.imageFromBase64String(vm.data['images']).image,
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
                    vm.data['title'],
                    style: TextStyleConstant.normalxxLargeText.semiBold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Mô tả sản phẩm:',
                    style: TextStyleConstant.normalLargeText.semiBold,
                  ),
                  Text(
                    vm.data['desc'],
                    style: TextStyleConstant.normalMediumText,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Số lượng:',
                    style: TextStyleConstant.normalLargeText.semiBold,
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
                            vm.setItemNumber(
                                vm.itemNumber - 1 >= 0 ? vm.itemNumber - 1 : 0)
                          },
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          vm.itemNumber.toString(),
                          style: TextStyleConstant.normalLargeText.semiBold,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: () => vm.setItemNumber(vm.itemNumber + 1),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Thêm vào giỏ hàng'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: ColorConstant.primaryColor,
                child: Icon(Icons.arrow_back),
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
                : TextStyleConstant.normalLargeText.semiBold),
      ),
    );
  }
}
