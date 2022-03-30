part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldPointsWorkerList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listPointsWorkerAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPointsWorkerListDB(DBRepository _dbRepository) async {
    var points_worker;
    points_worker = await _dbRepository.loadPointsWorkerList1('');
    if ((points_worker != null) || (points_worker != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<PointsWorkerListingModel?> getPointsWorkerList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsWorkerListingModel? points_worker ;

   if(page == 1){
			//await _dbRepository.deleteAllPointsWorkerList1();
            points_worker = await _apiProvider.getListPointsWorker(url, page)
                  .then((responsePointsWorkerList) {
                    _loadAndSavePointsWorkerList1(responsePointsWorkerList, '', page, _dbRepository);
					return responsePointsWorkerList;
                  });
   }else{
      points_worker = await _apiProvider.getListPointsWorker(url, page)
                  .then((responsePointsWorkerList) {
				  try{
				      return  _loadAndSavePointsWorkerList(responsePointsWorkerList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return points_worker;
	}

Future<PointsWorkerListingModel> getPointsWorkerListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsWorkerListingModel points_worker ;   
  points_worker = await _apiProvider.getListPointsWorker(url, page)
		  .then((responsePointsWorkerList) {
			return  _loadAndSavePointsWorkerListSearch(responsePointsWorkerList, '', page);
		  }); 
  return points_worker;
}



Future<PointsWorkerListingModel> _loadAndSavePointsWorkerListSearch(PointsWorkerListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
    }
    return list;
 }

Future<PointsWorkerListingModel> _loadAndSavePointsWorkerList(PointsWorkerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsWorkerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsWorkerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsWorkerModel points_worker;
      points_worker = list.items.items[i];
      points_worker.item.cnt = i ;
      points_worker.item.age = age;
      points_worker.item.page = page;
	  points_worker.item.ttl = '';
	  points_worker.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_worker.item.sbttl = '';
	  
	  points_worker.item.id = points_worker.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsWorkerList1(points_worker);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsWorkerList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSavePointsWorkerList1(PointsWorkerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsWorkerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsWorkerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsWorkerModel points_worker;
      points_worker = list.items.items[i];
      points_worker.item.cnt = i ;
      points_worker.item.age = age;
      points_worker.item.page = page;
	  points_worker.item.ttl = '';
	  points_worker.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_worker.item.sbttl = '';
	  
	  points_worker.item.id = points_worker.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsWorkerList1(points_worker);
    }

  }


  Future<PointsWorkerListingModel> loadPointsWorkerList( String searchKey, DBRepository _dbRepository) async{
    PointsWorkerListingModel appList = await _dbRepository.loadPointsWorkerListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsWorkerList1(searchKey)) ;
    return appList;
  }






  

