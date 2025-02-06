import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _playerTableName = "players";
  final String _idColumnName = "id";
  final String _nameColumnName = "name";
  final String _elementColumnName = "element";
  final String _talentColumnName = "main_talent";
  final String _secretColumnName = "secret_talents";
  final String _classColumnName = "class";
  final String _senjutsuColumnName = "senjutsus";
  final String _notesColumnName = "notes";


  DatabaseService._constructor();

  Future<Database> get dataase async{
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        version: 1;
        db.execute('''
        CREATE TABLE $_playerTableName (
          $_idColumnName INTEGER PRIMARY KEY,
          $_nameColumnName TEXT,
          $_elementColumnName TEXT,
          $_talentColumnName TEXT,
          $_secretColumnName TEXT,
          $_classColumnName TEXT,
          $_senjutsuColumnName TEXT,
          $_notesColumnName TEXT
        )
        ''');
      }
    );

    return database;
  }
}