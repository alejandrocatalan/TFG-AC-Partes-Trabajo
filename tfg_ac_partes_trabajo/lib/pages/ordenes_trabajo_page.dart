import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_ordenes_bloc/listado_ordenes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/button_widget.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/parte_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/partes_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
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
    _ordenTrabajoDao.create(OrdenTrabajo(
        fechaInicio: DateTime.now(), codigoOrdenCliente: "Prueba"));
    _parteTrabajoDao.create(ParteTrabajo(
        ordenTrabajoId: 87,
        fechaInicio: DateTime.now(),
        fechaFin: DateTime.now(),
        observaciones: "observaciones",
        trabajoARealizar: "trabajoARealizar",
        identificadorDispositivo: "identificadorDispositivo"));
    _ordenTrabajoDao.delete(34);
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
          return ListView.builder(
            itemCount: state.listOrdenesTrabajo.length,
            itemBuilder: (context, index) {
              final ordenTrabajo = state.listOrdenesTrabajo[index];
              return ListTile(
                title: Text('Orden ${ordenTrabajo.id}'),
                subtitle: Text(
                    'Fecha de inicio: ${ordenTrabajo.fechaInicio.toString()}'),
                tileColor: MyColorStyles.whiteColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetallesOrdenTrabajo(ordenTrabajo: ordenTrabajo),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class DetallesOrdenTrabajo extends StatelessWidget {
  final OrdenTrabajo ordenTrabajo;

  const DetallesOrdenTrabajo({Key? key, required this.ordenTrabajo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.translate("work_order_detail"),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.maxFinite,
            color: MyColorStyles.whiteColor,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/inycom_icon.svg"),
                Text('ID: ${ordenTrabajo.id}'),
                Text('Fecha de inicio: ${ordenTrabajo.fechaInicio.toString()}'),
                if (ordenTrabajo.fechaFin != null)
                  Text('Fecha de fin: ${ordenTrabajo.fechaFin!.toString()}'),
                if (ordenTrabajo.tipo != null)
                  Text('Tipo: ${ordenTrabajo.tipo!}'),
                if (ordenTrabajo.observaciones != null)
                  Text('Observaciones: ${ordenTrabajo.observaciones!}'),
                if (ordenTrabajo.trabajoARealizar != null)
                  Text('Trabajo a realizar: ${ordenTrabajo.trabajoARealizar!}'),
                Text(
                    'Código de orden del cliente: ${ordenTrabajo.codigoOrdenCliente}'),
                if (ordenTrabajo.instalacion != null)
                  Text('Instalación: ${ordenTrabajo.instalacion!}'),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: Platform.isIOS ? 30 : 15, left: 24, right: 24),
                child: ButtonWidget(
                    textButton: 'Ver partes de trabajo',
                    disabled: false,
                    context: context,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PartesTrabajoPage.routeName,
                        arguments:
                            ordenTrabajo, // Si necesitas pasar argumentos a la página
                      );
                    }),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
