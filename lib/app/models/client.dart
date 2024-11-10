import 'dart:convert';

class Client {
  String host;
  int port;

  Client({required this.host, required this.port});

  static String storagePrefix = "client:";
  late String storageKey = "$storagePrefix$host";

  factory Client.fromJson(Map<String, dynamic> json) =>
      Client(host: json["host"], port: json["port"]);

  Map<String, dynamic> toJson() => {"host": host, "port": port};

  factory Client.fromJsonString(String jsonString) =>
      Client.fromJson(json.decode(jsonString));

  String toJsonString() => json.encode(toJson());

  @override
  String toString() => "$host:$port";
}
