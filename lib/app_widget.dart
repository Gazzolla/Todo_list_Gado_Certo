import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gado_certo_todo_list/modules/Home/home_page.dart';
import 'package:gado_certo_todo_list/shared/config/globals.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (context) => const HomePage(),
      },
      builder: (context, child) => Stack(
        children: [
          child!,
          Observer(
            builder: (_) {
              if (!loadingBarService.showLoading) return Container();
              return const LinearProgressIndicator();
            },
          )
        ],
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      home: const HomePage(),
    );
  }
}
