// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NewRitualBooking)
final newRitualBookingProvider = NewRitualBookingProvider._();

final class NewRitualBookingProvider
    extends $AsyncNotifierProvider<NewRitualBooking, List<RitualDetailModel>> {
  NewRitualBookingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newRitualBookingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newRitualBookingHash();

  @$internal
  @override
  NewRitualBooking create() => NewRitualBooking();
}

String _$newRitualBookingHash() => r'06ca6eb4c861beacc1b882bd844a32041dcee7ac';

abstract class _$NewRitualBooking
    extends $AsyncNotifier<List<RitualDetailModel>> {
  FutureOr<List<RitualDetailModel>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<RitualDetailModel>>,
              List<RitualDetailModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<RitualDetailModel>>,
                List<RitualDetailModel>
              >,
              AsyncValue<List<RitualDetailModel>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(OverView)
final overViewProvider = OverViewProvider._();

final class OverViewProvider
    extends $AsyncNotifierProvider<OverView, List<OverviewDetails>> {
  OverViewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'overViewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$overViewHash();

  @$internal
  @override
  OverView create() => OverView();
}

String _$overViewHash() => r'6dbebeb680dc18b544b3fb444e313909c6e94bd8';

abstract class _$OverView extends $AsyncNotifier<List<OverviewDetails>> {
  FutureOr<List<OverviewDetails>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<OverviewDetails>>, List<OverviewDetails>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<OverviewDetails>>,
                List<OverviewDetails>
              >,
              AsyncValue<List<OverviewDetails>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(UserAvailable)
final userAvailableProvider = UserAvailableProvider._();

final class UserAvailableProvider
    extends $NotifierProvider<UserAvailable, bool> {
  UserAvailableProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userAvailableProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userAvailableHash();

  @$internal
  @override
  UserAvailable create() => UserAvailable();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$userAvailableHash() => r'af76c24135ef109c0c1f0863c262bde811e32635';

abstract class _$UserAvailable extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
