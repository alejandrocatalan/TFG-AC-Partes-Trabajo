import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';

part 'listado_partes_event.dart';
part 'listado_partes_state.dart';
part 'listado_partes_bloc.freezed.dart';

class ListadoPartesBloc extends Bloc<ListadoPartesEvent, ListadoPartesState> {
  ListadoPartesBloc() : super(ListadoPartesState.initial()) {
    on<ListadoPartesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<OnLoadPartes>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final ParteTrabajoDao parteTrabajoDao = ParteTrabajoDao.instance;
      List<ParteTrabajo> partesTrabajo = await parteTrabajoDao.getAll();

      emit(state.copyWith(isLoading: false, listPartesTrabajo: partesTrabajo));
    });

    on<OnLoadPartesDeOrden>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final ParteTrabajoDao parteTrabajoDao = ParteTrabajoDao.instance;
      List<ParteTrabajo> partesTrabajo = await parteTrabajoDao
          .getAllPartesDeOrden(ordenTrabajoId: event.ordenTrabajoId);

      emit(state.copyWith(isLoading: false, listPartesTrabajo: partesTrabajo));
    });
  }
}
