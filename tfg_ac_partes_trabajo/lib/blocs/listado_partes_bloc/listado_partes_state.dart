part of 'listado_partes_bloc.dart';

@freezed
class ListadoPartesState with _$ListadoPartesState {
  const factory ListadoPartesState({
    required bool isLoading,
    required bool isError,
    required List<ParteTrabajo> listPartesTrabajo,
    required ParteTrabajo lastParteCreated,
    required ParteTrabajo? lastParteModified,
  }) = _ListadoPartesState;

  factory ListadoPartesState.initial() => ListadoPartesState(
        isLoading: false,
        isError: false,
        listPartesTrabajo: [],
        lastParteCreated: ParteTrabajo.initial(),
        lastParteModified: null,
      );
}
