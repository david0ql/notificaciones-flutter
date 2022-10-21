import 'package:flutter/material.dart';
import 'package:notificaciones/src/pages/pages.dart';
import 'package:notificaciones/src/services/pages_service.dart';
import 'package:notificaciones/src/services/socket_service.dart';
import 'package:notificaciones/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SocketService>(
          create: (_) => SocketService(),
        ),
        ChangeNotifierProvider<PagesService>(
          create: (_) => PagesService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'main',
        routes: {
          'main': (context) => const HomePage(),
        },
        theme: UserTheme.userTheme,
      ),
    );
  }
}
