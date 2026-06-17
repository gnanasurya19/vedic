// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_booking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RitualBookingList)
final ritualBookingListProvider = RitualBookingListProvider._();

final class RitualBookingListProvider
    extends $AsyncNotifierProvider<RitualBookingList, List<RitualDetailModel>> {
  RitualBookingListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ritualBookingListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ritualBookingListHash();

  @$internal
  @override
  RitualBookingList create() => RitualBookingList();
}

String _$ritualBookingListHash() => r'e21bf090fc8c73065ab5c59980100a515ce291ad';

abstract class _$RitualBookingList
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

@ProviderFor(ShowRitualSearchBar)
final showRitualSearchBarProvider = ShowRitualSearchBarProvider._();

final class ShowRitualSearchBarProvider
    extends $NotifierProvider<ShowRitualSearchBar, bool> {
  ShowRitualSearchBarProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showRitualSearchBarProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showRitualSearchBarHash();

  @$internal
  @override
  ShowRitualSearchBar create() => ShowRitualSearchBar();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showRitualSearchBarHash() =>
    r'39dd7c58e571ad5d7cc3ba625ecd9d33cd66b9f0';

abstract class _$ShowRitualSearchBar extends $Notifier<bool> {
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

@ProviderFor(RitualSearchQuery)
final ritualSearchQueryProvider = RitualSearchQueryProvider._();

final class RitualSearchQueryProvider
    extends $NotifierProvider<RitualSearchQuery, String> {
  RitualSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ritualSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ritualSearchQueryHash();

  @$internal
  @override
  RitualSearchQuery create() => RitualSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$ritualSearchQueryHash() => r'8063550881aabda2369edd7170c7cafb2a10c39b';

abstract class _$RitualSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(RitualSelectedStatus)
final ritualSelectedStatusProvider = RitualSelectedStatusProvider._();

final class RitualSelectedStatusProvider
    extends $NotifierProvider<RitualSelectedStatus, int> {
  RitualSelectedStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ritualSelectedStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ritualSelectedStatusHash();

  @$internal
  @override
  RitualSelectedStatus create() => RitualSelectedStatus();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$ritualSelectedStatusHash() =>
    r'a575127b0aec0c4a5dc2ce7f6535857d6d29cada';

abstract class _$RitualSelectedStatus extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredritualList)
final filteredritualListProvider = FilteredritualListProvider._();

final class FilteredritualListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RitualDetailModel>>,
          List<RitualDetailModel>,
          FutureOr<List<RitualDetailModel>>
        >
    with
        $FutureModifier<List<RitualDetailModel>>,
        $FutureProvider<List<RitualDetailModel>> {
  FilteredritualListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredritualListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredritualListHash();

  @$internal
  @override
  $FutureProviderElement<List<RitualDetailModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RitualDetailModel>> create(Ref ref) {
    return filteredritualList(ref);
  }
}

String _$filteredritualListHash() =>
    r'eca3f103a3bf24fe6b50f4a1ee63d672eda38daf';
