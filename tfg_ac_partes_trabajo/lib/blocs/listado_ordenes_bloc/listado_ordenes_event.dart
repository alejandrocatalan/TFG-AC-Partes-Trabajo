part of 'listado_ordenes_bloc.dart';

@freezed
class ListadoOrdenesEvent with _$ListadoOrdenesEvent {
  const factory ListadoOrdenesEvent.onLoadOrdenes() = OnLoadOrdenes;

  const factory ListadoOrdenesEvent.onSearch({required String search}) =
      OnSearch;

  /// Personas
  const factory ListadoOrdenesEvent.onLoadPersonasDeOrden(
      {required int ordenTrabajoId}) = OnLoadPersonasDeOrden;

  const factory ListadoOrdenesEvent.onLoadPersonasDeOrdenPersona() =
      OnLoadPersonasDeOrdenPersona;

  /// Materiales
  const factory ListadoOrdenesEvent.onLoadMaterialesDeOrden(
      {required int ordenTrabajoId}) = OnLoadMaterialesDeOrden;

  const factory ListadoOrdenesEvent.onLoadMaterialesDeOrdenMaterial() =
      OnLoadMaterialesDeOrdenMaterial;

  /// Máquinas
  const factory ListadoOrdenesEvent.onLoadMaquinasDeOrden(
      {required int ordenTrabajoId}) = OnLoadMaquinasDeOrden;

  const factory ListadoOrdenesEvent.onLoadMaquinasDeOrdenMaquina() =
      OnLoadMaquinasDeOrdenMaquina;
}
