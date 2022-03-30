part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldServicesList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listServicesAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyServicesListDB(DBRepository _dbRepository) async {
    var services;
    services = await _dbRepository.loadServicesList1('');
    if ((services != null) || (services != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ServicesListingModel?> getServicesList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ServicesListingModel? services ;

   if(page == 1){
			//await _dbRepository.deleteAllServicesList1();
            services = await _apiProvider.getListServices(url, page)
                  .then((responseServicesList) {
                    _loadAndSaveServicesList1(responseServicesList, '', page, _dbRepository);
					return responseServicesList;
                  });
   }else{
      services = await _apiProvider.getListServices(url, page)
                  .then((responseServicesList) {
				  try{
				      return  _loadAndSaveServicesList(responseServicesList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return services;
	}

Future<ServicesListingModel> getServicesListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ServicesListingModel services ;   
  services = await _apiProvider.getListServices(url, page)
		  .then((responseServicesList) {
			return  _loadAndSaveServicesListSearch(responseServicesList, '', page);
		  }); 
  return services;
}



Future<ServicesListingModel> _loadAndSaveServicesListSearch(ServicesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.logo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.title;
	  list.items.items[i].item.sbttl = list.items.items[i].item.short_description;
    }
    return list;
 }

Future<ServicesListingModel> _loadAndSaveServicesList(ServicesListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ServicesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateServicesListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemServicesModel services;
      services = list.items.items[i];
      services.item.cnt = i ;
      services.item.age = age;
      services.item.page = page;
	  services.item.ttl = '';
	  services.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  services.item.sbttl = '';
	  
	  services.item.id = services.item.service_id; 
	  
	  services.item.pht = services.item.logo_url;
	  services.item.ttl = services.item.title;
	  services.item.sbttl = services.item.short_description;
      await _dbRepository.saveOrUpdateServicesList1(services);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadServicesList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveServicesList1(ServicesListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ServicesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateServicesListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemServicesModel services;
      services = list.items.items[i];
      services.item.cnt = i ;
      services.item.age = age;
      services.item.page = page;
	  services.item.ttl = '';
	  services.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  services.item.sbttl = '';
	  
	  services.item.id = services.item.service_id; 
	  
	  services.item.pht = services.item.logo_url;
	  services.item.ttl = services.item.title;
	  services.item.sbttl = services.item.short_description;
      await _dbRepository.saveOrUpdateServicesList1(services);
    }

  }


  Future<ServicesListingModel> loadServicesList( String searchKey, DBRepository _dbRepository) async{
    ServicesListingModel appList = await _dbRepository.loadServicesListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadServicesList1(searchKey)) ;
    return appList;
  }






  

