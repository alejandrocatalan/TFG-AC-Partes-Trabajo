import 'package:flutter/material.dart';
import 'package:tfg_ac_partes_trabajo/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/pages/ordenes_trabajo_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  await MyDatabase.instance.database;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: OrdenesTrabajoList());
  }
}
