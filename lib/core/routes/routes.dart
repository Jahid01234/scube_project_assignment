import 'package:get/get.dart';
import 'package:scube_assignment/features/auth/login/view/login_screen.dart';
import 'package:scube_assignment/features/dashboard/view/dashboard_screen.dart';
import 'package:scube_assignment/features/dashboard/view/menu_item_details_screen.dart';
import 'package:scube_assignment/features/power_consumtion/view/power_consumption_history_screen.dart';

class AppRoutes {
  // Get routes name here.......
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String menuItemDetails = '/menuItemDetails';
  static const String powerConsumptionHistory = '/powerConsumptionHistory';






  // Get routes here.......
  static List<GetPage> routes = [
    GetPage(
      name: login,
      page: ()=> LoginScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: dashboard,
      page: ()=> DashboardScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: menuItemDetails,
      page: ()=> MenuItemDetailsScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: powerConsumptionHistory,
      page: ()=> PowerConsumptionHistoryScreen(),
      transition: Transition.leftToRight,
    ),
  ];
}