part of 'package:projectscoid/repository/APIRepository.dart';
/** AUTOGENERATE OFF **/

 Future<bool> isOldCreditHistoryList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listCreditHistoryAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyCreditHistoryListDB(DBRepository _dbRepository) async {
    var credit_history;
    credit_history = await _dbRepository.loadCreditHistoryList1('');
    if ((credit_history != null) || (credit_history != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<CreditHistoryListingModel?> getCreditHistoryList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  CreditHistoryListingModel? credit_history ;

   if(page == 1){
			//await _dbRepository.deleteAllCreditHistoryList1();
            credit_history = await _apiProvider.getListCreditHistory(url, page)
                  .then((responseCreditHistoryList) {

                        try{
                          return  _loadAndSaveCreditHistoryList(responseCreditHistoryList, '', page, _dbRepository);
                        }catch(_){
                          return null;
                        }
                    /*
                    _loadAndSaveCreditHistoryList1(responseCreditHistoryList, '', page, _dbRepository);
					          return responseCreditHistoryList;

                     */
                  });
   }else{
      credit_history = await _apiProvider.getListCreditHistory(url, page)
                  .then((responseCreditHistoryList) {
				  try{
				      return  _loadAndSaveCreditHistoryList(responseCreditHistoryList, '', page, _dbRepository);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return credit_history;
	}

Future<CreditHistoryListingModel> getCreditHistoryListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  CreditHistoryListingModel credit_history ;   
  credit_history = await _apiProvider.getListCreditHistory(url, page)
		  .then((responseCreditHistoryList) {
			return  _loadAndSaveCreditHistoryListSearch(responseCreditHistoryList, '', page);
		  }); 
  return credit_history;
}



Future<CreditHistoryListingModel> _loadAndSaveCreditHistoryListSearch(CreditHistoryListingModel list, String searchKey, int page) async{

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

Future<CreditHistoryListingModel> _loadAndSaveCreditHistoryList(CreditHistoryListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    CreditHistoryListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCreditHistoryListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCreditHistoryModel credit_history;
      credit_history = list.items.items[i];
      credit_history.item.cnt = i ;
      credit_history.item.age = age;
      credit_history.item.page = page;
	  credit_history.item.ttl = '';
	  credit_history.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  credit_history.item.sbttl = '';
	  
	  credit_history.item.id = credit_history.item.credit_id; 
	  
      await _dbRepository.saveOrUpdateCreditHistoryList1(credit_history);
    }
	appList.items.items.clear();
   // appList.items.items.addAll(await _dbRepository.loadCreditHistoryList1(searchKey)) ;
    var mylist = await  _dbRepository.loadCreditHistoryList1(searchKey);

    for(var i=0;i<mylist.length/2;i++) {
      var temp = mylist[i];
      mylist[i] = mylist[mylist.length - 1 - i];
      mylist[mylist.length - 1 - i] = temp;
    }

    appList.items.items.addAll(mylist) ;
    return appList;
  }

Future<void> _loadAndSaveCreditHistoryList1(CreditHistoryListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    CreditHistoryListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCreditHistoryListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCreditHistoryModel credit_history;
      credit_history = list.items.items[i];
      credit_history.item.cnt = i ;
      credit_history.item.age = age;
      credit_history.item.page = page;
	  credit_history.item.ttl = '';
	  credit_history.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  credit_history.item.sbttl = '';
	  
	  credit_history.item.id = credit_history.item.credit_id; 
	  
      await _dbRepository.saveOrUpdateCreditHistoryList1(credit_history);
    }

  }


  Future<CreditHistoryListingModel> loadCreditHistoryList( String searchKey, DBRepository _dbRepository) async{
    CreditHistoryListingModel appList = await _dbRepository.loadCreditHistoryListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCreditHistoryList1(searchKey)) ;
    return appList;
  }






  

