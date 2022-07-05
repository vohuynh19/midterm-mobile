import 'package:ecommerce_midterm/screens/Auth/login_screen.dart';
import 'package:ecommerce_midterm/screens/ItemDetail/item_detail.dart';
import 'package:ecommerce_midterm/screens/TabBar/tabbar_screen.dart';
import 'package:ecommerce_midterm/utils/themes.dart';
import 'package:ecommerce_midterm/view_models/category_view_model.dart';
import 'package:ecommerce_midterm/view_models/home_view_model.dart';
import 'package:ecommerce_midterm/view_models/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      lazy: true,
    ),
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      lazy: true,
    ),
    ChangeNotifierProvider(
      create: (context) => CategoryViewModel(),
      lazy: true,
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.themeData,
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      home: Builder(
        builder: (context) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.active) {
                return Center(child: CircularProgressIndicator());
              }
              final user = snapshot.data;
              if (user != null &&
                  FirebaseAuth.instance.currentUser?.email != null) {
                return const TabbarScreen();
              }

              return LoginScreen();
            },
          );
        },
      ),
      routes: <String, WidgetBuilder>{
        '/login': (context) => const LoginScreen(),
        ItemDetail.route: (context) => const ItemDetail(),
      },
    );
  }
}
