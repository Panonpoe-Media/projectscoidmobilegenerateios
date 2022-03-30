part of 'package:projectscoid/db/DBRepository.dart';

Future<void> saveOrUpdateProductsList(ItemProductsModel products, Database _database,int TableID_Products) async{
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
    String meta = jsonEncode(products.item.toJson());
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
		  TableID_Products, 
		  userID, 
		  products.item.page,
          products.item.age,
          products.item.cnt,
		  products.item.ttl,
		  products.item.pht,
		  products.item.sbttl,
          searchText,
          meta,
          products.item.id,
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

            products.item.id,
			TableID_Products,
			userID,
			 products.item.page,
            products.item.age,
            products.item.cnt,
			products.item.ttl,
		    products.item.pht,
		    products.item.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<ProductsListingModel> loadProductsListInfo(String searchKey, Database _database,int TableID_Products) async{
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
					     WHERE `table_id` = '''+ TableID_Products.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	var batchList =	await batch.commit();
	});
     list.addAll(batchList[0]);
	for(var map in list) {
     meta =  ProductsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateProductsListInfo(ProductsListingModel products, Database _database,int TableID_Products) async{
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
    String meta = jsonEncode(products.tools.toJson());
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
          TableID_Products,
		  
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
			TableID_Products,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listProductsAge(Database _database,int TableID_Products) async {
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
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Products.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemProductsModel> appList = [];
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
      ItemProductsModel products = ItemProductsModel(jsonDecode(map['meta']));
      products.item.cnt = map['cnt'];
      products.item.age = map['age'];
	   products.item.page = map['page'];
	  products.item.ttl = map['ttl'];
	  products.item.pht = map['pht'];
	  products.item.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(products);
    }
    return age;
  }

  Future<List<ItemProductsModel>> loadProductsList(String searchKey,Database _database,int TableID_Products) async{
    String searchSql = '';
    List<ItemProductsModel> appList = [];
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
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Products.toString()  + ''' AND `user_id` = '$userID' ''';
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
        ItemProductsModel products = ItemProductsModel(jsonDecode(map['meta']));
        products.item.cnt = map['cnt'];
		products.item.page = map['page'];
        products.item.age = map['age'];
	    products.item.ttl = map['ttl'];
	    products.item.pht = map['pht'];
	    products.item.sbttl = map['sbttl'];
        appList.add(products);
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
											 WHERE `table_id` = '''+ TableID_Products.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList[0]);

      for(var map in list){
        ItemProductsModel products = ItemProductsModel(jsonDecode(map['meta']));
        products.item.cnt = map['cnt'];
		products.item.page = map['page'];
        products.item.age = map['age'];
		products.item.ttl = map['ttl'];
	    products.item.pht = map['pht'];
	    products.item.sbttl = map['sbttl'];
        appList.add(products);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllProductsList(Database _database,int TableID_Products) async{
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
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Products.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	});
 }













  

