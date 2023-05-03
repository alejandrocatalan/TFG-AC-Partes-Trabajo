import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/model/models/persona.dart';

part 'listado_ordenes_event.dart';
part 'listado_ordenes_state.dart';
part 'listado_ordenes_bloc.freezed.dart';

class ListadoOrdenesBloc
    extends Bloc<ListadoOrdenesEvent, ListadoOrdenesState> {
  final OrdenTrabajoDao _ordenTrabajoDao = OrdenTrabajoDao.instance;
  final OrdenPersonaDao _ordenPersonaDao = OrdenPersonaDao.instance;
  final PersonaDao _personaDao = PersonaDao.instance;

  ListadoOrdenesBloc() : super(ListadoOrdenesState.initial()) {
    on<ListadoOrdenesEvent>((event, emit) {});

    on<OnLoadOrdenes>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<OrdenTrabajo> ordenesTrabajo = await _ordenTrabajoDao.getAll();

      emit(state.copyWith(
        isLoading: false,
        listOrdenesTrabajo: ordenesTrabajo,
      ));
    });

    on<OnSearch>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<OrdenTrabajo> ordenesTrabajo =
          await _ordenTrabajoDao.getAllFiltered(event.search);

      emit(
          state.copyWith(isLoading: false, listOrdenesTrabajo: ordenesTrabajo));
    });

    on<OnLoadPersonasDeOrden>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<OrdenPersona> personasDeOrden =
          await _ordenPersonaDao.getAllPersonasDeOrden(
        ordenTrabajoId: event.ordenTrabajoId,
      );

      emit(state.copyWith(
        listOrdenPersonas: personasDeOrden,
      ));

      add(const OnLoadPersonasDeOrdenPersona());
    });

    on<OnLoadPersonasDeOrdenPersona>((event, emit) async {
      List<int> personaIds = state.listOrdenPersonas
          .map((ordenPersona) => ordenPersona.personaId)
          .toList();
      List<Persona> listPersonas =
          await _personaDao.getAllPersonasDeOrdenOPartePersona(personaIds);

      emit(state.copyWith(
        isLoading: false,
        listPersonas: listPersonas,
      ));
    });
  }
}
