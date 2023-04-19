// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listado_partes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListadoPartesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListadoPartesEventCopyWith<$Res> {
  factory $ListadoPartesEventCopyWith(
          ListadoPartesEvent value, $Res Function(ListadoPartesEvent) then) =
      _$ListadoPartesEventCopyWithImpl<$Res, ListadoPartesEvent>;
}

/// @nodoc
class _$ListadoPartesEventCopyWithImpl<$Res, $Val extends ListadoPartesEvent>
    implements $ListadoPartesEventCopyWith<$Res> {
  _$ListadoPartesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnLoadPartesCopyWith<$Res> {
  factory _$$OnLoadPartesCopyWith(
          _$OnLoadPartes value, $Res Function(_$OnLoadPartes) then) =
      __$$OnLoadPartesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadPartesCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res, _$OnLoadPartes>
    implements _$$OnLoadPartesCopyWith<$Res> {
  __$$OnLoadPartesCopyWithImpl(
      _$OnLoadPartes _value, $Res Function(_$OnLoadPartes) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnLoadPartes implements OnLoadPartes {
  const _$OnLoadPartes();

  @override
  String toString() {
    return 'ListadoPartesEvent.onLoadPartes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnLoadPartes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
  }) {
    return onLoadPartes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
  }) {
    return onLoadPartes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    required TResult orElse(),
  }) {
    if (onLoadPartes != null) {
      return onLoadPartes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
  }) {
    return onLoadPartes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
  }) {
    return onLoadPartes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    required TResult orElse(),
  }) {
    if (onLoadPartes != null) {
      return onLoadPartes(this);
    }
    return orElse();
  }
}

abstract class OnLoadPartes implements ListadoPartesEvent {
  const factory OnLoadPartes() = _$OnLoadPartes;
}

/// @nodoc
abstract class _$$OnLoadPartesDeOrdenCopyWith<$Res> {
  factory _$$OnLoadPartesDeOrdenCopyWith(_$OnLoadPartesDeOrden value,
          $Res Function(_$OnLoadPartesDeOrden) then) =
      __$$OnLoadPartesDeOrdenCopyWithImpl<$Res>;
  @useResult
  $Res call({int ordenTrabajoId});
}

