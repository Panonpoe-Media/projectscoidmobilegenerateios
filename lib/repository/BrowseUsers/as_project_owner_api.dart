part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldAsProjectOwnerList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listAsProjectOwnerAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyAsProjectOwnerListDB(DBRepository _dbRepository) async {
    var as_project_owner;
    as_project_owner = await _dbRepository.loadAsProjectOwnerList1('');
    if ((as_project_owner != null) || (as_project_owner != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<AsProjectOwnerListingModel?> getAsProjectOwnerList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  AsProjectOwnerListingModel? as_project_owner ;

   if(page == 1){
			//await _dbRepository.deleteAllAsProjectOwnerList1();
            as_project_owner = await _apiProvider.getListAsProjectOwner(url, page)
                  .then((responseAsProjectOwnerList) {
                    _loadAndSaveAsProjectOwnerList1(responseAsProjectOwnerList, '', page, _dbRepository);
					return responseAsProjectOwnerList;
                  });
   }else{
      as_project_owner = await _apiProvider.getListAsProjectOwner(url, page)
                  .then((responseAsProjectOwnerList) {
				  try{
				      return  _loadAndSaveAsProjectOwnerList(responseAsProjectOwnerList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return as_project_owner;
	}

Future<AsProjectOwnerListingModel> getAsProjectOwnerListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  AsProjectOwnerListingModel as_project_owner ;   
  as_project_owner = await _apiProvider.getListAsProjectOwner(url, page)
		  .then((responseAsProjectOwnerList) {
			return  _loadAndSaveAsProjectOwnerListSearch(responseAsProjectOwnerList, '', page);
		  }); 
  return as_project_owner;
}



Future<AsProjectOwnerListingModel> _loadAndSaveAsProjectOwnerListSearch(AsProjectOwnerListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.owner_feedback;
	  list.items.items[i].item.ttl = list.items.items[i].item.title;
    }
    return list;
 }

Future<AsProjectOwnerListingModel> _loadAndSaveAsProjectOwnerList(AsProjectOwnerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    AsProjectOwnerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateAsProjectOwnerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemAsProjectOwnerModel as_project_owner;
      as_project_owner = list.items.items[i];
      as_project_owner.item.cnt = i ;
      as_project_owner.item.age = age;
      as_project_owner.item.page = page;
	  as_project_owner.item.ttl = '';
	  as_project_owner.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  as_project_owner.item.sbttl = '';
	  
	  as_project_owner.item.id = as_project_owner.item.project_id; 
	  
	  as_project_owner.item.sbttl = as_project_owner.item.owner_feedback;
	  as_project_owner.item.ttl = as_project_owner.item.title;
      await _dbRepository.saveOrUpdateAsProjectOwnerList1(as_project_owner);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadAsProjectOwnerList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveAsProjectOwnerList1(AsProjectOwnerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    AsProjectOwnerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateAsProjectOwnerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemAsProjectOwnerModel as_project_owner;
      as_project_owner = list.items.items[i];
      as_project_owner.item.cnt = i ;
      as_project_owner.item.age = age;
      as_project_owner.item.page = page;
	  as_project_owner.item.ttl = '';
	  as_project_owner.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  as_project_owner.item.sbttl = '';
	  
	  as_project_owner.item.id = as_project_owner.item.project_id; 
	  
	  as_project_owner.item.sbttl = as_project_owner.item.owner_feedback;
	  as_project_owner.item.ttl = as_project_owner.item.title;
      await _dbRepository.saveOrUpdateAsProjectOwnerList1(as_project_owner);
    }

  }


  Future<AsProjectOwnerListingModel> loadAsProjectOwnerList( String searchKey, DBRepository _dbRepository) async{
    AsProjectOwnerListingModel appList = await _dbRepository.loadAsProjectOwnerListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadAsProjectOwnerList1(searchKey)) ;
    return appList;
  }






  

