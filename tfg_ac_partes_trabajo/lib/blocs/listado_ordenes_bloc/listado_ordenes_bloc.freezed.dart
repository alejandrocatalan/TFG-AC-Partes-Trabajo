// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listado_ordenes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListadoOrdenesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadOrdenes,
    required TResult Function(String search) onSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadOrdenes,
    TResult? Function(String search)? onSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadOrdenes,
    TResult Function(String search)? onSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadOrdenes value) onLoadOrdenes,
    required TResult Function(OnSearch value) onSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadOrdenes value)? onLoadOrdenes,
    TResult? Function(OnSearch value)? onSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadOrdenes value)? onLoadOrdenes,
    TResult Function(OnSearch value)? onSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListadoOrdenesEventCopyWith<$Res> {
  factory $ListadoOrdenesEventCopyWith(
          ListadoOrdenesEvent value, $Res Function(ListadoOrdenesEvent) then) =
      _$ListadoOrdenesEventCopyWithImpl<$Res, ListadoOrdenesEvent>;
}

/// @nodoc
class _$ListadoOrdenesEventCopyWithImpl<$Res, $Val extends ListadoOrdenesEvent>
    implements $ListadoOrdenesEventCopyWith<$Res> {
  _$ListadoOrdenesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnLoadOrdenesCopyWith<$Res> {
  factory _$$OnLoadOrdenesCopyWith(
          _$OnLoadOrdenes value, $Res Function(_$OnLoadOrdenes) then) =
      __$$OnLoadOrdenesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadOrdenesCopyWithImpl<$Res>
    extends _$ListadoOrdenesEventCopyWithImpl<$Res, _$OnLoadOrdenes>
    implements _$$OnLoadOrdenesCopyWith<$Res> {
  __$$OnLoadOrdenesCopyWithImpl(
      _$OnLoadOrdenes _value, $Res Function(_$OnLoadOrdenes) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnLoadOrdenes implements OnLoadOrdenes {
  const _$OnLoadOrdenes();

  @override
  String toString() {
    return 'ListadoOrdenesEvent.onLoadOrdenes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnLoadOrdenes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadOrdenes,
    required TResult Function(String search) onSearch,
  }) {
    return onLoadOrdenes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadOrdenes,
    TResult? Function(String search)? onSearch,
  }) {
    return onLoadOrdenes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadOrdenes,
    TResult Function(String search)? onSearch,
    required TResult orElse(),
  }) {
    if (onLoadOrdenes != null) {
      return onLoadOrdenes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadOrdenes value) onLoadOrdenes,
    required TResult Function(OnSearch value) onSearch,
  }) {
    return onLoadOrdenes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadOrdenes value)? onLoadOrdenes,
    TResult? Function(OnSearch value)? onSearch,
  }) {
    return onLoadOrdenes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadOrdenes value)? onLoadOrdenes,
    TResult Function(OnSearch value)? onSearch,
    required TResult orElse(),
  }) {
    if (onLoadOrdenes != null) {
      return onLoadOrdenes(this);
    }
    return orElse();
  }
}

abstract class OnLoadOrdenes implements ListadoOrdenesEvent {
  const factory OnLoadOrdenes() = _$OnLoadOrdenes;
}

/// @nodoc
abstract class _$$OnSearchCopyWith<$Res> {
  factory _$$OnSearchCopyWith(
          _$OnSearch value, $Res Function(_$OnSearch) then) =
      __$$OnSearchCopyWithImpl<$Res>;
  @useResult
  $Res call({String search});
}

/// @nodoc
class __$$OnSearchCopyWithImpl<$Res>
    extends _$ListadoOrdenesEventCopyWithImpl<$Res, _$OnSearch>
    implements _$$OnSearchCopyWith<$Res> {
  __$$OnSearchCopyWithImpl(_$OnSearch _value, $Res Function(_$OnSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
  }) {
    return _then(_$OnSearch(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnSearch implements OnSearch {
  const _$OnSearch({required this.search});

  @override
  final String search;

  @override
  String toString() {
    return 'ListadoOrdenesEvent.onSearch(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSearch &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSearchCopyWith<_$OnSearch> get copyWith =>
      __$$OnSearchCopyWithImpl<_$OnSearch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadOrdenes,
    required TResult Function(String search) onSearch,
  }) {
    return onSearch(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadOrdenes,
    TResult? Function(String search)? onSearch,
  }) {
    return onSearch?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadOrdenes,
    TResult Function(String search)? onSearch,
    required TResult orElse(),
  }) {
    if (onSearch != null) {
      return onSearch(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadOrdenes value) onLoadOrdenes,
    required TResult Function(OnSearch value) onSearch,
  }) {
    return onSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadOrdenes value)? onLoadOrdenes,
    TResult? Function(OnSearch value)? onSearch,
  }) {
    return onSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadOrdenes value)? onLoadOrdenes,
    TResult Function(OnSearch value)? onSearch,
    required TResult orElse(),
  }) {
    if (onSearch != null) {
      return onSearch(this);
    }
    return orElse();
  }
}

