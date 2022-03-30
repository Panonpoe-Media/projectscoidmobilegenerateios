part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldProductCommentsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listProductCommentsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyProductCommentsListDB(DBRepository _dbRepository) async {
    var product_comments;
    product_comments = await _dbRepository.loadProductCommentsList1('');
    if ((product_comments != null) || (product_comments != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ProductCommentsListingModel?> getProductCommentsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ProductCommentsListingModel? product_comments ;

   if(page == 1){
			//await _dbRepository.deleteAllProductCommentsList1();
            product_comments = await _apiProvider.getListProductComments(url, page)
                  .then((responseProductCommentsList) {
                    _loadAndSaveProductCommentsList1(responseProductCommentsList, '', page, _dbRepository);
					return responseProductCommentsList;
                  });
   }else{
      product_comments = await _apiProvider.getListProductComments(url, page)
                  .then((responseProductCommentsList) {
				  try{
				      return  _loadAndSaveProductCommentsList(responseProductCommentsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return product_comments;
	}

Future<ProductCommentsListingModel> getProductCommentsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ProductCommentsListingModel product_comments ;   
  product_comments = await _apiProvider.getListProductComments(url, page)
		  .then((responseProductCommentsList) {
			return  _loadAndSaveProductCommentsListSearch(responseProductCommentsList, '', page);
		  }); 
  return product_comments;
}



Future<ProductCommentsListingModel> _loadAndSaveProductCommentsListSearch(ProductCommentsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.user_photo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.user_user_name;
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
    }
    return list;
 }

Future<ProductCommentsListingModel> _loadAndSaveProductCommentsList(ProductCommentsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ProductCommentsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateProductCommentsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemProductCommentsModel product_comments;
      product_comments = list.items.items[i];
      product_comments.item.cnt = i ;
      product_comments.item.age = age;
      product_comments.item.page = page;
	  product_comments.item.ttl = '';
	  product_comments.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  product_comments.item.sbttl = '';
	  
	  product_comments.item.id = product_comments.item.product_post_id; 
	  
	  product_comments.item.pht = product_comments.item.user_photo_url;
	  product_comments.item.ttl = product_comments.item.user_user_name;
	  product_comments.item.sbttl = product_comments.item.message;
      await _dbRepository.saveOrUpdateProductCommentsList1(product_comments);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadProductCommentsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveProductCommentsList1(ProductCommentsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ProductCommentsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateProductCommentsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemProductCommentsModel product_comments;
      product_comments = list.items.items[i];
      product_comments.item.cnt = i ;
      product_comments.item.age = age;
      product_comments.item.page = page;
	  product_comments.item.ttl = '';
	  product_comments.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  product_comments.item.sbttl = '';
	  
	  product_comments.item.id = product_comments.item.product_post_id; 
	  
	  product_comments.item.pht = product_comments.item.user_photo_url;
	  product_comments.item.ttl = product_comments.item.user_user_name;
	  product_comments.item.sbttl = product_comments.item.message;
      await _dbRepository.saveOrUpdateProductCommentsList1(product_comments);
    }

  }


  Future<ProductCommentsListingModel> loadProductCommentsList( String searchKey, DBRepository _dbRepository) async{
    ProductCommentsListingModel appList = await _dbRepository.loadProductCommentsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadProductCommentsList1(searchKey)) ;
    return appList;
  }






  

