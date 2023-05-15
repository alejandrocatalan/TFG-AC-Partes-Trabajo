part of 'listado_partes_bloc.dart';

@freezed
class ListadoPartesEvent with _$ListadoPartesEvent {
  const factory ListadoPartesEvent.onLoadPartes() = OnLoadPartes;

  const factory ListadoPartesEvent.onLoadPartesDeOrden(
      {required int ordenTrabajoId}) = OnLoadPartesDeOrden;

  const factory ListadoPartesEvent.onSearch(
      {required int ordenTrabajoId, required String search}) = OnSearch;

  const factory ListadoPartesEvent.onCreateParte(
      {required ParteTrabajo parteTrabajo}) = OnCreateParte;

  const factory ListadoPartesEvent.onUpdateParte(
      {required ParteTrabajo parteTrabajo}) = OnUpdateParte;

  // const factory ListadoPartesEvent.onCleanLastParteModified() =
  //     OnCleanLastParteModified;

  // const factory ListadoPartesEvent.onChangeButtonMapState({
  //   required bool buttonState,
  //   required int index,
  // }) = OnChangeButtonMapState;

  const factory ListadoPartesEvent.onChangeButtonState({
    required bool buttonState,
  }) = OnChangeButtonState;

  /// Personas
  const factory ListadoPartesEvent.onLoadPersonasDeParte(
      {required int parteTrabajoId}) = OnLoadPersonasDeParte;

  const factory ListadoPartesEvent.onLoadPersonasDePartePersona() =
      OnLoadPersonasDePartePersona;

  const factory ListadoPartesEvent.onSearchPersona(
      {required int parteTrabajoId, required String search}) = OnSearchPersona;

  const factory ListadoPartesEvent.onUpdateHoursPartePersona(
      {required int parteTrabajoId,
      required int personaId,
      String? hours,
      String? mins}) = OnUpdateHoursPartePersona;

  /// Materiales
  const factory ListadoPartesEvent.onLoadMaterialesDeParte(
      {required int parteTrabajoId}) = OnLoadMaterialesDeParte;

  const factory ListadoPartesEvent.onLoadMaterialesDeParteMaterial() =
      OnLoadMaterialesDeParteMaterial;

  const factory ListadoPartesEvent.onSearchMaterial(
      {required int parteTrabajoId, required String search}) = OnSearchMaterial;

  const factory ListadoPartesEvent.onUpdateUnidadesParteMaterial(
      {required int parteTrabajoId,
      required int materialId,
      required String unidades}) = OnUpdateUnidadesParteMaterial;

  /// Máquinas
  const factory ListadoPartesEvent.onLoadMaquinasDeParte(
      {required int parteTrabajoId}) = OnLoadMaquinasDeParte;

  const factory ListadoPartesEvent.onLoadMaquinasDeParteMaquina() =
      OnLoadMaquinasDeParteMaquina;

  const factory ListadoPartesEvent.onSearchMaquina(
      {required int parteTrabajoId, required String search}) = OnSearchMaquina;

  const factory ListadoPartesEvent.onUpdateHoursParteMaquina(
      {required int parteTrabajoId,
      required int maquinaId,
      String? hours,
      String? mins}) = OnUpdateHoursParteMaquina;
}
