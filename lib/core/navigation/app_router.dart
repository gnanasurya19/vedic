import 'package:flutter/material.dart';
import 'package:vedic/core/navigation/route_name.dart';
import 'package:vedic/features/home/presentation/home_screen.dart';
import 'package:vedic/features/my_bookings/presentation/my_booking_screen.dart';
import 'package:vedic/features/splash/presentation/splash_screen.dart';

Route<dynamic>? approutes(RouteSettings settings) {
  Widget? screen;
  switch (settings.name) {
    case RouteNames.splash:
      screen = const SplashScreen();
      break;
    case RouteNames.myBooking:
      screen = const MyBookingScreen();
      break;
    case RouteNames.home:
      screen = const HomeScreen();
      break;
    default:
      screen = null;
  }

  if (screen == null) {
    return null;
  }

  return MaterialPageRoute(
    builder: (_) => screen!,
    settings: settings,
  ); 
}
