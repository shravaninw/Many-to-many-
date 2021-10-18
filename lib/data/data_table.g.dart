// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int? id;
  final String name;
  User({this.id, required this.name});
  factory User.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['name'] = Variable<String>(name);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  User copyWith({int? id, String? name}) => User(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User && other.id == this.id && other.name == this.name);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int?> id;
  final Value<String> name;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<User> custom({
    Expression<int?>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  UsersCompanion copyWith({Value<int?>? id, Value<String>? name}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Thread extends DataClass implements Insertable<Thread> {
  final int? id;
  final String chatName;
  Thread({this.id, required this.chatName});
  factory Thread.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Thread(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      chatName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['chat_name'] = Variable<String>(chatName);
    return map;
  }

  ThreadsCompanion toCompanion(bool nullToAbsent) {
    return ThreadsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      chatName: Value(chatName),
    );
  }

  factory Thread.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Thread(
      id: serializer.fromJson<int?>(json['id']),
      chatName: serializer.fromJson<String>(json['chatName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'chatName': serializer.toJson<String>(chatName),
    };
  }

  Thread copyWith({int? id, String? chatName}) => Thread(
        id: id ?? this.id,
        chatName: chatName ?? this.chatName,
      );
  @override
  String toString() {
    return (StringBuffer('Thread(')
          ..write('id: $id, ')
          ..write('chatName: $chatName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chatName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Thread &&
          other.id == this.id &&
          other.chatName == this.chatName);
}

class ThreadsCompanion extends UpdateCompanion<Thread> {
  final Value<int?> id;
  final Value<String> chatName;
  const ThreadsCompanion({
    this.id = const Value.absent(),
    this.chatName = const Value.absent(),
  });
  ThreadsCompanion.insert({
    this.id = const Value.absent(),
    required String chatName,
  }) : chatName = Value(chatName);
  static Insertable<Thread> custom({
    Expression<int?>? id,
    Expression<String>? chatName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatName != null) 'chat_name': chatName,
    });
  }

  ThreadsCompanion copyWith({Value<int?>? id, Value<String>? chatName}) {
    return ThreadsCompanion(
      id: id ?? this.id,
      chatName: chatName ?? this.chatName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (chatName.present) {
      map['chat_name'] = Variable<String>(chatName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThreadsCompanion(')
          ..write('id: $id, ')
          ..write('chatName: $chatName')
          ..write(')'))
        .toString();
  }
}

class $ThreadsTable extends Threads with TableInfo<$ThreadsTable, Thread> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ThreadsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _chatNameMeta = const VerificationMeta('chatName');
  late final GeneratedColumn<String?> chatName = GeneratedColumn<String?>(
      'chat_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, chatName];
  @override
  String get aliasedName => _alias ?? 'threads';
  @override
  String get actualTableName => 'threads';
  @override
  VerificationContext validateIntegrity(Insertable<Thread> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chat_name')) {
      context.handle(_chatNameMeta,
          chatName.isAcceptableOrUnknown(data['chat_name']!, _chatNameMeta));
    } else if (isInserting) {
      context.missing(_chatNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Thread map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Thread.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ThreadsTable createAlias(String alias) {
    return $ThreadsTable(_db, alias);
  }
}

class UserThread extends DataClass implements Insertable<UserThread> {
  final int userId;
  final int threadId;
  UserThread({required this.userId, required this.threadId});
  factory UserThread.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserThread(
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      threadId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thread_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['thread_id'] = Variable<int>(threadId);
    return map;
  }

  UserThreadsCompanion toCompanion(bool nullToAbsent) {
    return UserThreadsCompanion(
      userId: Value(userId),
      threadId: Value(threadId),
    );
  }

  factory UserThread.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserThread(
      userId: serializer.fromJson<int>(json['userId']),
      threadId: serializer.fromJson<int>(json['threadId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'threadId': serializer.toJson<int>(threadId),
    };
  }

  UserThread copyWith({int? userId, int? threadId}) => UserThread(
        userId: userId ?? this.userId,
        threadId: threadId ?? this.threadId,
      );
  @override
  String toString() {
    return (StringBuffer('UserThread(')
          ..write('userId: $userId, ')
          ..write('threadId: $threadId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, threadId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserThread &&
          other.userId == this.userId &&
          other.threadId == this.threadId);
}

class UserThreadsCompanion extends UpdateCompanion<UserThread> {
  final Value<int> userId;
  final Value<int> threadId;
  const UserThreadsCompanion({
    this.userId = const Value.absent(),
    this.threadId = const Value.absent(),
  });
  UserThreadsCompanion.insert({
    required int userId,
    required int threadId,
  })  : userId = Value(userId),
        threadId = Value(threadId);
  static Insertable<UserThread> custom({
    Expression<int>? userId,
    Expression<int>? threadId,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (threadId != null) 'thread_id': threadId,
    });
  }

  UserThreadsCompanion copyWith({Value<int>? userId, Value<int>? threadId}) {
    return UserThreadsCompanion(
      userId: userId ?? this.userId,
      threadId: threadId ?? this.threadId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (threadId.present) {
      map['thread_id'] = Variable<int>(threadId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserThreadsCompanion(')
          ..write('userId: $userId, ')
          ..write('threadId: $threadId')
          ..write(')'))
        .toString();
  }
}

class $UserThreadsTable extends UserThreads
    with TableInfo<$UserThreadsTable, UserThread> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UserThreadsTable(this._db, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _threadIdMeta = const VerificationMeta('threadId');
  late final GeneratedColumn<int?> threadId = GeneratedColumn<int?>(
      'thread_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, threadId];
  @override
  String get aliasedName => _alias ?? 'user_threads';
  @override
  String get actualTableName => 'user_threads';
  @override
  VerificationContext validateIntegrity(Insertable<UserThread> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('thread_id')) {
      context.handle(_threadIdMeta,
          threadId.isAcceptableOrUnknown(data['thread_id']!, _threadIdMeta));
    } else if (isInserting) {
      context.missing(_threadIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  UserThread map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserThread.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserThreadsTable createAlias(String alias) {
    return $UserThreadsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final $ThreadsTable threads = $ThreadsTable(this);
  late final $UserThreadsTable userThreads = $UserThreadsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, threads, userThreads];
}
