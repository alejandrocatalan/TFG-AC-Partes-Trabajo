part of 'listado_ordenes_bloc.dart';

@freezed
class ListadoOrdenesEvent with _$ListadoOrdenesEvent {
  const factory ListadoOrdenesEvent.onLoadOrdenes() = OnLoadOrdenes;

  const factory ListadoOrdenesEvent.onSearch({required String search}) =
      OnSearch;
}
