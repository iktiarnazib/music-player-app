// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaylistNotifier)
const playlistProvider = PlaylistNotifierProvider._();

final class PlaylistNotifierProvider
    extends $NotifierProvider<PlaylistNotifier, Set<Song>> {
  const PlaylistNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistNotifierHash();

  @$internal
  @override
  PlaylistNotifier create() => PlaylistNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<Song> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<Song>>(value),
    );
  }
}

String _$playlistNotifierHash() => r'bee33430e59430d29d6e0556a213566fe62b6d07';

abstract class _$PlaylistNotifier extends $Notifier<Set<Song>> {
  Set<Song> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<Song>, Set<Song>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<Song>, Set<Song>>,
              Set<Song>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
