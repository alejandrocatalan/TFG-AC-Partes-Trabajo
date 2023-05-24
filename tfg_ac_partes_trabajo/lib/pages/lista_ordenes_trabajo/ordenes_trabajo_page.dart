import 'dart:math';

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
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/maquina_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/material_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/maestro_dao/persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_maestro_dao/orden_maquina_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_maestro_dao/orden_material_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_maestro_dao/orden_persona_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/maquina.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_maquina.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_material.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_persona.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_ordenes_trabajo/detalle_orden_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_ordenes_trabajo/widgets/orden_trabajo_card.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
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

  void initialiseOrdenesYMaestros() async {
    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "Pendientes de la 9 a la 15",
        trabajoARealizar: "Reparación de arquetas"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "Maderas del primer segmento quebradas",
        trabajoARealizar:
            "Reemplazo de tablas de madera en el paseo marítimo"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "Zona de baño número 3",
        trabajoARealizar: "Montaje de duchas en la zona de baño"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "Escaleras de acceso norte desgastadas",
        trabajoARealizar: "Restauración de escaleras de acceso a la playa"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "Postes de sombra sueltos en el área de descanso",
        trabajoARealizar: "Ajuste y aseguramiento de postes de sombra"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "",
        trabajoARealizar:
            "Relleno y nivelación de arena en la zona de juegos"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "Fugas de agua",
        trabajoARealizar: "Reparación de grifos del área de lavado"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "Erosión",
        trabajoARealizar: "Reparación de la entrada principal"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "",
        trabajoARealizar: "Reposición de piedras en el muro de contención"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "",
        trabajoARealizar:
            "Instalación de señalización accesible en la zona de baño"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "En el primer bloque",
        trabajoARealizar: "Reposición de adoquines en el paseo marítimo"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "Desgastadas las de la segunda fila",
        trabajoARealizar: "Reemplazo de barandillas de acceso a la playa"));

    await OrdenTrabajoDao.instance.create(OrdenTrabajo(
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now().add(const Duration(days: 3)),
        tipo: "Obra",
        instalacion: "Playa de Denia - Alicante",
        codigoOrdenCliente: "DA-44327",
        observaciones: "",
        trabajoARealizar: "Reparación del sendero de acceso al mirador"));

    await PersonaDao.instance
        .create(Persona(descripcion: "Alejandro Rodríguez García"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Marta López Fernández"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Javier Pérez Martínez"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Laura González Sánchez"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Carlos Ramírez Romero"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Carmen Torres Jiménez"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Alberto Morales Vargas"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Ana Bel Ruiz Medina"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Diego Castro Ortega"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Manuel Herrera Paredes"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Antonio Torres López"));
    await PersonaDao.instance
        .create(Persona(descripcion: "Sergio Mendoza Ríos"));

    await MaterialDao.instance
        .create(Materiall(descripcion: "Bombas de achique"));
    await MaterialDao.instance.create(Materiall(descripcion: "Tubos de cobre"));
    await MaterialDao.instance.create(Materiall(descripcion: "Juntas de goma"));
    await MaterialDao.instance
        .create(Materiall(descripcion: "Filtros de sedimentación"));
    await MaterialDao.instance
        .create(Materiall(descripcion: "Losas de piedra"));
    await MaterialDao.instance
        .create(Materiall(descripcion: "Bloques de hormigón"));
    await MaterialDao.instance
        .create(Materiall(descripcion: "Manguitos de unión"));
    await MaterialDao.instance
        .create(Materiall(descripcion: "Codos de hierro fundido"));
    await MaterialDao.instance
        .create(Materiall(descripcion: "Selladores de silicona"));
    await MaterialDao.instance
        .create(Materiall(descripcion: "Adhesivos para PVC"));
    await MaterialDao.instance
        .create(Materiall(descripcion: "Tuberías de PVC"));
    await MaterialDao.instance
        .create(Materiall(descripcion: "Válvulas de compuerta"));

    await MaquinaDao.instance.create(Maquina(descripcion: "Excavadora"));
    await MaquinaDao.instance.create(Maquina(descripcion: "Retroexcavadora"));
    await MaquinaDao.instance
        .create(Maquina(descripcion: "Martillo neumático"));
    await MaquinaDao.instance
        .create(Maquina(descripcion: "Compactadora de suelos"));
    await MaquinaDao.instance.create(Maquina(descripcion: "Bomba de achique"));
    await MaquinaDao.instance
        .create(Maquina(descripcion: "Máquina de soldadura"));
    await MaquinaDao.instance.create(Maquina(descripcion: "Hidrolimpiadora"));
    await MaquinaDao.instance.create(Maquina(descripcion: "Vibroapisonadora"));
    await MaquinaDao.instance
        .create(Maquina(descripcion: "Carretilla elevadora"));
    await MaquinaDao.instance
        .create(Maquina(descripcion: "Fresadora de asfalto"));
    await MaquinaDao.instance.create(Maquina(descripcion: "Taladro percutor"));
    await MaquinaDao.instance.create(Maquina(descripcion: "Motoniveladora"));
  }

  void initialiseOrdenMaestro() async {
    final random = Random();

    for (var i = 0; i < 30; i++) {
      final ordenTrabajoId = random.nextInt(13) + 1;
      final personaId = random.nextInt(12) + 1;
      final horas = (random.nextDouble() * 99.5) + 0.5;

      await OrdenPersonaDao.instance.create(
        OrdenPersona(
            ordenTrabajoId: ordenTrabajoId, personaId: personaId, horas: horas),
      );
    }

    for (var i = 0; i < 30; i++) {
      final ordenTrabajoId = random.nextInt(13) + 1;
      final materialId = random.nextInt(12) + 1;
      final unidades = (random.nextDouble() * 99.5) + 0.5;

      await OrdenMaterialDao.instance.create(
        OrdenMaterial(
            ordenTrabajoId: ordenTrabajoId,
            materialId: materialId,
            unidades: unidades),
      );
    }

    for (var i = 0; i < 30; i++) {
      final ordenTrabajoId = random.nextInt(13) + 1;
      final maquinaId = random.nextInt(12) + 1;
      final horas = (random.nextDouble() * 99.5) + 0.5;

      await OrdenMaquinaDao.instance.create(
        OrdenMaquina(
            ordenTrabajoId: ordenTrabajoId, maquinaId: maquinaId, horas: horas),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.translate("work_orders_list"),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     // clearDB();
      //     // initialiseOrdenesYMaestros();
      //     // initialiseOrdenMaestro();

      //     viewDataDB();
      //   },
      // ),
      drawer: Drawer(
        width: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: MyColorStyles.redColor,
                  ),
                  child: Text(
                    'Menú Lateral',
                    style: MyFontStyles(MyColorStyles.whiteColor)
                        .getSourceSansPro20SemiBold(),
                  ),
                ),
                ListTile(
                  trailing: Icon(
                    Icons.settings,
                    color: MyColorStyles.blackColor,
                  ),
                  title: Text(
                    'Configuración',
                    style: MyFontStyles(MyColorStyles.blackColor)
                        .getSourceSansPro18Regular(),
                  ),
                  onTap: () {
                    // Lógica cuando se selecciona "Refrescar"
                  },
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  ListTile(
                    trailing: Icon(
                      Icons.refresh,
                      color: MyColorStyles.blackColor,
                    ),
                    title: Text(
                      'Refrescar',
                      style: MyFontStyles(MyColorStyles.blackColor)
                          .getSourceSansPro18Regular(),
                    ),
                    onTap: () {
                      // Lógica cuando se selecciona "Refrescar"
                    },
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  ListTile(
                    trailing: Icon(
                      Icons.exit_to_app,
                      color: MyColorStyles.blackColor,
                    ),
                    title: Text(
                      'Salir',
                      style: MyFontStyles(MyColorStyles.blackColor)
                          .getSourceSansPro18Regular(),
                    ),
                    onTap: () {
                      // Lógica cuando se selecciona "Salir"
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
