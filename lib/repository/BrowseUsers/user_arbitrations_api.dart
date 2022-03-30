part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldUserArbitrationsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listUserArbitrationsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyUserArbitrationsListDB(DBRepository _dbRepository) async {
    var user_arbitrations;
    user_arbitrations = await _dbRepository.loadUserArbitrationsList1('');
    if ((user_arbitrations != null) || (user_arbitrations != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<UserArbitrationsListingModel?> getUserArbitrationsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  UserArbitrationsListingModel? user_arbitrations ;

   if(page == 1){
			//await _dbRepository.deleteAllUserArbitrationsList1();
            user_arbitrations = await _apiProvider.getListUserArbitrations(url, page)
                  .then((responseUserArbitrationsList) {
                    _loadAndSaveUserArbitrationsList1(responseUserArbitrationsList, '', page, _dbRepository);
					return responseUserArbitrationsList;
                  });
   }else{
      user_arbitrations = await _apiProvider.getListUserArbitrations(url, page)
                  .then((responseUserArbitrationsList) {
				  try{
				      return  _loadAndSaveUserArbitrationsList(responseUserArbitrationsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return user_arbitrations;
	}

Future<UserArbitrationsListingModel> getUserArbitrationsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  UserArbitrationsListingModel user_arbitrations ;   
  user_arbitrations = await _apiProvider.getListUserArbitrations(url, page)
		  .then((responseUserArbitrationsList) {
			return  _loadAndSaveUserArbitrationsListSearch(responseUserArbitrationsList, '', page);
		  }); 
  return user_arbitrations;
}



Future<UserArbitrationsListingModel> _loadAndSaveUserArbitrationsListSearch(UserArbitrationsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.plaintiff_description;
	  list.items.items[i].item.sbttl = list.items.items[i].item.plaintiff_wishes;
	  list.items.items[i].item.sbttl = list.items.items[i].item.defendant_description;
	  list.items.items[i].item.sbttl = list.items.items[i].item.defendant_wishes;
	  list.items.items[i].item.sbttl = list.items.items[i].item.analysis;
    }
    return list;
 }

Future<UserArbitrationsListingModel> _loadAndSaveUserArbitrationsList(UserArbitrationsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    UserArbitrationsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateUserArbitrationsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemUserArbitrationsModel user_arbitrations;
      user_arbitrations = list.items.items[i];
      user_arbitrations.item.cnt = i ;
      user_arbitrations.item.age = age;
      user_arbitrations.item.page = page;
	  user_arbitrations.item.ttl = '';
	  user_arbitrations.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  user_arbitrations.item.sbttl = '';
	  
	  user_arbitrations.item.id = user_arbitrations.item.arbitration_id; 
	  
	  user_arbitrations.item.sbttl = user_arbitrations.item.plaintiff_description;
	  user_arbitrations.item.sbttl = user_arbitrations.item.plaintiff_wishes;
	  user_arbitrations.item.sbttl = user_arbitrations.item.defendant_description;
	  user_arbitrations.item.sbttl = user_arbitrations.item.defendant_wishes;
	  user_arbitrations.item.sbttl = user_arbitrations.item.analysis;
      await _dbRepository.saveOrUpdateUserArbitrationsList1(user_arbitrations);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadUserArbitrationsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveUserArbitrationsList1(UserArbitrationsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    UserArbitrationsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateUserArbitrationsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemUserArbitrationsModel user_arbitrations;
      user_arbitrations = list.items.items[i];
      user_arbitrations.item.cnt = i ;
      user_arbitrations.item.age = age;
      user_arbitrations.item.page = page;
	  user_arbitrations.item.ttl = '';
	  user_arbitrations.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  user_arbitrations.item.sbttl = '';
	  
	  user_arbitrations.item.id = user_arbitrations.item.arbitration_id; 
	  
	  user_arbitrations.item.sbttl = user_arbitrations.item.plaintiff_description;
	  user_arbitrations.item.sbttl = user_arbitrations.item.plaintiff_wishes;
	  user_arbitrations.item.sbttl = user_arbitrations.item.defendant_description;
	  user_arbitrations.item.sbttl = user_arbitrations.item.defendant_wishes;
	  user_arbitrations.item.sbttl = user_arbitrations.item.analysis;
      await _dbRepository.saveOrUpdateUserArbitrationsList1(user_arbitrations);
    }

  }


  Future<UserArbitrationsListingModel> loadUserArbitrationsList( String searchKey, DBRepository _dbRepository) async{
    UserArbitrationsListingModel appList = await _dbRepository.loadUserArbitrationsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadUserArbitrationsList1(searchKey)) ;
    return appList;
  }






  

