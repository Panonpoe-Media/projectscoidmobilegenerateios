part of 'package:projectscoid/repository/APIRepository.dart';
/** AUTOGENERATE OFF **/
 Future<bool> isOldPortofolioList1(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listPortofolioAge2();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPortofolioListDB1(DBRepository _dbRepository) async {
    var portofolio;
    portofolio = await _dbRepository.loadPortofolioList2('');
    if ((portofolio != null) || (portofolio != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<PortofolioListingModel?> getPortofolioList1(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PortofolioListingModel? portofolio ;

   if(page == 1){
			//await _dbRepository.deleteAllPortofolioList1();
            portofolio = await _apiProvider.getListPortofolio(url, page)
                  .then((responsePortofolioList) {
                    _loadAndSavePortofolioList11(responsePortofolioList, '', page, _dbRepository);
					return responsePortofolioList;
                  });
   }else{
      portofolio = await _apiProvider.getListPortofolio(url, page)
                  .then((responsePortofolioList) {
				  try{
				      return  _loadAndSavePortofolioList1A(responsePortofolioList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return portofolio;
	}

Future<PortofolioListingModel> getPortofolioListSearch1(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PortofolioListingModel portofolio ;   
  portofolio = await _apiProvider.getListPortofolio(url, page)
		  .then((responsePortofolioList) {
			return  _loadAndSavePortofolioListSearch1(responsePortofolioList, '', page);
		  }); 
  return portofolio;
}



Future<PortofolioListingModel> _loadAndSavePortofolioListSearch1(PortofolioListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.description;
	  list.items.items[i].item.pht = list.items.items[i].item.image_url;
    }
    return list;
 }

Future<PortofolioListingModel> _loadAndSavePortofolioList1A(PortofolioListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PortofolioListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePortofolioListInfo2(list);
	
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
	  
	  portofolio.item.sbttl = portofolio.item.description;
	  portofolio.item.pht = portofolio.item.image_url;
      await _dbRepository.saveOrUpdatePortofolioList2(portofolio);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPortofolioList2(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSavePortofolioList11(PortofolioListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PortofolioListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePortofolioListInfo2(list);
	
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
	  
	  portofolio.item.sbttl = portofolio.item.description;
	  portofolio.item.pht = portofolio.item.image_url;
      await _dbRepository.saveOrUpdatePortofolioList2(portofolio);
    }

  }


  Future<PortofolioListingModel> loadPortofolioList1( String searchKey, DBRepository _dbRepository) async{
    PortofolioListingModel appList = await _dbRepository.loadPortofolioListInfo2('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPortofolioList2(searchKey)) ;
    return appList;
  }






  

