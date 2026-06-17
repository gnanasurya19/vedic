import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vedic/core/utils/app_utils.dart';
import 'package:vedic/features/my_bookings/model/ritual_status.dart';
import 'package:vedic/shared/models/ritual_detail_model.dart';
part 'my_booking_repo.g.dart';

@riverpod
MyBookingRepo myBookingRepo(Ref ref) {
  return MyBookingRepo();
}

class MyBookingRepo {
  final List<RitualStatus> ritualStatus = [
    RitualStatus(0, "ALL"),
    RitualStatus(1, "Pending"),
    RitualStatus(2, "Confirmed"),
    RitualStatus(3, "Completed"),
  ];

  Future<List<RitualDetailModel>> getRitualList() async {
    await Future.delayed(Duration(seconds: 2));
    final list = data.map((e) => RitualDetailModel.fromJson(e)).toList();
      for (var element in list) {
        element.color = AppUtils.getInitialColor(element.name ?? '');
      }
    return list;
  }
}

final data = [
  {
    "id": "BK-2025-001",
    "name": "Rajesh Kumar",
    "price": 23000,
    "serviceName": "Griha Pravesh Puja",
    "location": "Koramangala, Bangalore",
    "status": "Confirmed",
    "statusID": 2,
    "datetime": "2025-06-20T09:00:00",
    "duration": "3 hours",
    "isApproved": true,
    "rating": 4.5,
    "usersRated": 12,
    "phone": "+91 98765 43210",
    "email": "rajesh.kumar@gmail.com",
    "attendies": 15,
    "paymentDetails": {"serviceFee": 18000, "platformFee": 1800, "GST": 3240},
    "specialInstruction":
        "Please arrive 15 minutes early. Family has a pet dog, will be kept in separate room.",
    "latitude": 12.9352,
    "longitude": 77.6245,
  },
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
    "status": "Completed",
    "statusID": 3,
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
  {
    "id": "BK-2025-004",
    "name": "Arjun Nair",
    "price": 8500,
    "serviceName": "Navagraha Homam",
    "location": "HSR Layout, Bangalore",
    "status": "Pending",
    "statusID": 1,
    "datetime": "2025-06-22T07:00:00",
    "duration": "2.5 hours",
    "isApproved": false,
    "rating": 0,
    "usersRated": 0,
    "phone": "+91 93456 78901",
    "email": "arjun.nair@gmail.com",
    "attendies": 8,
    "paymentDetails": {"serviceFee": 6500, "platformFee": 650, "GST": 1170},
    "specialInstruction":
        "Client prefers the puja conducted in Malayalam. Please confirm pandit availability.",
    "latitude": 12.9116,
    "longitude": 77.6474,
  },
  {
    "id": "BK-2025-005",
    "name": "Deepa Sharma",
    "price": 12000,
    "serviceName": "Vastu Shanti Puja",
    "location": "JP Nagar, Bangalore",
    "status": "Confirmed",
    "statusID": 2,
    "datetime": "2025-06-23T10:00:00",
    "duration": "2 hours",
    "isApproved": true,
    "rating": 4.2,
    "usersRated": 7,
    "phone": "+91 76543 21098",
    "email": "deepa.sharma@gmail.com",
    "attendies": 10,
    "paymentDetails": {"serviceFee": 9500, "platformFee": 950, "GST": 1710},
    "specialInstruction":
        "New flat on 4th floor. Lift available. Please carry all required puja samagri.",
    "latitude": 12.9063,
    "longitude": 77.5857,
  },
  {
    "id": "BK-2025-006",
    "name": "Karthik Balaji",
    "price": 5500,
    "serviceName": "Ayushya Homam",
    "location": "Marathahalli, Bangalore",
    "status": "Completed",
    "statusID": 3,
    "datetime": "2025-06-10T08:00:00",
    "duration": "1.5 hours",
    "isApproved": true,
    "rating": 4.8,
    "usersRated": 19,
    "phone": "+91 82345 67890",
    "email": "karthik.b@hotmail.com",
    "attendies": 5,
    "paymentDetails": {"serviceFee": 4200, "platformFee": 420, "GST": 756},
    "specialInstruction":
        "Child's first birthday. Please keep the ceremony child-friendly and brief.",
    "latitude": 12.9592,
    "longitude": 77.6974,
  },
  {
    "id": "BK-2025-007",
    "name": "Sowmya Iyer",
    "price": 31000,
    "serviceName": "Rudrabhishek Puja",
    "location": "Malleswaram, Bangalore",
    "status": "Confirmed",
    "statusID": 2,
    "datetime": "2025-06-24T05:30:00",
    "duration": "4 hours",
    "isApproved": true,
    "rating": 4.9,
    "usersRated": 41,
    "phone": "+91 94567 89012",
    "email": "sowmya.iyer@gmail.com",
    "attendies": 30,
    "paymentDetails": {"serviceFee": 25000, "platformFee": 2500, "GST": 4500},
    "specialInstruction":
        "Strictly Tamil Brahmin rituals. Pandit must be from Iyer community.",
    "latitude": 13.0035,
    "longitude": 77.5710,
  },
  {
    "id": "BK-2025-008",
    "name": "Vikram Reddy",
    "price": 7200,
    "serviceName": "Ganapathi Homam",
    "location": "Electronic City, Bangalore",
    "status": "Pending",
    "statusID": 1,
    "datetime": "2025-06-25T09:00:00",
    "duration": "2 hours",
    "isApproved": false,
    "rating": 0,
    "usersRated": 0,
    "phone": "+91 85678 90123",
    "email": "vikram.reddy@gmail.com",
    "attendies": 12,
    "paymentDetails": {"serviceFee": 5600, "platformFee": 560, "GST": 1008},
    "specialInstruction":
        "Office inauguration puja. Security clearance required at gate — contact HR before arrival.",
    "latitude": 12.8452,
    "longitude": 77.6602,
  },
];
