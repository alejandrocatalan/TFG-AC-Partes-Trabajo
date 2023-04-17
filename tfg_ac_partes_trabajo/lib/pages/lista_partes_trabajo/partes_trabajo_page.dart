import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_partes_bloc/listado_partes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';
import 'package:tfg_ac_partes_trabajo/pages/crear_parte_trabajo/crear_parte_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_partes_trabajo/detalle_parte_trabajo_page.dart';
import 'package:tfg_ac_partes_trabajo/pages/lista_partes_trabajo/widgets/parte_trabajo_card.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

class PartesTrabajoPage extends StatelessWidget {
  static const routeName = '/partes-trabajo';

  const PartesTrabajoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrdenTrabajo ordenTrabajo =
        ModalRoute.of(context)!.settings.arguments as OrdenTrabajo;
    return BlocProvider(
      create: (BuildContext context) => ListadoPartesBloc()
        ..add(ListadoPartesEvent.onLoadPartesDeOrden(
            ordenTrabajoId: ordenTrabajo.id!)),
      lazy: false,
      child: const PartesTrabajoView(),
    );
  }
}

class PartesTrabajoView extends StatefulWidget {
  const PartesTrabajoView({Key? key}) : super(key: key);

  @override
  State<PartesTrabajoView> createState() => _PartesTrabajoViewState();
}

class _PartesTrabajoViewState extends State<PartesTrabajoView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.translate("work_parts_list"),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColorStyles.redColor,
        onPressed: () {
          Navigator.pushNamed(context, CrearParteTrabajoPage.routeName);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: BlocConsumer<ListadoPartesBloc, ListadoPartesState>(
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
            itemCount: state.listPartesTrabajo.length,
            itemBuilder: (context, index) {
              final parteTrabajo = state.listPartesTrabajo[index];
              return ParteTrabajoCard(
                parteTrabajo: parteTrabajo,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetallesParteTrabajo(parteTrabajo: parteTrabajo),
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
