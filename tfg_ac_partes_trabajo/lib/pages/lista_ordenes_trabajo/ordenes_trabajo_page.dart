import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_ordenes_bloc/listado_ordenes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/search_textfield.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_ordenes_trabajo/detalle_orden_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_ordenes_trabajo/widgets/orden_trabajo_card.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class OrdenesTrabajoPage extends StatelessWidget {
  const OrdenesTrabajoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ListadoOrdenesBloc()
        ..add(
          const ListadoOrdenesEvent.onLoadOrdenes(),
        ),
      lazy: false,
      child: const OrdenesTrabajoView(),
    );
  }
}

class OrdenesTrabajoView extends StatefulWidget {
  const OrdenesTrabajoView({super.key});

  @override
  State<OrdenesTrabajoView> createState() => _OrdenesTrabajoViewState();
}

class _OrdenesTrabajoViewState extends State<OrdenesTrabajoView> {
  final OrdenTrabajoDao _ordenTrabajoDao = OrdenTrabajoDao.instance;
  final ParteTrabajoDao _parteTrabajoDao = ParteTrabajoDao.instance;

  @override
  void initState() {
    super.initState();
    // _ordenTrabajoDao.create(OrdenTrabajo(
    //     fechaInicio: DateTime.now(), codigoOrdenCliente: "Prueba"));
    // _parteTrabajoDao.create(ParteTrabajo(
    //     ordenTrabajoId: 87,
    //     fechaInicio: DateTime.now(),
    //     fechaFin: DateTime.now(),
    //     observaciones: "observaciones",
    //     trabajoARealizar: "trabajoARealizar",
    //     identificadorDispositivo: "identificadorDispositivo"));
    // _ordenTrabajoDao.delete(34);
    //_ordenTrabajoDao.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.translate("work_orders_list"),
      body: BlocConsumer<ListadoOrdenesBloc, ListadoOrdenesState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        listener: (context, state) {
          if (state.isLoading == true) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            clipBehavior: Clip.hardEdge,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SearchTextField(
                        controller: TextEditingController(),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.95,
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
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
                              builder: (context) => DetallesOrdenTrabajo(
                                  ordenTrabajo: ordenTrabajo),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
