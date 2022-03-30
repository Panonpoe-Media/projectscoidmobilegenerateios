part of 'package:projectscoid/db/DBRepository.dart';

Future<void> saveOrUpdatePointsSellerList(ItemPointsSellerModel points_seller, Database _database,int TableID_PointsSeller) async{
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
    String meta = jsonEncode(points_seller.item.toJson());
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
		  TableID_PointsSeller, 
		  userID, 
		  points_seller.item.page,
          points_seller.item.age,
          points_seller.item.cnt,
		  points_seller.item.ttl,
		  points_seller.item.pht,
		  points_seller.item.sbttl,
          searchText,
          meta,
          points_seller.item.id,
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

            points_seller.item.id,
			TableID_PointsSeller,
			userID,
			 points_seller.item.page,
            points_seller.item.age,
            points_seller.item.cnt,
			points_seller.item.ttl,
		    points_seller.item.pht,
		    points_seller.item.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<PointsSellerListingModel> loadPointsSellerListInfo(String searchKey, Database _database,int TableID_PointsSeller) async{
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
					     WHERE `table_id` = '''+ TableID_PointsSeller.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	var batchList =	await batch.commit();
	});
     list.addAll(batchList[0]);
	for(var map in list) {
     meta =  PointsSellerListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdatePointsSellerListInfo(PointsSellerListingModel points_seller, Database _database,int TableID_PointsSeller) async{
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
    String meta = jsonEncode(points_seller.tools.toJson());
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
          TableID_PointsSeller,
		  
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
			TableID_PointsSeller,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listPointsSellerAge(Database _database,int TableID_PointsSeller) async {
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
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_PointsSeller.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemPointsSellerModel> appList = [];
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
      ItemPointsSellerModel points_seller = ItemPointsSellerModel(jsonDecode(map['meta']));
      points_seller.item.cnt = map['cnt'];
      points_seller.item.age = map['age'];
	   points_seller.item.page = map['page'];
	  points_seller.item.ttl = map['ttl'];
	  points_seller.item.pht = map['pht'];
	  points_seller.item.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(points_seller);
    }
    return age;
  }

  Future<List<ItemPointsSellerModel>> loadPointsSellerList(String searchKey,Database _database,int TableID_PointsSeller) async{
    String searchSql = '';
    List<ItemPointsSellerModel> appList = [];
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
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_PointsSeller.toString()  + ''' AND `user_id` = '$userID' ''';
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
        ItemPointsSellerModel points_seller = ItemPointsSellerModel(jsonDecode(map['meta']));
        points_seller.item.cnt = map['cnt'];
		points_seller.item.page = map['page'];
        points_seller.item.age = map['age'];
	    points_seller.item.ttl = map['ttl'];
	    points_seller.item.pht = map['pht'];
	    points_seller.item.sbttl = map['sbttl'];
        appList.add(points_seller);
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
											 WHERE `table_id` = '''+ TableID_PointsSeller.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList[0]);

      for(var map in list){
        ItemPointsSellerModel points_seller = ItemPointsSellerModel(jsonDecode(map['meta']));
        points_seller.item.cnt = map['cnt'];
		points_seller.item.page = map['page'];
        points_seller.item.age = map['age'];
		points_seller.item.ttl = map['ttl'];
	    points_seller.item.pht = map['pht'];
	    points_seller.item.sbttl = map['sbttl'];
        appList.add(points_seller);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllPointsSellerList(Database _database,int TableID_PointsSeller) async{
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
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_PointsSeller.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	});
 }













  

