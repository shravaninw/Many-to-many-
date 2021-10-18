import 'package:flutter/material.dart';
import 'package:manytomany/data/data_table.dart';
import 'package:provider/provider.dart';

class ViewUsers extends StatelessWidget {
  const ViewUsers({Key? key, required this.threadId}) : super(key: key);
  final int threadId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserThreads'),
      ),
      body: _buildUserList(context),
    );
  }

  StreamBuilder<List<User>> _buildUserList(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);
    return StreamBuilder(
      stream: database.viewUser(threadId),
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
    return ListTile(
      title: Text(itemUser.id.toString()),
      subtitle: Text(itemUser.name),
    );
  }
}
