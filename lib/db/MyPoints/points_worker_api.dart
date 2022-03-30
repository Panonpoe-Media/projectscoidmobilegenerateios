part of 'package:projectscoid/db/DBRepository.dart';

Future<void> saveOrUpdatePointsWorkerList(ItemPointsWorkerModel points_worker, Database _database,int TableID_PointsWorker) async{
 Future<List<Map>> loadAccount() async{
    List<Map> list = [];
	//_database.transaction((txn) async {
		var batch = _database.batch();
		
    batch.rawQuery( '''
                                             SELECT
                                              id,
                                              user_name,
											  password,
                                              user_display,
                                              user_photo,
                                              user_hash,
                                              hash
                                             FROM account
                                             ''');
	  var batchList = await batch.commit();
     // list.addAll(batchList[0]);
	// });
   // print('list ===' + list.toString());
    return batchList.first as List<Map>;
  }
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(points_worker.item.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database.transaction((txn) async {
		var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PointsWorker, 
		  userID, 
		  points_worker.item.page,
          points_worker.item.age,
          points_worker.item.cnt,
		  points_worker.item.ttl,
		  points_worker.item.pht,
		  points_worker.item.sbttl,
          searchText,
          meta,
          points_worker.item.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            points_worker.item.id,
			TableID_PointsWorker,
			userID,
			 points_worker.item.page,
            points_worker.item.age,
            points_worker.item.cnt,
			points_worker.item.ttl,
		    points_worker.item.pht,
		    points_worker.item.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<PointsWorkerListingModel> loadPointsWorkerListInfo(String searchKey, Database _database,int TableID_PointsWorker) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
 Future<List<Map>> loadAccount() async{
    List<Map> list = [];
	//_database.transaction((txn) async {
		var batch = _database.batch();
		
    batch.rawQuery( '''
                                             SELECT
                                              id,
                                              user_name,
											  password,
                                              user_display,
                                              user_photo,
                                              user_hash,
                                              hash
                                             FROM account
                                             ''');
	  var batchList = await batch.commit();
     // list.addAll(batchList[0]);
	// });
   // print('list ===' + list.toString());
    return batchList.first as List<Map>;
  }
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	_database.transaction((txn) async {
		var batch = txn.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_PointsWorker.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	var batchList =	await batch.commit();
	});
     list.addAll(batchList[0]);
	for(var map in list) {
     meta =  PointsWorkerListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdatePointsWorkerListInfo(PointsWorkerListingModel points_worker, Database _database,int TableID_PointsWorker) async{
	String userID = '';
	List<Map>  listuser = [];
 Future<List<Map>> loadAccount() async{
    List<Map> list = [];
	//_database.transaction((txn) async {
		var batch = _database.batch();
		
    batch.rawQuery( '''
                                             SELECT
                                              id,
                                              user_name,
											  password,
                                              user_display,
                                              user_photo,
                                              user_hash,
                                              hash
                                             FROM account
                                             ''');
	  var batchList = await batch.commit();
     // list.addAll(batchList[0]);
	// });
   // print('list ===' + list.toString());
    return batchList.first as List<Map>;
  }
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(points_worker.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database.transaction((txn) async {
		var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_PointsWorker,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_PointsWorker,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listPointsWorkerAge(Database _database,int TableID_PointsWorker) async {
  	String userID = '';
	List<Map>  listuser = [];
 Future<List<Map>> loadAccount() async{
    List<Map> list = [];
	//_database.transaction((txn) async {
		var batch = _database.batch();
		
    batch.rawQuery( '''
                                             SELECT
                                              id,
                                              user_name,
											  password,
                                              user_display,
                                              user_photo,
                                              user_hash,
                                              hash
                                             FROM account
                                             ''');
	  var batchList = await batch.commit();
     // list.addAll(batchList[0]);
	// });
   // print('list ===' + list.toString());
    return batchList.first as List<Map>;
  }
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_PointsWorker.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemPointsWorkerModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	var batchList;
	//_database.transaction((txn) async {
		var batch = _database.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	batchList =	await batch.commit();	
    //});	
    list.addAll(batchList[0]);
    for(var map in list) {
      ItemPointsWorkerModel points_worker = ItemPointsWorkerModel(jsonDecode(map['meta']));
      points_worker.item.cnt = map['cnt'];
      points_worker.item.age = map['age'];
	   points_worker.item.page = map['page'];
	  points_worker.item.ttl = map['ttl'];
	  points_worker.item.pht = map['pht'];
	  points_worker.item.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(points_worker);
    }
    return age;
  }

  Future<List<ItemPointsWorkerModel>> loadPointsWorkerList(String searchKey,Database _database,int TableID_PointsWorker) async{
    String searchSql = '';
    List<ItemPointsWorkerModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
 Future<List<Map>> loadAccount() async{
    List<Map> list = [];
	//_database.transaction((txn) async {
		var batch = _database.batch();
		
    batch.rawQuery( '''
                                             SELECT
                                              id,
                                              user_name,
											  password,
                                              user_display,
                                              user_photo,
                                              user_hash,
                                              hash
                                             FROM account
                                             ''');
	  var batchList = await batch.commit();
     // list.addAll(batchList[0]);
	// });
   // print('list ===' + list.toString());
    return batchList.first as List<Map>;
  }
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_PointsWorker.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database.transaction((txn) async {
		    var batch = _database.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList[0]);
      for(var map in list) {
        ItemPointsWorkerModel points_worker = ItemPointsWorkerModel(jsonDecode(map['meta']));
        points_worker.item.cnt = map['cnt'];
		points_worker.item.page = map['page'];
        points_worker.item.age = map['age'];
	    points_worker.item.ttl = map['ttl'];
	    points_worker.item.pht = map['pht'];
	    points_worker.item.sbttl = map['sbttl'];
        appList.add(points_worker);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database.transaction((txn) async {
		    var batch = _database.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_PointsWorker.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList[0]);

      for(var map in list){
        ItemPointsWorkerModel points_worker = ItemPointsWorkerModel(jsonDecode(map['meta']));
        points_worker.item.cnt = map['cnt'];
		points_worker.item.page = map['page'];
        points_worker.item.age = map['age'];
		points_worker.item.ttl = map['ttl'];
	    points_worker.item.pht = map['pht'];
	    points_worker.item.sbttl = map['sbttl'];
        appList.add(points_worker);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllPointsWorkerList(Database _database,int TableID_PointsWorker) async{
  	String userID = '';
	List<Map>  listuser = [];
 Future<List<Map>> loadAccount() async{
    List<Map> list = [];
	//_database.transaction((txn) async {
		var batch = _database.batch();
		
    batch.rawQuery( '''
                                             SELECT
                                              id,
                                              user_name,
											  password,
                                              user_display,
                                              user_photo,
                                              user_hash,
                                              hash
                                             FROM account
                                             ''');
	  var batchList = await batch.commit();
     // list.addAll(batchList[0]);
	// });
   // print('list ===' + list.toString());
    return batchList.first as List<Map>;
  }
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	  _database.transaction((txn) async {
		    var batch = txn.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_PointsWorker.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	});
 }













  

