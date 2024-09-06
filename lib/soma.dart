import 'package:flutter/material.dart';
import 'subtracao.dart';

class SomaScreen extends StatefulWidget {
  const SomaScreen({super.key});

  @override
  _SomaScreenState createState() => _SomaScreenState();
}

class _SomaScreenState extends State<SomaScreen> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  int resultado = 0;

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }

  void calcularSoma() {
    int num1 = int.tryParse(num1Controller.text) ?? 0;
    int num2 = int.tryParse(num2Controller.text) ?? 0;
    setState(() {
      resultado = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Soma')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Subtração'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubtracaoScreen(resultado: resultado),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 1',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 2',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularSoma,
              child: const Text('Calcular Soma'),
            ),
            const SizedBox(height: 20),
            Text('Resultado: $resultado'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubtracaoScreen(resultado: resultado),
                  ),
                );
              },
              child: const Text('Ir para Subtração'),
            ),
          ],
        ),
      ),
    );
  }
}
