import 'package:flutter/material.dart';
import 'package:lan_mouse_mobile/app/models/client.dart';
import 'package:lan_mouse_mobile/app/modules/home/widgets/add_client.dart';
import 'package:lan_mouse_mobile/app/modules/server/server.dart';
import 'package:lan_mouse_mobile/app/services/lan_mouse_server.dart';
import 'package:lan_mouse_mobile/app/services/storage_service.dart';

class HomeConnections extends StatefulWidget {
  const HomeConnections({super.key});

  @override
  State<HomeConnections> createState() => _HomeConnectionsState();
}

class _HomeConnectionsState extends State<HomeConnections> {
  List<Client> clients = [];
  LanMouseServer lanMouseServer = LanMouseServer.instance;
  StorageService storageService = StorageService.instance;

  @override
  void initState() {
    clients = storageService.getClients();
    super.initState();
  }

  void connectClient(Client client) async {
    lanMouseServer.startServer(ignoreIfAlreadyRunning: true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Server(client: client),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Connections",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AddClient(onAdd: (client) {
                      storageService.addClient(client);
                      setState(() {
                        clients.add(client);
                      });
                    });
                  },
                );
              },
              child: Row(
                children: [
                  const Icon(Icons.add),
                  Text(
                    'Add',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Card(
          margin: EdgeInsets.zero,
          child: clients.isEmpty
              ? const Center(
                  child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("No Clients"),
                ))
              : ListView.separated(
                  itemCount: clients.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    Client client = clients[index];
                    return InkWell(
                      onTap: () => connectClient(client),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(client.host),
                                Text(
                                  "Port: ${client.port}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              storageService.deleteClient(client);
                              setState(() {
                                clients.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
        )
      ],
    );
  }
}
