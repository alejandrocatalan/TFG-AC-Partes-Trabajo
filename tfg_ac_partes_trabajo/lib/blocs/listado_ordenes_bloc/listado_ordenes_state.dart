part of 'listado_ordenes_bloc.dart';

@freezed
class ListadoOrdenesState with _$ListadoOrdenesState {
  const factory ListadoOrdenesState({
    required bool isLoading,
    required bool isError,
    required List<OrdenTrabajo> listOrdenesTrabajo,

    /// Personas
    required List<OrdenPersona> listOrdenPersonas,
    required List<Persona> listPersonas,

    /// Materiales
    required List<OrdenMaterial> listOrdenMateriales,
    required List<Materiall> listMateriales,

    /// Máquinas
    required List<OrdenMaquina> listOrdenMaquinas,
    required List<Maquina> listMaquinas,
  }) = _ListadoOrdenesState;

  factory ListadoOrdenesState.initial() => const ListadoOrdenesState(
        isLoading: false,
        isError: false,
        listOrdenesTrabajo: [],
        listOrdenPersonas: [],
        listPersonas: [],
        listOrdenMateriales: [],
        listMateriales: [],
        listOrdenMaquinas: [],
        listMaquinas: [],
      );
}
