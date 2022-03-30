part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldPointsSellerList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listPointsSellerAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPointsSellerListDB(DBRepository _dbRepository) async {
    var points_seller;
    points_seller = await _dbRepository.loadPointsSellerList1('');
    if ((points_seller != null) || (points_seller != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<PointsSellerListingModel?> getPointsSellerList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsSellerListingModel? points_seller ;

   if(page == 1){
			//await _dbRepository.deleteAllPointsSellerList1();
            points_seller = await _apiProvider.getListPointsSeller(url, page)
                  .then((responsePointsSellerList) {
                    _loadAndSavePointsSellerList1(responsePointsSellerList, '', page, _dbRepository);
					return responsePointsSellerList;
                  });
   }else{
      points_seller = await _apiProvider.getListPointsSeller(url, page)
                  .then((responsePointsSellerList) {
				  try{
				      return  _loadAndSavePointsSellerList(responsePointsSellerList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return points_seller;
	}

Future<PointsSellerListingModel> getPointsSellerListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsSellerListingModel points_seller ;   
  points_seller = await _apiProvider.getListPointsSeller(url, page)
		  .then((responsePointsSellerList) {
			return  _loadAndSavePointsSellerListSearch(responsePointsSellerList, '', page);
		  }); 
  return points_seller;
}



Future<PointsSellerListingModel> _loadAndSavePointsSellerListSearch(PointsSellerListingModel list, String searchKey, int page) async{

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

Future<PointsSellerListingModel> _loadAndSavePointsSellerList(PointsSellerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsSellerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsSellerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsSellerModel points_seller;
      points_seller = list.items.items[i];
      points_seller.item.cnt = i ;
      points_seller.item.age = age;
      points_seller.item.page = page;
	  points_seller.item.ttl = '';
	  points_seller.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_seller.item.sbttl = '';
	  
	  points_seller.item.id = points_seller.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsSellerList1(points_seller);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsSellerList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSavePointsSellerList1(PointsSellerListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsSellerListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsSellerListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsSellerModel points_seller;
      points_seller = list.items.items[i];
      points_seller.item.cnt = i ;
      points_seller.item.age = age;
      points_seller.item.page = page;
	  points_seller.item.ttl = '';
	  points_seller.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_seller.item.sbttl = '';
	  
	  points_seller.item.id = points_seller.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsSellerList1(points_seller);
    }

  }


  Future<PointsSellerListingModel> loadPointsSellerList( String searchKey, DBRepository _dbRepository) async{
    PointsSellerListingModel appList = await _dbRepository.loadPointsSellerListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsSellerList1(searchKey)) ;
    return appList;
  }






  

