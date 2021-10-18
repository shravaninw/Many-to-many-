import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/data_table.dart';

class ThreadSection extends StatelessWidget {
  const ThreadSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _incrementThread() {
      List<String> name = [
        'Robert',
        'enrique',
        'Zayn',
        'Noah',
        'Megan',
        'rihanna',
        'shakira',
      ];
      String element = name[Random().nextInt(name.length)];

      final db = Provider.of<MyDatabase>(context, listen: false);

      final fab = Thread(
        chatName: element,
      );
      db.insertAllThreads(fab);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Threads'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementThread();
        },
        child: Icon(Icons.add),
      ),
      body: _buildThreadList(context),
    );
  }

  StreamBuilder<List<Thread>> _buildThreadList(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);
    return StreamBuilder(
      stream: database.watchAllThreads(),
      builder: (context, AsyncSnapshot<List<Thread>> snapshot) {
        final todos = snapshot.data ?? [];

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, index) {
            final itemtodo = todos[index];
            return _buildListItem(itemtodo, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(Thread itemUser, MyDatabase database) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Text(itemUser.id.toString()),
        subtitle: Text(itemUser.chatName),
      ),
    );
  }
}
