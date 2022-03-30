import 'package:projectscoid/core/components/utility/db/DatabaseHelper.dart';
import 'package:projectscoid/core/components/utility/log/Log.dart';
import 'package:sqflite/sqflite.dart';

class DBMigrationListener implements DatabaseMigrationListener {
  static const int VERSION_1_0_0 = 1;

  @override
  void onCreate(Database db, int version) async {
    Log.info('onCreate version : $version');
    await _createDatabase(db, version);
  }

  @override
  void onUpgrade(Database db, int oldVersion, int newVersion) {
    Log.info('oldVersion : $oldVersion');
    Log.info('newVersion : $newVersion');
  }

  Future<void> _createDatabase(Database db, int version) async {
    if (VERSION_1_0_0 == version) {
      db.transaction((txn) async {
        var batch = txn.batch();
        batch.execute('''CREATE TABLE projects_list(id TEXT PRIMARY KEY, 
         cnt INTEGER, 
         page INTEGER,
         age INTEGER,
         title TEXT, 
         short_description TEXT, 
         meta TEXT)''');
        batch.execute('''CREATE TABLE token(id TEXT PRIMARY KEY, 
         age INTEGER, token INTEGER)''');

        batch.execute('''CREATE TABLE hash(id TEXT PRIMARY KEY, 
         age INTEGER, hash_string TEXT)''');

        batch.execute('''CREATE TABLE blacklist(id TEXT PRIMARY KEY, 
         meta TEXT)''');

        batch.execute('''CREATE TABLE account(id TEXT PRIMARY KEY, 
         user_name TEXT , password TEXT, user_display TEXT , user_photo TEXT , user_hash TEXT , notif_count TEXT, hash TEXT)''');


        batch.execute('''CREATE TABLE setting(id TEXT PRIMARY KEY, 
         tool TEXT, value INTEGER)''');
        batch.execute(''' INSERT INTO  
            setting (  
            id,
            tool,
            value ) 
            VALUES (  
            'intro',
            'intro',
            0 ) ''');

        batch.execute('''CREATE TABLE storage(
	     id TEXT PRIMARY KEY, 
		 user_id TEXT,
		 table_id INTEGER,
         cnt INTEGER,
         page INTEGER,
         age INTEGER,
		 ttl TEXT,
		 pht TEXT,
		 sbttl TEXT,
         search_text TEXT, 
         meta TEXT)''');

        batch.execute('''CREATE TABLE storage_info(
		 table_id INTEGER PRIMARY KEY,
		 user_id TEXT,
         meta TEXT)''');

        batch.execute('''CREATE INDEX table_id_page_search_text ON storage (
		 table_id,
		 user_id,
		 page,
		 search_text)''');

        await batch.commit(noResult: true);
      });

      /* KEY(table_id),
		 KEY(page),
		 KEY(search_text) */

    }
  }
}
