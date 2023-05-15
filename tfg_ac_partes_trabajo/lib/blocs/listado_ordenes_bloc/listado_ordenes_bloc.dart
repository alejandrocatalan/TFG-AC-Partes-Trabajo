import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/maquina_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/material_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_maestro_dao/orden_maquina_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_maestro_dao/orden_material_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_maestro_dao/orden_persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/maquina.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_maquina.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';

part 'listado_ordenes_event.dart';
part 'listado_ordenes_state.dart';
part 'listado_ordenes_bloc.freezed.dart';

class ListadoOrdenesBloc
    extends Bloc<ListadoOrdenesEvent, ListadoOrdenesState> {
  final OrdenTrabajoDao _ordenTrabajoDao = OrdenTrabajoDao.instance;

  /// Personas
  final OrdenPersonaDao _ordenPersonaDao = OrdenPersonaDao.instance;
  final PersonaDao _personaDao = PersonaDao.instance;

  /// Materiales
  final OrdenMaterialDao _ordenMaterialDao = OrdenMaterialDao.instance;
  final MaterialDao _materialDao = MaterialDao.instance;

  /// Máquinas
  final OrdenMaquinaDao _ordenMaquinaDao = OrdenMaquinaDao.instance;
  final MaquinaDao _maquinaDao = MaquinaDao.instance;

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

    /// Personas
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

    /// Materiales
    on<OnLoadMaterialesDeOrden>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<OrdenMaterial> materialesDeOrden =
          await _ordenMaterialDao.getAllMaterialesDeOrden(
        ordenTrabajoId: event.ordenTrabajoId,
      );

      emit(state.copyWith(
        listOrdenMateriales: materialesDeOrden,
      ));

      add(const OnLoadMaterialesDeOrdenMaterial());
    });

    on<OnLoadMaterialesDeOrdenMaterial>((event, emit) async {
      List<int> materialIds = state.listOrdenMateriales
          .map((ordenMaterial) => ordenMaterial.materialId)
          .toList();
      List<Materiall> listMateriales =
          await _materialDao.getAllMaterialesDeOrdenOParteMaterial(materialIds);

      emit(state.copyWith(
        isLoading: false,
        listMateriales: listMateriales,
      ));
    });

    /// Máquinas
    on<OnLoadMaquinasDeOrden>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<OrdenMaquina> maquinasDeOrden =
          await _ordenMaquinaDao.getAllMaquinasDeOrden(
        ordenTrabajoId: event.ordenTrabajoId,
      );

      emit(state.copyWith(
        listOrdenMaquinas: maquinasDeOrden,
      ));

      add(const OnLoadMaquinasDeOrdenMaquina());
    });

    on<OnLoadMaquinasDeOrdenMaquina>((event, emit) async {
      List<int> maquinaIds = state.listOrdenMaquinas
          .map((ordenMaquina) => ordenMaquina.maquinaId)
          .toList();
      List<Maquina> listMaquinas =
          await _maquinaDao.getAllMaquinasDeOrdenOParteMaquina(maquinaIds);

      emit(state.copyWith(
        isLoading: false,
        listMaquinas: listMaquinas,
      ));
    });
  }
}
