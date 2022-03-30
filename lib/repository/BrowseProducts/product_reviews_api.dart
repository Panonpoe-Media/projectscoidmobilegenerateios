part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldProductReviewsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listProductReviewsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyProductReviewsListDB(DBRepository _dbRepository) async {
    var product_reviews;
    product_reviews = await _dbRepository.loadProductReviewsList1('');
    if ((product_reviews != null) || (product_reviews != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ProductReviewsListingModel?> getProductReviewsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ProductReviewsListingModel? product_reviews ;

   if(page == 1){
			//await _dbRepository.deleteAllProductReviewsList1();
            product_reviews = await _apiProvider.getListProductReviews(url, page)
                  .then((responseProductReviewsList) {
                    _loadAndSaveProductReviewsList1(responseProductReviewsList, '', page, _dbRepository);
					return responseProductReviewsList;
                  });
   }else{
      product_reviews = await _apiProvider.getListProductReviews(url, page)
                  .then((responseProductReviewsList) {
				  try{
				      return  _loadAndSaveProductReviewsList(responseProductReviewsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return product_reviews;
	}

Future<ProductReviewsListingModel> getProductReviewsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ProductReviewsListingModel product_reviews ;   
  product_reviews = await _apiProvider.getListProductReviews(url, page)
		  .then((responseProductReviewsList) {
			return  _loadAndSaveProductReviewsListSearch(responseProductReviewsList, '', page);
		  }); 
  return product_reviews;
}



Future<ProductReviewsListingModel> _loadAndSaveProductReviewsListSearch(ProductReviewsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.testimony;
	  list.items.items[i].item.pht = list.items.items[i].item.buyer_photo_url;
    }
    return list;
 }

Future<ProductReviewsListingModel> _loadAndSaveProductReviewsList(ProductReviewsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ProductReviewsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateProductReviewsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemProductReviewsModel product_reviews;
      product_reviews = list.items.items[i];
      product_reviews.item.cnt = i ;
      product_reviews.item.age = age;
      product_reviews.item.page = page;
	  product_reviews.item.ttl = '';
	  product_reviews.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  product_reviews.item.sbttl = '';
	  
	  product_reviews.item.id = product_reviews.item.order_item_id; 
	  
	  product_reviews.item.sbttl = product_reviews.item.testimony;
	  product_reviews.item.pht = product_reviews.item.buyer_photo_url;
      await _dbRepository.saveOrUpdateProductReviewsList1(product_reviews);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadProductReviewsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveProductReviewsList1(ProductReviewsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ProductReviewsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateProductReviewsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemProductReviewsModel product_reviews;
      product_reviews = list.items.items[i];
      product_reviews.item.cnt = i ;
      product_reviews.item.age = age;
      product_reviews.item.page = page;
	  product_reviews.item.ttl = '';
	  product_reviews.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  product_reviews.item.sbttl = '';
	  
	  product_reviews.item.id = product_reviews.item.order_item_id; 
	  
	  product_reviews.item.sbttl = product_reviews.item.testimony;
	  product_reviews.item.pht = product_reviews.item.buyer_photo_url;
      await _dbRepository.saveOrUpdateProductReviewsList1(product_reviews);
    }

  }


  Future<ProductReviewsListingModel> loadProductReviewsList( String searchKey, DBRepository _dbRepository) async{
    ProductReviewsListingModel appList = await _dbRepository.loadProductReviewsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadProductReviewsList1(searchKey)) ;
    return appList;
  }






  

