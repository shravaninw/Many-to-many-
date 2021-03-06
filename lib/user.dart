import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manytomany/data/data_table.dart';
import 'package:manytomany/view_threads.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

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
    final db = Provider.of<MyDatabase>(context, listen: false);

    void _incrementUser() {
      String element = name[Random().nextInt(name.length)];

      final fab = User(
        status: 1,
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
  // Stream<User> _stream(Stream<User> a,Stream<Thread> b) {
  //   return a.asyncExpand((event) => b.map((events) => if));
  // }

  StreamBuilder<List<UsersCounts>> _buildUserList(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);
    // print(database.watchAllUsers().listen((event) {
    //   print(event);
    // }));
    return StreamBuilder(
      // stream: database.watchAllUsers().asyncMap((List<User> event) async {
      //   List<UsersCounts> _c = [];
      //   for (int i = 0; i < event.length; i++) {
      //     int length = (await database.getThread(event[i].id!)).length;
      //     _c.add(UsersCounts(event[i], length));
      //   }
      //   return _c;
      // }),

      // stream: database
      //     .watchAllUsers()
      //     .asyncMap((users) => Future.wait(users.map((user) {
      //           return database
      //               .getThread(user.id!)
      //               .then((value) => UsersCounts(user, value.length));
      //         }))),
      stream: database.watchAllUsers().asyncExpand((users) {
        return Rx.combineLatestList(users.map((user) {
          return database.viewThread(user.id!).map((threads) {
            return UsersCounts(user, threads.length);
          });
        }));
      }),
      //   for(int i=0;i<event.length;i++){
      //     return database.viewThread(event[i].id);
      //   }
      //      return database.viewThread(event[i].id!).map((events)  {
      //     return  UsersCounts(event[i], events.length);
      //   }
      // },
      builder: (context, AsyncSnapshot<List<UsersCounts>> snapshot) {
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
      UsersCounts itemUser, MyDatabase database, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewThreads(userId: itemUser.user.id!)));
      },
      child: ListTile(
        title: Text(itemUser.user.id.toString()),
        subtitle: Text('${itemUser.user.name}'),
        isThreeLine: true,
        trailing: Column(
          children: [
            Text(itemUser.user.status.toString()),
            Text(itemUser.count.toString())
          ],
        ),
      ),
    );
  }
}
