import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_midterm/models/item_model.dart';
import 'package:ecommerce_midterm/utils/color_constant.dart';
import 'package:ecommerce_midterm/utils/enum_constant.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/utils/utils.dart';
import 'package:ecommerce_midterm/view_models/home_view_model.dart';
import 'package:ecommerce_midterm/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late HomeViewModel homeVM;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeVM = Provider.of<HomeViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: FirebaseFirestore.instance.collection("items").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No Record'));
          }
          return CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        key: _formKey,
                        name: "search",
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          fillColor: Theme.of(context).colorScheme.tertiary,
                          filled: true,
                          hintText: 'Search for product',
                          hintStyle:
                              Theme.of(context).inputDecorationTheme.hintStyle,
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/cart");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Badge(
                            badgeContent: Text('${homeVM.numItems}'),
                            child: const Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 3)),
                    items: [
                      Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/banner_1.jpeg")),
                            ),
                          );
                        },
                      ),
                      Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/banner_2.jpg")),
                            ),
                          );
                        },
                      ),
                    ]),
                Text(
                  "Categories",
                  style: TextStyleConstant.normalLargexText.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 4,
                        right: 8,
                        bottom: 4,
                        left: 8,
                      ),
                      decoration: BoxDecoration(
                          color: homeVM.selectedCategory == Categories.jacket
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).toggleableActiveColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          homeVM.setCategory(Categories.jacket);
                        },
                        child: Center(
                          child: Text(
                            "Jacket",
                            style: TextStyleConstant.normalMediumText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 4,
                        right: 8,
                        bottom: 4,
                        left: 8,
                      ),
                      decoration: BoxDecoration(
                          color: homeVM.selectedCategory == Categories.tankTop
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).toggleableActiveColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          homeVM.setCategory(Categories.tankTop);
                        },
                        child: Center(
                          child: Text(
                            "TankTop",
                            style: TextStyleConstant.normalMediumText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 4,
                        right: 8,
                        bottom: 4,
                        left: 8,
                      ),
                      decoration: BoxDecoration(
                          color: homeVM.selectedCategory == Categories.jean
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).toggleableActiveColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          homeVM.setCategory(Categories.jean);
                        },
                        child: Center(
                          child: Text(
                            "Jean",
                            style: TextStyleConstant.normalMediumText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 4,
                        right: 8,
                        bottom: 4,
                        left: 8,
                      ),
                      decoration: BoxDecoration(
                          color: homeVM.selectedCategory == Categories.polo
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).toggleableActiveColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          homeVM.setCategory(Categories.polo);
                        },
                        child: Center(
                          child: Text(
                            "Polo",
                            style: TextStyleConstant.normalMediumText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 4,
                        right: 8,
                        bottom: 4,
                        left: 8,
                      ),
                      decoration: BoxDecoration(
                          color: homeVM.selectedCategory == Categories.kaki
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).toggleableActiveColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          homeVM.setCategory(Categories.kaki);
                        },
                        child: Center(
                          child: Text(
                            "Kaki",
                            style: TextStyleConstant.normalMediumText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 4,
                        right: 8,
                        bottom: 4,
                        left: 8,
                      ),
                      decoration: BoxDecoration(
                          color: homeVM.selectedCategory == Categories.short
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).toggleableActiveColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          homeVM.setCategory(Categories.short);
                        },
                        child: Center(
                          child: Text(
                            "Short",
                            style: TextStyleConstant.normalMediumText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 4,
                        right: 8,
                        bottom: 4,
                        left: 8,
                      ),
                      decoration: BoxDecoration(
                          color: homeVM.selectedCategory == Categories.tShirt
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).toggleableActiveColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: InkWell(
                        onTap: () {
                          homeVM.setCategory(Categories.tShirt);
                        },
                        child: Center(
                          child: Text(
                            "T-Shirt",
                            style: TextStyleConstant.normalMediumText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Lastest Product",
                  style: TextStyleConstant.normalLargexText.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(
                  height: 16,
                ),
              ])),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/detail-cart',
                              arguments: snapshot.data?.docs[index].data()
                                  as Map<String, dynamic>);
                        },
                        child: ItemsCard(
                            cardInfo:
                                (snapshot.data?.docs[index] as dynamic).data()),
                      ),
                    );
                  },
                  childCount: snapshot.data?.docs.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ItemsCard extends StatelessWidget {
  const ItemsCard({Key? key, required this.cardInfo}) : super(key: key);
  final Map<String, dynamic> cardInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      Utils.imageFromBase64String(cardInfo["images"][0]).image),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          cardInfo["name"].toString(),
          style: TextStyleConstant.normalLargeText.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "${cardInfo["price"]} vnd",
          style: TextStyleConstant.normalMediumText.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary),
        ),
      ],
    );
  }
}
