import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import '../../utils/color_constant.dart';
import '../components/HorizontalList.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

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
              return const Center(child: Text('noData'));
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  backgroundColor: ColorConstant.backgroundColor,
                  flexibleSpace: Container(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CategoryItem(
                            icon: Icons.restaurant,
                            name: 'Đồ ăn',
                            isActive: true,
                          ),
                          CategoryItem(
                            icon: IconData(0xe25a, fontFamily: 'MaterialIcons'),
                            name: 'Đồ ăn',
                            isActive: false,
                          ),
                          CategoryItem(
                            icon: IconData(0xe22e, fontFamily: 'MaterialIcons'),
                            name: 'Đồ ăn',
                            isActive: false,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return HorizontalScrollItem(
                        desc: foodArrData[index]['desc'] as String,
                        title: foodArrData[index]['title'] as String,
                        src: foodArrData[index]['src'] as String,
                        rateCounter:
                            foodArrData[index]['rateCounter'] as double,
                        price: foodArrData[index]['price'] as double,
                      );
                    },
                    childCount: 6,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.65,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool isActive;

  const CategoryItem(
      {Key? key,
      required this.icon,
      required this.name,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 16),
      child: Column(children: [
        CircleAvatar(
          backgroundColor: isActive == true
              ? ColorConstant.primaryColor
              : ColorConstant.secondaryColor,
          child: Icon(
            icon,
            color: isActive == true
                ? ColorConstant.backgroundColor
                : ColorConstant.textColor,
          ),
        ),
        Text(
          name,
          style: TextStyleConstant.normalMediumText
              .setColor(ColorConstant.textColor),
        )
      ]),
    );
  }
}
