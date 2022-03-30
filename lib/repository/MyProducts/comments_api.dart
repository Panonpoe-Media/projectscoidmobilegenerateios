part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldCommentsList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listCommentsAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyCommentsListDB(DBRepository _dbRepository) async {
    var comments;
    comments = await _dbRepository.loadCommentsList1('');
    if ((comments != null) || (comments != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<CommentsListingModel?> getCommentsList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  CommentsListingModel? comments ;

   if(page == 1){
			//await _dbRepository.deleteAllCommentsList1();
            comments = await _apiProvider.getListComments(url, page)
                  .then((responseCommentsList) {
                    _loadAndSaveCommentsList1(responseCommentsList, '', page, _dbRepository);
					return responseCommentsList;
                  });
   }else{
      comments = await _apiProvider.getListComments(url, page)
                  .then((responseCommentsList) {
				  try{
				      return  _loadAndSaveCommentsList(responseCommentsList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return comments;
	}

Future<CommentsListingModel> getCommentsListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  CommentsListingModel comments ;   
  comments = await _apiProvider.getListComments(url, page)
		  .then((responseCommentsList) {
			return  _loadAndSaveCommentsListSearch(responseCommentsList, '', page);
		  }); 
  return comments;
}



Future<CommentsListingModel> _loadAndSaveCommentsListSearch(CommentsListingModel list, String searchKey, int page) async{

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

Future<CommentsListingModel> _loadAndSaveCommentsList(CommentsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    CommentsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCommentsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCommentsModel comments;
      comments = list.items.items[i];
      comments.item.cnt = i ;
      comments.item.age = age;
      comments.item.page = page;
	  comments.item.ttl = '';
	  comments.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  comments.item.sbttl = '';
	  
	  comments.item.id = comments.item.product_post_id; 
	  
	  comments.item.pht = comments.item.user_photo_url;
	  comments.item.ttl = comments.item.user_user_name;
	  comments.item.sbttl = comments.item.message;
      await _dbRepository.saveOrUpdateCommentsList1(comments);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCommentsList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveCommentsList1(CommentsListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    CommentsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCommentsListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCommentsModel comments;
      comments = list.items.items[i];
      comments.item.cnt = i ;
      comments.item.age = age;
      comments.item.page = page;
	  comments.item.ttl = '';
	  comments.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  comments.item.sbttl = '';
	  
	  comments.item.id = comments.item.product_post_id; 
	  
	  comments.item.pht = comments.item.user_photo_url;
	  comments.item.ttl = comments.item.user_user_name;
	  comments.item.sbttl = comments.item.message;
      await _dbRepository.saveOrUpdateCommentsList1(comments);
    }

  }


  Future<CommentsListingModel> loadCommentsList( String searchKey, DBRepository _dbRepository) async{
    CommentsListingModel appList = await _dbRepository.loadCommentsListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCommentsList1(searchKey)) ;
    return appList;
  }






  

