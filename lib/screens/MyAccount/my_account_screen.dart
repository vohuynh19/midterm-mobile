import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_midterm/utils/extensions/ext.dart';
import 'package:ecommerce_midterm/utils/extensions/textstyle_ext.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../utils/color_constant.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 140,
              backgroundColor: ColorConstant.secondaryColor,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  onTap: () => {},
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                backgroundColor: ColorConstant.backgroundColor,
                                child: Icon(
                                  Icons.person,
                                  color: ColorConstant.primaryColor,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Vo Huynh',
                                style:
                                    TextStyleConstant.normalxLargeText.semiBold,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
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
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Thông tin cá nhân',
                                style: TextStyleConstant.normalLargeText),
                            const Icon(
                              Icons.arrow_right,
                              size: 24,
                            ),
                          ],
                        ),
                        const Divider(
                          height: 32,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Lịch sử đặt hàng',
                                style: TextStyleConstant.normalLargeText),
                            const Icon(
                              Icons.arrow_right,
                              size: 24,
                            ),
                          ],
                        ),
                        const Divider(
                          height: 32,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Về chúng tôi',
                                style: TextStyleConstant.normalLargeText),
                            const Icon(
                              Icons.arrow_right,
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => FirebaseAuth.instance.signOut(),
                            child: const Text('Đăng xuất'),
                          ),
                        )
                      ],
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
