import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_midterm/utils/color_constant.dart';
import 'package:ecommerce_midterm/utils/enum_constant.dart';
import 'package:ecommerce_midterm/utils/extensions/ext.dart';
import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:ecommerce_midterm/utils/size_constant.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/view_models/category_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/HorizontalList.dart';
import '../components/VerticalList.dart';

const dataArr = [
  {"title": "Đồ Ăn Vặt", "src": ""},
  {"title": "Đồ uống", "src": ""},
  {"title": "Thực phẩm khô", "src": ""},
  {"title": "Xem thêm", "src": ""},
];

const bannerSrcArr = [
  'assets/images/banner/1.jpeg',
  'assets/images/banner/2.png',
  'assets/images/banner/3.jpeg'
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CategoryViewModel categoryVM;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categoryVM = Provider.of<CategoryViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

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
                  expandedHeight: 60,
                  backgroundColor: ColorConstant.lightColor,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: InkWell(
                      onTap: () => {},
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Giao hàng đến',
                                  style: TextStyleConstant.normalLargeText
                                      .setColor(ColorConstant.textColor)
                                      .bold,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.map,
                                      color: ColorConstant.textColor,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text('86 Tản Đà, P11, Quận 5')
                                  ],
                                )
                              ],
                            ),
                            const Icon(Icons.keyboard_double_arrow_left,
                                color: ColorConstant.textColor, size: 32),
                          ],
                        ),
                      ),
                    ),
                  ),
                  floating: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 16,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 200, autoPlay: true, viewportFraction: 1),
                      items: bannerSrcArr.map((i) {
                        return Builder(
                          builder: (BuildContext ctx) {
                            return Container(
                              width: width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(i),
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.1),
                                      BlendMode.softLight),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Đồ ăn khô',
                        style: TextStyleConstant.normalxxLargeText.bold,
                      ),
                    ),
                    const HorizontalList(),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Ăn vặt',
                        style: TextStyleConstant.normalxxLargeText.bold,
                      ),
                    ),
                    const HorizontalList(),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Trà sữa',
                        style: TextStyleConstant.normalxxLargeText.bold,
                      ),
                    ),
                    const HorizontalList(),
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
