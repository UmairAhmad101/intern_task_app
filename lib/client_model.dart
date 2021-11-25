// This is our Client Modle //

class Client {
  final String id;
  final String name;
  final String company;

  Client({this.company, this.id, this.name});

  factory Client.fromJson(Map<String, dynamic> jsonData) {
    return Client(
        id: jsonData['id'],
        name: jsonData['name'],
        company: jsonData['company']);
  }
}
