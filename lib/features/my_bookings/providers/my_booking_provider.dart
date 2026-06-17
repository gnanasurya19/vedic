

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vedic/features/my_bookings/repository/my_booking_repo.dart';
import 'package:vedic/shared/models/ritual_detail_model.dart';
part 'my_booking_provider.g.dart';

@riverpod
class RitualBookingList extends _$RitualBookingList {
  @override
  Future<List<RitualDetailModel>> build() async {
    return ref.watch(myBookingRepoProvider).getRitualList();
  }
}

@riverpod
class ShowRitualSearchBar extends _$ShowRitualSearchBar{
  @override
  bool build() => false;

  void updateValue(bool value) => state = value;
} 

@riverpod
class RitualSearchQuery extends _$RitualSearchQuery {
  @override
  String build() => '';

  void updateQuery(String query) => state = query;
}

@riverpod
class RitualSelectedStatus extends _$RitualSelectedStatus {
  @override
  int build() => 0;

  void updateStatus(int statusId) => state = statusId;
}

@riverpod
Future<List<RitualDetailModel>> filteredritualList(Ref ref) async {
  final rituals = await ref.watch(ritualBookingListProvider.future);
  final searchQuery = ref.watch(ritualSearchQueryProvider).toLowerCase();
  final statusId = ref.watch(ritualSelectedStatusProvider);
  return rituals.where((ritual) {
    bool matchesStatus = statusId == 0 || ritual.statusID == statusId;
    bool matchesSearch =
        searchQuery.isEmpty ||
        (ritual.name?.toLowerCase().contains(searchQuery) ?? false) ||
        (ritual.serviceName?.toLowerCase().contains(searchQuery) ?? false);

    return matchesStatus && matchesSearch;
  }).toList();
}
