import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Account"),
          backgroundColor: Theme.of(context).toggleableActiveColor,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: InkWell(
                onTap: () {},
                child: const Text("Shop Location"),
              ),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: InkWell(
                onTap: () {},
                child: const Text("Profy ID"),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
