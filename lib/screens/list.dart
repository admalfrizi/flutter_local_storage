import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_storage_tutorial/screens/create.dart';

import '../models/person.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final storage = const FlutterSecureStorage();

  final List<Person> _listPerson = [];

  @override
  void initState() {
    super.initState();
    _getDataStorage();
  }

  _getDataStorage() async {
    String? data = await storage.read(key: 'list_person');
    print("data anda : $data");
    if(data != null){
      final dataDecoded = jsonDecode(data);
      if(dataDecoded is List){
        setState(() {
          _listPerson.clear();
          for(var item in dataDecoded){
            _listPerson.add(Person.fromJson(item));
          }
        });
      }
    }
  }

  _saveDataToStorage() async {
    final List<Object> tmp = [];
    for(var item in _listPerson){
      tmp.add(item.toJson());
    }

    await storage.write(
        key: 'list_person',
        value: jsonEncode(tmp)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final result = await Navigator.push(context, MaterialPageRoute(builder: (c) => const CreateScreen()));
                if(result is Person){
                  setState(() {
                    _listPerson.add(result);
                  });
                  _saveDataToStorage();
                }
              },
              icon: const Icon(
                Icons.add
              )
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            final item = _listPerson[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${item.name} (${item.nim})"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        "${item.jurusan} / ${item.kelas}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                      ),
                    ),
                  ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: _listPerson.length
      )
    );
  }
}
