part of 'package:projectscoid/repository/APIRepository.dart';
/** AUTOGENERATE OFF **/
 Future<bool> isOldScreenshotsList1(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listScreenshotsAge2();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyScreenshotsListDB1(DBRepository _dbRepository) async {
    var screenshots;
    screenshots = await _dbRepository.loadScreenshotsList2('');
    if ((screenshots != null) || (screenshots != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ScreenshotsListingModel?> getScreenshotsList1(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ScreenshotsListingModel? screenshots ;

   if(page == 1){
			//await _dbRepository.deleteAllScreenshotsList1();
            screenshots = await _apiProvider.getListScreenshots(url, page)
                  .then((responseScreenshotsList) {
                    _loadAndSaveScreenshotsList11(responseScreenshotsList, '', page, _dbRepository);
					return responseScreenshotsList;
                  });
   }else{
      screenshots = await _apiProvider.getListScreenshots(url, page)
                  .then((responseScreenshotsList) {
				  try{
				      return  _loadAndSaveScreenshotsList1A(responseScreenshotsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return screenshots;
	}

Future<ScreenshotsListingModel> getScreenshotsListSearch1(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ScreenshotsListingModel screenshots ;   
  screenshots = await _apiProvider.getListScreenshots(url, page)
		  .then((responseScreenshotsList) {
			return  _loadAndSaveScreenshotsListSearch(responseScreenshotsList, '', page);
		  }); 
  return screenshots;
}



Future<ScreenshotsListingModel> _loadAndSaveScreenshotsListSearch1(ScreenshotsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.image_url;
	  list.items.items[i].item.sbttl = list.items.items[i].item.description;
    }
    return list;
 }

Future<ScreenshotsListingModel> _loadAndSaveScreenshotsList1A(ScreenshotsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ScreenshotsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateScreenshotsListInfo2(list);
	
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
	  
	  screenshots.item.pht = screenshots.item.image_url;
	  screenshots.item.sbttl = screenshots.item.description;
      await _dbRepository.saveOrUpdateScreenshotsList2(screenshots);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadScreenshotsList2(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveScreenshotsList11(ScreenshotsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ScreenshotsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateScreenshotsListInfo1(list);
	
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
	  
	  screenshots.item.pht = screenshots.item.image_url;
	  screenshots.item.sbttl = screenshots.item.description;
      await _dbRepository.saveOrUpdateScreenshotsList2(screenshots);
    }

  }


  Future<ScreenshotsListingModel> loadScreenshotsList1( String searchKey, DBRepository _dbRepository) async{
    ScreenshotsListingModel appList = await _dbRepository.loadScreenshotsListInfo2('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadScreenshotsList2(searchKey)) ;
    return appList;
  }






  

