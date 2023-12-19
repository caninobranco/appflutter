import "package:flutter/material.dart";
import "package:lembrol/servicos/autenticacao_servico.dart";

class telaInicial extends StatelessWidget {
  const telaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Deslogar"),
              onTap: () {
                AutenticacaoServico().deslogar();
              },
            )
          ],
        ),
      ),
    );
  }
}
