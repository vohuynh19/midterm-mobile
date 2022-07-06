import 'package:ecommerce_midterm/provider/item-provider.dart';
import 'package:ecommerce_midterm/screens/Category/category_screen.dart';
import 'package:ecommerce_midterm/screens/ItemDetail/item_detail.dart';
import 'package:ecommerce_midterm/utils/extensions/ext.dart';
import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:ecommerce_midterm/utils/utils.dart';
import 'package:ecommerce_midterm/view_models/item_detail_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../utils/color_constant.dart';
import '../../utils/text_style_constant.dart';
import '../../view_models/category_view_model.dart';
import '../../view_models/home_view_model.dart';

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
  final String type;

  const HorizontalList({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ItemProvider>(context);
    return SizedBox(
      height: 290,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...(vm.isLoading
              ? [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                        child: SpinKitWave(
                      color: ColorConstant.primaryColor,
                    )),
                  )
                ]
              : [
                  ...vm
                      .getCategoryItem(type)
                      .sublist(
                          0,
                          vm.getCategoryItem(type).length > 5
                              ? 5
                              : vm.getCategoryItem(type).length)
                      .map((e) => HorizontalScrollItem(
                            desc: e['desc'] == null ? '' : e['desc'] as String,
                            title:
                                e['title'] == null ? '' : e['title'] as String,
                            src: e['images'] == null
                                ? ''
                                : e['images'] as String,
                            price: double.parse(e['price'].toString()),
                          )),
                  vm.getCategoryItem(type).length == 0
                      ? SizedBox(
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
                      : vm.getCategoryItem(type).length > 5
                          ? ViewMore(
                              type: type,
                            )
                          : const SizedBox()
                ])
        ],
      ),
    );
  }
}

class HorizontalScrollItem extends StatelessWidget {
  final String src;
  final String title;
  final String desc;

  final double price;

  const HorizontalScrollItem(
      {Key? key,
      required this.src,
      required this.title,
      required this.desc,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ItemDetailViewModal>(context);

    return InkWell(
      onTap: (() {
        Navigator.pushNamed(
          context,
          ItemDetail.route,
        );

        vm.fetchData(context, title);
      }),
      child: Container(
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
                  image: Utils.imageFromBase64String(src).image,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.softLight),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: TextStyleConstant.normalLargeText.semiBold,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              desc,
              style: TextStyleConstant.normalxSmallText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
    var vm = Provider.of<HomeViewModel>(context);
    var categoryVM = Provider.of<CategoryViewModel>(context);
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: [
            ElevatedButton(
                child: const Icon(Icons.next_plan),
                onPressed: () =>
                    {vm.setSelectedTabIndex(1), categoryVM.setCategory(type)}),
            const Text('Xem thêm')
          ],
        ),
      ),
    );
  }
}

class DetailScreenArgument {
  String title;
  DetailScreenArgument(this.title);
}
