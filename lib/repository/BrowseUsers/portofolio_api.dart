part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldPortofolioList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listPortofolioAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPortofolioListDB(DBRepository _dbRepository) async {
    var portofolio;
    portofolio = await _dbRepository.loadPortofolioList1('');
    if ((portofolio != null) || (portofolio != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<PortofolioListingModel?> getPortofolioList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PortofolioListingModel? portofolio ;

   if(page == 1){
			//await _dbRepository.deleteAllPortofolioList1();
            portofolio = await _apiProvider.getListPortofolio(url, page)
                  .then((responsePortofolioList) {
                    _loadAndSavePortofolioList1(responsePortofolioList, '', page, _dbRepository);
					return responsePortofolioList;
                  });
   }else{
      portofolio = await _apiProvider.getListPortofolio(url, page)
                  .then((responsePortofolioList) {
				  try{
				      return  _loadAndSavePortofolioList(responsePortofolioList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return portofolio;
	}

Future<PortofolioListingModel> getPortofolioListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PortofolioListingModel portofolio ;   
  portofolio = await _apiProvider.getListPortofolio(url, page)
		  .then((responsePortofolioList) {
			return  _loadAndSavePortofolioListSearch(responsePortofolioList, '', page);
		  }); 
  return portofolio;
}



Future<PortofolioListingModel> _loadAndSavePortofolioListSearch(PortofolioListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.image_url;
	  list.items.items[i].item.sbttl = list.items.items[i].item.description;
    }
    return list;
 }

Future<PortofolioListingModel> _loadAndSavePortofolioList(PortofolioListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PortofolioListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePortofolioListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPortofolioModel portofolio;
      portofolio = list.items.items[i];
      portofolio.item.cnt = i ;
      portofolio.item.age = age;
      portofolio.item.page = page;
	  portofolio.item.ttl = '';
	  portofolio.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  portofolio.item.sbttl = '';
	  
	  portofolio.item.id = portofolio.item.portofolio_id; 
	  
	  portofolio.item.pht = portofolio.item.image_url;
	  portofolio.item.sbttl = portofolio.item.description;
      await _dbRepository.saveOrUpdatePortofolioList1(portofolio);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPortofolioList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSavePortofolioList1(PortofolioListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PortofolioListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePortofolioListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPortofolioModel portofolio;
      portofolio = list.items.items[i];
      portofolio.item.cnt = i ;
      portofolio.item.age = age;
      portofolio.item.page = page;
	  portofolio.item.ttl = '';
	  portofolio.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  portofolio.item.sbttl = '';
	  
	  portofolio.item.id = portofolio.item.portofolio_id; 
	  
	  portofolio.item.pht = portofolio.item.image_url;
	  portofolio.item.sbttl = portofolio.item.description;
      await _dbRepository.saveOrUpdatePortofolioList1(portofolio);
    }

  }


  Future<PortofolioListingModel> loadPortofolioList( String searchKey, DBRepository _dbRepository) async{
    PortofolioListingModel appList = await _dbRepository.loadPortofolioListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPortofolioList1(searchKey)) ;
    return appList;
  }






  

