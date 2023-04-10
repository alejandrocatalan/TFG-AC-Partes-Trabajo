part of 'listado_ordenes_bloc.dart';

@freezed
class ListadoOrdenesEvent with _$ListadoOrdenesEvent {
  const factory ListadoOrdenesEvent.onLoadOrdenes() = OnLoadOrdenes;
}
