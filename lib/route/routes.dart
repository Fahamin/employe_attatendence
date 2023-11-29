import 'package:employe_attatendence/screen/login_screen.dart';
import 'package:employe_attatendence/screen/regestrer_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';


class Routes {
  static String homePage = '/homepage';

  static String splashScreen = '/splashScreen';

  static String mainScreen = '/mainpage';

  static String country = '/country';

  static String registration = '/registration';

  static String iptv = '/iptv';

  static String player = '/player';

  static String player2 = '/player2';

  static String nexusAddons = '/nexusAddons';

  static String productPage = '/productPage';

  static String favPage = '/favPage';
}

appRoutes() => [
      GetPage(
        name: Routes.homePage,
        page: () => LoginScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.registration,
        page: () => RegistrationScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      )
    ];
