part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldProductsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listProductsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyProductsListDB(DBRepository _dbRepository) async {
    var products;
    products = await _dbRepository.loadProductsList1('');
    if ((products != null) || (products != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ProductsListingModel?> getProductsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ProductsListingModel? products ;

   if(page == 1){
			//await _dbRepository.deleteAllProductsList1();
            products = await _apiProvider.getListProducts(url, page)
                  .then((responseProductsList) {
                    _loadAndSaveProductsList1(responseProductsList, '', page, _dbRepository);
					return responseProductsList;
                  });
   }else{
      products = await _apiProvider.getListProducts(url, page)
                  .then((responseProductsList) {
				  try{
				      return  _loadAndSaveProductsList(responseProductsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return products;
	}

Future<ProductsListingModel> getProductsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ProductsListingModel products ;   
  products = await _apiProvider.getListProducts(url, page)
		  .then((responseProductsList) {
			return  _loadAndSaveProductsListSearch(responseProductsList, '', page);
		  }); 
  return products;
}



Future<ProductsListingModel> _loadAndSaveProductsListSearch(ProductsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.logo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.title;
	  list.items.items[i].item.sbttl = list.items.items[i].item.short_description;
    }
    return list;
 }

Future<ProductsListingModel> _loadAndSaveProductsList(ProductsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ProductsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateProductsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemProductsModel products;
      products = list.items.items[i];
      products.item.cnt = i ;
      products.item.age = age;
      products.item.page = page;
	  products.item.ttl = '';
	  products.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  products.item.sbttl = '';
	  
	  products.item.id = products.item.product_id; 
	  
	  products.item.pht = products.item.logo_url;
	  products.item.ttl = products.item.title;
	  products.item.sbttl = products.item.short_description;
      await _dbRepository.saveOrUpdateProductsList1(products);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadProductsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveProductsList1(ProductsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ProductsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateProductsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemProductsModel products;
      products = list.items.items[i];
      products.item.cnt = i ;
      products.item.age = age;
      products.item.page = page;
	  products.item.ttl = '';
	  products.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  products.item.sbttl = '';
	  
	  products.item.id = products.item.product_id; 
	  
	  products.item.pht = products.item.logo_url;
	  products.item.ttl = products.item.title;
	  products.item.sbttl = products.item.short_description;
      await _dbRepository.saveOrUpdateProductsList1(products);
    }

  }


  Future<ProductsListingModel> loadProductsList( String searchKey, DBRepository _dbRepository) async{
    ProductsListingModel appList = await _dbRepository.loadProductsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadProductsList1(searchKey)) ;
    return appList;
  }






  

