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
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
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
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onLoadPartes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onLoadPartes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
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
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onLoadPartes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onLoadPartes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
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
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onLoadPartesDeOrden(ordenTrabajoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onLoadPartesDeOrden?.call(ordenTrabajoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
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
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onLoadPartesDeOrden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onLoadPartesDeOrden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
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
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onSearch(ordenTrabajoId, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onSearch?.call(ordenTrabajoId, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
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
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
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
abstract class _$$OnCreateParteCopyWith<$Res> {
  factory _$$OnCreateParteCopyWith(
          _$OnCreateParte value, $Res Function(_$OnCreateParte) then) =
      __$$OnCreateParteCopyWithImpl<$Res>;
  @useResult
  $Res call({ParteTrabajo parteTrabajo});
}

/// @nodoc
class __$$OnCreateParteCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res, _$OnCreateParte>
    implements _$$OnCreateParteCopyWith<$Res> {
  __$$OnCreateParteCopyWithImpl(
      _$OnCreateParte _value, $Res Function(_$OnCreateParte) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parteTrabajo = null,
  }) {
    return _then(_$OnCreateParte(
      parteTrabajo: null == parteTrabajo
          ? _value.parteTrabajo
          : parteTrabajo // ignore: cast_nullable_to_non_nullable
              as ParteTrabajo,
    ));
  }
}

/// @nodoc

class _$OnCreateParte implements OnCreateParte {
  const _$OnCreateParte({required this.parteTrabajo});

  @override
  final ParteTrabajo parteTrabajo;

  @override
  String toString() {
    return 'ListadoPartesEvent.onCreateParte(parteTrabajo: $parteTrabajo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnCreateParte &&
            (identical(other.parteTrabajo, parteTrabajo) ||
                other.parteTrabajo == parteTrabajo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parteTrabajo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnCreateParteCopyWith<_$OnCreateParte> get copyWith =>
      __$$OnCreateParteCopyWithImpl<_$OnCreateParte>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onCreateParte(parteTrabajo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onCreateParte?.call(parteTrabajo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onCreateParte != null) {
      return onCreateParte(parteTrabajo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onCreateParte(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onCreateParte?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onCreateParte != null) {
      return onCreateParte(this);
    }
    return orElse();
  }
}

abstract class OnCreateParte implements ListadoPartesEvent {
  const factory OnCreateParte({required final ParteTrabajo parteTrabajo}) =
      _$OnCreateParte;

  ParteTrabajo get parteTrabajo;
  @JsonKey(ignore: true)
  _$$OnCreateParteCopyWith<_$OnCreateParte> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUpdateParteCopyWith<$Res> {
  factory _$$OnUpdateParteCopyWith(
          _$OnUpdateParte value, $Res Function(_$OnUpdateParte) then) =
      __$$OnUpdateParteCopyWithImpl<$Res>;
  @useResult
  $Res call({ParteTrabajo parteTrabajo});
}

/// @nodoc
class __$$OnUpdateParteCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res, _$OnUpdateParte>
    implements _$$OnUpdateParteCopyWith<$Res> {
  __$$OnUpdateParteCopyWithImpl(
      _$OnUpdateParte _value, $Res Function(_$OnUpdateParte) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parteTrabajo = null,
  }) {
    return _then(_$OnUpdateParte(
      parteTrabajo: null == parteTrabajo
          ? _value.parteTrabajo
          : parteTrabajo // ignore: cast_nullable_to_non_nullable
              as ParteTrabajo,
    ));
  }
}

/// @nodoc

class _$OnUpdateParte implements OnUpdateParte {
  const _$OnUpdateParte({required this.parteTrabajo});

  @override
  final ParteTrabajo parteTrabajo;

  @override
  String toString() {
    return 'ListadoPartesEvent.onUpdateParte(parteTrabajo: $parteTrabajo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUpdateParte &&
            (identical(other.parteTrabajo, parteTrabajo) ||
                other.parteTrabajo == parteTrabajo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parteTrabajo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnUpdateParteCopyWith<_$OnUpdateParte> get copyWith =>
      __$$OnUpdateParteCopyWithImpl<_$OnUpdateParte>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onUpdateParte(parteTrabajo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onUpdateParte?.call(parteTrabajo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onUpdateParte != null) {
      return onUpdateParte(parteTrabajo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onUpdateParte(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onUpdateParte?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onUpdateParte != null) {
      return onUpdateParte(this);
    }
    return orElse();
  }
}

abstract class OnUpdateParte implements ListadoPartesEvent {
  const factory OnUpdateParte({required final ParteTrabajo parteTrabajo}) =
      _$OnUpdateParte;

  ParteTrabajo get parteTrabajo;
  @JsonKey(ignore: true)
  _$$OnUpdateParteCopyWith<_$OnUpdateParte> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnCleanLastParteModifiedCopyWith<$Res> {
  factory _$$OnCleanLastParteModifiedCopyWith(_$OnCleanLastParteModified value,
          $Res Function(_$OnCleanLastParteModified) then) =
      __$$OnCleanLastParteModifiedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnCleanLastParteModifiedCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res, _$OnCleanLastParteModified>
    implements _$$OnCleanLastParteModifiedCopyWith<$Res> {
  __$$OnCleanLastParteModifiedCopyWithImpl(_$OnCleanLastParteModified _value,
      $Res Function(_$OnCleanLastParteModified) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnCleanLastParteModified implements OnCleanLastParteModified {
  const _$OnCleanLastParteModified();

  @override
  String toString() {
    return 'ListadoPartesEvent.onCleanLastParteModified()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnCleanLastParteModified);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onCleanLastParteModified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onCleanLastParteModified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onCleanLastParteModified != null) {
      return onCleanLastParteModified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onCleanLastParteModified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onCleanLastParteModified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onCleanLastParteModified != null) {
      return onCleanLastParteModified(this);
    }
    return orElse();
  }
}

abstract class OnCleanLastParteModified implements ListadoPartesEvent {
  const factory OnCleanLastParteModified() = _$OnCleanLastParteModified;
}

/// @nodoc
abstract class _$$OnLoadPersonasDeParteCopyWith<$Res> {
  factory _$$OnLoadPersonasDeParteCopyWith(_$OnLoadPersonasDeParte value,
          $Res Function(_$OnLoadPersonasDeParte) then) =
      __$$OnLoadPersonasDeParteCopyWithImpl<$Res>;
  @useResult
  $Res call({int parteTrabajoId});
}

/// @nodoc
class __$$OnLoadPersonasDeParteCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res, _$OnLoadPersonasDeParte>
    implements _$$OnLoadPersonasDeParteCopyWith<$Res> {
  __$$OnLoadPersonasDeParteCopyWithImpl(_$OnLoadPersonasDeParte _value,
      $Res Function(_$OnLoadPersonasDeParte) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parteTrabajoId = null,
  }) {
    return _then(_$OnLoadPersonasDeParte(
      parteTrabajoId: null == parteTrabajoId
          ? _value.parteTrabajoId
          : parteTrabajoId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnLoadPersonasDeParte implements OnLoadPersonasDeParte {
  const _$OnLoadPersonasDeParte({required this.parteTrabajoId});

  @override
  final int parteTrabajoId;

  @override
  String toString() {
    return 'ListadoPartesEvent.onLoadPersonasDeParte(parteTrabajoId: $parteTrabajoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadPersonasDeParte &&
            (identical(other.parteTrabajoId, parteTrabajoId) ||
                other.parteTrabajoId == parteTrabajoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parteTrabajoId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadPersonasDeParteCopyWith<_$OnLoadPersonasDeParte> get copyWith =>
      __$$OnLoadPersonasDeParteCopyWithImpl<_$OnLoadPersonasDeParte>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onLoadPersonasDeParte(parteTrabajoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onLoadPersonasDeParte?.call(parteTrabajoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onLoadPersonasDeParte != null) {
      return onLoadPersonasDeParte(parteTrabajoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onLoadPersonasDeParte(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onLoadPersonasDeParte?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onLoadPersonasDeParte != null) {
      return onLoadPersonasDeParte(this);
    }
    return orElse();
  }
}

abstract class OnLoadPersonasDeParte implements ListadoPartesEvent {
  const factory OnLoadPersonasDeParte({required final int parteTrabajoId}) =
      _$OnLoadPersonasDeParte;

  int get parteTrabajoId;
  @JsonKey(ignore: true)
  _$$OnLoadPersonasDeParteCopyWith<_$OnLoadPersonasDeParte> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnLoadPersonasDePartePersonaCopyWith<$Res> {
  factory _$$OnLoadPersonasDePartePersonaCopyWith(
          _$OnLoadPersonasDePartePersona value,
          $Res Function(_$OnLoadPersonasDePartePersona) then) =
      __$$OnLoadPersonasDePartePersonaCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadPersonasDePartePersonaCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res,
        _$OnLoadPersonasDePartePersona>
    implements _$$OnLoadPersonasDePartePersonaCopyWith<$Res> {
  __$$OnLoadPersonasDePartePersonaCopyWithImpl(
      _$OnLoadPersonasDePartePersona _value,
      $Res Function(_$OnLoadPersonasDePartePersona) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnLoadPersonasDePartePersona implements OnLoadPersonasDePartePersona {
  const _$OnLoadPersonasDePartePersona();

  @override
  String toString() {
    return 'ListadoPartesEvent.onLoadPersonasDePartePersona()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadPersonasDePartePersona);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onLoadPersonasDePartePersona();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onLoadPersonasDePartePersona?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onLoadPersonasDePartePersona != null) {
      return onLoadPersonasDePartePersona();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onLoadPersonasDePartePersona(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onLoadPersonasDePartePersona?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onLoadPersonasDePartePersona != null) {
      return onLoadPersonasDePartePersona(this);
    }
    return orElse();
  }
}

abstract class OnLoadPersonasDePartePersona implements ListadoPartesEvent {
  const factory OnLoadPersonasDePartePersona() = _$OnLoadPersonasDePartePersona;
}

/// @nodoc
abstract class _$$OnSearchPersonaCopyWith<$Res> {
  factory _$$OnSearchPersonaCopyWith(
          _$OnSearchPersona value, $Res Function(_$OnSearchPersona) then) =
      __$$OnSearchPersonaCopyWithImpl<$Res>;
  @useResult
  $Res call({int parteTrabajoId, String search});
}

/// @nodoc
class __$$OnSearchPersonaCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res, _$OnSearchPersona>
    implements _$$OnSearchPersonaCopyWith<$Res> {
  __$$OnSearchPersonaCopyWithImpl(
      _$OnSearchPersona _value, $Res Function(_$OnSearchPersona) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parteTrabajoId = null,
    Object? search = null,
  }) {
    return _then(_$OnSearchPersona(
      parteTrabajoId: null == parteTrabajoId
          ? _value.parteTrabajoId
          : parteTrabajoId // ignore: cast_nullable_to_non_nullable
              as int,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnSearchPersona implements OnSearchPersona {
  const _$OnSearchPersona({required this.parteTrabajoId, required this.search});

  @override
  final int parteTrabajoId;
  @override
  final String search;

  @override
  String toString() {
    return 'ListadoPartesEvent.onSearchPersona(parteTrabajoId: $parteTrabajoId, search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSearchPersona &&
            (identical(other.parteTrabajoId, parteTrabajoId) ||
                other.parteTrabajoId == parteTrabajoId) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parteTrabajoId, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSearchPersonaCopyWith<_$OnSearchPersona> get copyWith =>
      __$$OnSearchPersonaCopyWithImpl<_$OnSearchPersona>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onSearchPersona(parteTrabajoId, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onSearchPersona?.call(parteTrabajoId, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onSearchPersona != null) {
      return onSearchPersona(parteTrabajoId, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onSearchPersona(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onSearchPersona?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onSearchPersona != null) {
      return onSearchPersona(this);
    }
    return orElse();
  }
}

abstract class OnSearchPersona implements ListadoPartesEvent {
  const factory OnSearchPersona(
      {required final int parteTrabajoId,
      required final String search}) = _$OnSearchPersona;

  int get parteTrabajoId;
  String get search;
  @JsonKey(ignore: true)
  _$$OnSearchPersonaCopyWith<_$OnSearchPersona> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUpdateHoursPartePersonaCopyWith<$Res> {
  factory _$$OnUpdateHoursPartePersonaCopyWith(
          _$OnUpdateHoursPartePersona value,
          $Res Function(_$OnUpdateHoursPartePersona) then) =
      __$$OnUpdateHoursPartePersonaCopyWithImpl<$Res>;
  @useResult
  $Res call({int parteTrabajoId, String? hours, String? mins});
}

/// @nodoc
class __$$OnUpdateHoursPartePersonaCopyWithImpl<$Res>
    extends _$ListadoPartesEventCopyWithImpl<$Res, _$OnUpdateHoursPartePersona>
    implements _$$OnUpdateHoursPartePersonaCopyWith<$Res> {
  __$$OnUpdateHoursPartePersonaCopyWithImpl(_$OnUpdateHoursPartePersona _value,
      $Res Function(_$OnUpdateHoursPartePersona) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parteTrabajoId = null,
    Object? hours = freezed,
    Object? mins = freezed,
  }) {
    return _then(_$OnUpdateHoursPartePersona(
      parteTrabajoId: null == parteTrabajoId
          ? _value.parteTrabajoId
          : parteTrabajoId // ignore: cast_nullable_to_non_nullable
              as int,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as String?,
      mins: freezed == mins
          ? _value.mins
          : mins // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnUpdateHoursPartePersona implements OnUpdateHoursPartePersona {
  const _$OnUpdateHoursPartePersona(
      {required this.parteTrabajoId, this.hours, this.mins});

  @override
  final int parteTrabajoId;
  @override
  final String? hours;
  @override
  final String? mins;

  @override
  String toString() {
    return 'ListadoPartesEvent.onUpdateHoursPartePersona(parteTrabajoId: $parteTrabajoId, hours: $hours, mins: $mins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUpdateHoursPartePersona &&
            (identical(other.parteTrabajoId, parteTrabajoId) ||
                other.parteTrabajoId == parteTrabajoId) &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.mins, mins) || other.mins == mins));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parteTrabajoId, hours, mins);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnUpdateHoursPartePersonaCopyWith<_$OnUpdateHoursPartePersona>
      get copyWith => __$$OnUpdateHoursPartePersonaCopyWithImpl<
          _$OnUpdateHoursPartePersona>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadPartes,
    required TResult Function(int ordenTrabajoId) onLoadPartesDeOrden,
    required TResult Function(int ordenTrabajoId, String search) onSearch,
    required TResult Function(ParteTrabajo parteTrabajo) onCreateParte,
    required TResult Function(ParteTrabajo parteTrabajo) onUpdateParte,
    required TResult Function() onCleanLastParteModified,
    required TResult Function(int parteTrabajoId) onLoadPersonasDeParte,
    required TResult Function() onLoadPersonasDePartePersona,
    required TResult Function(int parteTrabajoId, String search)
        onSearchPersona,
    required TResult Function(int parteTrabajoId, String? hours, String? mins)
        onUpdateHoursPartePersona,
  }) {
    return onUpdateHoursPartePersona(parteTrabajoId, hours, mins);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadPartes,
    TResult? Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult? Function(int ordenTrabajoId, String search)? onSearch,
    TResult? Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult? Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult? Function()? onCleanLastParteModified,
    TResult? Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult? Function()? onLoadPersonasDePartePersona,
    TResult? Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult? Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
  }) {
    return onUpdateHoursPartePersona?.call(parteTrabajoId, hours, mins);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadPartes,
    TResult Function(int ordenTrabajoId)? onLoadPartesDeOrden,
    TResult Function(int ordenTrabajoId, String search)? onSearch,
    TResult Function(ParteTrabajo parteTrabajo)? onCreateParte,
    TResult Function(ParteTrabajo parteTrabajo)? onUpdateParte,
    TResult Function()? onCleanLastParteModified,
    TResult Function(int parteTrabajoId)? onLoadPersonasDeParte,
    TResult Function()? onLoadPersonasDePartePersona,
    TResult Function(int parteTrabajoId, String search)? onSearchPersona,
    TResult Function(int parteTrabajoId, String? hours, String? mins)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onUpdateHoursPartePersona != null) {
      return onUpdateHoursPartePersona(parteTrabajoId, hours, mins);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadPartes value) onLoadPartes,
    required TResult Function(OnLoadPartesDeOrden value) onLoadPartesDeOrden,
    required TResult Function(OnSearch value) onSearch,
    required TResult Function(OnCreateParte value) onCreateParte,
    required TResult Function(OnUpdateParte value) onUpdateParte,
    required TResult Function(OnCleanLastParteModified value)
        onCleanLastParteModified,
    required TResult Function(OnLoadPersonasDeParte value)
        onLoadPersonasDeParte,
    required TResult Function(OnLoadPersonasDePartePersona value)
        onLoadPersonasDePartePersona,
    required TResult Function(OnSearchPersona value) onSearchPersona,
    required TResult Function(OnUpdateHoursPartePersona value)
        onUpdateHoursPartePersona,
  }) {
    return onUpdateHoursPartePersona(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadPartes value)? onLoadPartes,
    TResult? Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult? Function(OnSearch value)? onSearch,
    TResult? Function(OnCreateParte value)? onCreateParte,
    TResult? Function(OnUpdateParte value)? onUpdateParte,
    TResult? Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult? Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult? Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult? Function(OnSearchPersona value)? onSearchPersona,
    TResult? Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
  }) {
    return onUpdateHoursPartePersona?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadPartes value)? onLoadPartes,
    TResult Function(OnLoadPartesDeOrden value)? onLoadPartesDeOrden,
    TResult Function(OnSearch value)? onSearch,
    TResult Function(OnCreateParte value)? onCreateParte,
    TResult Function(OnUpdateParte value)? onUpdateParte,
    TResult Function(OnCleanLastParteModified value)? onCleanLastParteModified,
    TResult Function(OnLoadPersonasDeParte value)? onLoadPersonasDeParte,
    TResult Function(OnLoadPersonasDePartePersona value)?
        onLoadPersonasDePartePersona,
    TResult Function(OnSearchPersona value)? onSearchPersona,
    TResult Function(OnUpdateHoursPartePersona value)?
        onUpdateHoursPartePersona,
    required TResult orElse(),
  }) {
    if (onUpdateHoursPartePersona != null) {
      return onUpdateHoursPartePersona(this);
    }
    return orElse();
  }
}

abstract class OnUpdateHoursPartePersona implements ListadoPartesEvent {
  const factory OnUpdateHoursPartePersona(
      {required final int parteTrabajoId,
      final String? hours,
      final String? mins}) = _$OnUpdateHoursPartePersona;

  int get parteTrabajoId;
  String? get hours;
  String? get mins;
  @JsonKey(ignore: true)
  _$$OnUpdateHoursPartePersonaCopyWith<_$OnUpdateHoursPartePersona>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListadoPartesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<ParteTrabajo> get listPartesTrabajo =>
      throw _privateConstructorUsedError;
  ParteTrabajo get lastParteCreated => throw _privateConstructorUsedError;
  ParteTrabajo? get lastParteModified => throw _privateConstructorUsedError;
  List<PartePersona> get listPartePersonas =>
      throw _privateConstructorUsedError;
  List<Persona> get listPersonas => throw _privateConstructorUsedError;

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
      {bool isLoading,
      bool isError,
      List<ParteTrabajo> listPartesTrabajo,
      ParteTrabajo lastParteCreated,
      ParteTrabajo? lastParteModified,
      List<PartePersona> listPartePersonas,
      List<Persona> listPersonas});
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
    Object? lastParteCreated = null,
    Object? lastParteModified = freezed,
    Object? listPartePersonas = null,
    Object? listPersonas = null,
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
      lastParteCreated: null == lastParteCreated
          ? _value.lastParteCreated
          : lastParteCreated // ignore: cast_nullable_to_non_nullable
              as ParteTrabajo,
      lastParteModified: freezed == lastParteModified
          ? _value.lastParteModified
          : lastParteModified // ignore: cast_nullable_to_non_nullable
              as ParteTrabajo?,
      listPartePersonas: null == listPartePersonas
          ? _value.listPartePersonas
          : listPartePersonas // ignore: cast_nullable_to_non_nullable
              as List<PartePersona>,
      listPersonas: null == listPersonas
          ? _value.listPersonas
          : listPersonas // ignore: cast_nullable_to_non_nullable
              as List<Persona>,
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
      {bool isLoading,
      bool isError,
      List<ParteTrabajo> listPartesTrabajo,
      ParteTrabajo lastParteCreated,
      ParteTrabajo? lastParteModified,
      List<PartePersona> listPartePersonas,
      List<Persona> listPersonas});
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
    Object? lastParteCreated = null,
    Object? lastParteModified = freezed,
    Object? listPartePersonas = null,
    Object? listPersonas = null,
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
      lastParteCreated: null == lastParteCreated
          ? _value.lastParteCreated
          : lastParteCreated // ignore: cast_nullable_to_non_nullable
              as ParteTrabajo,
      lastParteModified: freezed == lastParteModified
          ? _value.lastParteModified
          : lastParteModified // ignore: cast_nullable_to_non_nullable
              as ParteTrabajo?,
      listPartePersonas: null == listPartePersonas
          ? _value._listPartePersonas
          : listPartePersonas // ignore: cast_nullable_to_non_nullable
              as List<PartePersona>,
      listPersonas: null == listPersonas
          ? _value._listPersonas
          : listPersonas // ignore: cast_nullable_to_non_nullable
              as List<Persona>,
    ));
  }
}

/// @nodoc

class _$_ListadoPartesState implements _ListadoPartesState {
  const _$_ListadoPartesState(
      {required this.isLoading,
      required this.isError,
      required final List<ParteTrabajo> listPartesTrabajo,
      required this.lastParteCreated,
      required this.lastParteModified,
      required final List<PartePersona> listPartePersonas,
      required final List<Persona> listPersonas})
      : _listPartesTrabajo = listPartesTrabajo,
        _listPartePersonas = listPartePersonas,
        _listPersonas = listPersonas;

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
  final ParteTrabajo lastParteCreated;
  @override
  final ParteTrabajo? lastParteModified;
  final List<PartePersona> _listPartePersonas;
  @override
  List<PartePersona> get listPartePersonas {
    if (_listPartePersonas is EqualUnmodifiableListView)
      return _listPartePersonas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listPartePersonas);
  }

  final List<Persona> _listPersonas;
  @override
  List<Persona> get listPersonas {
    if (_listPersonas is EqualUnmodifiableListView) return _listPersonas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listPersonas);
  }

  @override
  String toString() {
    return 'ListadoPartesState(isLoading: $isLoading, isError: $isError, listPartesTrabajo: $listPartesTrabajo, lastParteCreated: $lastParteCreated, lastParteModified: $lastParteModified, listPartePersonas: $listPartePersonas, listPersonas: $listPersonas)';
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
                .equals(other._listPartesTrabajo, _listPartesTrabajo) &&
            (identical(other.lastParteCreated, lastParteCreated) ||
                other.lastParteCreated == lastParteCreated) &&
            (identical(other.lastParteModified, lastParteModified) ||
                other.lastParteModified == lastParteModified) &&
            const DeepCollectionEquality()
                .equals(other._listPartePersonas, _listPartePersonas) &&
            const DeepCollectionEquality()
                .equals(other._listPersonas, _listPersonas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isError,
      const DeepCollectionEquality().hash(_listPartesTrabajo),
      lastParteCreated,
      lastParteModified,
      const DeepCollectionEquality().hash(_listPartePersonas),
      const DeepCollectionEquality().hash(_listPersonas));

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
      required final List<ParteTrabajo> listPartesTrabajo,
      required final ParteTrabajo lastParteCreated,
      required final ParteTrabajo? lastParteModified,
      required final List<PartePersona> listPartePersonas,
      required final List<Persona> listPersonas}) = _$_ListadoPartesState;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<ParteTrabajo> get listPartesTrabajo;
  @override
  ParteTrabajo get lastParteCreated;
  @override
  ParteTrabajo? get lastParteModified;
  @override
  List<PartePersona> get listPartePersonas;
  @override
  List<Persona> get listPersonas;
  @override
  @JsonKey(ignore: true)
  _$$_ListadoPartesStateCopyWith<_$_ListadoPartesState> get copyWith =>
      throw _privateConstructorUsedError;
}
