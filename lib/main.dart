import 'package:flutter/material.dart';
import 'package:flutter_p05/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> nameList = ['Budi', 'Siti'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa Terdaftar'),
      ),
  body: Column(
    children: [
      ElevatedButton(
        onPressed: () async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DummyBox(
            nameList: nameList,
            onNameListChanged: (newList) {
              setState(() {
                nameList = newList;
              });
            },
          ),
        ),
      );
      },
        child: const Text('Tambah Mahasiswa'),
      ),
      
      Expanded(
        child: ListView.builder(
          itemCount: nameList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${index + 1}. ${nameList[index]}'),
            );
          },
        ),
      ),
      
      
    ],
  ),
    );
  }
}

