import "package:flutter/material.dart";
import "package:lembrol/componentes/decoracao.dart";
import "package:lembrol/comum/cores.dart";
import "package:lembrol/comum/snackbar.dart";
import "package:lembrol/servicos/autenticacao_servico.dart";

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool entrando = true;
  final _formkey = GlobalKey<FormState>();
  String? pass;

  TextEditingController _emailControler = TextEditingController();
  TextEditingController _senhaControler = TextEditingController();
  TextEditingController _nomeControler = TextEditingController();

  AutenticacaoServico _autenticacaoServico = AutenticacaoServico();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 184, 184),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [MinhasCores.amarelotop, MinhasCores.amarelodown])),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          "assets/remember.png",
                          height: 128,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(
                            30)), //???????????? pq deus odeia o vasco????
                      ),
                      const Text(
                        "Lembrol",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _emailControler,
                        decoration: getAutenticationInputDecoration("E-Mail"),
                        //validação local
                        validator: (String? value) {
                          if (value == null) {
                            return "E-mail inválido";
                          }
                          if (value.length < 6) {
                            return "endereço  de E-mail muito curto ";
                          }

                          if (!value.contains("@")) {
                            return "O E-Mail não é valido";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _senhaControler,
                        decoration: getAutenticationInputDecoration("Senha"),
                        obscureText: true,

                        //validação local
                        validator: (String? value) {
                          pass = value;
                          if (value == null) {
                            return "Senha inválida";
                          }
                          if (value.length < 6) {
                            return "Senha é muito curta ";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: !entrando,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getAutenticationInputDecoration(
                                  "Confirme a Senha"),
                              obscureText: true,
                              //validação local
                              validator: (String? value) {
                                if (value == null) {
                                  return "Senha inválida";
                                }
                                if (value.length < 6) {
                                  return "Senha é muito curta ";
                                }
                                if (pass != value) {
                                  return "Senhas não conferem";
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _nomeControler,
                              decoration: getAutenticationInputDecoration(
                                  "Digite um Nome"),
                              //validação local
                              validator: (String? value) {
                                if (value == null) {
                                  return "Nome inválido";
                                }
                                if (value.length < 2) {
                                  return "Nome muito curto ";
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          botaoprincipal();
                        },
                        child: Text((entrando) ? "Entrar" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            entrando = !entrando;
                          });
                        },
                        child: Text((entrando)
                            ? "Criar Conta"
                            : "Já tem uma conta? Logar"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  botaoprincipal() {
    String nome = _nomeControler.text;
    String senha = _senhaControler.text;
    String email = _emailControler.text;
    if (_formkey.currentState!.validate()) {
      if (entrando) {
        print("entrei");
        _autenticacaoServico
            .logarUsuarios(email: email, senha: senha)
            .then((String? erro) {
          if (erro != null) {
            mostrarSnackbar(context: context, texto: erro);
          }
        });
      } else {
        print("castrado validado");

        _autenticacaoServico
            .cadastrarUsuario(email: email, senha: senha, nome: nome)
            .then(
          (String? erro) {
            if (erro != null) {
              mostrarSnackbar(context: context, texto: erro);
            } else {
              mostrarSnackbar(
                  context: context,
                  texto: "Cadastro Confirmado!",
                  isErro: false);
            }
          },
        );
      }
    } else {
      print("nao valido");
    }
  }
}
