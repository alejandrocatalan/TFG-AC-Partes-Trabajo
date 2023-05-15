import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/maquina_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/material_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_maestro_dao/parte_maquina_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_maestro_dao/parte_material_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_maestro_dao/parte_persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/maquina.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_maestro/parte_maquina.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_maestro/parte_material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_maestro/parte_persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';

part 'listado_partes_event.dart';
part 'listado_partes_state.dart';
part 'listado_partes_bloc.freezed.dart';

class ListadoPartesBloc extends Bloc<ListadoPartesEvent, ListadoPartesState> {
  final ParteTrabajoDao _parteTrabajoDao = ParteTrabajoDao.instance;

  final PartePersonaDao _partePersonaDao = PartePersonaDao.instance;
  final PersonaDao _personaDao = PersonaDao.instance;

  final ParteMaterialDao _parteMaterialDao = ParteMaterialDao.instance;
  final MaterialDao _materialDao = MaterialDao.instance;

  final ParteMaquinaDao _parteMaquinaDao = ParteMaquinaDao.instance;
  final MaquinaDao _maquinaDao = MaquinaDao.instance;

  ListadoPartesBloc() : super(ListadoPartesState.initial()) {
    on<ListadoPartesEvent>((event, emit) {});

    on<OnLoadPartes>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<ParteTrabajo> partesTrabajo = await _parteTrabajoDao.getAll();

      emit(state.copyWith(isLoading: false, listPartesTrabajo: partesTrabajo));
    });

    on<OnLoadPartesDeOrden>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<ParteTrabajo> partesTrabajo = await _parteTrabajoDao
          .getAllPartesDeOrden(ordenTrabajoId: event.ordenTrabajoId);

      emit(state.copyWith(isLoading: false, listPartesTrabajo: partesTrabajo));
    });

    on<OnSearch>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<ParteTrabajo> partesTrabajo =
          await _parteTrabajoDao.getAllPartesDeOrdenFiltered(
        ordenTrabajoId: event.ordenTrabajoId,
        searchTerm: event.search,
      );

      emit(state.copyWith(isLoading: false, listPartesTrabajo: partesTrabajo));
    });

    on<OnCreateParte>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      int idParte = await _parteTrabajoDao.create(event.parteTrabajo);
      ParteTrabajo? parteCreated = await _parteTrabajoDao.get(idParte);

      emit(state.copyWith(isLoading: false, lastParteCreated: parteCreated!));

      add(OnLoadPartesDeOrden(
          ordenTrabajoId: event.parteTrabajo.ordenTrabajoId));
    });

    on<OnUpdateParte>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      await _parteTrabajoDao.update(event.parteTrabajo);
      ParteTrabajo? parteCreated =
          await _parteTrabajoDao.get(event.parteTrabajo.id!);

      emit(state.copyWith(isLoading: false, lastParteCreated: parteCreated!));

      add(OnLoadPartesDeOrden(
          ordenTrabajoId: event.parteTrabajo.ordenTrabajoId));
    });

    // on<OnChangeButtonMapState>((event, emit) async {
    //   emit(state.copyWith(
    //     isButtonEnabledMap: Map<int, bool>.from(
    //       state.isButtonEnabledMap,
    //     )..[event.index] = event.buttonState,
    //   ));
    // });

    on<OnChangeButtonState>((event, emit) async {
      emit(state.copyWith(
        isButtonEnabled: event.buttonState,
      ));
    });

    /// Personas
    on<OnLoadPersonasDeParte>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      // Obtenemos todos los PartePersona de con el id del ParteTrabajo
      List<PartePersona> personasDeParte =
          await _partePersonaDao.getAllPersonasDeParte(
        parteTrabajoId: event.parteTrabajoId,
      );

      // Sacamos los ids de esos PartePersona
      List<int> partePersonaIds = personasDeParte
          .map((partePersona) => partePersona.personaId)
          .toList();

      // Obtenemos todas las Persona
      List<Persona> personas = await _personaDao.getAll();

      // Sacamos los ids de todas las Persona
      List<int?> personaIds = personas.map((persona) => persona.id).toList();

      /// Comparamos si en la lista de ids de PartePersona están todos los de Persona
      // Ordenamos ambas listas de ids
      partePersonaIds.sort();
      personaIds.sort();

      // Comparamos si las listas ordenadas son iguales
      bool todasPersonaEnPartePersona =
          personaIds.every((id) => partePersonaIds.contains(id));

      if (!todasPersonaEnPartePersona) {
        // Si faltan algunos ids de Persona en la lista de PartePersona, creamos los PartePersona restantes
        List<int?> faltantes =
            personaIds.where((id) => !partePersonaIds.contains(id)).toList();

        for (int? idPersona in faltantes) {
          PartePersona nuevoPartePersona = PartePersona(
            parteTrabajoId: event.parteTrabajoId,
            personaId: idPersona!,
            horas: 0,
          );
          await _partePersonaDao.create(nuevoPartePersona);
          personasDeParte.add(nuevoPartePersona);
        }
      }

      emit(state.copyWith(
        isLoading: false,
        listPartePersonas: personasDeParte,
        listPersonas: personas,
      ));
    });

    on<OnSearchPersona>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<Persona> personas = await _personaDao.getAllPersonasFiltered(
        searchTerm: event.search,
      );

      List<PartePersona> partePersonas = [];
      for (var persona in personas) {
        PartePersona? partePersona =
            await _partePersonaDao.getPersonaDeParteFiltered(
                parteTrabajoId: event.parteTrabajoId, personaId: persona.id!);
        if (partePersona != null) {
          partePersonas.add(partePersona);
        }
      }

      emit(state.copyWith(
          isLoading: false,
          listPartePersonas: partePersonas,
          listPersonas: personas));
    });

    on<OnUpdateHoursPartePersona>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      int parteTrabajoId = event.parteTrabajoId;
      int personaId = event.personaId;

      PartePersona? partePersonaActual =
          await _partePersonaDao.get(parteTrabajoId, personaId);
      List<String> tiempoActual =
          partePersonaActual!.horas.toString().split(".");

      String horasNuevas = event.hours != null ? event.hours! : tiempoActual[0];
      String minsNuevas = event.mins != null ? event.mins! : tiempoActual[1];

      double horas =
          double.parse("$horasNuevas.0") + double.parse("0.$minsNuevas");

      _partePersonaDao.update(PartePersona(
          parteTrabajoId: parteTrabajoId, personaId: personaId, horas: horas));

      add(OnLoadPersonasDeParte(parteTrabajoId: parteTrabajoId));
    });

    /// Materiales
    on<OnLoadMaterialesDeParte>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      // Obtenemos todos los ParteMaterial de con el id del ParteTrabajo
      List<ParteMaterial> materialesDeParte =
          await _parteMaterialDao.getAllMaterialesDeParte(
        parteTrabajoId: event.parteTrabajoId,
      );

      // Sacamos los ids de esos ParteMaterial
      List<int> parteMaterialIds = materialesDeParte
          .map((parteMaterial) => parteMaterial.materialId)
          .toList();

      // Obtenemos todas las Material
      List<Materiall> materiales = await _materialDao.getAll();

      // Sacamos los ids de todas las Material
      List<int?> materialIds =
          materiales.map((material) => material.id).toList();

      /// Comparamos si en la lista de ids de ParteMaterial están todos los de Material
      // Ordenamos ambas listas de ids
      parteMaterialIds.sort();
      materialIds.sort();

      // Comparamos si las listas ordenadas son iguales
      bool todasMaterialEnParteMaterial =
          materialIds.every((id) => parteMaterialIds.contains(id));

      if (!todasMaterialEnParteMaterial) {
        // Si faltan algunos ids de Material en la lista de ParteMaterial, creamos los ParteMaterial restantes
        List<int?> faltantes =
            materialIds.where((id) => !parteMaterialIds.contains(id)).toList();

        for (int? idMaterial in faltantes) {
          ParteMaterial nuevoParteMaterial = ParteMaterial(
            parteTrabajoId: event.parteTrabajoId,
            materialId: idMaterial!,
            unidades: 0,
          );
          await _parteMaterialDao.create(nuevoParteMaterial);
          materialesDeParte.add(nuevoParteMaterial);
        }
      }

      emit(state.copyWith(
        isLoading: false,
        listParteMateriales: materialesDeParte,
        listMateriales: materiales,
      ));
    });

    on<OnSearchMaterial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<Materiall> materiales = await _materialDao.getAllMaterialesFiltered(
        searchTerm: event.search,
      );

      List<ParteMaterial> parteMateriales = [];
      for (var material in materiales) {
        ParteMaterial? parteMaterial =
            await _parteMaterialDao.getMaterialDeParteFiltered(
                parteTrabajoId: event.parteTrabajoId, materialId: material.id!);
        if (parteMaterial != null) {
          parteMateriales.add(parteMaterial);
        }
      }

      emit(state.copyWith(
          isLoading: false,
          listParteMateriales: parteMateriales,
          listMateriales: materiales));
    });

    on<OnUpdateUnidadesParteMaterial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      int parteTrabajoId = event.parteTrabajoId;
      int materialId = event.materialId;
      double unidades = double.parse(event.unidades);

      _parteMaterialDao.update(ParteMaterial(
          parteTrabajoId: parteTrabajoId,
          materialId: materialId,
          unidades: unidades));

      add(OnLoadMaterialesDeParte(parteTrabajoId: parteTrabajoId));
    });

    /// Máquinas
    on<OnLoadMaquinasDeParte>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      // Obtenemos todos los ParteMaquina de con el id del ParteTrabajo
      List<ParteMaquina> maquinasDeParte =
          await _parteMaquinaDao.getAllMaquinasDeParte(
        parteTrabajoId: event.parteTrabajoId,
      );

      // Sacamos los ids de esos ParteMaquina
      List<int> parteMaquinaIds = maquinasDeParte
          .map((parteMaquina) => parteMaquina.maquinaId)
          .toList();

      // Obtenemos todas las Maquina
      List<Maquina> maquinas = await _maquinaDao.getAll();

      // Sacamos los ids de todas las Maquina
      List<int?> maquinaIds = maquinas.map((maquina) => maquina.id).toList();

      /// Comparamos si en la lista de ids de ParteMaquina están todos los de Maquina
      // Ordenamos ambas listas de ids
      parteMaquinaIds.sort();
      maquinaIds.sort();

      // Comparamos si las listas ordenadas son iguales
      bool todasMaquinaEnParteMaquina =
          maquinaIds.every((id) => parteMaquinaIds.contains(id));

      if (!todasMaquinaEnParteMaquina) {
        // Si faltan algunos ids de Maquina en la lista de ParteMaquina, creamos los ParteMaquina restantes
        List<int?> faltantes =
            maquinaIds.where((id) => !parteMaquinaIds.contains(id)).toList();

        for (int? idMaquina in faltantes) {
          ParteMaquina nuevoParteMaquina = ParteMaquina(
            parteTrabajoId: event.parteTrabajoId,
            maquinaId: idMaquina!,
            horas: 0,
          );
          await _parteMaquinaDao.create(nuevoParteMaquina);
          maquinasDeParte.add(nuevoParteMaquina);
        }
      }

      emit(state.copyWith(
        isLoading: false,
        listParteMaquinas: maquinasDeParte,
        listMaquinas: maquinas,
      ));
    });

    on<OnSearchMaquina>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<Maquina> maquinas = await _maquinaDao.getAllMaquinasFiltered(
        searchTerm: event.search,
      );

      List<ParteMaquina> parteMaquinas = [];
      for (var maquina in maquinas) {
        ParteMaquina? parteMaquina =
            await _parteMaquinaDao.getMaquinaDeParteFiltered(
                parteTrabajoId: event.parteTrabajoId, maquinaId: maquina.id!);
        if (parteMaquina != null) {
          parteMaquinas.add(parteMaquina);
        }
      }

      emit(state.copyWith(
          isLoading: false,
          listParteMaquinas: parteMaquinas,
          listMaquinas: maquinas));
    });

    on<OnUpdateHoursParteMaquina>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      int parteTrabajoId = event.parteTrabajoId;
      int maquinaId = event.maquinaId;

      ParteMaquina? parteMaquinaActual =
          await _parteMaquinaDao.get(parteTrabajoId, maquinaId);
      List<String> tiempoActual =
          parteMaquinaActual!.horas.toString().split(".");

      String horasNuevas = event.hours != null ? event.hours! : tiempoActual[0];
      String minsNuevas = event.mins != null ? event.mins! : tiempoActual[1];

      double horas =
          double.parse("$horasNuevas.0") + double.parse("0.$minsNuevas");

      _parteMaquinaDao.update(ParteMaquina(
          parteTrabajoId: parteTrabajoId, maquinaId: maquinaId, horas: horas));

      add(OnLoadMaquinasDeParte(parteTrabajoId: parteTrabajoId));
    });
  }
}
