part of 'package:projectscoid/repository/APIRepository.dart';

 Future<bool> isOldShowConversationList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listShowConversationAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyShowConversationListDB(DBRepository _dbRepository) async {
    var show_conversation;
    show_conversation = await _dbRepository.loadShowConversationList1('');
    if ((show_conversation != null) || (show_conversation != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<ShowConversationListingModel?> getShowConversationList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShowConversationListingModel? show_conversation ;

   if(page == 1){
			//await _dbRepository.deleteAllShowConversationList1();
            show_conversation = await _apiProvider.getListShowConversation(url, page)
                  .then((responseShowConversationList) {
                    _loadAndSaveShowConversationList1(responseShowConversationList, '', page, _dbRepository);
					return responseShowConversationList;
                  });
   }else{
      show_conversation = await _apiProvider.getListShowConversation(url, page)
                  .then((responseShowConversationList) {
				  try{
				      return  _loadAndSaveShowConversationList(responseShowConversationList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return show_conversation;
	}

Future<ShowConversationListingModel> getShowConversationListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  ShowConversationListingModel show_conversation ;   
  show_conversation = await _apiProvider.getListShowConversation(url, page)
		  .then((responseShowConversationList) {
			return  _loadAndSaveShowConversationListSearch(responseShowConversationList, '', page);
		  }); 
  return show_conversation;
}



Future<ShowConversationListingModel> _loadAndSaveShowConversationListSearch(ShowConversationListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
	  list.items.items[i].item.pht = list.items.items[i].item.user_photo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.user_user_name;
    }
    return list;
 }

Future<ShowConversationListingModel> _loadAndSaveShowConversationList(ShowConversationListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShowConversationListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShowConversationListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShowConversationModel show_conversation;
      show_conversation = list.items.items[i];
      show_conversation.item.cnt = i ;
      show_conversation.item.age = age;
      show_conversation.item.page = page;
	  show_conversation.item.ttl = '';
	  show_conversation.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  show_conversation.item.sbttl = '';
	  
	  show_conversation.item.id = show_conversation.item.post_id; 
	  
	  show_conversation.item.sbttl = show_conversation.item.message;
	  show_conversation.item.pht = show_conversation.item.user_photo_url;
	  show_conversation.item.ttl = show_conversation.item.user_user_name;
      await _dbRepository.saveOrUpdateShowConversationList1(show_conversation);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShowConversationList1(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveShowConversationList1(ShowConversationListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    ShowConversationListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateShowConversationListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemShowConversationModel show_conversation;
      show_conversation = list.items.items[i];
      show_conversation.item.cnt = i ;
      show_conversation.item.age = age;
      show_conversation.item.page = page;
	  show_conversation.item.ttl = '';
	  show_conversation.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  show_conversation.item.sbttl = '';
	  
	  show_conversation.item.id = show_conversation.item.post_id; 
	  
	  show_conversation.item.sbttl = show_conversation.item.message;
	  show_conversation.item.pht = show_conversation.item.user_photo_url;
	  show_conversation.item.ttl = show_conversation.item.user_user_name;
      await _dbRepository.saveOrUpdateShowConversationList1(show_conversation);
    }

  }


  Future<ShowConversationListingModel> loadShowConversationList( String searchKey, DBRepository _dbRepository) async{
    ShowConversationListingModel appList = await _dbRepository.loadShowConversationListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadShowConversationList1(searchKey)) ;
    return appList;
  }






  

