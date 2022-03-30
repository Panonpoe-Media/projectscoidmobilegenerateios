part of 'package:projectscoid/repository/APIRepository.dart';
/** AUTOGENERATE OFF **/
 Future<bool> isOldScreenshotsList2(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listScreenshotsAge3();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyScreenshotsListDB2(DBRepository _dbRepository) async {
    var screenshots;
    screenshots = await _dbRepository.loadScreenshotsList3('');
    if ((screenshots != null) || (screenshots != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ScreenshotsListingModel?> getScreenshotsList2(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ScreenshotsListingModel? screenshots ;

   if(page == 1){
			//await _dbRepository.deleteAllScreenshotsList1();
            screenshots = await _apiProvider.getListScreenshots(url, page)
                  .then((responseScreenshotsList) {
                    _loadAndSaveScreenshotsList12(responseScreenshotsList, '', page, _dbRepository);
					return responseScreenshotsList;
                  });
   }else{
      screenshots = await _apiProvider.getListScreenshots(url, page)
                  .then((responseScreenshotsList) {
				  try{
				      return  _loadAndSaveScreenshotsList2A(responseScreenshotsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return screenshots;
	}

Future<ScreenshotsListingModel> getScreenshotsListSearch2(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ScreenshotsListingModel screenshots ;   
  screenshots = await _apiProvider.getListScreenshots(url, page)
		  .then((responseScreenshotsList) {
			return  _loadAndSaveScreenshotsListSearch2(responseScreenshotsList, '', page);
		  }); 
  return screenshots;
}



Future<ScreenshotsListingModel> _loadAndSaveScreenshotsListSearch2(ScreenshotsListingModel list, String searchKey, int page) async{

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

Future<ScreenshotsListingModel> _loadAndSaveScreenshotsList2A(ScreenshotsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ScreenshotsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateScreenshotsListInfo3(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemScreenshotsModel screenshots;
      screenshots = list.items.items[i];
      screenshots.item.cnt = i ;
      screenshots.item.age = age;
      screenshots.item.page = page;
	  screenshots.item.ttl = '';
	  screenshots.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  screenshots.item.sbttl = '';
	  
	  screenshots.item.id = screenshots.item.product_images_id; 
	  
	  screenshots.item.sbttl = screenshots.item.description;
	  screenshots.item.pht = screenshots.item.image_url;
      await _dbRepository.saveOrUpdateScreenshotsList1(screenshots);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadScreenshotsList3(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveScreenshotsList12(ScreenshotsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
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
	  
	  screenshots.item.id = screenshots.item.product_images_id; 
	  
	  screenshots.item.sbttl = screenshots.item.description;
	  screenshots.item.pht = screenshots.item.image_url;
      await _dbRepository.saveOrUpdateScreenshotsList3(screenshots);
    }

  }


  Future<ScreenshotsListingModel> loadScreenshotsList2( String searchKey, DBRepository _dbRepository) async{
    ScreenshotsListingModel appList = await _dbRepository.loadScreenshotsListInfo3('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadScreenshotsList3(searchKey)) ;
    return appList;
  }






  

