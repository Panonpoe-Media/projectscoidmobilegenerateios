part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldSalesList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listSalesAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptySalesListDB(DBRepository _dbRepository) async {
    var sales;
    sales = await _dbRepository.loadSalesList1('');
    if ((sales != null) || (sales != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<SalesListingModel?> getSalesList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  SalesListingModel? sales ;

   if(page == 1){
			//await _dbRepository.deleteAllSalesList1();
            sales = await _apiProvider.getListSales(url, page)
                  .then((responseSalesList) {
                    _loadAndSaveSalesList1(responseSalesList, '', page, _dbRepository);
					return responseSalesList;
                  });
   }else{
      sales = await _apiProvider.getListSales(url, page)
                  .then((responseSalesList) {
				  try{
				      return  _loadAndSaveSalesList(responseSalesList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return sales;
	}

Future<SalesListingModel> getSalesListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  SalesListingModel sales ;   
  sales = await _apiProvider.getListSales(url, page)
		  .then((responseSalesList) {
			return  _loadAndSaveSalesListSearch(responseSalesList, '', page);
		  }); 
  return sales;
}



Future<SalesListingModel> _loadAndSaveSalesListSearch(SalesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.testimony;
    }
    return list;
 }

Future<SalesListingModel> _loadAndSaveSalesList(SalesListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    SalesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateSalesListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemSalesModel sales;
      sales = list.items.items[i];
      sales.item.cnt = i ;
      sales.item.age = age;
      sales.item.page = page;
	  sales.item.ttl = '';
	  sales.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  sales.item.sbttl = '';
	  
	  sales.item.id = sales.item.order_item_id; 
	  
	  sales.item.sbttl = sales.item.testimony;
      await _dbRepository.saveOrUpdateSalesList1(sales);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadSalesList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveSalesList1(SalesListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    SalesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateSalesListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemSalesModel sales;
      sales = list.items.items[i];
      sales.item.cnt = i ;
      sales.item.age = age;
      sales.item.page = page;
	  sales.item.ttl = '';
	  sales.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  sales.item.sbttl = '';
	  
	  sales.item.id = sales.item.order_item_id; 
	  
	  sales.item.sbttl = sales.item.testimony;
      await _dbRepository.saveOrUpdateSalesList1(sales);
    }

  }


  Future<SalesListingModel> loadSalesList( String searchKey, DBRepository _dbRepository) async{
    SalesListingModel appList = await _dbRepository.loadSalesListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadSalesList1(searchKey)) ;
    return appList;
  }






  

