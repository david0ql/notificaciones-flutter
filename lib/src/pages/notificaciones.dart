import 'package:flutter/material.dart';
import 'package:notificaciones/src/models/notificaciones.dart';
import 'package:notificaciones/src/services/socket_service.dart';
import 'package:notificaciones/src/widgets/custom_bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:quick_notify/quick_notify.dart';
import 'package:socket_io_client/socket_io_client.dart';

class Notificaciones extends StatefulWidget {
  const Notificaciones({super.key});

  @override
  State<Notificaciones> createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on(
        'enviar-notificaciones',
        (data) async => {
              (data as Map<dynamic, dynamic>),
              for (var element in data["notificaciones"])
                {
                  SocketService.notificaciones.add(Sedes.fromMap(element)),
                  await QuickNotify.notify(
                    title: "Sede : ${Sedes.fromMap(element).sede}",
                    content: "Room : ${Sedes.fromMap(element).room}",
                  ),
                  if (mounted) {setState(() {})}
                },
            });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Notificaciones",
          style: TextStyle(color: Colors.black),
        )),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: SingleChildScrollView(
                    child: ListBody(children: const [
                      Text('Estado del servidor. '),
                      Text("Azul =>😁 Rojo=>😯")
                    ]),
                  ),
                  actions: [
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: const Text('Cerrar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              );
            },
            child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: (socketService.serverStatus == ServerStatus.online)
                    ? Icon(Icons.check_circle, color: Colors.blue[300])
                    : const Icon(Icons.offline_bolt, color: Colors.red)),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: SocketService.notificaciones.length,
        itemBuilder: (BuildContext context, int index) {
          return customListTile(index);
        },
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }

  Widget customListTile(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("1900 Web"),
            Text("Sede y Room: ${SocketService.notificaciones[index].sede}"),
          ]),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
