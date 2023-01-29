import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zetico/driver/presentation/completed_order/view/completed_orders.dart';
import 'package:zetico/driver/presentation/home/view/home_driver_screen.dart';
import 'package:zetico/driver/presentation/orders_home/view/orders_home.dart';
import 'package:zetico/login_screen/view/login_screen.dart';
import 'package:zetico/main/presentation/add_outlet/view/add_outlet_screen.dart';
import 'package:zetico/main/presentation/declined_outlet/view/declined_outlet_screen.dart';
import 'package:zetico/main/presentation/purchasing_home/view/purchasing_home_screen.dart';
import '../../main/presentation/add_outlet_reg/view/add_outlet_reg_screen.dart';
import '../../main/presentation/home/view/home.dart';
import '../../main/presentation/manual_order/view/manual_order_screen.dart';
import '../../main/presentation/orders_home/view/orders_home_screen.dart';
import '../../main/presentation/outlet_home/view/outlet_home_screen.dart';
import '../../main/presentation/surveyed_home/view/surveyed_home_screen.dart';
import '../../splash_screen/splach_screen.dart';
import '../../warehouse/presentation/home/view/home_warehouse_screen.dart';
import '../../warehouse/presentation/warehouse_home/view/warehouse_home_screen.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeDriverRoute = "/homeDriverRoute";
  static const String loginRoute = "/loginRoute";
  static const String homeRoute = "/homeRoute";
  static const String surveyedHomeRoute = "/surveyedHomeRoute";
  static const String purchasedHomeRoute = "/purchasedHomeRoute";
  static const String viewOutletRoute = "/viewOutletRoute";
  static const String addOutletRoute = "/addOutletRoute";
  static const String ordersRoute = "/ordersRoute";
  static const String completedOrdersRoute = "/completedOrdersRoute";
  static const String declinedOutletRoute = "/declinedOutletRoute";
  static const String ordersHomeRoute = "/ordersHomeRoute";
  static const String manualOrderRoute = "/manualOrderRoute";
  static const String homeWarehouseRoute = "/homeWarehouseRoute";
  static const String warehouse = "/Warehouse";
  static const String addOutletRegRoute = "/addOutletRegRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.surveyedHomeRoute:
        return MaterialPageRoute(
          builder: (_) => const SurveyedHome(),
        );
      case Routes.homeDriverRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeDriverScreen(),
        );
      case Routes.ordersRoute:
        return MaterialPageRoute(
          builder: (_) => const OrdersHome(),
        );
      case Routes.completedOrdersRoute:
        return MaterialPageRoute(
          builder: (_) => const CompletedOrders(),
        );
      case Routes.purchasedHomeRoute:
        return MaterialPageRoute(
          builder: (_) => const PurchasingHomeScreen(),
        );
      case Routes.addOutletRoute:
        return MaterialPageRoute(
          builder: (_) => const AddOutletScreen(),
        );
      case Routes.viewOutletRoute:
        return MaterialPageRoute(
          builder: (_) => const OutletHomeScreen(),
        );
      case Routes.declinedOutletRoute:
        return MaterialPageRoute(
          builder: (_) => DeclinedOutletScreen(),
        );
      case Routes.ordersHomeRoute:
        return MaterialPageRoute(
          builder: (_) => const OrdersHomeScreen(),
        );
      case Routes.manualOrderRoute:
        return MaterialPageRoute(
          builder: (_) => const ManualOrderScreen(),
        );
      case Routes.homeWarehouseRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeWarehouseScreen(),
        );
      case Routes.warehouse:
        return MaterialPageRoute(
          builder: (_) => const WarehouseHomeScreen(),
        );

      case Routes.addOutletRegRoute:
        return MaterialPageRoute(
            builder: (context) => const AddOutletRegScreen());
      default:
        return unDefiendRoute();
    }
  }

  static Route<dynamic> unDefiendRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.notFound.tr()),
        ),
        body: Center(
          child: Text(
            AppStrings.notFound.tr(),
          ),
        ),
      ),
    );
  }
}
