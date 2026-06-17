import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vedic/core/utils/app_utils.dart';
import 'package:vedic/features/home/models/overview_details.dart';
import 'package:vedic/shared/models/ritual_detail_model.dart';
part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository();
}

class HomeRepository {
  Future<List<RitualDetailModel>> fetchNewBooking() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final response = data;
      final list = response
          .map<RitualDetailModel>((item) => RitualDetailModel.fromJson(item))
          .toList();
      for (var element in list) {
        element.color = AppUtils.getInitialColor(element.name ?? '');
      }

      return list;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<List<OverviewDetails>> fetchOverview() async {
    await Future.delayed(const Duration(seconds: 2));
    return overview;
  }

  List<OverviewDetails> overview = [
    OverviewDetails(
      title: "Total Booking",
      value: "120",
      color: Color(0xff7b61ff),
      icon: Icons.calendar_today_outlined,
    ),
    OverviewDetails(
      title: "Pending",
      value: "20",
      color: Color(0xfff2b93c),
      icon: Icons.pending_actions_sharp,
    ),
    OverviewDetails(
      title: "Completed",
      value: "135",
      color: Color(0xff26c27d),
      icon: Icons.calendar_today_outlined,
    ),
    OverviewDetails(
      title: "Earned",
      value: "34k",
      color: Color(0xffe64d3d),
      icon: Icons.attach_money_sharp,
    ),
  ];
}

final data = [
  {
    "id": "BK-2025-002",
    "name": "Meenakshi Sundaram",
    "price": 15500,
    "serviceName": "Satyanarayan Puja",
    "location": "Indiranagar, Bangalore",
    "status": "Pending",
    "statusID": 1,
    "datetime": "2025-06-21T08:30:00",
    "duration": "2 hours",
    "isApproved": false,
    "rating": 0,
    "usersRated": 0,
    "phone": "+91 91234 56789",
    "email": "meenakshi.s@outlook.com",
    "attendies": 25,
    "paymentDetails": {"serviceFee": 12000, "platformFee": 1200, "GST": 2340},
    "specialInstruction":
        "Vegetarian household. Please do not bring any non-veg items.",
    "latitude": 12.9784,
    "longitude": 77.6408,
  },
  {
    "id": "BK-2025-003",
    "name": "Priya Venkatesh",
    "price": 45000,
    "serviceName": "Vivah Muhurta Puja",
    "location": "Whitefield, Bangalore",
    "status": "Pending",
    "statusID": 1,
    "datetime": "2025-06-15T06:00:00",
    "duration": "5 hours",
    "isApproved": true,
    "rating": 5.0,
    "usersRated": 34,
    "phone": "+91 87654 32109",
    "email": "priya.venkatesh@yahoo.com",
    "attendies": 80,
    "paymentDetails": {"serviceFee": 36000, "platformFee": 3600, "GST": 6480},
    "specialInstruction":
        "Wedding ceremony. Coordinate with event manager Suresh: +91 99001 23456.",
    "latitude": 12.9698,
    "longitude": 77.7499,
  },
];
