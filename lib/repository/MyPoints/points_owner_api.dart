part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldPointsOwnerList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listPointsOwnerAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPointsOwnerListDB(DBRepository _dbRepository) async {
    var points_owner;
    points_owner = await _dbRepository.loadPointsOwnerList1('');
    if ((points_owner != null) || (points_owner != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<PointsOwnerListingModel?> getPointsOwnerList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsOwnerListingModel? points_owner ;

   if(page == 1){
			//await _dbRepository.deleteAllPointsOwnerList1();
            points_owner = await _apiProvider.getListPointsOwner(url, page)
                  .then((responsePointsOwnerList) {
                    _loadAndSavePointsOwnerList1(responsePointsOwnerList, '', page, _dbRepository);
					return responsePointsOwnerList;
                  });
   }else{
      points_owner = await _apiProvider.getListPointsOwner(url, page)
                  .then((responsePointsOwnerList) {
				  try{
				      return  _loadAndSavePointsOwnerList(responsePointsOwnerList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return points_owner;
	}

Future<PointsOwnerListingModel> getPointsOwnerListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsOwnerListingModel points_owner ;   
  points_owner = await _apiProvider.getListPointsOwner(url, page)
		  .then((responsePointsOwnerList) {
			return  _loadAndSavePointsOwnerListSearch(responsePointsOwnerList, '', page);
		  }); 
  return points_owner;
}



Future<PointsOwnerListingModel> _loadAndSavePointsOwnerListSearch(PointsOwnerListingModel list, String searchKey, int page) async{

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

Future<PointsOwnerListingModel> _loadAndSavePointsOwnerList(PointsOwnerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsOwnerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsOwnerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsOwnerModel points_owner;
      points_owner = list.items.items[i];
      points_owner.item.cnt = i ;
      points_owner.item.age = age;
      points_owner.item.page = page;
	  points_owner.item.ttl = '';
	  points_owner.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_owner.item.sbttl = '';
	  
	  points_owner.item.id = points_owner.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsOwnerList1(points_owner);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsOwnerList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSavePointsOwnerList1(PointsOwnerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsOwnerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsOwnerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsOwnerModel points_owner;
      points_owner = list.items.items[i];
      points_owner.item.cnt = i ;
      points_owner.item.age = age;
      points_owner.item.page = page;
	  points_owner.item.ttl = '';
	  points_owner.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_owner.item.sbttl = '';
	  
	  points_owner.item.id = points_owner.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsOwnerList1(points_owner);
    }

  }


  Future<PointsOwnerListingModel> loadPointsOwnerList( String searchKey, DBRepository _dbRepository) async{
    PointsOwnerListingModel appList = await _dbRepository.loadPointsOwnerListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsOwnerList1(searchKey)) ;
    return appList;
  }






  

