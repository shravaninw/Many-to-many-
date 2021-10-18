import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/data_table.dart';

class ViewThreads extends StatelessWidget {
  ViewThreads({Key? key, required this.userId}) : super(key: key);
  final int userId;
  late int threadId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Threads for user'),
      ),
      body: _buildThreadList(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return _buildThread(context);
              });
        },
      ),
    );
  }

  StreamBuilder<List<Thread>> _buildThreadList(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);
    return StreamBuilder(
      stream: database.viewThread(userId),
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
    return ListTile(
      title: Text(itemUser.id.toString()),
      subtitle: Text(itemUser.chatName),
    );
  }

  StreamBuilder<List<Thread>> _buildThread(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);
    return StreamBuilder(
      stream: database.watchAllThreads(),
      builder: (context, AsyncSnapshot<List<Thread>> snapshot) {
        final todos = snapshot.data ?? [];

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, index) {
            final itemtodo = todos[index];
            return _buildThreadItem(itemtodo, database, context);
          },
        );
      },
    );
  }

  Widget _buildThreadItem(
      Thread itemUser, MyDatabase database, BuildContext context) {
    return InkWell(
      onTap: () {
        final db = Provider.of<MyDatabase>(context, listen: false);
        threadId = itemUser.id!;
        final ut = UserThread(userId: userId, threadId: threadId);
        db.insertUserThread(ut);
        Navigator.pop(context);
      },
      child: ListTile(
        title: Text(itemUser.id.toString()),
        subtitle: Text(itemUser.chatName),
      ),
    );
  }
}
