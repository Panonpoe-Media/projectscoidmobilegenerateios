part of 'package:projectscoid/repository/APIRepository.dart';
/** AUTOGENERATE OFF **/

 Future<bool> isOldPaymentHistoryList(DBRepository _dbRepository)async{

    int ageDB = await _dbRepository.listPaymentHistoryAge1();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPaymentHistoryListDB(DBRepository _dbRepository) async {
    var payment_history;
    payment_history = await _dbRepository.loadPaymentHistoryList1('');
    if ((payment_history != null) || (payment_history != [])){
      return false;
    }else {
      return true;
    }
  }

   Future<PaymentHistoryListingModel?> getPaymentHistoryList(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PaymentHistoryListingModel? payment_history ;

   if(page == 1){
			//await _dbRepository.deleteAllPaymentHistoryList1();
            payment_history = await _apiProvider.getListPaymentHistory(url, page)
                  .then((responsePaymentHistoryList) {

              try{
                return  _loadAndSavePaymentHistoryList(responsePaymentHistoryList, '', page, _dbRepository);
              }catch(_){
                print('aku disini 6 ${page.toString()}');
                return null;
              }
               /*
                    _loadAndSavePaymentHistoryList1(responsePaymentHistoryList, '', page, _dbRepository);
					          return responsePaymentHistoryList;

                */
                  });
   }else{
      payment_history = await _apiProvider.getListPaymentHistory(url, page)
                  .then((responsePaymentHistoryList) {
				  try{
				      return  _loadAndSavePaymentHistoryList(responsePaymentHistoryList, '', page, _dbRepository);
				  }catch(_){
				    print('aku disini 5 ${page.toString()}');
				    return null;
				  }

                  });
   }  

	  return payment_history;
	}

Future<PaymentHistoryListingModel> getPaymentHistoryListSearch(String url, int page, APIProvider _apiProvider, DBRepository _dbRepository)async{
  PaymentHistoryListingModel payment_history ;   
  payment_history = await _apiProvider.getListPaymentHistory(url, page)
		  .then((responsePaymentHistoryList) {
			return  _loadAndSavePaymentHistoryListSearch(responsePaymentHistoryList, '', page);
		  }); 
  return payment_history;
}



Future<PaymentHistoryListingModel> _loadAndSavePaymentHistoryListSearch(PaymentHistoryListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
	  list.items.items[i].item.pht = list.items.items[i].item.attachment_url;
	  list.items.items[i].item.sbttl = list.items.items[i].item.approver_note;
    }
    return list;
 }

Future<PaymentHistoryListingModel> _loadAndSavePaymentHistoryList(PaymentHistoryListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PaymentHistoryListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePaymentHistoryListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPaymentHistoryModel payment_history;
      payment_history = list.items.items[i];
      payment_history.item.cnt = i ;
      payment_history.item.age = age;
      payment_history.item.page = page;
	  payment_history.item.ttl = '';
	  payment_history.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  payment_history.item.sbttl = '';
	  
	  payment_history.item.id = payment_history.item.payment_id; 
	  
	  payment_history.item.sbttl = payment_history.item.message;
	  payment_history.item.pht = payment_history.item.attachment_url;
	  payment_history.item.sbttl = payment_history.item.approver_note;
      await _dbRepository.saveOrUpdatePaymentHistoryList1(payment_history);
    }
	appList.items.items.clear();
   // appList.items.items.addAll(await _dbRepository.loadPaymentHistoryList1(searchKey)) ;


    var mylist = await  _dbRepository.loadPaymentHistoryList1(searchKey);

    for(var i=0;i<mylist.length/2;i++) {
      var temp = mylist[i];
      mylist[i] = mylist[mylist.length - 1 - i];
      mylist[mylist.length - 1 - i] = temp;
    }

    appList.items.items.addAll(mylist) ;

    return appList;
  }

Future<void> _loadAndSavePaymentHistoryList1(PaymentHistoryListingModel list, String searchKey, int page, DBRepository _dbRepository) async{
    PaymentHistoryListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePaymentHistoryListInfo1(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPaymentHistoryModel payment_history;
      payment_history = list.items.items[i];
      payment_history.item.cnt = i ;
      payment_history.item.age = age;
      payment_history.item.page = page;
	  payment_history.item.ttl = '';
	  payment_history.item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  payment_history.item.sbttl = '';
	  
	  payment_history.item.id = payment_history.item.payment_id; 
	  
	  payment_history.item.sbttl = payment_history.item.message;
	  payment_history.item.pht = payment_history.item.attachment_url;
	  payment_history.item.sbttl = payment_history.item.approver_note;
      await _dbRepository.saveOrUpdatePaymentHistoryList1(payment_history);
    }

  }


  Future<PaymentHistoryListingModel> loadPaymentHistoryList( String searchKey, DBRepository _dbRepository) async{
    PaymentHistoryListingModel appList = await _dbRepository.loadPaymentHistoryListInfo1('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPaymentHistoryList1(searchKey)) ;
    return appList;
  }






  

