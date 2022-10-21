import 'package:flutter/material.dart';
import 'package:notificaciones/src/services/pages_service.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pagesProvider = Provider.of<PagesService>(context);
    return BottomNavigationBar(
        currentIndex: pagesProvider.selectedIndex,
        onTap: (value) {
          pagesProvider.selectedIndex = value;
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant_photo), label: 'Asistencia'),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner), label: 'QR'),
        ]);
  }
}
