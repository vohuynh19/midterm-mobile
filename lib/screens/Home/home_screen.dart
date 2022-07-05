import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_midterm/utils/enum_constant.dart';
import 'package:ecommerce_midterm/utils/text_style_constant.dart';
import 'package:ecommerce_midterm/view_models/category_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        padding: const EdgeInsets.all(16),
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
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        child: Center(
                          child: Text((snapshot.data?.docs[index] as dynamic)
                              .data()['name'] as String),
                        ),
                        color: Colors.red,
                      );
                    },
                    childCount: snapshot.data?.docs.length,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const Text("Categories"),
                      const SizedBox(
                        height: 16,
                      ),
                      TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: const Text('Logout'),
                      ),
                    ],
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
