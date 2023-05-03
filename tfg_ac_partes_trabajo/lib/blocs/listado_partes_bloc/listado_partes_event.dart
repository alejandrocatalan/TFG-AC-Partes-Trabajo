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

  const factory ListadoPartesEvent.onCleanLastParteModified() =
      OnCleanLastParteModified;

  const factory ListadoPartesEvent.onLoadPersonasDeParte(
      {required int parteTrabajoId}) = OnLoadPersonasDeParte;

  const factory ListadoPartesEvent.onLoadPersonasDePartePersona() =
      OnLoadPersonasDePartePersona;

  const factory ListadoPartesEvent.onSearchPersona(
      {required int parteTrabajoId, required String search}) = OnSearchPersona;

  const factory ListadoPartesEvent.onUpdateHoursPartePersona(
      {required int parteTrabajoId,
      String? hours,
      String? mins}) = OnUpdateHoursPartePersona;
}
