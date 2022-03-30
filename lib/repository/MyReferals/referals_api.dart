part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldReferalsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listReferalsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyReferalsListDB(DBRepository _dbRepository) async {
    var referals;
    referals = await _dbRepository.loadReferalsList1('');
    if ((referals != null) || (referals != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ReferalsListingModel?> getReferalsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ReferalsListingModel? referals ;

   if(page == 1){
			//await _dbRepository.deleteAllReferalsList1();
            referals = await _apiProvider.getListReferals(url, page)
                  .then((responseReferalsList) {
                    _loadAndSaveReferalsList1(responseReferalsList, '', page, _dbRepository);
					return responseReferalsList;
                  });
   }else{
      referals = await _apiProvider.getListReferals(url, page)
                  .then((responseReferalsList) {
				  try{
				      return  _loadAndSaveReferalsList(responseReferalsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return referals;
	}

Future<ReferalsListingModel> getReferalsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ReferalsListingModel referals ;   
  referals = await _apiProvider.getListReferals(url, page)
		  .then((responseReferalsList) {
			return  _loadAndSaveReferalsListSearch(responseReferalsList, '', page);
		  }); 
  return referals;
}



Future<ReferalsListingModel> _loadAndSaveReferalsListSearch(ReferalsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.user_name;
    }
    return list;
 }

Future<ReferalsListingModel> _loadAndSaveReferalsList(ReferalsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ReferalsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateReferalsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemReferalsModel referals;
      referals = list.items.items[i];
      referals.item.cnt = i ;
      referals.item.age = age;
      referals.item.page = page;
	  referals.item.ttl = '';
	  referals.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  referals.item.sbttl = '';
	  
	  referals.item.id = referals.item.user_id; 
	  
	  referals.item.ttl = referals.item.user_name;
      await _dbRepository.saveOrUpdateReferalsList1(referals);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadReferalsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveReferalsList1(ReferalsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ReferalsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateReferalsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemReferalsModel referals;
      referals = list.items.items[i];
      referals.item.cnt = i ;
      referals.item.age = age;
      referals.item.page = page;
	  referals.item.ttl = '';
	  referals.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  referals.item.sbttl = '';
	  
	  referals.item.id = referals.item.user_id; 
	  
	  referals.item.ttl = referals.item.user_name;
      await _dbRepository.saveOrUpdateReferalsList1(referals);
    }

  }


  Future<ReferalsListingModel> loadReferalsList( String searchKey, DBRepository _dbRepository) async{
    ReferalsListingModel appList = await _dbRepository.loadReferalsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadReferalsList1(searchKey)) ;
    return appList;
  }






  

