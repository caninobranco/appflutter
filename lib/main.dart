import 'package:flutter/material.dart';
import 'package:lembrol/telas/autenticacao_tela.dart';
import 'package:lembrol/telas/lembrol_tela.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lembrol/telas/tela_inicial.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: roteadorTela(),
    );
  }
}

class roteadorTela extends StatelessWidget {
  const roteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return telaInicial();
        } else {
          return AutenticacaoTela();
        }
      },
    );
  }
}
