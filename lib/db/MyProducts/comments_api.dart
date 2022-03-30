part of 'package:projectscoid/db/DBRepository.dart';

Future<void> saveOrUpdateCommentsList(ItemCommentsModel comments, Database _database,int TableID_Comments) async{
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
    String meta = jsonEncode(comments.item.toJson());
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
		  TableID_Comments, 
		  userID, 
		  comments.item.page,
          comments.item.age,
          comments.item.cnt,
		  comments.item.ttl,
		  comments.item.pht,
		  comments.item.sbttl,
          searchText,
          meta,
          comments.item.id,
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

            comments.item.id,
			TableID_Comments,
			userID,
			 comments.item.page,
            comments.item.age,
            comments.item.cnt,
			comments.item.ttl,
		    comments.item.pht,
		    comments.item.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<CommentsListingModel> loadCommentsListInfo(String searchKey, Database _database,int TableID_Comments) async{
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
					     WHERE `table_id` = '''+ TableID_Comments.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	var batchList =	await batch.commit();
	});
     list.addAll(batchList[0]);
	for(var map in list) {
     meta =  CommentsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateCommentsListInfo(CommentsListingModel comments, Database _database,int TableID_Comments) async{
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
    String meta = jsonEncode(comments.tools.toJson());
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
          TableID_Comments,
		  
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
			TableID_Comments,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listCommentsAge(Database _database,int TableID_Comments) async {
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
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Comments.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemCommentsModel> appList = [];
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
      ItemCommentsModel comments = ItemCommentsModel(jsonDecode(map['meta']));
      comments.item.cnt = map['cnt'];
      comments.item.age = map['age'];
	   comments.item.page = map['page'];
	  comments.item.ttl = map['ttl'];
	  comments.item.pht = map['pht'];
	  comments.item.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(comments);
    }
    return age;
  }

  Future<List<ItemCommentsModel>> loadCommentsList(String searchKey,Database _database,int TableID_Comments) async{
    String searchSql = '';
    List<ItemCommentsModel> appList = [];
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
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Comments.toString()  + ''' AND `user_id` = '$userID' ''';
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
        ItemCommentsModel comments = ItemCommentsModel(jsonDecode(map['meta']));
        comments.item.cnt = map['cnt'];
		comments.item.page = map['page'];
        comments.item.age = map['age'];
	    comments.item.ttl = map['ttl'];
	    comments.item.pht = map['pht'];
	    comments.item.sbttl = map['sbttl'];
        appList.add(comments);
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
											 WHERE `table_id` = '''+ TableID_Comments.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList[0]);

      for(var map in list){
        ItemCommentsModel comments = ItemCommentsModel(jsonDecode(map['meta']));
        comments.item.cnt = map['cnt'];
		comments.item.page = map['page'];
        comments.item.age = map['age'];
		comments.item.ttl = map['ttl'];
	    comments.item.pht = map['pht'];
	    comments.item.sbttl = map['sbttl'];
        appList.add(comments);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllCommentsList(Database _database,int TableID_Comments) async{
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
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Comments.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	});
 }













  

