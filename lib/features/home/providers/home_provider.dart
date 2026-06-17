import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vedic/features/home/models/overview_details.dart';
import 'package:vedic/features/home/repository/home_repository.dart';
import 'package:vedic/shared/models/ritual_detail_model.dart';
part 'home_provider.g.dart';


@riverpod
class NewRitualBooking extends _$NewRitualBooking{
  @override
 Future<List<RitualDetailModel>> build(){
  return  ref.watch(homeRepositoryProvider).fetchNewBooking();
  }
}

@riverpod
class OverView extends _$OverView{
  @override
  Future<List<OverviewDetails>> build(){
    return ref.watch(homeRepositoryProvider).fetchOverview();
  }
}

@riverpod
class UserAvailable extends _$UserAvailable{
  @override
  bool build (){
    return true;
  }

  void update(bool value) => state = value;
}