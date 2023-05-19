import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tfg_ac_partes_trabajo/blocs/listado_partes_bloc/listado_partes_bloc.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/custom_scaffold.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/disabled_widget_wrapper.dart';
import 'package:tfg_ac_partes_trabajo/generic_components/search_textfield.dart';
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

    final ListadoPartesBloc bloc = BlocProvider.of<ListadoPartesBloc>(context);
    bloc.add(ListadoPartesEvent.onLoadPartesDeOrden(
        ordenTrabajoId: ordenTrabajo.id!));

    return PartesTrabajoView(
      ordenTrabajo: ordenTrabajo,
    );
  }
}

class PartesTrabajoView extends StatefulWidget {
  const PartesTrabajoView({Key? key, required this.ordenTrabajo})
      : super(key: key);

  final OrdenTrabajo ordenTrabajo;

  @override
  State<PartesTrabajoView> createState() => _PartesTrabajoViewState();
}

class _PartesTrabajoViewState extends State<PartesTrabajoView> {
  /// Variables
  // DAOs

  // Controllers
  final TextEditingController _searchController = TextEditingController();

  /// Functions
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.translate("work_parts_list"),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColorStyles.redColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CrearParteTrabajoPage(ordenTrabajo: widget.ordenTrabajo),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: BlocConsumer<ListadoPartesBloc, ListadoPartesState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.listPartesTrabajo != current.listPartesTrabajo,
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
                            context.read<ListadoPartesBloc>().add(
                                ListadoPartesEvent.onSearch(
                                    ordenTrabajoId: widget.ordenTrabajo.id!,
                                    search: value));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: ListView.builder(
                      itemCount: state.listPartesTrabajo.length,
                      itemBuilder: (context, index) {
                        final parteTrabajo = state.listPartesTrabajo[index];
                        return DisabledWidgetWrapper(
                          disabled: parteTrabajo.fechaFin != null &&
                              parteTrabajo.fechaFin.toString().isNotEmpty,
                          child: ParteTrabajoCard(
                            parteTrabajo: parteTrabajo,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetallesParteTrabajoPage(
                                          parteTrabajo: parteTrabajo),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
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
