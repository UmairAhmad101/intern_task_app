import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intern_app/expotter.dart';
import 'package:http/http.dart' as http;

// Our Data container //
class Clients with ChangeNotifier {
  List<Client> clients = [];

  Future<void> fetchAndSetData() async {
    try {
      var url = Uri.parse(
          'http://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6');

      var response = await http.get(url);

      List<dynamic> jsonData = jsonDecode(response.body)['clients'];

      final List<Client> loadedClients = [];

      jsonData.forEach((data) {
        Client client = new Client();
        client = Client.fromJson(data);
        loadedClients.add(client);
      });

      clients = loadedClients;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
