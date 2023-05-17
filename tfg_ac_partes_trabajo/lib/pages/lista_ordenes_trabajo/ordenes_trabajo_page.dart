import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_ordenes_bloc/listado_ordenes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/search_textfield.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_maestro_dao/orden_persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_ordenes_trabajo/detalle_orden_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_ordenes_trabajo/widgets/orden_trabajo_card.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class OrdenesTrabajoPage extends StatelessWidget {
  const OrdenesTrabajoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListadoOrdenesBloc bloc =
        BlocProvider.of<ListadoOrdenesBloc>(context);
    bloc.add(const ListadoOrdenesEvent.onLoadOrdenes());

    return const OrdenesTrabajoView();
  }
}

class OrdenesTrabajoView extends StatefulWidget {
  const OrdenesTrabajoView({Key? key}) : super(key: key);

  @override
  State<OrdenesTrabajoView> createState() => _OrdenesTrabajoViewState();
}

class _OrdenesTrabajoViewState extends State<OrdenesTrabajoView> {
  /// Variables
  // final bool _isFirstTime = true;

  // DAOs

  // Controllers
  final TextEditingController _searchController = TextEditingController();

  /// Functions
  @override
  void initState() {
    // clearDB();
    // initialiseDB();

    super.initState();
  }

  void viewDataDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'my_database.db');
    final database = await openDatabase(path);

    // Obtener los datos de la tabla 'ordenesTrabajo'
    final ordenesTrabajoData = await database.query('ordenesTrabajo');
    // ignore: avoid_print
    print('Datos de la tabla ordenesTrabajo:');
    // ignore: avoid_print
    print(ordenesTrabajoData);

    // Obtener los datos de la tabla 'partesTrabajo'
    final partesTrabajoData = await database.query('partesTrabajo');
    // ignore: avoid_print
    print('Datos de la tabla partesTrabajo:');
    // ignore: avoid_print
    print(partesTrabajoData);

    // Obtener los datos de la tabla 'personas'
    final personasData = await database.query('personas');
    // ignore: avoid_print
    print('Datos de la tabla personas:');
    // ignore: avoid_print
    print(personasData);

    // Obtener los datos de la tabla 'maquinas'
    final maquinasData = await database.query('maquinas');
    // ignore: avoid_print
    print('Datos de la tabla maquinas:');
    // ignore: avoid_print
    print(maquinasData);

    // Obtener los datos de la tabla 'materiales'
    final materialesData = await database.query('materiales');
    // ignore: avoid_print
    print('Datos de la tabla materiales:');
    // ignore: avoid_print
    print(materialesData);

    // Obtener los datos de la tabla 'ordenesPersonas'
    final ordenesPersonasData = await database.query('ordenesPersonas');
    // ignore: avoid_print
    print('Datos de la tabla ordenesPersonas:');
    // ignore: avoid_print
    print(ordenesPersonasData);

    // Obtener los datos de la tabla 'partesPersonas'
    final partesPersonasData = await database.query('partesPersonas');
    // ignore: avoid_print
    print('Datos de la tabla partesPersonas:');
    // ignore: avoid_print
    print(partesPersonasData);

    // Obtener los datos de la tabla 'ordenesMateriales'
    final ordenesMaterialesData = await database.query('ordenesMateriales');
    // ignore: avoid_print
    print('Datos de la tabla ordenesMateriales:');
    // ignore: avoid_print
    print(ordenesMaterialesData);

    // Obtener los datos de la tabla 'partesMateriales'
    final partesMaterialesData = await database.query('partesMateriales');
    // ignore: avoid_print
    print('Datos de la tabla partesMateriales:');
    // ignore: avoid_print
    print(partesMaterialesData);

    // Obtener los datos de la tabla 'ordenesMaquinas'
    final ordenesMaquinasData = await database.query('ordenesMaquinas');
    // ignore: avoid_print
    print('Datos de la tabla ordenesMaquinas:');
    // ignore: avoid_print
    print(ordenesMaquinasData);

    // Obtener los datos de la tabla 'partesMaquinas'
    final partesMaquinasData = await database.query('partesMaquinas');
    // ignore: avoid_print
    print('Datos de la tabla partesMaquinas:');
    // ignore: avoid_print
    print(partesMaquinasData);
  }

  void clearDB() async {
    await MyDatabase.instance.clearDatabase();
  }

  void initialiseOrdenesYPersonas() async {
    for (int i = 0; i < 10; i++) {
      OrdenTrabajoDao.instance.create(OrdenTrabajo(
          fechaInicio: DateTime.now(),
          codigoOrdenCliente: "codigoOrdenCliente"));
    }

    await PersonaDao.instance.create(Persona(descripcion: "descripcion"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion2"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion3"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion4"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion5"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion6"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion7"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion8"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion9"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion10"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion11"));
    await PersonaDao.instance.create(Persona(descripcion: "descripcion12"));
  }

  void initialiseOrdenPersona() async {
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 5, personaId: 1, horas: 11.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 5, personaId: 2, horas: 12.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 5, personaId: 3, horas: 13.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 5, personaId: 4, horas: 14.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 5, personaId: 5, horas: 15.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 5, personaId: 6, horas: 16.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 6, personaId: 7, horas: 17.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 6, personaId: 8, horas: 18.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 6, personaId: 9, horas: 19.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 6, personaId: 10, horas: 20.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 7, personaId: 11, horas: 21.0));
    await OrdenPersonaDao.instance
        .create(OrdenPersona(ordenTrabajoId: 8, personaId: 12, horas: 22.0));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.translate("work_orders_list"),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // clearDB();
      //     // initialiseOrdenesYPersonas();
      //     // initialiseOrdenPersona();
      //     viewDataDB();
      //   },
      // ),
      body: BlocConsumer<ListadoOrdenesBloc, ListadoOrdenesState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        listener: (context, state) {
          if (state.isLoading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          return Container(
            color: Colors.grey.shade100,
            child: CustomScrollView(
              clipBehavior: Clip.hardEdge,
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchTextField(
                          controller: _searchController,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.95,
                          onChanged: (value) {
                            context.read<ListadoOrdenesBloc>().add(
                                ListadoOrdenesEvent.onSearch(search: value));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: ListView.builder(
                    itemCount: state.listOrdenesTrabajo.length,
                    itemBuilder: (context, index) {
                      final OrdenTrabajo ordenTrabajo =
                          state.listOrdenesTrabajo[index];
                      return OrdenTrabajoCard(
                        ordenTrabajo: ordenTrabajo,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetallesOrdenTrabajoPage(
                                  ordenTrabajo: ordenTrabajo),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
