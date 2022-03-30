part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldCheckoutItemsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listCheckoutItemsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyCheckoutItemsListDB(DBRepository _dbRepository) async {
    var checkout_items;
    checkout_items = await _dbRepository.loadCheckoutItemsList1('');
    if ((checkout_items != null) || (checkout_items != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<CheckoutItemsListingModel?> getCheckoutItemsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  CheckoutItemsListingModel? checkout_items ;

   if(page == 1){
			//await _dbRepository.deleteAllCheckoutItemsList1();
            checkout_items = await _apiProvider.getListCheckoutItems(url, page)
                  .then((responseCheckoutItemsList) {
                    _loadAndSaveCheckoutItemsList1(responseCheckoutItemsList, '', page, _dbRepository);
					return responseCheckoutItemsList;
                  });
   }else{
      checkout_items = await _apiProvider.getListCheckoutItems(url, page)
                  .then((responseCheckoutItemsList) {
				  try{
				      return  _loadAndSaveCheckoutItemsList(responseCheckoutItemsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return checkout_items;
	}

Future<CheckoutItemsListingModel> getCheckoutItemsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  CheckoutItemsListingModel checkout_items ;   
  checkout_items = await _apiProvider.getListCheckoutItems(url, page)
		  .then((responseCheckoutItemsList) {
			return  _loadAndSaveCheckoutItemsListSearch(responseCheckoutItemsList, '', page);
		  }); 
  return checkout_items;
}



Future<CheckoutItemsListingModel> _loadAndSaveCheckoutItemsListSearch(CheckoutItemsListingModel list, String searchKey, int page) async{

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

Future<CheckoutItemsListingModel> _loadAndSaveCheckoutItemsList(CheckoutItemsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    CheckoutItemsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCheckoutItemsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCheckoutItemsModel checkout_items;
      checkout_items = list.items.items[i];
      checkout_items.item.cnt = i ;
      checkout_items.item.age = age;
      checkout_items.item.page = page;
	  checkout_items.item.ttl = '';
	  checkout_items.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  checkout_items.item.sbttl = '';
	  
	  checkout_items.item.id = checkout_items.item.cart_id; 
	  
      await _dbRepository.saveOrUpdateCheckoutItemsList1(checkout_items);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCheckoutItemsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveCheckoutItemsList1(CheckoutItemsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    CheckoutItemsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCheckoutItemsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCheckoutItemsModel checkout_items;
      checkout_items = list.items.items[i];
      checkout_items.item.cnt = i ;
      checkout_items.item.age = age;
      checkout_items.item.page = page;
	  checkout_items.item.ttl = '';
	  checkout_items.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  checkout_items.item.sbttl = '';
	  
	  checkout_items.item.id = checkout_items.item.cart_id; 
	  
      await _dbRepository.saveOrUpdateCheckoutItemsList1(checkout_items);
    }

  }


  Future<CheckoutItemsListingModel> loadCheckoutItemsList( String searchKey, DBRepository _dbRepository) async{
    CheckoutItemsListingModel appList = await _dbRepository.loadCheckoutItemsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCheckoutItemsList1(searchKey)) ;
    return appList;
  }






  

