import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/view_models/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/item-provider.dart';
import '../../utils/color_constant.dart';
import '../components/HorizontalList.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ItemProvider>(context);
    var mainVm = Provider.of<CategoryViewModel>(context);

    return SafeArea(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: ColorConstant.backgroundColor,
              flexibleSpace: Container(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  onChanged: (String text) => {mainVm.setSearchFilter(text)},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
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
                    children: [
                      CategoryItem(
                        icon: Icons.restaurant,
                        name: 'Đồ ăn khô',
                        isActive: mainVm.selectedCategory == 'do_an_kho',
                        onTap: () => mainVm.setCategory('do_an_kho'),
                      ),
                      CategoryItem(
                        icon:
                            const IconData(0xe25a, fontFamily: 'MaterialIcons'),
                        name: 'Ăn vặt',
                        isActive: mainVm.selectedCategory == 'do_an_vat',
                        onTap: () => mainVm.setCategory('do_an_vat'),
                      ),
                      CategoryItem(
                        icon:
                            const IconData(0xe22e, fontFamily: 'MaterialIcons'),
                        name: 'Đồ uống',
                        isActive: mainVm.selectedCategory == 'do_uong',
                        onTap: () => mainVm.setCategory('do_uong'),
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
                    desc: vm.filterCategoryItem(mainVm.selectedCategory,
                                mainVm.searchFilter)[index]['desc'] ==
                            null
                        ? ''
                        : vm.filterCategoryItem(mainVm.selectedCategory,
                            mainVm.searchFilter)[index]['desc'] as String,
                    title: vm.filterCategoryItem(mainVm.selectedCategory,
                                mainVm.searchFilter)[index]['title'] ==
                            null
                        ? ''
                        : vm.filterCategoryItem(mainVm.selectedCategory,
                            mainVm.searchFilter)[index]['title'] as String,
                    src: vm.filterCategoryItem(mainVm.selectedCategory,
                                mainVm.searchFilter)[index]['images'] ==
                            null
                        ? ''
                        : vm.filterCategoryItem(mainVm.selectedCategory,
                            mainVm.searchFilter)[index]['images'] as String,
                    price: double.parse(vm
                        .filterCategoryItem(mainVm.selectedCategory,
                            mainVm.searchFilter)[index]['price']
                        .toString()),
                  );
                },
                childCount: vm
                    .filterCategoryItem(
                        mainVm.selectedCategory, mainVm.searchFilter)
                    .length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.65,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool isActive;
  final Function onTap;

  const CategoryItem(
      {Key? key,
      required this.icon,
      required this.name,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 16),
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
      ),
    );
  }
}
