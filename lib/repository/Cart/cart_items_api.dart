part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldCartItemsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listCartItemsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyCartItemsListDB(DBRepository _dbRepository) async {
    var cart_items;
    cart_items = await _dbRepository.loadCartItemsList1('');
    if ((cart_items != null) || (cart_items != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<CartItemsListingModel?> getCartItemsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  CartItemsListingModel? cart_items ;

   if(page == 1){
			//await _dbRepository.deleteAllCartItemsList1();
            cart_items = await _apiProvider.getListCartItems(url, page)
                  .then((responseCartItemsList) {
                    _loadAndSaveCartItemsList1(responseCartItemsList, '', page, _dbRepository);
					return responseCartItemsList;
                  });
   }else{
      cart_items = await _apiProvider.getListCartItems(url, page)
                  .then((responseCartItemsList) {
				  try{
				      return  _loadAndSaveCartItemsList(responseCartItemsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return cart_items;
	}

Future<CartItemsListingModel> getCartItemsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  CartItemsListingModel cart_items ;   
  cart_items = await _apiProvider.getListCartItems(url, page)
		  .then((responseCartItemsList) {
			return  _loadAndSaveCartItemsListSearch(responseCartItemsList, '', page);
		  }); 
  return cart_items;
}



Future<CartItemsListingModel> _loadAndSaveCartItemsListSearch(CartItemsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
    }
    return list;
 }

Future<CartItemsListingModel> _loadAndSaveCartItemsList(CartItemsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    CartItemsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCartItemsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCartItemsModel cart_items;
      cart_items = list.items.items[i];
      cart_items.item.cnt = i ;
      cart_items.item.age = age;
      cart_items.item.page = page;
	  cart_items.item.ttl = '';
	  cart_items.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  cart_items.item.sbttl = '';
	  
	  cart_items.item.id = cart_items.item.cart_id; 
	  
      await _dbRepository.saveOrUpdateCartItemsList1(cart_items);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCartItemsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveCartItemsList1(CartItemsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    CartItemsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCartItemsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCartItemsModel cart_items;
      cart_items = list.items.items[i];
      cart_items.item.cnt = i ;
      cart_items.item.age = age;
      cart_items.item.page = page;
	  cart_items.item.ttl = '';
	  cart_items.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  cart_items.item.sbttl = '';
	  
	  cart_items.item.id = cart_items.item.cart_id; 
	  
      await _dbRepository.saveOrUpdateCartItemsList1(cart_items);
    }

  }


  Future<CartItemsListingModel> loadCartItemsList( String searchKey, DBRepository _dbRepository) async{
    CartItemsListingModel appList = await _dbRepository.loadCartItemsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCartItemsList1(searchKey)) ;
    return appList;
  }






  