abstract class OnSearch implements ListadoOrdenesEvent {
  const factory OnSearch({required final String search}) = _$OnSearch;

  String get search;
  @JsonKey(ignore: true)
  _$$OnSearchCopyWith<_$OnSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListadoOrdenesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<OrdenTrabajo> get listOrdenesTrabajo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListadoOrdenesStateCopyWith<ListadoOrdenesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListadoOrdenesStateCopyWith<$Res> {
  factory $ListadoOrdenesStateCopyWith(
          ListadoOrdenesState value, $Res Function(ListadoOrdenesState) then) =
      _$ListadoOrdenesStateCopyWithImpl<$Res, ListadoOrdenesState>;
  @useResult
  $Res call(
      {bool isLoading, bool isError, List<OrdenTrabajo> listOrdenesTrabajo});
}

/// @nodoc
class _$ListadoOrdenesStateCopyWithImpl<$Res, $Val extends ListadoOrdenesState>
    implements $ListadoOrdenesStateCopyWith<$Res> {
  _$ListadoOrdenesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? listOrdenesTrabajo = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      listOrdenesTrabajo: null == listOrdenesTrabajo
          ? _value.listOrdenesTrabajo
          : listOrdenesTrabajo // ignore: cast_nullable_to_non_nullable
              as List<OrdenTrabajo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListadoOrdenesStateCopyWith<$Res>
    implements $ListadoOrdenesStateCopyWith<$Res> {
  factory _$$_ListadoOrdenesStateCopyWith(_$_ListadoOrdenesState value,
          $Res Function(_$_ListadoOrdenesState) then) =
      __$$_ListadoOrdenesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool isError, List<OrdenTrabajo> listOrdenesTrabajo});
}

/// @nodoc
class __$$_ListadoOrdenesStateCopyWithImpl<$Res>
    extends _$ListadoOrdenesStateCopyWithImpl<$Res, _$_ListadoOrdenesState>
    implements _$$_ListadoOrdenesStateCopyWith<$Res> {
  __$$_ListadoOrdenesStateCopyWithImpl(_$_ListadoOrdenesState _value,
      $Res Function(_$_ListadoOrdenesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? listOrdenesTrabajo = null,
  }) {
    return _then(_$_ListadoOrdenesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      listOrdenesTrabajo: null == listOrdenesTrabajo
          ? _value._listOrdenesTrabajo
          : listOrdenesTrabajo // ignore: cast_nullable_to_non_nullable
              as List<OrdenTrabajo>,
    ));
  }
}

/// @nodoc

class _$_ListadoOrdenesState implements _ListadoOrdenesState {
  const _$_ListadoOrdenesState(
      {required this.isLoading,
      required this.isError,
      required final List<OrdenTrabajo> listOrdenesTrabajo})
      : _listOrdenesTrabajo = listOrdenesTrabajo;

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<OrdenTrabajo> _listOrdenesTrabajo;
  @override
  List<OrdenTrabajo> get listOrdenesTrabajo {
    if (_listOrdenesTrabajo is EqualUnmodifiableListView)
      return _listOrdenesTrabajo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOrdenesTrabajo);
  }

  @override
  String toString() {
    return 'ListadoOrdenesState(isLoading: $isLoading, isError: $isError, listOrdenesTrabajo: $listOrdenesTrabajo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListadoOrdenesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality()
                .equals(other._listOrdenesTrabajo, _listOrdenesTrabajo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      const DeepCollectionEquality().hash(_listOrdenesTrabajo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListadoOrdenesStateCopyWith<_$_ListadoOrdenesState> get copyWith =>
      __$$_ListadoOrdenesStateCopyWithImpl<_$_ListadoOrdenesState>(
          this, _$identity);
}

abstract class _ListadoOrdenesState implements ListadoOrdenesState {
  const factory _ListadoOrdenesState(
          {required final bool isLoading,
          required final bool isError,
          required final List<OrdenTrabajo> listOrdenesTrabajo}) =
      _$_ListadoOrdenesState;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<OrdenTrabajo> get listOrdenesTrabajo;
  @override
  @JsonKey(ignore: true)
  _$$_ListadoOrdenesStateCopyWith<_$_ListadoOrdenesState> get copyWith =>
      throw _privateConstructorUsedError;
}
