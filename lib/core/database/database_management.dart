import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:squadio/core/common/date_helper.dart';
import 'package:squadio/core/utils/core.util.dart';
import 'package:squadio/env.dart';
import 'package:uuid/uuid.dart';

class DatabaseManagement {
  static final DatabaseManagement _instance = DatabaseManagement.internal();

  factory DatabaseManagement() => _instance;

  static Database? _db;
  Uuid uuid = const Uuid();


  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  DatabaseManagement.internal();

  Future<Database> initDb() async {
    final io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, "maindb.db");
    final Database theDb = await openDatabase(path, version: Env.databaseVersion, onCreate: _onCreate);
    return theDb;
  }

  // ignore: missing_whitespace_between_adjacent_strings
  Future _onCreate(Database db, int version) async {






  }




  /// This method helps insert a map of [values]
  /// into the specified [table] and returns the
  /// id of the last inserted row.
  ///
  /// ```
  ///    var value = {
  ///      'age': 18,
  ///      'name': 'value'
  ///    };
  ///    int id = await db.insert(
  ///      'table',
  ///      value,
  ///      conflictAlgorithm: ConflictAlgorithm.replace,
  ///    );
  /// ```
  ///
  /// 0 could be returned for some specific conflict algorithms if not inserted.
  Future<String> insertRecord(String table, Map<String,dynamic> data,{bool isNew=false,bool setNewId=true}) async {
    try{
      final Database dbClient = await db;
      if(setNewId) {
        data['id']=uuid.v4();
      }
      if(isNew){
        data['new']=1;
      }
      data["created_at"]=DateUtility.getFormattedDate(DateTime.now(),customFormat: "yyyy-MM-dd HH:mm:ss");
      data["updated_at"]=data["created_at"];
      await dbClient.insert(table, data);
      return data['id'].toString();
    }catch(error){
      CoreUtility.safePrint("error happened on database in insertRecord of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// This method helps insert a map of [values]
  /// into the specified [table] and returns the
  /// id of the last inserted row.
  ///
  /// ```
  ///    var value = {
  ///      'age': 18,
  ///      'name': 'value'
  ///    };
  ///    int id = await db.insert(
  ///      'table',
  ///      value,
  ///      conflictAlgorithm: ConflictAlgorithm.replace,
  ///    );
  /// ```
  ///
  /// 0 could be returned for some specific conflict algorithms if not inserted.
  Future<dynamic> insertIfNotExist(String table, Map<String,dynamic> data, String id,{bool updateIfExist=true}) async {
    try{
      final Database dbClient = await db;
      final List<Map<String, Object?>> result = await dbClient.query(table, where: 'id = ?', whereArgs: [id]);
      if (result.isNotEmpty) {
        if(updateIfExist) {
          await updateRecord(table,id,data);
        }
      }else{
        data["id"]=id;
        if(!data.containsKey("created_at")) {
          data["created_at"]=DateUtility.getFormattedDate(DateTime.now(),customFormat: "yyyy-MM-dd HH:mm:ss");
        }
        if(!data.containsKey("updated_at")) {
          data["updated_at"]=data["created_at"];
        }
        await dbClient.insert(table, data);
      }

      return await getRecord(table,id);
    }catch(error){
      CoreUtility.safePrint("error happened on database in insertIfNotExist of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }

  }


  /// This is a helper to query a table and return the items found. All optional
  /// clauses and filters are formatted as SQL queries
  /// excluding the clauses' names.
  ///
  /// [table] contains the table names to compile the query against.
  ///
  /// [distinct] when set to true ensures each row is unique.
  ///
  /// The [columns] list specify which columns to return. Passing null will
  /// return all columns, which is discouraged.
  ///
  /// [where] filters which rows to return. Passing null will return all rows
  /// for the given URL. '?'s are replaced with the items in the
  /// [whereArgs] field.
  ///
  /// [groupBy] declares how to group rows. Passing null
  /// will cause the rows to not be grouped.
  ///
  /// [having] declares which row groups to include in the cursor,
  /// if row grouping is being used. Passing null will cause
  /// all row groups to be included, and is required when row
  /// grouping is not being used.
  ///
  /// [orderBy] declares how to order the rows,
  /// Passing null will use the default sort order,
  /// which may be unordered.
  ///
  /// [limit] limits the number of rows returned by the query.
  ///
  /// [offset] specifies the starting index.
  ///
  /// ```
  ///  List<Map> maps = await db.query(tableTodo,
  ///      columns: ['columnId', 'columnDone', 'columnTitle'],
  ///      where: 'columnId = ?',
  ///      whereArgs: [id]);
  /// ```
  Future<List<Map<String, Object?>>> getTableRecords(String table) async {
    try{
      final Database dbClient = await db;
      final List<Map<String, Object?>> result = await dbClient.query(table);
      return result;
    }catch(error){
      CoreUtility.safePrint("error happened on database in getTableRecords of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// This is a helper to query a table and return the items found. All optional
  /// clauses and filters are formatted as SQL queries
  /// excluding the clauses' names.
  ///
  /// [table] contains the table names to compile the query against.
  ///
  /// [distinct] when set to true ensures each row is unique.
  ///
  /// The [columns] list specify which columns to return. Passing null will
  /// return all columns, which is discouraged.
  ///
  /// [where] filters which rows to return. Passing null will return all rows
  /// for the given URL. '?'s are replaced with the items in the
  /// [whereArgs] field.
  ///
  /// [groupBy] declares how to group rows. Passing null
  /// will cause the rows to not be grouped.
  ///
  /// [having] declares which row groups to include in the cursor,
  /// if row grouping is being used. Passing null will cause
  /// all row groups to be included, and is required when row
  /// grouping is not being used.
  ///
  /// [orderBy] declares how to order the rows,
  /// Passing null will use the default sort order,
  /// which may be unordered.
  ///
  /// [limit] limits the number of rows returned by the query.
  ///
  /// [offset] specifies the starting index.
  ///
  /// ```
  ///  List<Map> maps = await db.query(tableTodo,
  ///      columns: ['columnId', 'columnDone', 'columnTitle'],
  ///      where: 'columnId = ?',
  ///      whereArgs: [id]);
  /// ```
  Future<List<Map<String, Object?>>?> getTableWhere(String table,String column,String where) async {
    try {
      final Database dbClient = await db;
      final List<Map<String, Object?>> result = await dbClient.query(table, where: "$column = ?", whereArgs: [where]);
      return result.toList();
    } catch (error) {
      CoreUtility.safePrint("error happened on database in getTableWhere of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// This is a helper to query a table and return the items found. All optional
  /// clauses and filters are formatted as SQL queries
  /// excluding the clauses' names.
  ///
  /// [table] contains the table names to compile the query against.
  ///
  /// [distinct] when set to true ensures each row is unique.
  ///
  /// The [columns] list specify which columns to return. Passing null will
  /// return all columns, which is discouraged.
  ///
  /// [where] filters which rows to return. Passing null will return all rows
  /// for the given URL. '?'s are replaced with the items in the
  /// [whereArgs] field.
  ///
  /// [groupBy] declares how to group rows. Passing null
  /// will cause the rows to not be grouped.
  ///
  /// [having] declares which row groups to include in the cursor,
  /// if row grouping is being used. Passing null will cause
  /// all row groups to be included, and is required when row
  /// grouping is not being used.
  ///
  /// [orderBy] declares how to order the rows,
  /// Passing null will use the default sort order,
  /// which may be unordered.
  ///
  /// [limit] limits the number of rows returned by the query.
  ///
  /// [offset] specifies the starting index.
  ///
  /// ```
  ///  List<Map> maps = await db.query(tableTodo,
  ///      columns: ['columnId', 'columnDone', 'columnTitle'],
  ///      where: 'columnId = ?',
  ///      whereArgs: [id]);
  /// ```
  Future<List<Map<String, Object?>>?> getTableWhereLike(String table,String column,String where) async {
    try{
      final Database dbClient = await db;
      final List<Map<String, Object?>> result = await dbClient.query(table, where: "$column like ?", whereArgs: [where]);
      return result.toList();
    }catch(error){
      CoreUtility.safePrint("error happened on database in getTableWhereLike of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// This is a helper to query a table and return the items found. All optional
  /// clauses and filters are formatted as SQL queries
  /// excluding the clauses' names.
  ///
  /// [table] contains the table names to compile the query against.
  ///
  /// [distinct] when set to true ensures each row is unique.
  ///
  /// The [columns] list specify which columns to return. Passing null will
  /// return all columns, which is discouraged.
  ///
  /// [where] filters which rows to return. Passing null will return all rows
  /// for the given URL. '?'s are replaced with the items in the
  /// [whereArgs] field.
  ///
  /// [groupBy] declares how to group rows. Passing null
  /// will cause the rows to not be grouped.
  ///
  /// [having] declares which row groups to include in the cursor,
  /// if row grouping is being used. Passing null will cause
  /// all row groups to be included, and is required when row
  /// grouping is not being used.
  ///
  /// [orderBy] declares how to order the rows,
  /// Passing null will use the default sort order,
  /// which may be unordered.
  ///
  /// [limit] limits the number of rows returned by the query.
  ///
  /// [offset] specifies the starting index.
  ///
  /// ```
  ///  List<Map> maps = await db.query(tableTodo,
  ///      columns: ['columnId', 'columnDone', 'columnTitle'],
  ///      where: 'columnId = ?',
  ///      whereArgs: [id]);
  /// ```
  Future<Map<String, Object?>?> getRecord(String table, String id) async {
    try{
      final Database dbClient = await db;
      final List<Map<String, Object?>>  result = await dbClient.query(table, where: 'id = ?', whereArgs: [id]);
      if (result.isNotEmpty) {
        return result.first;
      }
      return null;
    }catch(error){
      CoreUtility.safePrint("error happened on database in getRecord of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// Convenience method for updating rows in the database. Returns
  /// the number of changes made
  ///
  /// Update [table] with [values], a map from column names to new column
  /// values. null is a valid value that will be translated to NULL.
  ///
  /// [where] is the optional WHERE clause to apply when updating.
  /// Passing null will update all rows.
  ///
  /// You may include ?s in the where clause, which will be replaced by the
  /// values from [whereArgs]
  ///
  /// [conflictAlgorithm] (optional) specifies algorithm to use in case of a
  /// conflict. See [ConflictAlgorithm] docs for more details
  ///
  /// ```
  /// int count = await db.update(tableTodo, todo.toMap(),
  ///    where: '$columnId = ?', whereArgs: [todo.id]);
  ///    [idFromMap] is used as determination to wither update id or not
  /// ```
  Future<int> updateRecord(String table,String id,Map<String,dynamic> data,{bool idFromMap=false}) async {
    try{
      final Database dbClient = await db;
      if(idFromMap==false) {
        data["id"]=id;
      }else{
        data.remove("id");
      }
      data["updated_at"]=DateUtility.getFormattedDate(DateTime.now(),customFormat: "yyyy-MM-dd HH:mm:ss");
      return await dbClient.update(table,data, where: "id = ?", whereArgs: [id]);
    }catch(error){
      CoreUtility.safePrint("error happened on database in updateRecord of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// Convenience method for deleting rows in the database.
  ///
  /// Delete from [table]
  ///
  /// [where] is the optional WHERE clause to apply when updating. Passing null
  /// will delete all rows.
  ///
  /// You may include ?s in the where clause, which will be replaced by the
  /// values from [whereArgs]
  ///
  /// Returns the number of rows affected.
  /// ```
  ///  int count = await db.delete(tableTodo, where: 'columnId = ?', whereArgs: [id]);
  /// ```
  Future<int> softDeleteRecord(String table, String id) async {
    try{
      final Database dbClient = await db;
      Map<String, dynamic> data={};
      data["deleted_at"]=DateUtility.getFormattedDate(DateTime.now(),customFormat: "yyyy-MM-dd HH:mm:ss");
      return await dbClient.update(table,data, where: "id = ?", whereArgs: [id]);
    }catch(error){
      CoreUtility.safePrint("error happened on database in softDeleteRecord of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// Convenience method for deleting rows in the database.
  ///
  /// Delete from [table]
  ///
  /// [where] is the optional WHERE clause to apply when updating. Passing null
  /// will delete all rows.
  ///
  /// You may include ?s in the where clause, which will be replaced by the
  /// values from [whereArgs]
  ///
  /// Returns the number of rows affected.
  /// ```
  ///  int count = await db.delete(tableTodo, where: 'columnId = ?', whereArgs: [id]);
  /// ```
  Future<int> truncateTableRecords(String table) async {
    try{
      final Database dbClient = await db;
      return await dbClient.delete(table);
    }catch(error){
      CoreUtility.safePrint("error happened on database in deleteTableRecords of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// Convenience method for deleting rows in the database.
  ///
  /// Delete from [table]
  ///
  /// [where] is the optional WHERE clause to apply when updating. Passing null
  /// will delete all rows.
  ///
  /// You may include ?s in the where clause, which will be replaced by the
  /// values from [whereArgs]
  ///
  /// Returns the number of rows affected.
  /// ```
  ///  int count = await db.delete(tableTodo, where: 'columnId = ?', whereArgs: [id]);
  /// ```
  Future<int> hardDeleteRecord(String table, String id) async {
    try{
      final Database dbClient = await db;
      return await dbClient.delete(table, where: 'id = ?', whereArgs: [id]);
    }catch(error){
      CoreUtility.safePrint("error happened on database in hardDeleteRecord of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// Executes a raw SQL SELECT query and returns a list
  /// of the rows that were found.
  ///
  /// ```
  /// List<Map> list = await database.rawQuery('SELECT * FROM Test');
  /// ```
  Future<List<Map<String, Object?>>?> rawQuery(String sql) async {

    try{
      final Database dbClient = await db;
      final List<Map<String, Object?>> result = await dbClient.rawQuery(sql);
      return result;
    }catch(error){
      CoreUtility.safePrint("error happened on database in rawQuery of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }

  /// Execute an SQL query with no return value.
  ///
  /// ```
  ///   await db.execute(
  ///   'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
  /// ```
  Future execute(String sql) async {
    try{
      final Database dbClient = await db;
      dbClient.execute(sql);
    }catch(error){
      rethrow;
    }
  }

  ///
  /// Delete the database at the given path.
  ///
  Future deleteDB() async {
    try{
      final io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
      final String path = join(documentsDirectory.path, "maindb.db");
      await deleteDatabase(path);
      _db=null;
    }catch(error,st){
      CoreUtility.safePrint("error happened on database in deleteDB of type ${error.runtimeType} with ${error.toString()}");
      rethrow;
    }
  }


}
