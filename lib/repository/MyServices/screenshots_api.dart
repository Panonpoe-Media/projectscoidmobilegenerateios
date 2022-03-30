part of 'package:projectscoid/repository/APIRepository.dart';
/** AUTOGENERATE OFF **/
 Future<bool> isOldScreenshotsList3(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listScreenshotsAge4();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyScreenshotsListDB3(DBRepository _dbRepository) async {
    var screenshots;
    screenshots = await _dbRepository.loadScreenshotsList4('');
    if ((screenshots != null) || (screenshots != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ScreenshotsListingModel?> getScreenshotsList3(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ScreenshotsListingModel? screenshots ;

   if(page == 1){
			//await _dbRepository.deleteAllScreenshotsList1();
            screenshots = await _apiProvider.getListScreenshots(url, page)
                  .then((responseScreenshotsList) {
                    _loadAndSaveScreenshotsList13(responseScreenshotsList, '', page, _dbRepository);
					return responseScreenshotsList;
                  });
   }else{
      screenshots = await _apiProvider.getListScreenshots(url, page)
                  .then((responseScreenshotsList) {
				  try{
				      return  _loadAndSaveScreenshotsList3A(responseScreenshotsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return screenshots;
	}

Future<ScreenshotsListingModel> getScreenshotsListSearch3(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ScreenshotsListingModel screenshots ;   
  screenshots = await _apiProvider.getListScreenshots(url, page)
		  .then((responseScreenshotsList) {
			return  _loadAndSaveScreenshotsListSearch3(responseScreenshotsList, '', page);
		  }); 
  return screenshots;
}



Future<ScreenshotsListingModel> _loadAndSaveScreenshotsListSearch3(ScreenshotsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.description;
	  list.items.items[i].item.pht = list.items.items[i].item.image_url;
    }
    return list;
 }

Future<ScreenshotsListingModel> _loadAndSaveScreenshotsList3A(ScreenshotsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ScreenshotsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateScreenshotsListInfo4(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemScreenshotsModel screenshots;
      screenshots = list.items.items[i];
      screenshots.item.cnt = i ;
      screenshots.item.age = age;
      screenshots.item.page = page;
	  screenshots.item.ttl = '';
	  screenshots.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  screenshots.item.sbttl = '';
	  
	  screenshots.item.id = screenshots.item.service_images_id; 
	  
	  screenshots.item.sbttl = screenshots.item.description;
	  screenshots.item.pht = screenshots.item.image_url;
      await _dbRepository.saveOrUpdateScreenshotsList4(screenshots);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadScreenshotsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveScreenshotsList13(ScreenshotsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ScreenshotsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateScreenshotsListInfo4(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemScreenshotsModel screenshots;
      screenshots = list.items.items[i];
      screenshots.item.cnt = i ;
      screenshots.item.age = age;
      screenshots.item.page = page;
	  screenshots.item.ttl = '';
	  screenshots.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  screenshots.item.sbttl = '';
	  
	  screenshots.item.id = screenshots.item.service_images_id; 
	  
	  screenshots.item.sbttl = screenshots.item.description;
	  screenshots.item.pht = screenshots.item.image_url;
      await _dbRepository.saveOrUpdateScreenshotsList4(screenshots);
    }

  }


  Future<ScreenshotsListingModel> loadScreenshotsList3( String searchKey, DBRepository _dbRepository) async{
    ScreenshotsListingModel appList = await _dbRepository.loadScreenshotsListInfo4('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadScreenshotsList4(searchKey)) ;
    return appList;
  }






  

