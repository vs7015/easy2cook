import 'package:easy2cook/services/auth.dart';
import 'package:easy2cook/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy2cook/screens/home/components/body.dart';

import '../../components/my_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            width: 24,
          ),
          onPressed: null),
      centerTitle: true,
      title: Image.asset("assets/images/logo.png", width: 170),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/logout.svg", width: 24),
          onPressed: () async {
            await _auth.signOut();
          },
        ),
        SizedBox(
          width: SizeConfig.defaultSize * 0.6,
        )
      ],
    );
  }
}
