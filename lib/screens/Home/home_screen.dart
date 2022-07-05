import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_midterm/utils/enum_constant.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/view_models/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late CategoryViewModel categoryVM;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categoryVM = Provider.of<CategoryViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).backgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: FormBuilderTextField(
                    key: _formKey,
                    name: "search",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16),
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
              ),
              const Text("Categories"),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 4,
                      right: 8,
                      bottom: 4,
                      left: 4,
                    ),
                    decoration: BoxDecoration(
                        color: categoryVM.selectedCategory == Categories.jacket
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).toggleableActiveColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: InkWell(
                      onTap: () {},
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
                      left: 4,
                    ),
                    decoration: BoxDecoration(
                        color: categoryVM.selectedCategory == Categories.tankTop
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).toggleableActiveColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: InkWell(
                      onTap: () {},
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
                      left: 4,
                    ),
                    decoration: BoxDecoration(
                        color: categoryVM.selectedCategory == Categories.jean
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).toggleableActiveColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: InkWell(
                      onTap: () {},
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
                      left: 4,
                    ),
                    decoration: BoxDecoration(
                        color: categoryVM.selectedCategory == Categories.polo
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).toggleableActiveColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: InkWell(
                      onTap: () {},
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
                      left: 4,
                    ),
                    decoration: BoxDecoration(
                        color: categoryVM.selectedCategory == Categories.kaki
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).toggleableActiveColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: InkWell(
                      onTap: () {},
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
                      left: 4,
                    ),
                    decoration: BoxDecoration(
                        color: categoryVM.selectedCategory == Categories.short
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).toggleableActiveColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: InkWell(
                      onTap: () {},
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
                      left: 4,
                    ),
                    decoration: BoxDecoration(
                        color: categoryVM.selectedCategory == Categories.tShirt
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).toggleableActiveColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: InkWell(
                      onTap: () {},
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
              FutureBuilder(
                  future: FirebaseFirestore.instance.collection("items").get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          "No Record",
                          style: TextStyleConstant.normalMediumText.copyWith(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      );
                    }
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.0,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            color: Colors.red,
                          );
                        },
                        childCount: 10,
                      ),
                    );
                  }),
            ]),
          )
        ],
      ),
    );
  }
}
