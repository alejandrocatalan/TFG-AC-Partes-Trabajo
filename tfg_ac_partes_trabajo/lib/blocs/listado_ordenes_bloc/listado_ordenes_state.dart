part of 'listado_ordenes_bloc.dart';

@freezed
class ListadoOrdenesState with _$ListadoOrdenesState {
  const factory ListadoOrdenesState({
    required bool isLoading,
    required bool isError,
    required List<OrdenTrabajo> listOrdenesTrabajo,
    required List<OrdenPersona> listOrdenPersonas,
    required List<Persona> listPersonas,
  }) = _ListadoOrdenesState;

  factory ListadoOrdenesState.initial() => const ListadoOrdenesState(
        isLoading: false,
        isError: false,
        listOrdenesTrabajo: [],
        listOrdenPersonas: [],
        listPersonas: [],
      );
}
