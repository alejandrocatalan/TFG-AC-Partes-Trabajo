import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';

part 'listado_partes_event.dart';
part 'listado_partes_state.dart';
part 'listado_partes_bloc.freezed.dart';

class ListadoPartesBloc extends Bloc<ListadoPartesEvent, ListadoPartesState> {
  final ParteTrabajoDao parteTrabajoDao = ParteTrabajoDao.instance;

  ListadoPartesBloc() : super(ListadoPartesState.initial()) {
    on<ListadoPartesEvent>((event, emit) {});

    on<OnLoadPartes>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<ParteTrabajo> partesTrabajo = await parteTrabajoDao.getAll();

      emit(state.copyWith(isLoading: false, listPartesTrabajo: partesTrabajo));
    });

    on<OnLoadPartesDeOrden>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<ParteTrabajo> partesTrabajo = await parteTrabajoDao
          .getAllPartesDeOrden(ordenTrabajoId: event.ordenTrabajoId);

      emit(state.copyWith(isLoading: false, listPartesTrabajo: partesTrabajo));
    });

    on<OnSearch>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<ParteTrabajo> partesTrabajo =
          await parteTrabajoDao.getAllPartesDeOrdenFiltered(
        ordenTrabajoId: event.ordenTrabajoId,
        searchTerm: event.search,
      );

      emit(state.copyWith(isLoading: false, listPartesTrabajo: partesTrabajo));
    });

    on<OnCreateParte>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      int idParte = await parteTrabajoDao.create(event.parteTrabajo);
      ParteTrabajo? parteCreated = await parteTrabajoDao.get(idParte);

      emit(state.copyWith(isLoading: false, lastParteCreated: parteCreated));

      add(OnLoadPartesDeOrden(
          ordenTrabajoId: event.parteTrabajo.ordenTrabajoId));
    });
  }
}
