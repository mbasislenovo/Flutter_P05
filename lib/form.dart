import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DummyBox extends StatefulWidget {
  final List<String> nameList;
  final ValueChanged<List<String>> onNameListChanged;

  const DummyBox({
    super.key, 
    required this.nameList, 
    required this.onNameListChanged});

  @override
  State<DummyBox> createState() => _DummyBoxState();
}

class _DummyBoxState extends State<DummyBox> {
  TextEditingController nameController = TextEditingController();
  
  get nameList => null;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      TextFormField(
                        controller: nameController,
                         decoration: const InputDecoration(
                          labelText: 'Nama Mahasiswa'),
                          onChanged: (value){
                                     setState(() {});
                                     },
                           validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Nama tidak boleh kosong';
                            }
                            return null;
                           },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () async {
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            final updatedList = [...widget.nameList, nameController.text];
                            await prefs.setStringList('name', updatedList);
                            widget.onNameListChanged(updatedList);
                            // ignore: avoid_print
                            print('Name saved: ${prefs.getStringList('name')}');
                            nameController.clear(); 
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          },
                          child: const Text('Save Name')),
                      const SizedBox(height: 20),
                      
                    ],
                  ),
                  
                ),
              ],
            ),
        ),
      ),
    );
    }
  }