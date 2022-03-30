part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldServiceReviewsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listServiceReviewsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyServiceReviewsListDB(DBRepository _dbRepository) async {
    var service_reviews;
    service_reviews = await _dbRepository.loadServiceReviewsList1('');
    if ((service_reviews != null) || (service_reviews != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ServiceReviewsListingModel?> getServiceReviewsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ServiceReviewsListingModel? service_reviews ;

   if(page == 1){
			//await _dbRepository.deleteAllServiceReviewsList1();
            service_reviews = await _apiProvider.getListServiceReviews(url, page)
                  .then((responseServiceReviewsList) {
                    _loadAndSaveServiceReviewsList1(responseServiceReviewsList, '', page, _dbRepository);
					return responseServiceReviewsList;
                  });
   }else{
      service_reviews = await _apiProvider.getListServiceReviews(url, page)
                  .then((responseServiceReviewsList) {
				  try{
				      return  _loadAndSaveServiceReviewsList(responseServiceReviewsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return service_reviews;
	}

Future<ServiceReviewsListingModel> getServiceReviewsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ServiceReviewsListingModel service_reviews ;   
  service_reviews = await _apiProvider.getListServiceReviews(url, page)
		  .then((responseServiceReviewsList) {
			return  _loadAndSaveServiceReviewsListSearch(responseServiceReviewsList, '', page);
		  }); 
  return service_reviews;
}



Future<ServiceReviewsListingModel> _loadAndSaveServiceReviewsListSearch(ServiceReviewsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.worker_feedback;
	  list.items.items[i].item.pht = list.items.items[i].item.owner_photo_url;
    }
    return list;
 }

Future<ServiceReviewsListingModel> _loadAndSaveServiceReviewsList(ServiceReviewsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ServiceReviewsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateServiceReviewsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemServiceReviewsModel service_reviews;
      service_reviews = list.items.items[i];
      service_reviews.item.cnt = i ;
      service_reviews.item.age = age;
      service_reviews.item.page = page;
	  service_reviews.item.ttl = '';
	  service_reviews.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  service_reviews.item.sbttl = '';
	  
	  service_reviews.item.id = service_reviews.item.project_id; 
	  
	  service_reviews.item.sbttl = service_reviews.item.worker_feedback;
	  service_reviews.item.pht = service_reviews.item.owner_photo_url;
      await _dbRepository.saveOrUpdateServiceReviewsList1(service_reviews);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadServiceReviewsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveServiceReviewsList1(ServiceReviewsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ServiceReviewsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateServiceReviewsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemServiceReviewsModel service_reviews;
      service_reviews = list.items.items[i];
      service_reviews.item.cnt = i ;
      service_reviews.item.age = age;
      service_reviews.item.page = page;
	  service_reviews.item.ttl = '';
	  service_reviews.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  service_reviews.item.sbttl = '';
	  
	  service_reviews.item.id = service_reviews.item.project_id; 
	  
	  service_reviews.item.sbttl = service_reviews.item.worker_feedback;
	  service_reviews.item.pht = service_reviews.item.owner_photo_url;
      await _dbRepository.saveOrUpdateServiceReviewsList1(service_reviews);
    }

  }


  Future<ServiceReviewsListingModel> loadServiceReviewsList( String searchKey, DBRepository _dbRepository) async{
    ServiceReviewsListingModel appList = await _dbRepository.loadServiceReviewsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadServiceReviewsList1(searchKey)) ;
    return appList;
  }






  

