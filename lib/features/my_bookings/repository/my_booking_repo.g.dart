// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_booking_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myBookingRepo)
final myBookingRepoProvider = MyBookingRepoProvider._();

final class MyBookingRepoProvider
    extends $FunctionalProvider<MyBookingRepo, MyBookingRepo, MyBookingRepo>
    with $Provider<MyBookingRepo> {
  MyBookingRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myBookingRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myBookingRepoHash();

  @$internal
  @override
  $ProviderElement<MyBookingRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MyBookingRepo create(Ref ref) {
    return myBookingRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyBookingRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyBookingRepo>(value),
    );
  }
}

String _$myBookingRepoHash() => r'076d7e3fd0f1fca5928df75d02d487ab5900f08a';
