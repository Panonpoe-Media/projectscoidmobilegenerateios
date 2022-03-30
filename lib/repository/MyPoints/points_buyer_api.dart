part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldPointsBuyerList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listPointsBuyerAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPointsBuyerListDB(DBRepository _dbRepository) async {
    var points_buyer;
    points_buyer = await _dbRepository.loadPointsBuyerList1('');
    if ((points_buyer != null) || (points_buyer != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<PointsBuyerListingModel?> getPointsBuyerList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsBuyerListingModel? points_buyer ;

   if(page == 1){
			//await _dbRepository.deleteAllPointsBuyerList1();
            points_buyer = await _apiProvider.getListPointsBuyer(url, page)
                  .then((responsePointsBuyerList) {
                    _loadAndSavePointsBuyerList1(responsePointsBuyerList, '', page, _dbRepository);
					return responsePointsBuyerList;
                  });
   }else{
      points_buyer = await _apiProvider.getListPointsBuyer(url, page)
                  .then((responsePointsBuyerList) {
				  try{
				      return  _loadAndSavePointsBuyerList(responsePointsBuyerList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return points_buyer;
	}

Future<PointsBuyerListingModel> getPointsBuyerListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsBuyerListingModel points_buyer ;   
  points_buyer = await _apiProvider.getListPointsBuyer(url, page)
		  .then((responsePointsBuyerList) {
			return  _loadAndSavePointsBuyerListSearch(responsePointsBuyerList, '', page);
		  }); 
  return points_buyer;
}



Future<PointsBuyerListingModel> _loadAndSavePointsBuyerListSearch(PointsBuyerListingModel list, String searchKey, int page) async{

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

Future<PointsBuyerListingModel> _loadAndSavePointsBuyerList(PointsBuyerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsBuyerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsBuyerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsBuyerModel points_buyer;
      points_buyer = list.items.items[i];
      points_buyer.item.cnt = i ;
      points_buyer.item.age = age;
      points_buyer.item.page = page;
	  points_buyer.item.ttl = '';
	  points_buyer.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_buyer.item.sbttl = '';
	  
	  points_buyer.item.id = points_buyer.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsBuyerList1(points_buyer);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsBuyerList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSavePointsBuyerList1(PointsBuyerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsBuyerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsBuyerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsBuyerModel points_buyer;
      points_buyer = list.items.items[i];
      points_buyer.item.cnt = i ;
      points_buyer.item.age = age;
      points_buyer.item.page = page;
	  points_buyer.item.ttl = '';
	  points_buyer.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_buyer.item.sbttl = '';
	  
	  points_buyer.item.id = points_buyer.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsBuyerList1(points_buyer);
    }

  }


  Future<PointsBuyerListingModel> loadPointsBuyerList( String searchKey, DBRepository _dbRepository) async{
    PointsBuyerListingModel appList = await _dbRepository.loadPointsBuyerListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsBuyerList1(searchKey)) ;
    return appList;
  }






  

