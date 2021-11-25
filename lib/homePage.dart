import 'package:flutter/material.dart';
import 'package:intern_app/expotter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Clients>(
      context,
    ).fetchAndSetData();
    final clientData = Provider.of<Clients>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('InternApp'),
      ),
      body: ListView.builder(
          itemCount: clientData.clients.length,
          itemBuilder: (ctx, i) {
            return ListTile(
              title: Text(clientData.clients[i].name),
              subtitle: Text(clientData.clients[i].company),
              trailing: Text(clientData.clients[i].id),
            );
          }),
    );
  }
}
