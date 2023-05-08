import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/model/models/persona.dart';

part 'listado_partes_event.dart';
part 'listado_partes_state.dart';
part 'listado_partes_bloc.freezed.dart';

class ListadoPartesBloc extends Bloc<ListadoPartesEvent, ListadoPartesState> {
  final ParteTrabajoDao _parteTrabajoDao = ParteTrabajoDao.instance;
  final PartePersonaDao _partePersonaDao = PartePersonaDao.instance;
  final PersonaDao _personaDao = PersonaDao.instance;

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

      double horas = double.parse(event.hours ?? "0.0") +
          double.parse(event.mins ?? "0.0");

      _partePersonaDao.update(PartePersona(
          parteTrabajoId: parteTrabajoId, personaId: personaId, horas: horas));

      add(OnLoadPersonasDeParte(parteTrabajoId: parteTrabajoId));
    });

    // on<OnLoadPersonasDePartePersona>((event, emit) async {
    //   List<int> personaIds = state.listPartePersonas
    //       .map((partePersona) => partePersona.personaId)
    //       .toList();
    //   List<Persona> listPersonas =
    //       await _personaDao.getAllPersonasDeOrdenOPartePersona(personaIds);

    //   emit(state.copyWith(
    //     isLoading: false,
    //     listPersonas: listPersonas,
    //   ));
    // });

    // on<OnCleanLastParteModified>((event, emit) async {
    //   emit(state.copyWith(lastParteModified: ParteTrabajo.initial()));
    // });
  }
}
