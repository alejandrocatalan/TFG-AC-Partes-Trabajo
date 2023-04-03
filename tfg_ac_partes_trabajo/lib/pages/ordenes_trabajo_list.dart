import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/orden_trabajo_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';

class OrdenesTrabajoList extends StatefulWidget {
  const OrdenesTrabajoList({super.key});

  @override
  State<OrdenesTrabajoList> createState() => _OrdenesTrabajoListState();
}

class _OrdenesTrabajoListState extends State<OrdenesTrabajoList> {
  late Future<List<OrdenTrabajo>> _ordenesTrabajoFuture;
  final OrdenTrabajoDao _ordenTrabajoDao = OrdenTrabajoDao();

  @override
  void initState() {
    super.initState();
    _ordenesTrabajoFuture = _ordenTrabajoDao.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de órdenes de trabajo'),
      ),
      body: FutureBuilder<List<OrdenTrabajo>>(
        future: _ordenesTrabajoFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final ordenesTrabajo = snapshot.data!;
            return ListView.builder(
              itemCount: ordenesTrabajo.length,
              itemBuilder: (context, index) {
                final ordenTrabajo = ordenesTrabajo[index];
                return ListTile(
                  title: Text('Orden ${ordenTrabajo.id}'),
                  subtitle: Text(
                      'Fecha de inicio: ${ordenTrabajo.fechaInicio.toString()}'),
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
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error al cargar las órdenes de trabajo'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la orden de trabajo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${ordenTrabajo.id}'),
            Text('Fecha de inicio: ${ordenTrabajo.fechaInicio.toString()}'),
            if (ordenTrabajo.fechaFin != null)
              Text('Fecha de fin: ${ordenTrabajo.fechaFin!.toString()}'),
            if (ordenTrabajo.tipo != null) Text('Tipo: ${ordenTrabajo.tipo!}'),
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
    );
  }
}
