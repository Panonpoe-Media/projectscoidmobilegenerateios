part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldPointsAffiliateList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listPointsAffiliateAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPointsAffiliateListDB(DBRepository _dbRepository) async {
    var points_affiliate;
    points_affiliate = await _dbRepository.loadPointsAffiliateList1('');
    if ((points_affiliate != null) || (points_affiliate != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<PointsAffiliateListingModel?> getPointsAffiliateList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsAffiliateListingModel? points_affiliate ;

   if(page == 1){
			//await _dbRepository.deleteAllPointsAffiliateList1();
            points_affiliate = await _apiProvider.getListPointsAffiliate(url, page)
                  .then((responsePointsAffiliateList) {
                    _loadAndSavePointsAffiliateList1(responsePointsAffiliateList, '', page, _dbRepository);
					return responsePointsAffiliateList;
                  });
   }else{
      points_affiliate = await _apiProvider.getListPointsAffiliate(url, page)
                  .then((responsePointsAffiliateList) {
				  try{
				      return  _loadAndSavePointsAffiliateList(responsePointsAffiliateList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return points_affiliate;
	}

Future<PointsAffiliateListingModel> getPointsAffiliateListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PointsAffiliateListingModel points_affiliate ;   
  points_affiliate = await _apiProvider.getListPointsAffiliate(url, page)
		  .then((responsePointsAffiliateList) {
			return  _loadAndSavePointsAffiliateListSearch(responsePointsAffiliateList, '', page);
		  }); 
  return points_affiliate;
}



Future<PointsAffiliateListingModel> _loadAndSavePointsAffiliateListSearch(PointsAffiliateListingModel list, String searchKey, int page) async{

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

Future<PointsAffiliateListingModel> _loadAndSavePointsAffiliateList(PointsAffiliateListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsAffiliateListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsAffiliateListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsAffiliateModel points_affiliate;
      points_affiliate = list.items.items[i];
      points_affiliate.item.cnt = i ;
      points_affiliate.item.age = age;
      points_affiliate.item.page = page;
	  points_affiliate.item.ttl = '';
	  points_affiliate.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_affiliate.item.sbttl = '';
	  
	  points_affiliate.item.id = points_affiliate.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsAffiliateList1(points_affiliate);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsAffiliateList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSavePointsAffiliateList1(PointsAffiliateListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PointsAffiliateListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePointsAffiliateListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPointsAffiliateModel points_affiliate;
      points_affiliate = list.items.items[i];
      points_affiliate.item.cnt = i ;
      points_affiliate.item.age = age;
      points_affiliate.item.page = page;
	  points_affiliate.item.ttl = '';
	  points_affiliate.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  points_affiliate.item.sbttl = '';
	  
	  points_affiliate.item.id = points_affiliate.item.point_id; 
	  
      await _dbRepository.saveOrUpdatePointsAffiliateList1(points_affiliate);
    }

  }


  Future<PointsAffiliateListingModel> loadPointsAffiliateList( String searchKey, DBRepository _dbRepository) async{
    PointsAffiliateListingModel appList = await _dbRepository.loadPointsAffiliateListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPointsAffiliateList1(searchKey)) ;
    return appList;
  }






  

