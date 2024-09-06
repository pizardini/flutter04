import 'package:flutter/material.dart';

class Segunda extends StatefulWidget {
  const Segunda({super.key});

  @override
  State<Segunda> createState() => _SegundaState();
}

class _SegundaState extends State<Segunda> {
  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final nascimentoController = TextEditingController();
  final senhaController = TextEditingController();
  final nomeFocusNode = FocusNode();

  String ajudaData = 'Exemplo: 01/01/1970';
  String senhaFeedback = '';
  
  void validarData(String valor) {
    final RegExp regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!regex.hasMatch(valor)) {
      setState(() {
        ajudaData = 'Formato de data inválido. Exemplo: 01/01/1970';
      });
    } else {
      setState(() {
        ajudaData = 'Formato válido!';
      });
    }
  }

  void validarSenha(String valor) {
    String feedback = '';
    
    if (valor.length >= 8) {
      feedback += '✔ Mínimo 8 caracteres\n';
    } else {
      feedback += '❌ Mínimo 8 caracteres\n';
    }

    if (RegExp(r'[A-Z]').hasMatch(valor)) {
      feedback += '✔ Contém letra maiúscula\n';
    } else {
      feedback += '❌ Contém letra maiúscula\n';
    }

    if (RegExp(r'\d').allMatches(valor).length >= 3) {
      feedback += '✔ Contém 3 números\n';
    } else {
      feedback += '❌ Contém 3 números\n';
    }

    if (RegExp(r'[!@#$%^&*()?_\-+=]').allMatches(valor).length >= 2) {
      feedback += '✔ Contém 2 caracteres especiais\n';
    } else {
      feedback += '❌ Contém 2 caracteres especiais\n';
    }

    setState(() {
      senhaFeedback = feedback;
    });
  }

  @override
  void dispose() {
    nomeFocusNode.dispose();
    nomeController.dispose();
    sobrenomeController.dispose();
    senhaController.dispose();
    nascimentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: nomeController,
              focusNode: nomeFocusNode,
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Nome',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              cursorColor: Colors.blue,
              autofocus: true,
            ),
            const SizedBox(height: 50),
            TextField(
              controller: sobrenomeController,
              decoration: const InputDecoration(
                labelText: 'Sobrenome',
                hintText: 'Sobrenome',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              cursorColor: Colors.blue,
            ),
            const SizedBox(height: 50),
            TextField(
              controller: nascimentoController,
              onChanged: validarData,
              decoration: InputDecoration(
                helperText: ajudaData,
                labelText: 'Nascimento',
                hintText: 'Nascimento',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              cursorColor: Colors.blue,
            ),
            const SizedBox(height: 50),
            TextField(
              controller: senhaController,
              obscureText: true,
              onChanged: validarSenha,
              decoration: InputDecoration(
                helperText: senhaFeedback,
                labelText: 'Senha',
                hintText: 'Senha',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              cursorColor: Colors.blue,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    nomeController.clear();
                    sobrenomeController.clear();
                    FocusScope.of(context).requestFocus(nomeFocusNode);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Limpar'),
                ),
                const SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    // Ação para o botão "Enviar"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
