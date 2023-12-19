import 'package:flutter/material.dart';
import 'package:lembrol/modelos/lembranca_modelo.dart';
import 'package:lembrol/modelos/lembrol_modelo.dart';
import 'package:lembrol/comum/cores.dart';

class lembrol_tela extends StatelessWidget {
  lembrol_tela({super.key});

  final LembrolModelo lembrolmodelo = LembrolModelo(
      //é o obejto a ser lembrado
      id: "atividade 1",
      nome: "nome",
      atividade: "atividade",
      contexto: "contexto");

  final List<LembrancaModelo> listalembranca = [
    //lista de lembranças do objeto
    LembrancaModelo(
        id: "se01", lembranca: "lembranca primeira", data: "23-10-19"),
    LembrancaModelo(
        id: "se02", lembranca: "lembranca  segunda", data: "23-10-20"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.amaderado,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              lembrolmodelo.nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(lembrolmodelo.atividade),
          ],
        ),
        centerTitle: true,
        backgroundColor: MinhasCores.amarelotop,
        toolbarHeight: 75,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 241, 241),
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          //ex coluna mae
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, //espaçamento  ente os icones
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Enviar foto"),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Deletar Foto"))
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Qual o contexto?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(lembrolmodelo.contexto),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const Text(
              "Qual a notação?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              //coluna interna
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listalembranca.length, (index) {
                //lista de wight de texto
                LembrancaModelo lembrancaagora = listalembranca[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(lembrancaagora.lembranca),
                  subtitle: Text(lembrancaagora.data),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      print("deletar ${lembrancaagora.lembranca}");
                    },
                  ),
                ); //lista de titulo -> lista de textos
              }),
            )
          ],
        ),
      ),
    );
  }
}
