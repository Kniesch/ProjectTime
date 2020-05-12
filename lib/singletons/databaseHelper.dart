import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'activeProject.dart';

class DatabaseHelper {

  static  DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _currentDatabase;       // Singleton Database

  DatabaseHelper._createInstance();

  Future<Database> get database async {
    if (_currentDatabase == null) {
      _currentDatabase = await initCurrentDatabase();
    }
    return _currentDatabase;
  }

  Future<Database> initCurrentDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'ProjectTime.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS CURRENTTASK ("
                "ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "
                "TASKNAME TEXT NOT NULL, "
                "STARTTIME TEXT NOT NULL, "
                "STOPTIME TEXT NOT NULL, "
                "TIMEDIF TEXT NOT NULL);"
        );
        await db.execute(
          "CREATE TABLE IF NOT EXISTS TASKS ("
                "ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "
                "TASKNAME TEXT NOT NULL, "
                "STARTTIME TEXT NOT NULL, "
                "STOPTIME TEXT NOT NULL, "
                "TIMEDIF TEXT NOT NULL);"
        );
      },
      version: 1,
    );
  }

  Future<int> insertCurrent(ActiveProject current) async {
    Database db = await this.database;
    return await db.insert('CURRENTTASK', current.toMap());
  }

  Future<List<Map<String, dynamic>>> getCurrentMap() async {
		Database db = await this.database;
		return await db.query('CURRENTTASK');
	}

  Future<ActiveProject> getCurrent() async {
    var active = new ActiveProject();
    var activeMap = await getCurrentMap();
    if (activeMap.length > 0 ) {
      active = ActiveProject.fromMapObject(activeMap[0]);
    }
    return active;
  }

  Future<int> removeCurrent() async {
    Database db = await this.database;
    return await db.delete('CURRENTTASK');
  }

  factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}
}