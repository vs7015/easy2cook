import 'package:easy2cook/screens/auth/authenticate.dart';
import 'package:easy2cook/screens/home/home_screen.dart';
import 'package:easy2cook/screens/search/search_screen.dart';
import 'package:easy2cook/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy2cook/screens/search/search_screen.dart';
import 'package:easy2cook/screens/search/components/ingredient_list_provider.dart';

import 'package:easy2cook/models/user.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    // Dostop do uporabnika
    final FUser? user = Provider.of<FUser?>(context);

    // user not logged in
    if (user == null) {
      return Authenticate();
    }
    // user logged in
    else {
      if (id == 0) {
        return ChangeNotifierProvider(
          create: ((_) => MyChangeNotifier()),
          child: HomeScreen(),
        );
      }
      if (id == 1) {
        return /* MultiProvider(
          providers: [ */
            ChangeNotifierProvider(
          create: ((_) => MyChangeNotifier()),
          /*  ),
            ChangeNotifierProvider<ListProvider>(
              create: ((context) => ListProvider()),
            ),
          ], */
          child: SearchScreen(),
        );
      } else
        return ProfileScreen();
    }
  }
}

class MyChangeNotifier extends ChangeNotifier {
  int index = 0;

  void setCategory(int i) {
    index = i;
    notifyListeners();
  }
}
