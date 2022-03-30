part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldShowFilesList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listShowFilesAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyShowFilesListDB(DBRepository _dbRepository) async {
    var show_files;
    show_files = await _dbRepository.loadShowFilesList1('');
    if ((show_files != null) || (show_files != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ShowFilesListingModel?> getShowFilesList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShowFilesListingModel? show_files ;

   if(page == 1){
			//await _dbRepository.deleteAllShowFilesList1();
            show_files = await _apiProvider.getListShowFiles(url, page)
                  .then((responseShowFilesList) {
                    _loadAndSaveShowFilesList1(responseShowFilesList, '', page, _dbRepository);
					return responseShowFilesList;
                  });
   }else{
      show_files = await _apiProvider.getListShowFiles(url, page)
                  .then((responseShowFilesList) {
				  try{
				      return  _loadAndSaveShowFilesList(responseShowFilesList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return show_files;
	}

Future<ShowFilesListingModel> getShowFilesListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShowFilesListingModel show_files ;   
  show_files = await _apiProvider.getListShowFiles(url, page)
		  .then((responseShowFilesList) {
			return  _loadAndSaveShowFilesListSearch(responseShowFilesList, '', page);
		  }); 
  return show_files;
}



Future<ShowFilesListingModel> _loadAndSaveShowFilesListSearch(ShowFilesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
    }
    return list;
 }

Future<ShowFilesListingModel> _loadAndSaveShowFilesList(ShowFilesListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShowFilesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShowFilesListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShowFilesModel show_files;
      show_files = list.items.items[i];
      show_files.item.cnt = i ;
      show_files.item.age = age;
      show_files.item.page = page;
	  show_files.item.ttl = '';
	  show_files.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  show_files.item.sbttl = '';
	  
	  show_files.item.id = show_files.item.post_id; 
	  
	  show_files.item.sbttl = show_files.item.message;
      await _dbRepository.saveOrUpdateShowFilesList1(show_files);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShowFilesList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveShowFilesList1(ShowFilesListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShowFilesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShowFilesListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShowFilesModel show_files;
      show_files = list.items.items[i];
      show_files.item.cnt = i ;
      show_files.item.age = age;
      show_files.item.page = page;
	  show_files.item.ttl = '';
	  show_files.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  show_files.item.sbttl = '';
	  
	  show_files.item.id = show_files.item.post_id; 
	  
	  show_files.item.sbttl = show_files.item.message;
      await _dbRepository.saveOrUpdateShowFilesList1(show_files);
    }

  }


  Future<ShowFilesListingModel> loadShowFilesList( String searchKey, DBRepository _dbRepository) async{
    ShowFilesListingModel appList = await _dbRepository.loadShowFilesListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShowFilesList1(searchKey)) ;
    return appList;
  }






  

