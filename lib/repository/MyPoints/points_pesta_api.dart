part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldPointsPestaList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listPointsPestaAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPointsPestaListDB(DBRepository _dbRepository) async {
    var points_pesta;
    points_pesta = await _dbRepository.loadPointsPestaList1('');
    if ((points_pesta != null) || (points_pesta != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<PointsPestaListingModel?> getPointsPestaList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsPestaListingModel? points_pesta ;

   if(page == 1){
			//await _dbRepository.deleteAllPointsPestaList1();
            points_pesta = await _apiProvider.getListPointsPesta(url, page)
                  .then((responsePointsPestaList) {
                    _loadAndSavePointsPestaList1(responsePointsPestaList, '', page, _dbRepository);
					return responsePointsPestaList;
                  });
   }else{
      points_pesta = await _apiProvider.getListPointsPesta(url, page)
                  .then((responsePointsPestaList) {
				  try{
				      return  _loadAndSavePointsPestaList(responsePointsPestaList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return points_pesta;
	}

Future<PointsPestaListingModel> getPointsPestaListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsPestaListingModel points_pesta ;   
  points_pesta = await _apiProvider.getListPointsPesta(url, page)
		  .then((responsePointsPestaList) {
			return  _loadAndSavePointsPestaListSearch(responsePointsPestaList, '', page);
		  }); 
  return points_pesta;
}



Future<PointsPestaListingModel> _loadAndSavePointsPestaListSearch(PointsPestaListingModel list, String searchKey, int page) async{

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

Future<PointsPestaListingModel> _loadAndSavePointsPestaList(PointsPestaListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsPestaListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsPestaListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsPestaModel points_pesta;
      points_pesta = list.items.items[i];
      points_pesta.item.cnt = i ;
      points_pesta.item.age = age;
      points_pesta.item.page = page;
	  points_pesta.item.ttl = '';
	  points_pesta.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_pesta.item.sbttl = '';
	  
	  points_pesta.item.id = points_pesta.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsPestaList1(points_pesta);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsPestaList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSavePointsPestaList1(PointsPestaListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsPestaListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsPestaListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsPestaModel points_pesta;
      points_pesta = list.items.items[i];
      points_pesta.item.cnt = i ;
      points_pesta.item.age = age;
      points_pesta.item.page = page;
	  points_pesta.item.ttl = '';
	  points_pesta.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_pesta.item.sbttl = '';
	  
	  points_pesta.item.id = points_pesta.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsPestaList1(points_pesta);
    }

  }


  Future<PointsPestaListingModel> loadPointsPestaList( String searchKey, DBRepository _dbRepository) async{
    PointsPestaListingModel appList = await _dbRepository.loadPointsPestaListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsPestaList1(searchKey)) ;
    return appList;
  }






  

