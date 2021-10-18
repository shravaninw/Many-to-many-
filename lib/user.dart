import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manytomany/data/data_table.dart';
import 'package:manytomany/view_threads.dart';
import 'package:provider/provider.dart';

class UserSection extends StatelessWidget {
  UserSection({Key? key}) : super(key: key);
  late int threadId;

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      'Robert',
      'enrique',
      'Zayn',
      'Noah',
      'Megan',
      'rihanna'
    ];
    String element = name[Random().nextInt(name.length)];
    final db = Provider.of<MyDatabase>(context, listen: false);

    void _incrementUser() {
      final fab = User(
        name: element,
      );
      db.insertAllUsers(fab);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementUser();
        },
        child: Icon(Icons.add),
      ),
      body: _buildUserList(context),
    );
  }

  StreamBuilder<List<User>> _buildUserList(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);
    return StreamBuilder(
      stream: database.watchAllUsers(),
      builder: (context, AsyncSnapshot<List<User>> snapshot) {
        final todos = snapshot.data ?? [];

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, index) {
            final itemtodo = todos[index];
            return _buildListItem(itemtodo, database, context);
          },
        );
      },
    );
  }

  Widget _buildListItem(
      User itemUser, MyDatabase database, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewThreads(userId: itemUser.id!)));
      },
      child: ListTile(
        title: Text(itemUser.id.toString()),
        subtitle: Text(itemUser.name),
      ),
    );
  }
}
