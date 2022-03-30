part of 'package:projectscoid/repository/APIRepository.dart';
/** AUTOGENERATE OFF **/
 Future<bool> isOldUserBidsList1(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listUserBidsAge2();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyUserBidsListDB1(DBRepository _dbRepository) async {
    var user_bids;
    user_bids = await _dbRepository.loadUserBidsList2('');
    if ((user_bids != null) || (user_bids != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<UserBidsListingModel?> getUserBidsList1(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  UserBidsListingModel? user_bids ;

   if(page == 1){
			//await _dbRepository.deleteAllUserBidsList1();
            user_bids = await _apiProvider.getListUserBids(url, page)
                  .then((responseUserBidsList) {
                    _loadAndSaveUserBidsList1(responseUserBidsList, '', page, _dbRepository);
					return responseUserBidsList;
                  });
   }else{
      user_bids = await _apiProvider.getListUserBids(url, page)
                  .then((responseUserBidsList) {
				  try{
				      return  _loadAndSaveUserBidsList(responseUserBidsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return user_bids;
	}

Future<UserBidsListingModel> getUserBidsListSearch1(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  UserBidsListingModel user_bids ;   
  user_bids = await _apiProvider.getListUserBids(url, page)
		  .then((responseUserBidsList) {
			return  _loadAndSaveUserBidsListSearch(responseUserBidsList, '', page);
		  }); 
  return user_bids;
}



Future<UserBidsListingModel> _loadAndSaveUserBidsListSearch1(UserBidsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.worker_photo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.worker_user_name;
    }
    return list;
 }

Future<UserBidsListingModel> _loadAndSaveUserBidsList1A(UserBidsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    UserBidsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateUserBidsListInfo2(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemUserBidsModel user_bids;
      user_bids = list.items.items[i];
      user_bids.item.cnt = i ;
      user_bids.item.age = age;
      user_bids.item.page = page;
	  user_bids.item.ttl = '';
	  user_bids.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  user_bids.item.sbttl = '';
	  
	  user_bids.item.id = user_bids.item.bid_id; 
	  
	  user_bids.item.pht = user_bids.item.worker_photo_url;
	  user_bids.item.ttl = user_bids.item.worker_user_name;
      await _dbRepository.saveOrUpdateUserBidsList2(user_bids);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadUserBidsList2(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveUserBidsList11(UserBidsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    UserBidsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateUserBidsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemUserBidsModel user_bids;
      user_bids = list.items.items[i];
      user_bids.item.cnt = i ;
      user_bids.item.age = age;
      user_bids.item.page = page;
	  user_bids.item.ttl = '';
	  user_bids.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  user_bids.item.sbttl = '';
	  
	  user_bids.item.id = user_bids.item.bid_id; 
	  
	  user_bids.item.pht = user_bids.item.worker_photo_url;
	  user_bids.item.ttl = user_bids.item.worker_user_name;
      await _dbRepository.saveOrUpdateUserBidsList2(user_bids);
    }

  }


  Future<UserBidsListingModel> loadUserBidsList1( String searchKey, DBRepository _dbRepository) async{
    UserBidsListingModel appList = await _dbRepository.loadUserBidsListInfo2('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadUserBidsList2(searchKey)) ;
    return appList;
  }






  

