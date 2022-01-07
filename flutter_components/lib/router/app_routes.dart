import 'package:flutter/material.dart';
import 'package:flutter_components/models/models.dart';
import 'package:flutter_components/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'card',
        name: 'Card Screen',
        screen: const CardScreen(),
        icon: Icons.card_membership),
    MenuOption(
        route: 'listview1',
        name: 'ListView1 Screen',
        screen: const ListView1Screen(),
        icon: Icons.list),
    MenuOption(
        route: 'listview2',
        name: 'ListView2 Screen',
        screen: const ListView2Screen(),
        icon: Icons.list_alt_outlined),
    MenuOption(
        route: 'listview3',
        name: 'ListView3 Screen',
        screen: const ListView3Screen(),
        icon: Icons.card_membership),
    MenuOption(
        route: 'alert',
        name: 'Alert Screen',
        screen: const AlertScreen(),
        icon: Icons.ring_volume_sharp),
    MenuOption(
        route: 'avatar',
        name: 'Avatar Screen',
        screen: const AvatarScreen(),
        icon: Icons.supervised_user_circle),
    MenuOption(
        route: 'animate',
        name: 'Animated Screen',
        screen: const AnimatedScreen(),
        icon: Icons.warning_amber_sharp),
    MenuOption(
        route: 'inputs',
        name: 'Inputs Screen',
        screen: const InputsScreen(),
        icon: Icons.input_sharp),
    MenuOption(
        route: 'slider',
        name: 'Sliders Screen',
        screen: const SliderScreen(),
        icon: Icons.sledding),
    MenuOption(
        route: 'listviewBuilder',
        name: 'InfiniteScroll &Pull to refresh',
        screen: const ListViewBuilderScreen(),
        icon: Icons.build_circle),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final options in menuOptions) {
      appRoutes.addAll({
        options.route: (BuildContext context) => options.screen,
      });
    }

    return appRoutes;
  }
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'listview1': (BuildContext context) => const ListView1Screen(),
  //   'listview2': (BuildContext context) => const ListView2Screen(),
  //   'listview3': (BuildContext context) => const ListView3Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  //   'home': (BuildContext context) => const HomeScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
