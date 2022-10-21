import 'package:flutter/material.dart';
import 'package:notificaciones/src/pages/asistencia.dart';
import 'package:notificaciones/src/pages/notificaciones.dart';
import 'package:notificaciones/src/services/pages_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pagesProvider = Provider.of<PagesService>(context);
    switch (pagesProvider.selectedIndex) {
      case 0:
        return const Notificaciones();
      case 1:
        return const Asistencia();
      default:
        return const Notificaciones();
    }
  }
}
