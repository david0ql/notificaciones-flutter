import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notificaciones/src/widgets/custom_bottom_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Asistencia extends StatefulWidget {
  const Asistencia({Key? key}) : super(key: key);

  @override
  State<Asistencia> createState() => _AsistenciaState();
}

class _AsistenciaState extends State<Asistencia> {
  DateTime myval = DateTime.now();
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      myval = DateTime.now();
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("QR Code", style: TextStyle(color: Colors.black))),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(50),
          child: QrImage(
            data: ("$myval"),
            version: QrVersions.auto,
            embeddedImage: const AssetImage("assets/logo_windows.png"),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
