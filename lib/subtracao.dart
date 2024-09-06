import 'package:flutter/material.dart';
import 'soma.dart';

class SubtracaoScreen extends StatefulWidget {
  final int resultado;

  const SubtracaoScreen({super.key, required this.resultado});

  @override
  _SubtracaoScreenState createState() => _SubtracaoScreenState();
}

class _SubtracaoScreenState extends State<SubtracaoScreen> {
  var num1Controller = TextEditingController();
  var num2Controller = TextEditingController();
  int resultado = 0;

  @override
  void initState() {
    super.initState();
    num1Controller.text = widget.resultado.toString(); 
  }

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }

  void calcularSubtracao() {
    int num1 = int.tryParse(num1Controller.text) ?? 0;
    int num2 = int.tryParse(num2Controller.text) ?? 0;
    setState(() {
      resultado = num1 - num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subtração')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Soma'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SomaScreen(),
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
              onPressed: calcularSubtracao,
              child: const Text('Calcular Subtração'),
            ),
            const SizedBox(height: 20),
            Text('Resultado: $resultado'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SomaScreen(),
                  ),
                );
              },
              child: const Text('Ir para Soma'),
            ),
          ],
        ),
      ),
    );
  }
}
