part of 'package:projectscoid/repository/APIRepository.dart';
/** AUTOGENERATE OFF **/
 Future<bool> isOldSalesList1(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listSalesAge2();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptySalesListDB1(DBRepository _dbRepository) async {
    var sales;
    sales = await _dbRepository.loadSalesList2('');
    if ((sales != null) || (sales != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<SalesListingModel?> getSalesList1(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  SalesListingModel? sales ;

   if(page == 1){
			//await _dbRepository.deleteAllSalesList1();
            sales = await _apiProvider.getListSales(url, page)
                  .then((responseSalesList) {
                    _loadAndSaveSalesList11(responseSalesList, '', page, _dbRepository);
					return responseSalesList;
                  });
   }else{
      sales = await _apiProvider.getListSales(url, page)
                  .then((responseSalesList) {
				  try{
				      return  _loadAndSaveSalesList1A(responseSalesList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return sales;
	}

Future<SalesListingModel> getSalesListSearch1(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  SalesListingModel sales ;   
  sales = await _apiProvider.getListSales(url, page)
		  .then((responseSalesList) {
			return  _loadAndSaveSalesListSearch1(responseSalesList, '', page);
		  }); 
  return sales;
}



Future<SalesListingModel> _loadAndSaveSalesListSearch1(SalesListingModel list, String searchKey, int page) async{

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

Future<SalesListingModel> _loadAndSaveSalesList1A(SalesListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    SalesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateSalesListInfo2(list);
	
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
      await _dbRepository.saveOrUpdateSalesList2(sales);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadSalesList2(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveSalesList11(SalesListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    SalesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateSalesListInfo2(list);
	
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
      await _dbRepository.saveOrUpdateSalesList2(sales);
    }

  }


  Future<SalesListingModel> loadSalesList1( String searchKey, DBRepository _dbRepository) async{
    SalesListingModel appList = await _dbRepository.loadSalesListInfo2('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadSalesList2(searchKey)) ;
    return appList;
  }






  

