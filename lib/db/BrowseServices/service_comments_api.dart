part of 'package:projectscoid/db/DBRepository.dart';

Future<void> saveOrUpdateServiceCommentsList(ItemServiceCommentsModel service_comments, Database _database,int TableID_ServiceComments) async{
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
    String meta = jsonEncode(service_comments.item.toJson());
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
		  TableID_ServiceComments, 
		  userID, 
		  service_comments.item.page,
          service_comments.item.age,
          service_comments.item.cnt,
		  service_comments.item.ttl,
		  service_comments.item.pht,
		  service_comments.item.sbttl,
          searchText,
          meta,
          service_comments.item.id,
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

            service_comments.item.id,
			TableID_ServiceComments,
			userID,
			 service_comments.item.page,
            service_comments.item.age,
            service_comments.item.cnt,
			service_comments.item.ttl,
		    service_comments.item.pht,
		    service_comments.item.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<ServiceCommentsListingModel> loadServiceCommentsListInfo(String searchKey, Database _database,int TableID_ServiceComments) async{
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
					     WHERE `table_id` = '''+ TableID_ServiceComments.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	var batchList =	await batch.commit();
	});
     list.addAll(batchList[0]);
	for(var map in list) {
     meta =  ServiceCommentsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateServiceCommentsListInfo(ServiceCommentsListingModel service_comments, Database _database,int TableID_ServiceComments) async{
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
    String meta = jsonEncode(service_comments.tools.toJson());
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
          TableID_ServiceComments,
		  
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
			TableID_ServiceComments,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listServiceCommentsAge(Database _database,int TableID_ServiceComments) async {
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
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_ServiceComments.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemServiceCommentsModel> appList = [];
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
      ItemServiceCommentsModel service_comments = ItemServiceCommentsModel(jsonDecode(map['meta']));
      service_comments.item.cnt = map['cnt'];
      service_comments.item.age = map['age'];
	   service_comments.item.page = map['page'];
	  service_comments.item.ttl = map['ttl'];
	  service_comments.item.pht = map['pht'];
	  service_comments.item.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(service_comments);
    }
    return age;
  }

  Future<List<ItemServiceCommentsModel>> loadServiceCommentsList(String searchKey,Database _database,int TableID_ServiceComments) async{
    String searchSql = '';
    List<ItemServiceCommentsModel> appList = [];
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
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_ServiceComments.toString()  + ''' AND `user_id` = '$userID' ''';
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
        ItemServiceCommentsModel service_comments = ItemServiceCommentsModel(jsonDecode(map['meta']));
        service_comments.item.cnt = map['cnt'];
		service_comments.item.page = map['page'];
        service_comments.item.age = map['age'];
	    service_comments.item.ttl = map['ttl'];
	    service_comments.item.pht = map['pht'];
	    service_comments.item.sbttl = map['sbttl'];
        appList.add(service_comments);
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
											 WHERE `table_id` = '''+ TableID_ServiceComments.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList[0]);

      for(var map in list){
        ItemServiceCommentsModel service_comments = ItemServiceCommentsModel(jsonDecode(map['meta']));
        service_comments.item.cnt = map['cnt'];
		service_comments.item.page = map['page'];
        service_comments.item.age = map['age'];
		service_comments.item.ttl = map['ttl'];
	    service_comments.item.pht = map['pht'];
	    service_comments.item.sbttl = map['sbttl'];
        appList.add(service_comments);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllServiceCommentsList(Database _database,int TableID_ServiceComments) async{
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
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_ServiceComments.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	});
 }













  

