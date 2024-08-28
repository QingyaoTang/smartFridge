import 'package:app/pages/FoodDetailPage.dart';
import 'package:app/pages/homePage.dart';
import 'package:get/get.dart';

import 'pages/FridgeDetailPage.dart';
import 'pages/MinePage.dart';

List<GetPage<dynamic>> pages = [
  // toolbar
  // GetPage(name: '/', page: () => const Toolbar()),
  // GetPage(name: '/home', page: () => const Toolbar()),
  // GetPage(name: '/mine', page: () => const Toolbar()),
  //
  // GetPage(name: '/login', page: () => const LoginPage()),
  // GetPage(name: '/register', page: () => const RegisterPager()),

  GetPage(name: '/home', page: () => const HomePage()),
  GetPage(name: '/mine', page: () => const MinePage()),
  GetPage(name: '/fridge_detail', page: () => const FridgeDetailPage()),
  GetPage(name: '/food_detail', page: () => const FoodDetailPage())



];