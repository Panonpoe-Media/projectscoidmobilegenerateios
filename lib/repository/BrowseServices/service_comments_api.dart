part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldServiceCommentsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listServiceCommentsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyServiceCommentsListDB(DBRepository _dbRepository) async {
    var service_comments;
    service_comments = await _dbRepository.loadServiceCommentsList1('');
    if ((service_comments != null) || (service_comments != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ServiceCommentsListingModel?> getServiceCommentsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ServiceCommentsListingModel? service_comments ;

   if(page == 1){
			//await _dbRepository.deleteAllServiceCommentsList1();
            service_comments = await _apiProvider.getListServiceComments(url, page)
                  .then((responseServiceCommentsList) {
                    _loadAndSaveServiceCommentsList1(responseServiceCommentsList, '', page, _dbRepository);
					return responseServiceCommentsList;
                  });
   }else{
      service_comments = await _apiProvider.getListServiceComments(url, page)
                  .then((responseServiceCommentsList) {
				  try{
				      return  _loadAndSaveServiceCommentsList(responseServiceCommentsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return service_comments;
	}

Future<ServiceCommentsListingModel> getServiceCommentsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ServiceCommentsListingModel service_comments ;   
  service_comments = await _apiProvider.getListServiceComments(url, page)
		  .then((responseServiceCommentsList) {
			return  _loadAndSaveServiceCommentsListSearch(responseServiceCommentsList, '', page);
		  }); 
  return service_comments;
}



Future<ServiceCommentsListingModel> _loadAndSaveServiceCommentsListSearch(ServiceCommentsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.user_photo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.user_user_name;
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
    }
    return list;
 }

Future<ServiceCommentsListingModel> _loadAndSaveServiceCommentsList(ServiceCommentsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ServiceCommentsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateServiceCommentsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemServiceCommentsModel service_comments;
      service_comments = list.items.items[i];
      service_comments.item.cnt = i ;
      service_comments.item.age = age;
      service_comments.item.page = page;
	  service_comments.item.ttl = '';
	  service_comments.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  service_comments.item.sbttl = '';
	  
	  service_comments.item.id = service_comments.item.service_post_id; 
	  
	  service_comments.item.pht = service_comments.item.user_photo_url;
	  service_comments.item.ttl = service_comments.item.user_user_name;
	  service_comments.item.sbttl = service_comments.item.message;
      await _dbRepository.saveOrUpdateServiceCommentsList1(service_comments);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadServiceCommentsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveServiceCommentsList1(ServiceCommentsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ServiceCommentsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateServiceCommentsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemServiceCommentsModel service_comments;
      service_comments = list.items.items[i];
      service_comments.item.cnt = i ;
      service_comments.item.age = age;
      service_comments.item.page = page;
	  service_comments.item.ttl = '';
	  service_comments.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  service_comments.item.sbttl = '';
	  
	  service_comments.item.id = service_comments.item.service_post_id; 
	  
	  service_comments.item.pht = service_comments.item.user_photo_url;
	  service_comments.item.ttl = service_comments.item.user_user_name;
	  service_comments.item.sbttl = service_comments.item.message;
      await _dbRepository.saveOrUpdateServiceCommentsList1(service_comments);
    }

  }


  Future<ServiceCommentsListingModel> loadServiceCommentsList( String searchKey, DBRepository _dbRepository) async{
    ServiceCommentsListingModel appList = await _dbRepository.loadServiceCommentsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadServiceCommentsList1(searchKey)) ;
    return appList;
  }






  

