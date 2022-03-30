part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldShortlistedBidsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listShortlistedBidsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyShortlistedBidsListDB(DBRepository _dbRepository) async {
    var shortlisted_bids;
    shortlisted_bids = await _dbRepository.loadShortlistedBidsList1('');
    if ((shortlisted_bids != null) || (shortlisted_bids != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ShortlistedBidsListingModel?> getShortlistedBidsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShortlistedBidsListingModel? shortlisted_bids ;

   if(page == 1){
			//await _dbRepository.deleteAllShortlistedBidsList1();
            shortlisted_bids = await _apiProvider.getListShortlistedBids(url, page)
                  .then((responseShortlistedBidsList) {
                    _loadAndSaveShortlistedBidsList1(responseShortlistedBidsList, '', page, _dbRepository);
					return responseShortlistedBidsList;
                  });
   }else{
      shortlisted_bids = await _apiProvider.getListShortlistedBids(url, page)
                  .then((responseShortlistedBidsList) {
				  try{
				      return  _loadAndSaveShortlistedBidsList(responseShortlistedBidsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return shortlisted_bids;
	}

Future<ShortlistedBidsListingModel> getShortlistedBidsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShortlistedBidsListingModel shortlisted_bids ;   
  shortlisted_bids = await _apiProvider.getListShortlistedBids(url, page)
		  .then((responseShortlistedBidsList) {
			return  _loadAndSaveShortlistedBidsListSearch(responseShortlistedBidsList, '', page);
		  }); 
  return shortlisted_bids;
}



Future<ShortlistedBidsListingModel> _loadAndSaveShortlistedBidsListSearch(ShortlistedBidsListingModel list, String searchKey, int page) async{

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
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
    }
    return list;
 }

Future<ShortlistedBidsListingModel> _loadAndSaveShortlistedBidsList(ShortlistedBidsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShortlistedBidsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShortlistedBidsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShortlistedBidsModel shortlisted_bids;
      shortlisted_bids = list.items.items[i];
      shortlisted_bids.item.cnt = i ;
      shortlisted_bids.item.age = age;
      shortlisted_bids.item.page = page;
	  shortlisted_bids.item.ttl = '';
	  shortlisted_bids.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  shortlisted_bids.item.sbttl = '';
	  
	  shortlisted_bids.item.id = shortlisted_bids.item.bid_id; 
	  
	  shortlisted_bids.item.pht = shortlisted_bids.item.worker_photo_url;
	  shortlisted_bids.item.ttl = shortlisted_bids.item.worker_user_name;
	  shortlisted_bids.item.sbttl = shortlisted_bids.item.message;
      await _dbRepository.saveOrUpdateShortlistedBidsList1(shortlisted_bids);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShortlistedBidsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveShortlistedBidsList1(ShortlistedBidsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShortlistedBidsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShortlistedBidsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShortlistedBidsModel shortlisted_bids;
      shortlisted_bids = list.items.items[i];
      shortlisted_bids.item.cnt = i ;
      shortlisted_bids.item.age = age;
      shortlisted_bids.item.page = page;
	  shortlisted_bids.item.ttl = '';
	  shortlisted_bids.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  shortlisted_bids.item.sbttl = '';
	  
	  shortlisted_bids.item.id = shortlisted_bids.item.bid_id; 
	  
	  shortlisted_bids.item.pht = shortlisted_bids.item.worker_photo_url;
	  shortlisted_bids.item.ttl = shortlisted_bids.item.worker_user_name;
	  shortlisted_bids.item.sbttl = shortlisted_bids.item.message;
      await _dbRepository.saveOrUpdateShortlistedBidsList1(shortlisted_bids);
    }

  }


  Future<ShortlistedBidsListingModel> loadShortlistedBidsList( String searchKey, DBRepository _dbRepository) async{
    ShortlistedBidsListingModel appList = await _dbRepository.loadShortlistedBidsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShortlistedBidsList1(searchKey)) ;
    return appList;
  }






  

