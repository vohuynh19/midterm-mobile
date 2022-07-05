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
              return Center(child: Text('noData'));
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 50,
                  backgroundColor: ColorConstant.primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Giao hang den',
                          style: TextStyleConstant.normalSmallText,
                        ),
                        Row(
                          children: const [Icon(Icons.map), Text('86 Tan Da')],
                        )
                      ],
                    ),
                  ),
                  floating: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                              ),
                            ),
                            isDense: true,
                            suffixIcon: const Icon(
                              Icons.search,
                              color: ColorConstant.textColor,
                              size: 24,
                            ),
                            focusColor: ColorConstant.primaryColor,
                            fillColor: ColorConstant.lightColor,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(height: 160),
                      items: bannerSrcArr.map((i) {
                        return Builder(
                          builder: (BuildContext ctx) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
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
                    const HorizontalScrollItemList(),
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
                    const HorizontalScrollItemList(),
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
                    const HorizontalScrollItemList(),
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

class HorizontalScrollItemList extends StatelessWidget {
  const HorizontalScrollItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...foodArrData.map((e) => HorizontalScrollItem(
                desc: e['desc'] as String,
                title: e['title'] as String,
                src: e['src'] as String,
                rateCounter: e['rateCounter'] as double,
                price: e['price'] as double,
              )),
          const ViewMore(
            type: 'kho',
          )
          // HorizontalScrollItem(),
          // HorizontalScrollItem(),
        ],
      ),
    );
  }
}

class HorizontalScrollItem extends StatelessWidget {
  final String src;
  final String title;
  final String desc;
  final double rateCounter;
  final double price;

  const HorizontalScrollItem(
      {Key? key,
      required this.src,
      required this.title,
      required this.desc,
      required this.rateCounter,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              image: AssetImage(src),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.softLight),
            )),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: TextStyleConstant.normalLargeText.semiBold,
          ),
          Text(
            desc,
            style: TextStyleConstant.normalxSmallText,
          ),
          Spacer(),
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
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: [
            ElevatedButton(
              child: Icon(Icons.next_plan),
              onPressed: () {},
            ),
            Text('Xem them')
          ],
        ),
      ),
    );
  }
}