/// @nodoc
class __$$OnLoadPartesDeOrdenCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res, _$OnLoadPartesDeOrden>
    implements _$$OnLoadPartesDeOrdenCopyWith<$Res> {
  __$$OnLoadPartesDeOrdenCopyWithImpl(
      _$OnLoadPartesDeOrden _value, $Res Function(_$OnLoadPartesDeOrden) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordenTrabajoId = null,
  }) {
    return _then(_$OnLoadPartesDeOrden(
      ordenTrabajoId: null == ordenTrabajoId
          ? _value.ordenTrabajoId
          : ordenTrabajoId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnLoadPartesDeOrden implements OnLoadPartesDeOrden {
  const _$OnLoadPartesDeOrden({required this.ordenTrabajoId});

  @override
  final int ordenTrabajoId;

  @override
  String toString() {
    return 'ListadoPartesEvent.onLoadPartesDeOrden(ordenTrabajoId: $ordenTrabajoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadPartesDeOrden &&
            (identical(other.ordenTrabajoId, ordenTrabajoId) ||
                other.ordenTrabajoId == ordenTrabajoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ordenTrabajoId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadPartesDeOrdenCopyWith<_$OnLoadPartesDeOrden> get copyWith =>
      __$$OnLoadPartesDeOrdenCopyWithImpl<_$OnLoadPartesDeOrden>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
  }) {
    return onLoadPartesDeOrden(ordenTrabajoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
  }) {
    return onLoadPartesDeOrden?.call(ordenTrabajoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    required TResult orElse(),
  }) {
    if (onLoadPartesDeOrden != null) {
      return onLoadPartesDeOrden(ordenTrabajoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
  }) {
    return onLoadPartesDeOrden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
  }) {
    return onLoadPartesDeOrden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    required TResult orElse(),
  }) {
    if (onLoadPartesDeOrden != null) {
      return onLoadPartesDeOrden(this);
    }
    return orElse();
  }
}

abstract class OnLoadPartesDeOrden implements ListadoPartesEvent {
  const factory OnLoadPartesDeOrden({required final int ordenTrabajoId}) =
      _$OnLoadPartesDeOrden;

  int get ordenTrabajoId;
  @JsonKey(ignore: true)
  _$$OnLoadPartesDeOrdenCopyWith<_$OnLoadPartesDeOrden> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSearchCopyWith<$Res> {
  factory _$$OnSearchCopyWith(
          _$OnSearch value, $Res Function(_$OnSearch) then) =
      __$$OnSearchCopyWithImpl<$Res>;
  @useResult
  $Res call({int ordenTrabajoId, String search});
}

/// @nodoc
class __$$OnSearchCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res, _$OnSearch>
    implements _$$OnSearchCopyWith<$Res> {
  __$$OnSearchCopyWithImpl(_$OnSearch _value, $Res Function(_$OnSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordenTrabajoId = null,
    Object? search = null,
  }) {
    return _then(_$OnSearch(
      ordenTrabajoId: null == ordenTrabajoId
          ? _value.ordenTrabajoId
          : ordenTrabajoId // ignore: cast_nullable_to_non_nullable
              as int,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnSearch implements OnSearch {
  const _$OnSearch({required this.ordenTrabajoId, required this.search});

  @override
  final int ordenTrabajoId;
  @override
  final String search;

  @override
  String toString() {
    return 'ListadoPartesEvent.onSearch(ordenTrabajoId: $ordenTrabajoId, search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSearch &&
            (identical(other.ordenTrabajoId, ordenTrabajoId) ||
                other.ordenTrabajoId == ordenTrabajoId) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ordenTrabajoId, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSearchCopyWith<_$OnSearch> get copyWith =>
      __$$OnSearchCopyWithImpl<_$OnSearch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
  }) {
    return onSearch(ordenTrabajoId, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
  }) {
    return onSearch?.call(ordenTrabajoId, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    required TResult orElse(),
  }) {
    if (onSearch != null) {
      return onSearch(ordenTrabajoId, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
  }) {
    return onSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
  }) {
    return onSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    required TResult orElse(),
  }) {
    if (onSearch != null) {
      return onSearch(this);
    }
    return orElse();
  }
}

abstract class OnSearch implements ListadoPartesEvent {
  const factory OnSearch(
      {required final int ordenTrabajoId,
      required final String search}) = _$OnSearch;

  int get ordenTrabajoId;
  String get search;
  @JsonKey(ignore: true)
  _$$OnSearchCopyWith<_$OnSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListadoPartesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<ParteTrabajo> get listPartesTrabajo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListadoPartesStateCopyWith<ListadoPartesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListadoPartesStateCopyWith<$Res> {
  factory $ListadoPartesStateCopyWith(
          ListadoPartesState value, $Res Function(ListadoPartesState) then) =
      _$ListadoPartesStateCopyWithImpl<$Res, ListadoPartesState>;
  @useResult
  $Res call(
      {bool isLoading, bool isError, List<ParteTrabajo> listPartesTrabajo});
}

/// @nodoc
class _$ListadoPartesStateCopyWithImpl<$Res, $Val extends ListadoPartesState>
    implements $ListadoPartesStateCopyWith<$Res> {
  _$ListadoPartesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? listPartesTrabajo = null,
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
      listPartesTrabajo: null == listPartesTrabajo
          ? _value.listPartesTrabajo
          : listPartesTrabajo // ignore: cast_nullable_to_non_nullable
              as List<ParteTrabajo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListadoPartesStateCopyWith<$Res>
    implements $ListadoPartesStateCopyWith<$Res> {
  factory _$$_ListadoPartesStateCopyWith(_$_ListadoPartesState value,
          $Res Function(_$_ListadoPartesState) then) =
      __$$_ListadoPartesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool isError, List<ParteTrabajo> listPartesTrabajo});
}

/// @nodoc
class __$$_ListadoPartesStateCopyWithImpl<$Res>
    extends _$ListadoPartesStateCopyWithImpl<$Res, _$_ListadoPartesState>
    implements _$$_ListadoPartesStateCopyWith<$Res> {
  __$$_ListadoPartesStateCopyWithImpl(
      _$_ListadoPartesState _value, $Res Function(_$_ListadoPartesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? listPartesTrabajo = null,
  }) {
    return _then(_$_ListadoPartesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      listPartesTrabajo: null == listPartesTrabajo
          ? _value._listPartesTrabajo
          : listPartesTrabajo // ignore: cast_nullable_to_non_nullable
              as List<ParteTrabajo>,
    ));
  }
}

/// @nodoc

class _$_ListadoPartesState implements _ListadoPartesState {
  const _$_ListadoPartesState(
      {required this.isLoading,
      required this.isError,
      required final List<ParteTrabajo> listPartesTrabajo})
      : _listPartesTrabajo = listPartesTrabajo;

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<ParteTrabajo> _listPartesTrabajo;
  @override
  List<ParteTrabajo> get listPartesTrabajo {
    if (_listPartesTrabajo is EqualUnmodifiableListView)
      return _listPartesTrabajo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listPartesTrabajo);
  }

  @override
  String toString() {
    return 'ListadoPartesState(isLoading: $isLoading, isError: $isError, listPartesTrabajo: $listPartesTrabajo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListadoPartesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality()
                .equals(other._listPartesTrabajo, _listPartesTrabajo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      const DeepCollectionEquality().hash(_listPartesTrabajo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListadoPartesStateCopyWith<_$_ListadoPartesState> get copyWith =>
      __$$_ListadoPartesStateCopyWithImpl<_$_ListadoPartesState>(
          this, _$identity);
}

abstract class _ListadoPartesState implements ListadoPartesState {
  const factory _ListadoPartesState(
          {required final bool isLoading,
          required final bool isError,
          required final List<ParteTrabajo> listPartesTrabajo}) =
      _$_ListadoPartesState;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<ParteTrabajo> get listPartesTrabajo;
  @override
  @JsonKey(ignore: true)
  _$$_ListadoPartesStateCopyWith<_$_ListadoPartesState> get copyWith =>
      throw _privateConstructorUsedError;
}
