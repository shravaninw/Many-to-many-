import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'data_table.g.dart';

class Users extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get name => text()();
}

class Threads extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get chatName => text()();
}

class UserThreads extends Table {
  IntColumn get userId => integer()();

  IntColumn get threadId => integer()();
}

class UserwithThreads {
  UserwithThreads(this.user, this.thread);

  final User user;
  final Thread thread;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users, Threads, UserThreads])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<User>> watchAllUsers() => select(users).watch();

  Future insertAllUsers(User user) => into(users).insert(user);

  Stream<List<Thread>> watchAllThreads() => select(threads).watch();

  Future insertAllThreads(Thread thread) => into(threads).insert(thread);

  Future insertUserThread(UserThread userThread) =>
      into(userThreads).insert(userThread);

  Stream<List<Thread>> viewThread(int userId) {
    return ((select(threads).join([
      leftOuterJoin(userThreads, userThreads.threadId.equalsExp(threads.id))
    ]))
          ..where(userThreads.userId.equals(userId)))
        .watch()
        .map((event) => event.map((e) => e.readTable(threads)).toList());
  }

  Stream<List<User>> viewUser(int threadId) {
    return ((select(users).join(
            [innerJoin(userThreads, userThreads.userId.equalsExp(users.id))]))
          ..where(userThreads.threadId.equals(threadId)))
        .watch()
        .map((event) => event.map((e) => e.readTable(users)).toList());
  }
}