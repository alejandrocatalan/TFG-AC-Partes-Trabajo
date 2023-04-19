import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';

part 'listado_ordenes_event.dart';
part 'listado_ordenes_state.dart';
part 'listado_ordenes_bloc.freezed.dart';

class ListadoOrdenesBloc
    extends Bloc<ListadoOrdenesEvent, ListadoOrdenesState> {
  ListadoOrdenesBloc() : super(ListadoOrdenesState.initial()) {
    final OrdenTrabajoDao ordenTrabajoDao = OrdenTrabajoDao.instance;

    on<ListadoOrdenesEvent>((event, emit) {});

    on<OnLoadOrdenes>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<OrdenTrabajo> ordenesTrabajo = await ordenTrabajoDao.getAll();

      emit(state.copyWith(
        isLoading: false,
        listOrdenesTrabajo: ordenesTrabajo,
      ));
    });

    on<OnSearch>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<OrdenTrabajo> ordenesTrabajo =
          await ordenTrabajoDao.getAllFiltered(event.search);

      emit(
          state.copyWith(isLoading: false, listOrdenesTrabajo: ordenesTrabajo));
    });
  }
}
