import 'package:flutter/material.dart';

main () => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus destinos',
      routes: {
        '/': (context) => Login(),
        '/lista': (context) => Lista(),
        '/cadastro': (context) => Cadastro(),
      },
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.wallet_travel, size: 72, color: Colors.blue),
        Text(
          'Meus destinos',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            label: Text("E-mail"),
          ),
        ),
        TextField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            label: Text("Senha"),
          ),
        ),
        TextButton(child: Text('ENTRAR'), onPressed: () => Navigator.pushReplacementNamed(context, '/lista')),
      ],
    ));
  }
}

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locais'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          )
        ],
      ),  
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          const Locais = ['Barcelona', 'Paris', 'Londres', 'Sidney', 'Roma'];
          return ListTile(
            title: Text(" ${Locais[index]}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/cadastro'),
      ),
    );
  }
}

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo local'),
        actions: [
          TextButton(
            child: const Text(
              'SALVAR',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: Column(
        children: const [
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              label: Text("Local"),
            ),
          ),
        ],
      ),
    );
  }
}
