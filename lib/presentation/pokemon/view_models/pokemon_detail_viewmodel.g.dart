// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonDetailViewModelHash() =>
    r'7fd3f688ac803d5ccbbaa2d16eb03454593b7a24';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PokemonDetailViewModel
    extends BuildlessAutoDisposeAsyncNotifier<PokemonDetails> {
  late final String pokemonName;

  FutureOr<PokemonDetails> build(
    String pokemonName,
  );
}

/// See also [PokemonDetailViewModel].
@ProviderFor(PokemonDetailViewModel)
const pokemonDetailViewModelProvider = PokemonDetailViewModelFamily();

/// See also [PokemonDetailViewModel].
class PokemonDetailViewModelFamily extends Family<AsyncValue<PokemonDetails>> {
  /// See also [PokemonDetailViewModel].
  const PokemonDetailViewModelFamily();

  /// See also [PokemonDetailViewModel].
  PokemonDetailViewModelProvider call(
    String pokemonName,
  ) {
    return PokemonDetailViewModelProvider(
      pokemonName,
    );
  }

  @override
  PokemonDetailViewModelProvider getProviderOverride(
    covariant PokemonDetailViewModelProvider provider,
  ) {
    return call(
      provider.pokemonName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonDetailViewModelProvider';
}

/// See also [PokemonDetailViewModel].
class PokemonDetailViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PokemonDetailViewModel,
        PokemonDetails> {
  /// See also [PokemonDetailViewModel].
  PokemonDetailViewModelProvider(
    String pokemonName,
  ) : this._internal(
          () => PokemonDetailViewModel()..pokemonName = pokemonName,
          from: pokemonDetailViewModelProvider,
          name: r'pokemonDetailViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonDetailViewModelHash,
          dependencies: PokemonDetailViewModelFamily._dependencies,
          allTransitiveDependencies:
              PokemonDetailViewModelFamily._allTransitiveDependencies,
          pokemonName: pokemonName,
        );

  PokemonDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pokemonName,
  }) : super.internal();

  final String pokemonName;

  @override
  FutureOr<PokemonDetails> runNotifierBuild(
    covariant PokemonDetailViewModel notifier,
  ) {
    return notifier.build(
      pokemonName,
    );
  }

  @override
  Override overrideWith(PokemonDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: PokemonDetailViewModelProvider._internal(
        () => create()..pokemonName = pokemonName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pokemonName: pokemonName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PokemonDetailViewModel,
      PokemonDetails> createElement() {
    return _PokemonDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonDetailViewModelProvider &&
        other.pokemonName == pokemonName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pokemonName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PokemonDetailViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<PokemonDetails> {
  /// The parameter `pokemonName` of this provider.
  String get pokemonName;
}

class _PokemonDetailViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PokemonDetailViewModel,
        PokemonDetails> with PokemonDetailViewModelRef {
  _PokemonDetailViewModelProviderElement(super.provider);

  @override
  String get pokemonName =>
      (origin as PokemonDetailViewModelProvider).pokemonName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
