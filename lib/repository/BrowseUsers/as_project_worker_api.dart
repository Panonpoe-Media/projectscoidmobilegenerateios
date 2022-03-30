part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldAsProjectWorkerList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listAsProjectWorkerAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyAsProjectWorkerListDB(DBRepository _dbRepository) async {
    var as_project_worker;
    as_project_worker = await _dbRepository.loadAsProjectWorkerList1('');
    if ((as_project_worker != null) || (as_project_worker != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<AsProjectWorkerListingModel?> getAsProjectWorkerList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  AsProjectWorkerListingModel? as_project_worker ;

   if(page == 1){
			//await _dbRepository.deleteAllAsProjectWorkerList1();
            as_project_worker = await _apiProvider.getListAsProjectWorker(url, page)
                  .then((responseAsProjectWorkerList) {
                    _loadAndSaveAsProjectWorkerList1(responseAsProjectWorkerList, '', page, _dbRepository);
					return responseAsProjectWorkerList;
                  });
   }else{
      as_project_worker = await _apiProvider.getListAsProjectWorker(url, page)
                  .then((responseAsProjectWorkerList) {
				  try{
				      return  _loadAndSaveAsProjectWorkerList(responseAsProjectWorkerList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return as_project_worker;
	}

Future<AsProjectWorkerListingModel> getAsProjectWorkerListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  AsProjectWorkerListingModel as_project_worker ;   
  as_project_worker = await _apiProvider.getListAsProjectWorker(url, page)
		  .then((responseAsProjectWorkerList) {
			return  _loadAndSaveAsProjectWorkerListSearch(responseAsProjectWorkerList, '', page);
		  }); 
  return as_project_worker;
}



Future<AsProjectWorkerListingModel> _loadAndSaveAsProjectWorkerListSearch(AsProjectWorkerListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.worker_feedback;
	  list.items.items[i].item.ttl = list.items.items[i].item.title;
    }
    return list;
 }

Future<AsProjectWorkerListingModel> _loadAndSaveAsProjectWorkerList(AsProjectWorkerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    AsProjectWorkerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateAsProjectWorkerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemAsProjectWorkerModel as_project_worker;
      as_project_worker = list.items.items[i];
      as_project_worker.item.cnt = i ;
      as_project_worker.item.age = age;
      as_project_worker.item.page = page;
	  as_project_worker.item.ttl = '';
	  as_project_worker.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  as_project_worker.item.sbttl = '';
	  
	  as_project_worker.item.id = as_project_worker.item.project_id; 
	  
	  as_project_worker.item.sbttl = as_project_worker.item.worker_feedback;
	  as_project_worker.item.ttl = as_project_worker.item.title;
      await _dbRepository.saveOrUpdateAsProjectWorkerList1(as_project_worker);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadAsProjectWorkerList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveAsProjectWorkerList1(AsProjectWorkerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    AsProjectWorkerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateAsProjectWorkerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemAsProjectWorkerModel as_project_worker;
      as_project_worker = list.items.items[i];
      as_project_worker.item.cnt = i ;
      as_project_worker.item.age = age;
      as_project_worker.item.page = page;
	  as_project_worker.item.ttl = '';
	  as_project_worker.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  as_project_worker.item.sbttl = '';
	  
	  as_project_worker.item.id = as_project_worker.item.project_id; 
	  
	  as_project_worker.item.sbttl = as_project_worker.item.worker_feedback;
	  as_project_worker.item.ttl = as_project_worker.item.title;
      await _dbRepository.saveOrUpdateAsProjectWorkerList1(as_project_worker);
    }

  }


  Future<AsProjectWorkerListingModel> loadAsProjectWorkerList( String searchKey, DBRepository _dbRepository) async{
    AsProjectWorkerListingModel appList = await _dbRepository.loadAsProjectWorkerListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadAsProjectWorkerList1(searchKey)) ;
    return appList;
  }






  

