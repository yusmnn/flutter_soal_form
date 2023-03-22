import 'package:flutter/material.dart';

class Contoh extends StatefulWidget {
  const Contoh({super.key});

  @override
  State<Contoh> createState() => _ContohState();
}

class _ContohState extends State<Contoh> {
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();

  final List<ListItem> _listItems = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Builder Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List View Builder Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      onChanged: (value) {
                        _titleController.text = value;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Subtitle',
                      ),
                      onChanged: (value) {
                        _subtitleController.text = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _listItems.add(
                            ListItem(
                              title: _titleController.text,
                              subtitle: _subtitleController.text,
                            ),
                          );
                        });
                      },
                      child: const Text('Add Item'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: _listItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_listItems[index].title),
                      subtitle: Text(_listItems[index].subtitle),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem {
  final String title;
  final String subtitle;

  ListItem({required this.title, required this.subtitle});
}
