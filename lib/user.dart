import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manytomany/data/data_table.dart';
import 'package:provider/provider.dart';

class UserSection extends StatelessWidget {
  UserSection({Key? key}) : super(key: key);
  late int threadId;
  late int userId;

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

    void _incrementUser() {
      final db = Provider.of<MyDatabase>(context, listen: false);

      final fab = User(
        name: element,
      );
      db.insertAlltUsers(fab);
      final ut = UserThread(userId: userId, threadId: threadId);
      db.insertUserThread(ut);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return _buildThreadList(context);
              });
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
            return _buildListItem(itemtodo, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(User itemUser, MyDatabase database) {
    userId = itemUser.id!;
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Text(itemUser.id.toString()),
        subtitle: Text(itemUser.name),
      ),
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
            return _buildThreadItem(itemtodo, database);
          },
        );
      },
    );
  }

  Widget _buildThreadItem(Thread itemUser, MyDatabase database) {
    return InkWell(
      onTap: () {
        threadId = itemUser.id!;
      },
      child: ListTile(
        title: Text(itemUser.id.toString()),
        subtitle: Text(itemUser.chatName),
      ),
    );
  }
}
