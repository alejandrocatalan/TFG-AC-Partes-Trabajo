part of 'listado_partes_bloc.dart';

@freezed
class ListadoPartesState with _$ListadoPartesState {
  const factory ListadoPartesState({
    required bool isLoading,
    required bool isError,
    required List<ParteTrabajo> listPartesTrabajo,
    required ParteTrabajo lastParteCreated,
    required ParteTrabajo? lastParteModified,
    required bool isButtonEnabled,
    required bool isParteClosed,

    /// Personas
    required List<PartePersona> listPartePersonas,
    required List<Persona> listPersonas,

    /// Materiales
    required List<ParteMaterial> listParteMateriales,
    required List<Materiall> listMateriales,

    /// Máquinas
    required List<ParteMaquina> listParteMaquinas,
    required List<Maquina> listMaquinas,
  }) = _ListadoPartesState;

  factory ListadoPartesState.initial() => ListadoPartesState(
        isLoading: false,
        isError: false,
        listPartesTrabajo: [],
        lastParteCreated: ParteTrabajo.initial(),
        lastParteModified: null,
        isButtonEnabled: false,
        isParteClosed: false,
        listPartePersonas: [],
        listPersonas: [],
        listParteMateriales: [],
        listMateriales: [],
        listParteMaquinas: [],
        listMaquinas: [],
      );
}
