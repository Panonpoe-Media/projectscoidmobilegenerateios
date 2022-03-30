part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldShowBidsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listShowBidsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyShowBidsListDB(DBRepository _dbRepository) async {
    var show_bids;
    show_bids = await _dbRepository.loadShowBidsList1('');
    if ((show_bids != null) || (show_bids != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ShowBidsListingModel?> getShowBidsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShowBidsListingModel? show_bids ;

   if(page == 1){
			//await _dbRepository.deleteAllShowBidsList1();
            show_bids = await _apiProvider.getListShowBids(url, page)
                  .then((responseShowBidsList) {
                    _loadAndSaveShowBidsList1(responseShowBidsList, '', page, _dbRepository);
					return responseShowBidsList;
                  });
   }else{
      show_bids = await _apiProvider.getListShowBids(url, page)
                  .then((responseShowBidsList) {
				  try{
				      return  _loadAndSaveShowBidsList(responseShowBidsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return show_bids;
	}

Future<ShowBidsListingModel> getShowBidsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShowBidsListingModel show_bids ;   
  show_bids = await _apiProvider.getListShowBids(url, page)
		  .then((responseShowBidsList) {
			return  _loadAndSaveShowBidsListSearch(responseShowBidsList, '', page);
		  }); 
  return show_bids;
}



Future<ShowBidsListingModel> _loadAndSaveShowBidsListSearch(ShowBidsListingModel list, String searchKey, int page) async{

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

Future<ShowBidsListingModel> _loadAndSaveShowBidsList(ShowBidsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShowBidsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShowBidsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShowBidsModel show_bids;
      show_bids = list.items.items[i];
      show_bids.item.cnt = i ;
      show_bids.item.age = age;
      show_bids.item.page = page;
	  show_bids.item.ttl = '';
	  show_bids.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  show_bids.item.sbttl = '';
	  
	  show_bids.item.id = show_bids.item.bid_id; 
	  
	  show_bids.item.pht = show_bids.item.worker_photo_url;
	  show_bids.item.ttl = show_bids.item.worker_user_name;
	  show_bids.item.sbttl = show_bids.item.message;
      await _dbRepository.saveOrUpdateShowBidsList1(show_bids);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShowBidsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveShowBidsList1(ShowBidsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShowBidsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShowBidsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShowBidsModel show_bids;
      show_bids = list.items.items[i];
      show_bids.item.cnt = i ;
      show_bids.item.age = age;
      show_bids.item.page = page;
	  show_bids.item.ttl = '';
	  show_bids.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  show_bids.item.sbttl = '';
	  
	  show_bids.item.id = show_bids.item.bid_id; 
	  
	  show_bids.item.pht = show_bids.item.worker_photo_url;
	  show_bids.item.ttl = show_bids.item.worker_user_name;
	  show_bids.item.sbttl = show_bids.item.message;
      await _dbRepository.saveOrUpdateShowBidsList1(show_bids);
    }

  }


  Future<ShowBidsListingModel> loadShowBidsList( String searchKey, DBRepository _dbRepository) async{
    ShowBidsListingModel appList = await _dbRepository.loadShowBidsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShowBidsList1(searchKey)) ;
    return appList;
  }






  

