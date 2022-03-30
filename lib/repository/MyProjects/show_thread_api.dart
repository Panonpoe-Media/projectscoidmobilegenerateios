part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldShowThreadList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listShowThreadAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyShowThreadListDB(DBRepository _dbRepository) async {
    var show_thread;
    show_thread = await _dbRepository.loadShowThreadList1('');
    if ((show_thread != null) || (show_thread != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ShowThreadListingModel?> getShowThreadList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShowThreadListingModel? show_thread ;

   if(page == 1){
			//await _dbRepository.deleteAllShowThreadList1();
            show_thread = await _apiProvider.getListShowThread(url, page)
                  .then((responseShowThreadList) {
                    _loadAndSaveShowThreadList1(responseShowThreadList, '', page, _dbRepository);
					return responseShowThreadList;
                  });
   }else{
      show_thread = await _apiProvider.getListShowThread(url, page)
                  .then((responseShowThreadList) {
				  try{
				      return  _loadAndSaveShowThreadList(responseShowThreadList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return show_thread;
	}

Future<ShowThreadListingModel> getShowThreadListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShowThreadListingModel show_thread ;   
  show_thread = await _apiProvider.getListShowThread(url, page)
		  .then((responseShowThreadList) {
			return  _loadAndSaveShowThreadListSearch(responseShowThreadList, '', page);
		  }); 
  return show_thread;
}



Future<ShowThreadListingModel> _loadAndSaveShowThreadListSearch(ShowThreadListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
	  list.items.items[i].item.pht = list.items.items[i].item.user_photo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.user_user_name;
    }
    return list;
 }

Future<ShowThreadListingModel> _loadAndSaveShowThreadList(ShowThreadListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShowThreadListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShowThreadListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShowThreadModel show_thread;
      show_thread = list.items.items[i];
      show_thread.item.cnt = i ;
      show_thread.item.age = age;
      show_thread.item.page = page;
	  show_thread.item.ttl = '';
	  show_thread.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  show_thread.item.sbttl = '';
	  
	  show_thread.item.id = show_thread.item.post_id; 
	  
	  show_thread.item.sbttl = show_thread.item.message;
	  show_thread.item.pht = show_thread.item.user_photo_url;
	  show_thread.item.ttl = show_thread.item.user_user_name;
      await _dbRepository.saveOrUpdateShowThreadList1(show_thread);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShowThreadList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveShowThreadList1(ShowThreadListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShowThreadListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShowThreadListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShowThreadModel show_thread;
      show_thread = list.items.items[i];
      show_thread.item.cnt = i ;
      show_thread.item.age = age;
      show_thread.item.page = page;
	  show_thread.item.ttl = '';
	  show_thread.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  show_thread.item.sbttl = '';
	  
	  show_thread.item.id = show_thread.item.post_id; 
	  
	  show_thread.item.sbttl = show_thread.item.message;
	  show_thread.item.pht = show_thread.item.user_photo_url;
	  show_thread.item.ttl = show_thread.item.user_user_name;
      await _dbRepository.saveOrUpdateShowThreadList1(show_thread);
    }

  }


  Future<ShowThreadListingModel> loadShowThreadList( String searchKey, DBRepository _dbRepository) async{
    ShowThreadListingModel appList = await _dbRepository.loadShowThreadListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShowThreadList1(searchKey)) ;
    return appList;
  }






  

