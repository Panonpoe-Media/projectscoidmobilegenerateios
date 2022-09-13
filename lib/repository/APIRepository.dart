import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/api/APIProvider.dart';
import 'package:projectscoid/db/DBRepository.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
//import 'package:device_info/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
//import 'package:connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io' show Platform;
import 'package:projectscoid/core/components/helpers/action_helpers.dart';


import 'package:projectscoid/models/BrowseProducts/product_comments_list.dart';

import 'package:projectscoid/models/BrowseProducts/product_reviews_list.dart';
import 'package:projectscoid/models/BrowseProducts/screenshots_list.dart';
import 'package:projectscoid/models/BrowseProjects/user_bids_list.dart';
//import 'package:projectscoid/models/BrowseServices/screenshots_list.dart';
import 'package:projectscoid/models/BrowseServices/service_comments_list.dart';
import 'package:projectscoid/models/BrowseServices/service_reviews_list.dart';
import 'package:projectscoid/models/BrowseUsers/as_project_owner_list.dart';
import 'package:projectscoid/models/BrowseUsers/as_project_worker_list.dart';
import 'package:projectscoid/models/BrowseUsers/portofolio_list.dart';
import 'package:projectscoid/models/BrowseUsers/products_list.dart';
import 'package:projectscoid/models/BrowseUsers/services_list.dart';
import 'package:projectscoid/models/BrowseUsers/user_arbitrations_list.dart';
import 'package:projectscoid/models/Cart/cart_items_list.dart';
import 'package:projectscoid/models/Checkout/checkout_items_list.dart';
//import 'package:projectscoid/models/MyBids/show_conversation_list.dart';
import 'package:projectscoid/models/MyFinance/credit_history_list.dart';
import 'package:projectscoid/models/MyFinance/payment_history_list.dart';
import 'package:projectscoid/models/MyPoints/points_affiliate_list.dart';
import 'package:projectscoid/models/MyPoints/points_buyer_list.dart';
import 'package:projectscoid/models/MyPoints/points_owner_list.dart';
import 'package:projectscoid/models/MyPoints/points_pesta_list.dart';
import 'package:projectscoid/models/MyPoints/points_seller_list.dart';
import 'package:projectscoid/models/MyPoints/points_worker_list.dart';
import 'package:projectscoid/models/MyProducts/comments_list.dart';
import 'package:projectscoid/models/MyProducts/sales_list.dart';
//import 'package:projectscoid/models/MyProducts/screenshots_list.dart';
//import 'package:projectscoid/models/MyProfile/portofolio_list.dart';
import 'package:projectscoid/models/MyProjects/shortlisted_bids_list.dart';
import 'package:projectscoid/models/MyProjects/show_bids_list.dart';
import 'package:projectscoid/models/MyProjects/show_conversation_list.dart';
import 'package:projectscoid/models/MyProjects/show_files_list.dart';
import 'package:projectscoid/models/MyProjects/show_thread_list.dart';
import 'package:projectscoid/models/MyReferals/referals_list.dart';
//import 'package:projectscoid/models/MyServices/comments_list.dart';
//import 'package:projectscoid/models/MyServices/sales_list.dart';
//import 'package:projectscoid/models/MyServices/screenshots_list.dart';
//import 'package:projectscoid/models/PastProjects/user_bids_list.dart';

import 'package:projectscoid/models/BrowseProducts/product_comments_list_item.dart';

import 'package:projectscoid/models/BrowseProducts/product_reviews_list_item.dart';
import 'package:projectscoid/models/BrowseProducts/screenshots_list_item.dart';
import 'package:projectscoid/models/BrowseProjects/user_bids_list_item.dart';
//import 'package:projectscoid/models/BrowseServices/screenshots_list_item.dart';
import 'package:projectscoid/models/BrowseServices/service_comments_list_item.dart';
import 'package:projectscoid/models/BrowseServices/service_reviews_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/as_project_owner_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/as_project_worker_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/portofolio_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/products_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/services_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/user_arbitrations_list_item.dart';
import 'package:projectscoid/models/Cart/cart_items_list_item.dart';
import 'package:projectscoid/models/Checkout/checkout_items_list_item.dart';
//import 'package:projectscoid/models/MyBids/show_conversation_list_item.dart';
import 'package:projectscoid/models/MyFinance/credit_history_list_item.dart';
import 'package:projectscoid/models/MyFinance/payment_history_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_affiliate_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_buyer_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_owner_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_pesta_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_seller_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_worker_list_item.dart';
import 'package:projectscoid/models/MyProducts/comments_list_item.dart';
import 'package:projectscoid/models/MyProducts/sales_list_item.dart';
//import 'package:projectscoid/models/MyProducts/screenshots_list_item.dart';
//import 'package:projectscoid/models/MyProfile/portofolio_list_item.dart';
import 'package:projectscoid/models/MyProjects/shortlisted_bids_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_bids_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_conversation_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_files_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_thread_list_item.dart';
import 'package:projectscoid/models/MyReferals/referals_list_item.dart';
//import 'package:projectscoid/models/MyServices/comments_list_item.dart';
//import 'package:projectscoid/models/MyServices/sales_list_item.dart';
//import 'package:projectscoid/models/MyServices/screenshots_list_item.dart';
//import 'package:projectscoid/models/PastProjects/user_bids_list_item.dart';
part 'package:projectscoid/repository/BrowseProducts/product_comments_api.dart';
part 'package:projectscoid/repository/BrowseProducts/product_reviews_api.dart';
part 'package:projectscoid/repository/BrowseProducts/screenshots_api.dart';
part 'package:projectscoid/repository/BrowseProjects/user_bids_api.dart';
part 'package:projectscoid/repository/BrowseServices/screenshots_api.dart';
part 'package:projectscoid/repository/BrowseServices/service_comments_api.dart';
part 'package:projectscoid/repository/BrowseServices/service_reviews_api.dart';
part 'package:projectscoid/repository/BrowseUsers/as_project_owner_api.dart';
part 'package:projectscoid/repository/BrowseUsers/as_project_worker_api.dart';
part 'package:projectscoid/repository/BrowseUsers/portofolio_api.dart';
part 'package:projectscoid/repository/BrowseUsers/products_api.dart';
part 'package:projectscoid/repository/BrowseUsers/services_api.dart';
part 'package:projectscoid/repository/BrowseUsers/user_arbitrations_api.dart';
part 'package:projectscoid/repository/Cart/cart_items_api.dart';
part 'package:projectscoid/repository/Checkout/checkout_items_api.dart';
part 'package:projectscoid/repository/MyBids/show_conversation_api.dart';
part 'package:projectscoid/repository/MyFinance/credit_history_api.dart';
part 'package:projectscoid/repository/MyFinance/payment_history_api.dart';
part 'package:projectscoid/repository/MyPoints/points_affiliate_api.dart';
part 'package:projectscoid/repository/MyPoints/points_buyer_api.dart';
part 'package:projectscoid/repository/MyPoints/points_owner_api.dart';
part 'package:projectscoid/repository/MyPoints/points_pesta_api.dart';
part 'package:projectscoid/repository/MyPoints/points_seller_api.dart';
part 'package:projectscoid/repository/MyPoints/points_worker_api.dart';
part 'package:projectscoid/repository/MyProducts/comments_api.dart';
part 'package:projectscoid/repository/MyProducts/sales_api.dart';
part 'package:projectscoid/repository/MyProducts/screenshots_api.dart';
part 'package:projectscoid/repository/MyProfile/portofolio_api.dart';
part 'package:projectscoid/repository/MyProjects/shortlisted_bids_api.dart';
part 'package:projectscoid/repository/MyProjects/show_bids_api.dart';
part 'package:projectscoid/repository/MyProjects/show_conversation_api.dart';
part 'package:projectscoid/repository/MyProjects/show_files_api.dart';
part 'package:projectscoid/repository/MyProjects/show_thread_api.dart';
part 'package:projectscoid/repository/MyReferals/referals_api.dart';
part 'package:projectscoid/repository/MyServices/comments_api.dart';
part 'package:projectscoid/repository/MyServices/sales_api.dart';
part 'package:projectscoid/repository/MyServices/screenshots_api.dart';
part 'package:projectscoid/repository/PastProjects/user_bids_api.dart';
var MaxAge = 180000;
//halooo
class APIRepository{

  APIProvider _apiProvider;
  DBRepository _dbRepository;
  APIRepository(this._apiProvider, this._dbRepository);
  

  Future <String> getBlacklist(String userID)async{
    List<Map>  list = [];
    String meta = '';
    var l = await _dbRepository.loadBlacklist(userID);
    if(l != null){
     // print('halooooooooooo');
      list.addAll( await _dbRepository.loadBlacklist(userID));
      for(var map in list) {
        meta = map['meta'];

      }
     return meta;
    }else{
     // print('mengerikan');

      return '';
    }

   // return await _dbRepository.loadBlacklist(userID);

  }

  Future<void> loadAndSaveBlacklist(String userID, String meta)async{
    await _dbRepository.saveOrUpdateBlacklist(userID, meta);
  }

  Future<void> deleteBlacklist() async{
    await _dbRepository.deleteBlacklist();
  }



 Future<String> getCookies(String url)async{
    return  await _apiProvider.getCookies(url);
  }
  Future <bool> getToken()async{
    List<Map>  list = [];
    String token = '';
    if(await _dbRepository.loadToken() != null){
      list.addAll(await _dbRepository.loadToken());
      for(var map in list) {
        token = map['token'];

      }
    }else{

    }

    if(token == '1'){
      return true;
    }else return false;
    //return true;

  }

  Future<void> loadAndSaveToken(String token)async{
    await _dbRepository.saveOrUpdateToken(token);
  }

  Future<void> deleteToken() async{
    await _dbRepository.deleteToken();
  }


  Future downloadFile(String url,String fileName) async {
    await _apiProvider.downloadFile(url, fileName);
  }

 Future<String> downloadFile1(String url,String fileName,  ProgressDlCallback showProgress) async {
    return await _apiProvider.downloadFile1(url, fileName, showProgress);
  }
 Future<void> deleteAll()async{
    await _dbRepository.deleteAll();
  }
  Future<void> loadAndSaveIntro(int intro)async{
    await _dbRepository.saveOrUpdateIntro(intro);
  }

  Future<int> loadIntro()async{

    List<Map>  list = [];
    int intro = 0;
    if(await _dbRepository.loadIntro() != null){
      list.addAll(await _dbRepository.loadIntro());
      for(var map in list) {
        intro = map['value'];


      }
    }else{

    }
    return intro;
  }

 Future   loadAccount()async{
    var res = await _dbRepository.loadAccount();
    return res;
 }

 Future <String?> getUserHash()async{
   List<Map>  list = [];
   String? userHash; 
   var res = await _dbRepository.loadAccount();
   if(res!= null || res != []) {
     list.addAll(await _dbRepository.loadAccount());
     for (var map in list) {
       userHash = map['user_hash'];
     }
   }
   return userHash!;
 }

  Future <bool> getHash()async{

    List<Map>  list = [];
    String? hash = '';
    String? userName;
	String? password;
    String? userID;
    String? tempUserID;
    String? machineID;
    var res = await _dbRepository.loadAccount();
    if(res!= null || res != []){
      list.addAll(await _dbRepository.loadAccount());
      for(var map in list) {
        hash       = map['hash'];
        userName   = map['user_name'];
		password   = map['password'];
        tempUserID = map['id'];
        userID     = tempUserID!.substring(4);
        userID     = userID.substring(0, userID.length - 4);
      }
    }else{

    }

    machineID = await getMachineId();
    try
    {
      if(hash!.contains(userName!) && hash!.contains(userID!) && hash!.contains(machineID!))
      {
        var res = await _apiProvider.userLogin(userName, password!);  
		  LoginItem loginItem;
        loginItem = LoginItem.fromJson(jsonDecode(res));
        
        await _dbRepository.saveOrUpdateAccount(loginItem, password!);
         return true;
      }
        else return false;
    }

    catch(_){
      return false;
    }

  }

 Future<String?> getMachineId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  Future authenticate(String username, String password)async{

    var res = await _apiProvider.userLogin(username, password);
    LoginResult loginResult;
    String userID;

    String hash;
    const Sign = 'abcde';
    LoginItem loginItem;
    loginResult = LoginResult.fromJson(jsonDecode(res));
     if(loginResult.result == 'OK'){
      loginItem = LoginItem.fromJson(jsonDecode(res));
      userID = loginItem.user_id!.substring(4);
      userID = userID.substring(0, userID.length - 4);
      await getMachineId().
      then((val){
        var date = DateFormat('yyyyMMdd').format(DateTime.now());
        loginItem.hash = loginItem.user_name! + userID + val! + date + Sign;


      });
      await _dbRepository.saveOrUpdateAccount(loginItem, password);

    }

    return loginResult.result;
    //return '1';
  }


  Future<void> saveOrUpdateAccount(LoginItem loginItem, String password) async{
    await _dbRepository.saveOrUpdateAccount(loginItem, password);
  }

  Future<void> deleteHash() async{
    await _dbRepository.deleteAccount();
  }

  Future sendRegister(String url, var formdata)async{
    var testPost;
    testPost = await _apiProvider.sendData(url, formdata);
    return testPost;
  }

    Future getPageView(String url, String id, String title)async{
    var testPost;
    testPost = await _apiProvider.getData(url);
    return testPost;
  }

    //---------------------------------------------------------------------------------------

 Future<bool> isOldHomeList()async{
    int ageDB = await _dbRepository.listHomeAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
	MaxAge = 1000;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyHomeListDB() async {
    var home;
    home = await _dbRepository.loadHomeList('');
    if ((home != null) || (home != [])){
      return false;
    }else {
      return true;
    }
  }

  Future<HomeListingModel> getHomeList(String url, int page)async{
    HomeListingModel home ;
    final isEmpty = await isEmptyHomeListDB();
    final isOld = await isOldHomeList();
   // final isOld = true;
/*
    if((page == 1)&& (!isEmpty) &&(!isOld)) {
      home = await _dbRepository.loadHomeListInfo('');
      home.items.items.clear();
      home.items.items.addAll(await _dbRepository.loadHomeList(''));
    }else {
      if(isEmpty || isOld ){
        home = await _apiProvider.getListHome(url, page)
            .then((responseHomeList) {
          //  print(responseHomeList);
          //  HomeListingModel list = null;
          //  for (var home in responseHomeList) {
          //  list.add(HomeModel.fromJson(home));
          //  }
          return  _loadAndSaveHomeList(responseHomeList, '', page);
        });
      }else{
        if(page == 1){
          home = await _dbRepository.loadHomeListInfo('');
          home.items.items.clear();
          home.items.items.addAll(await _dbRepository.loadHomeList(''));
        }else{
          home = await _apiProvider.getListHome(url, page)
              .then((responseHomeList) {
            //  print(responseHomeList);
            //    HomeListingModel list = null;
            //    for (var home in responseHomeList) {
            //    list.add(HomeModel.fromJson(home));
            //    }
            return  _loadAndSaveHomeList(responseHomeList, '', page);
          });
        }
      }
    }
*/	


		  if(page == 1){
					await _dbRepository.deleteAllHomeList();
					home  = await _apiProvider.getListHome(url, page)
						  .then((responseHomeList) {
							return  _loadAndSaveHomeList(responseHomeList, '', page);
						  });
		   }else{
			  home = await _apiProvider.getListHome(url, page)
						  .then((responseHomeList) {
							return  _loadAndSaveHomeList(responseHomeList, '', page);
						  });
		   }  

			  return home ;
	/*  
	 home = await _apiProvider.getListHome(url, page)
            .then((responseHomeList) {
          //  print(responseHomeList);
          //  HomeListingModel list = null;
          //  for (var home in responseHomeList) {
          //  list.add(HomeModel.fromJson(home));
          //  }
		   if(page == 1){
		    _loadAndSaveHomeList(responseHomeList, '', page);
		  }
          return  responseHomeList;
        });
	
    return home;
	*/
  }

  Future<HomeListingModel> getHomeListSearch(String url, int page)async{
    HomeListingModel home ;
    home = await _apiProvider.getListHome(url, page)
        .then((responseHomeList) {
      return  _loadAndSaveHomeListSearch(responseHomeList, '', page);
    });
    return home;
  }

  Future<HomeListingModel> _loadAndSaveHomeListSearch(HomeListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;

    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
      list.items.items[i].item!.ttl = '';
      list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
      list.items.items[i].item!.sbttl = '';

      list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
      list.items.items[i].item!.id = list.items.items[i].item!.notification_id;
    }
    return list;
  }

  Future<HomeListingModel> _loadAndSaveHomeList(HomeListingModel list, String searchKey, int page) async{
    HomeListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
    await _dbRepository.saveOrUpdateHomeListInfo(list);

    for(var i = 0; i < list.items.items.length ; i++){
      ItemHomeModel home;
      home = list.items.items[i];
      home.item!.cnt = i ;
      home.item!.age = age;
      home.item!.page = page;
      home.item!.ttl = '';
      home.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
      home.item!.sbttl = '';

      home.item!.ttl = home.item!.user_name;
       home.item!.id = home.item!.notification_id;
      await _dbRepository.saveOrUpdateHomeList(home);
    }
    appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadHomeList(searchKey)) ;
    return appList;
  }

  Future<HomeListingModel?> loadHomeList( String searchKey) async{
    HomeListingModel? appList = await _dbRepository.loadHomeListInfo('');
    appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadHomeList(searchKey)) ;
    return appList;
  }

  Future loadHomeList1( String searchKey) async{
    HomeListingModel appList = await _dbRepository.loadHomeListInfo('');

    var list = [];
    if(appList == null){
      return list;
    }else{
      list.addAll(await _dbRepository.loadHomeList(searchKey)) ;
      return list;
    }

  }

  /*Future getHomeEdit(String url, String id, String title)async{
    var editHome;
    editHome = await _apiProvider.getDataHome(url, id, title);
    return editHome;
  } */

  Future getHomeView(String url, String id, String title)async{
    var  viewHome;
   // viewHome = await _apiProvider.getViewDataHome(url, id, title);
    return viewHome;
  }

  Future sendHomePost(String url, var formdata)async{
    var postHome;
    postHome = await _apiProvider.sendDataHome(url, formdata);
    return postHome;
  }

  Future sendHomePostWithID(String url, var formdata, String id, String title)async{
    var postHome;
    postHome = await _apiProvider.sendDataWithIDHome(url, formdata, id, title);
    return postHome;
  }
  
  //---------------------------------------------------------------------------------------
  
  Future getData(String url)async{
    var  data;
    data = await _apiProvider.getData(url);
    return data;
  }
  
    Future getPurchaseDownload(String url)async{
    var  data;
    data = await _apiProvider.getPurchaseDownload(url);
    return data;
  }
   Future getData1(String url)async{
    var  data;
    data = await _apiProvider.getData1(url);
    return data;
  }

  Future sendData(String url, var formdata)async{
    var data;
    data = await _apiProvider.sendData(url, formdata);
    return data;
  }
  
  //--------------
  //GetDataHome

  Future<bool> isOldDataHome()async{
    int ageDB = await _dbRepository.DataHomeAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
	MaxAge = 1000;
    if(deltaAge >= MaxAge){

      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyDataHomeDB() async {
    var datahome;
    datahome = await _dbRepository.loadDataHome('');

    if ((datahome != null) || (datahome != [])){

      return false;
    }else {

      return true;
    }
  }

  Future getDataHome(String url)async{
    //var  data;
    //data = await _apiProvider.getData(url);
   // return data;
    int page = 1;
    var datahome ;
    final isEmpty = await isEmptyDataHomeDB();
    //final isOld = await isOldDataHome();
    final isOld = true;
    if((page == 1)&& (!isEmpty) &&(!isOld)) {
      datahome = await _dbRepository.loadDataHomeInfo('');

      datahome = await _dbRepository.loadDataHome('');
    }else {
      if(isEmpty || isOld ){
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          return  _dbRepository.loadDataHome('');

          // I am connected to a mobile network.
        } else{
          datahome = await _apiProvider.getDataHome(url)
              .then((responseDataHome) {
            //  print(responseDataHome);
            //  DataHomeingModel list = null;
            //  for (var test in responseDataHome) {
            //  list.add(TestModel.fromJson(test));
            //  }
            return  _loadAndSaveDataHome(responseDataHome);
          }).catchError(
                  (e) {
                print("Got error: ${e.error}");     // Finally, callback fires.
                return  _dbRepository.loadDataHome('');                          // Future completes with 42.
              }

          );
        }
       
      }else{
        if(page == 1){
          datahome = await _dbRepository.loadDataHomeInfo('');
          datahome = await _dbRepository.loadDataHome('');
        }else{
          datahome = await _apiProvider.getListTest(url, page)
              .then((responseDataHome) {
            //  print(responseDataHome);
            //    DataHomeingModel list = null;
            //    for (var test in responseDataHome) {
            //    list.add(TestModel.fromJson(test));
            //    }
            return  _loadAndSaveDataHome(responseDataHome);
          });
        }
      }
    }
    return datahome ;
  }

  Future<PublicHomeModel?> _loadAndSaveDataHome(PublicHomeModel dataModel) async{
    PublicHomeModel? datahome = dataModel;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
    await _dbRepository.saveOrUpdateDataHomeInfo(dataModel);

      datahome.age = age;

      await _dbRepository.saveOrUpdateDataHome(datahome);

    return await _dbRepository.loadDataHome('');
  }

  Future<PublicHomeModel?> loadDataHome( String searchKey) async{
   // PublicHomeModel? appList = await _dbRepository.loadDataHomeInfo('');
    PublicHomeModel? appList1 = await _dbRepository.loadDataHome(searchKey) ;
    return appList1;
  }

//END of GetDataHome
//----------------------
  


  Future<bool> isOldTestList()async{
    int ageDB = await _dbRepository.listTestAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyTestListDB() async {
    var test;
    test = await _dbRepository.loadTestList('');
    if ((test != null) || (test != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<TestListingModel?> getTestList(String url, int page)async{
  TestListingModel? test ;

   if(page == 1){
			//await _dbRepository.deleteAllTestList();
            test = await _apiProvider.getListTest(url, page)
                  .then((responseTestList) {
                    _loadAndSaveTestList1(responseTestList, '', page);
					return responseTestList;
                  });
   }else{
      test = await _apiProvider.getListTest(url, page)
                  .then((responseTestList) {
				  try{
				      return  _loadAndSaveTestList(responseTestList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return test;
	}



Future<TestListingModel?> getTestListSearch(String url, int page)async{
  TestListingModel? test ;   
  test = await _apiProvider.getListTest(url, page)
		  .then((responseTestList) {
		  
   if(page == -1 ){
        return  _loadAndSaveTestListSearch(responseTestList, '', responseTestList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveTestListSearch(responseTestList, '', page);
      }
		  
		  
			
		  }); 
  return test;
}


Future<TestListingModel> _loadAndSaveTestListSearch(TestListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.multiline;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.article;
	  list.items.items[i].item!.pht = list.items.items[i].item!.image_url;
    }
    return list;
 }

Future<TestListingModel?> _loadAndSaveTestList(TestListingModel list, String searchKey, int page) async{
    TestListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateTestListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemTestModel test;
      test = list.items.items[i];
      test.item!.cnt = i ;
      test.item!.age = age;
      test.item!.page = page;
	  test.item!.ttl = '';
	  test.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  test.item!.sbttl = '';
	  
	  test.item!.id = test.item!.test_id; 
	  
	  test.item!.ttl = test.item!.user_name;
	  test.item!.ttl = test.item!.title;
	  test.item!.sbttl = test.item!.multiline;
	  test.item!.sbttl = test.item!.article;
	  test.item!.pht = test.item!.image_url;
      await _dbRepository.saveOrUpdateTestList(test);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadTestList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveTestList1(TestListingModel list, String searchKey, int page) async{
    TestListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateTestListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemTestModel test;
      test = list.items.items[i];
      test.item!.cnt = i ;
      test.item!.age = age;
      test.item!.page = page;
	  test.item!.ttl = '';
	  test.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  test.item!.sbttl = '';
	  
	  test.item!.id = test.item!.test_id; 
	  
	  test.item!.ttl = test.item!.user_name;
	  test.item!.ttl = test.item!.title;
	  test.item!.sbttl = test.item!.multiline;
	  test.item!.sbttl = test.item!.article;
	  test.item!.pht = test.item!.image_url;
      await _dbRepository.saveOrUpdateTestList(test);
    }

  }


  Future<TestListingModel> loadTestList( String searchKey) async{
    TestListingModel appList = await _dbRepository.loadTestListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadTestList(searchKey)) ;
    return appList;
  }

  Future getTestEdit(String url, String id, String title)async{
    var editTest;
    editTest = await _apiProvider.getDataTest(url, id, title);
    return editTest;
  }

  Future getTestView(String url, String id, String title)async{
    var  viewTest;
    viewTest = await _apiProvider.getViewDataTest(url, id, title);
    return viewTest;
  }

  Future sendTestPost(String url, var formdata)async{
    var postTest;
    postTest = await _apiProvider.sendDataTest(url, formdata);
    return postTest;
  }
  
   Future sendTestPostWithID(String url, var formdata, String id, String title)async{
    var postTest;
    postTest = await _apiProvider.sendDataWithIDTest(url, formdata, id, title);
    return postTest;
  }
  
  


  Future<bool> isOldTestimonialList()async{
    int ageDB = await _dbRepository.listTestimonialAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyTestimonialListDB() async {
    var testimonial;
    testimonial = await _dbRepository.loadTestimonialList('');
    if ((testimonial != null) || (testimonial != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<TestimonialListingModel?> getTestimonialList(String url, int page)async{
  TestimonialListingModel? testimonial ;

   if(page == 1){
			//await _dbRepository.deleteAllTestimonialList();
            testimonial = await _apiProvider.getListTestimonial(url, page)
                  .then((responseTestimonialList) {
                    _loadAndSaveTestimonialList1(responseTestimonialList, '', page);
					return responseTestimonialList;
                  });
   }else{
      testimonial = await _apiProvider.getListTestimonial(url, page)
                  .then((responseTestimonialList) {
				  try{
				      return  _loadAndSaveTestimonialList(responseTestimonialList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return testimonial;
	}



Future<TestimonialListingModel?> getTestimonialListSearch(String url, int page)async{
  TestimonialListingModel? testimonial ;   
  testimonial = await _apiProvider.getListTestimonial(url, page)
		  .then((responseTestimonialList) {
		  
   if(page == -1 ){
        return  _loadAndSaveTestimonialListSearch(responseTestimonialList, '', responseTestimonialList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveTestimonialListSearch(responseTestimonialList, '', page);
      }
		  
		  
			
		  }); 
  return testimonial;
}


Future<TestimonialListingModel> _loadAndSaveTestimonialListSearch(TestimonialListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.feedback;
	  list.items.items[i].item!.pht = list.items.items[i].item!.user_photo_url;
    }
    return list;
 }

Future<TestimonialListingModel?> _loadAndSaveTestimonialList(TestimonialListingModel list, String searchKey, int page) async{
    TestimonialListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateTestimonialListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemTestimonialModel testimonial;
      testimonial = list.items.items[i];
      testimonial.item!.cnt = i ;
      testimonial.item!.age = age;
      testimonial.item!.page = page;
	  testimonial.item!.ttl = '';
	  testimonial.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  testimonial.item!.sbttl = '';
	  
	  testimonial.item!.id = testimonial.item!.testimony_id; 
	  
	  testimonial.item!.sbttl = testimonial.item!.feedback;
	  testimonial.item!.pht = testimonial.item!.user_photo_url;
      await _dbRepository.saveOrUpdateTestimonialList(testimonial);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadTestimonialList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveTestimonialList1(TestimonialListingModel list, String searchKey, int page) async{
    TestimonialListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateTestimonialListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemTestimonialModel testimonial;
      testimonial = list.items.items[i];
      testimonial.item!.cnt = i ;
      testimonial.item!.age = age;
      testimonial.item!.page = page;
	  testimonial.item!.ttl = '';
	  testimonial.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  testimonial.item!.sbttl = '';
	  
	  testimonial.item!.id = testimonial.item!.testimony_id; 
	  
	  testimonial.item!.sbttl = testimonial.item!.feedback;
	  testimonial.item!.pht = testimonial.item!.user_photo_url;
      await _dbRepository.saveOrUpdateTestimonialList(testimonial);
    }

  }


  Future<TestimonialListingModel> loadTestimonialList( String searchKey) async{
    TestimonialListingModel appList = await _dbRepository.loadTestimonialListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadTestimonialList(searchKey)) ;
    return appList;
  }

  Future getTestimonialEdit(String url, String id, String title)async{
    var editTestimonial;
    editTestimonial = await _apiProvider.getDataTestimonial(url, id, title);
    return editTestimonial;
  }

  Future getTestimonialView(String url, String id, String title)async{
    var  viewTestimonial;
    viewTestimonial = await _apiProvider.getViewDataTestimonial(url, id, title);
    return viewTestimonial;
  }

  Future sendTestimonialPost(String url, var formdata)async{
    var postTestimonial;
    postTestimonial = await _apiProvider.sendDataTestimonial(url, formdata);
    return postTestimonial;
  }
  
   Future sendTestimonialPostWithID(String url, var formdata, String id, String title)async{
    var postTestimonial;
    postTestimonial = await _apiProvider.sendDataWithIDTestimonial(url, formdata, id, title);
    return postTestimonial;
  }
  
  


  Future<bool> isOldCeritaSuksesList()async{
    int ageDB = await _dbRepository.listCeritaSuksesAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyCeritaSuksesListDB() async {
    var cerita_sukses;
    cerita_sukses = await _dbRepository.loadCeritaSuksesList('');
    if ((cerita_sukses != null) || (cerita_sukses != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<CeritaSuksesListingModel?> getCeritaSuksesList(String url, int page)async{
  CeritaSuksesListingModel? cerita_sukses ;

   if(page == 1){
			//await _dbRepository.deleteAllCeritaSuksesList();
            cerita_sukses = await _apiProvider.getListCeritaSukses(url, page)
                  .then((responseCeritaSuksesList) {
                    _loadAndSaveCeritaSuksesList1(responseCeritaSuksesList, '', page);
					return responseCeritaSuksesList;
                  });
   }else{
      cerita_sukses = await _apiProvider.getListCeritaSukses(url, page)
                  .then((responseCeritaSuksesList) {
				  try{
				      return  _loadAndSaveCeritaSuksesList(responseCeritaSuksesList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return cerita_sukses;
	}



Future<CeritaSuksesListingModel?> getCeritaSuksesListSearch(String url, int page)async{
  CeritaSuksesListingModel? cerita_sukses ;   
  cerita_sukses = await _apiProvider.getListCeritaSukses(url, page)
		  .then((responseCeritaSuksesList) {
		  
   if(page == -1 ){
        return  _loadAndSaveCeritaSuksesListSearch(responseCeritaSuksesList, '', responseCeritaSuksesList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveCeritaSuksesListSearch(responseCeritaSuksesList, '', page);
      }
		  
		  
			
		  }); 
  return cerita_sukses;
}


Future<CeritaSuksesListingModel> _loadAndSaveCeritaSuksesListSearch(CeritaSuksesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.teaser;
	  list.items.items[i].item!.pht = list.items.items[i].item!.image_url;
    }
    return list;
 }

Future<CeritaSuksesListingModel?> _loadAndSaveCeritaSuksesList(CeritaSuksesListingModel list, String searchKey, int page) async{
    CeritaSuksesListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCeritaSuksesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCeritaSuksesModel cerita_sukses;
      cerita_sukses = list.items.items[i];
      cerita_sukses.item!.cnt = i ;
      cerita_sukses.item!.age = age;
      cerita_sukses.item!.page = page;
	  cerita_sukses.item!.ttl = '';
	  cerita_sukses.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  cerita_sukses.item!.sbttl = '';
	  
	  cerita_sukses.item!.id = cerita_sukses.item!.article_id; 
	  
	  cerita_sukses.item!.ttl = cerita_sukses.item!.title;
	  cerita_sukses.item!.sbttl = cerita_sukses.item!.teaser;
	  cerita_sukses.item!.pht = cerita_sukses.item!.image_url;
      await _dbRepository.saveOrUpdateCeritaSuksesList(cerita_sukses);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCeritaSuksesList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveCeritaSuksesList1(CeritaSuksesListingModel list, String searchKey, int page) async{
    CeritaSuksesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCeritaSuksesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCeritaSuksesModel cerita_sukses;
      cerita_sukses = list.items.items[i];
      cerita_sukses.item!.cnt = i ;
      cerita_sukses.item!.age = age;
      cerita_sukses.item!.page = page;
	  cerita_sukses.item!.ttl = '';
	  cerita_sukses.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  cerita_sukses.item!.sbttl = '';
	  
	  cerita_sukses.item!.id = cerita_sukses.item!.article_id; 
	  
	  cerita_sukses.item!.ttl = cerita_sukses.item!.title;
	  cerita_sukses.item!.sbttl = cerita_sukses.item!.teaser;
	  cerita_sukses.item!.pht = cerita_sukses.item!.image_url;
      await _dbRepository.saveOrUpdateCeritaSuksesList(cerita_sukses);
    }

  }


  Future<CeritaSuksesListingModel> loadCeritaSuksesList( String searchKey) async{
    CeritaSuksesListingModel appList = await _dbRepository.loadCeritaSuksesListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCeritaSuksesList(searchKey)) ;
    return appList;
  }

  Future getCeritaSuksesEdit(String url, String id, String title)async{
    var editCeritaSukses;
    editCeritaSukses = await _apiProvider.getDataCeritaSukses(url, id, title);
    return editCeritaSukses;
  }

  Future getCeritaSuksesView(String url, String id, String title)async{
    var  viewCeritaSukses;
    viewCeritaSukses = await _apiProvider.getViewDataCeritaSukses(url, id, title);
    return viewCeritaSukses;
  }

  Future sendCeritaSuksesPost(String url, var formdata)async{
    var postCeritaSukses;
    postCeritaSukses = await _apiProvider.sendDataCeritaSukses(url, formdata);
    return postCeritaSukses;
  }
  
   Future sendCeritaSuksesPostWithID(String url, var formdata, String id, String title)async{
    var postCeritaSukses;
    postCeritaSukses = await _apiProvider.sendDataWithIDCeritaSukses(url, formdata, id, title);
    return postCeritaSukses;
  }
  
  


  Future<bool> isOldTipsList()async{
    int ageDB = await _dbRepository.listTipsAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyTipsListDB() async {
    var tips;
    tips = await _dbRepository.loadTipsList('');
    if ((tips != null) || (tips != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<TipsListingModel?> getTipsList(String url, int page)async{
  TipsListingModel? tips ;

   if(page == 1){
			//await _dbRepository.deleteAllTipsList();
            tips = await _apiProvider.getListTips(url, page)
                  .then((responseTipsList) {
                    _loadAndSaveTipsList1(responseTipsList, '', page);
					return responseTipsList;
                  });
   }else{
      tips = await _apiProvider.getListTips(url, page)
                  .then((responseTipsList) {
				  try{
				      return  _loadAndSaveTipsList(responseTipsList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return tips;
	}



Future<TipsListingModel?> getTipsListSearch(String url, int page)async{
  TipsListingModel? tips ;   
  tips = await _apiProvider.getListTips(url, page)
		  .then((responseTipsList) {
		  
   if(page == -1 ){
        return  _loadAndSaveTipsListSearch(responseTipsList, '', responseTipsList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveTipsListSearch(responseTipsList, '', page);
      }
		  
		  
			
		  }); 
  return tips;
}


Future<TipsListingModel> _loadAndSaveTipsListSearch(TipsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.teaser;
	  list.items.items[i].item!.pht = list.items.items[i].item!.image_url;
    }
    return list;
 }

Future<TipsListingModel?> _loadAndSaveTipsList(TipsListingModel list, String searchKey, int page) async{
    TipsListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateTipsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemTipsModel tips;
      tips = list.items.items[i];
      tips.item!.cnt = i ;
      tips.item!.age = age;
      tips.item!.page = page;
	  tips.item!.ttl = '';
	  tips.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  tips.item!.sbttl = '';
	  
	  tips.item!.id = tips.item!.article_id; 
	  
	  tips.item!.ttl = tips.item!.title;
	  tips.item!.sbttl = tips.item!.teaser;
	  tips.item!.pht = tips.item!.image_url;
      await _dbRepository.saveOrUpdateTipsList(tips);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadTipsList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveTipsList1(TipsListingModel list, String searchKey, int page) async{
    TipsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateTipsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemTipsModel tips;
      tips = list.items.items[i];
      tips.item!.cnt = i ;
      tips.item!.age = age;
      tips.item!.page = page;
	  tips.item!.ttl = '';
	  tips.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  tips.item!.sbttl = '';
	  
	  tips.item!.id = tips.item!.article_id; 
	  
	  tips.item!.ttl = tips.item!.title;
	  tips.item!.sbttl = tips.item!.teaser;
	  tips.item!.pht = tips.item!.image_url;
      await _dbRepository.saveOrUpdateTipsList(tips);
    }

  }


  Future<TipsListingModel> loadTipsList( String searchKey) async{
    TipsListingModel appList = await _dbRepository.loadTipsListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadTipsList(searchKey)) ;
    return appList;
  }

  Future getTipsEdit(String url, String id, String title)async{
    var editTips;
    editTips = await _apiProvider.getDataTips(url, id, title);
    return editTips;
  }

  Future getTipsView(String url, String id, String title)async{
    var  viewTips;
    viewTips = await _apiProvider.getViewDataTips(url, id, title);
    return viewTips;
  }

  Future sendTipsPost(String url, var formdata)async{
    var postTips;
    postTips = await _apiProvider.sendDataTips(url, formdata);
    return postTips;
  }
  
   Future sendTipsPostWithID(String url, var formdata, String id, String title)async{
    var postTips;
    postTips = await _apiProvider.sendDataWithIDTips(url, formdata, id, title);
    return postTips;
  }
  
  


  Future<bool> isOldBrowseProjectsList()async{
   MaxAge = 18000;
    int ageDB = await _dbRepository.listBrowseProjectsAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyBrowseProjectsListDB() async {
    var browse_projects;
    browse_projects = await _dbRepository.loadBrowseProjectsList('');
    if ((browse_projects != null) || (browse_projects != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<BrowseProjectsListingModel?> getBrowseProjectsList(String url, int page)async{
  BrowseProjectsListingModel? browse_projects ;

   if(page == 1){
			//await _dbRepository.deleteAllBrowseProjectsList();
            browse_projects = await _apiProvider.getListBrowseProjects(url, page)
                  .then((responseBrowseProjectsList) {
                    _loadAndSaveBrowseProjectsList1(responseBrowseProjectsList, '', page);
					return responseBrowseProjectsList;
                  });
   }else{
      browse_projects = await _apiProvider.getListBrowseProjects(url, page)
                  .then((responseBrowseProjectsList) {
				  try{
				      return  _loadAndSaveBrowseProjectsList(responseBrowseProjectsList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return browse_projects;
	}



Future<BrowseProjectsListingModel?> getBrowseProjectsListSearch(String url, int page)async{
  BrowseProjectsListingModel? browse_projects ;   
  browse_projects = await _apiProvider.getListBrowseProjects(url, page)
		  .then((responseBrowseProjectsList) {
		  
   if(page == -1 ){
        return  _loadAndSaveBrowseProjectsListSearch(responseBrowseProjectsList, '', responseBrowseProjectsList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveBrowseProjectsListSearch(responseBrowseProjectsList, '', page);
      }
		  
		  
			
		  }); 
  return browse_projects;
}


Future<BrowseProjectsListingModel> _loadAndSaveBrowseProjectsListSearch(BrowseProjectsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.pht = list.items.items[i].item!.owner_photo_url;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.owner_user_name;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.short_description;
    }
    return list;
 }

Future<BrowseProjectsListingModel?> _loadAndSaveBrowseProjectsList(BrowseProjectsListingModel list, String searchKey, int page) async{
    BrowseProjectsListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBrowseProjectsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBrowseProjectsModel browse_projects;
      browse_projects = list.items.items[i];
      browse_projects.item!.cnt = i ;
      browse_projects.item!.age = age;
      browse_projects.item!.page = page;
	  browse_projects.item!.ttl = '';
	  browse_projects.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  browse_projects.item!.sbttl = '';
	  
	  browse_projects.item!.id = browse_projects.item!.project_id; 
	  
	  browse_projects.item!.pht = browse_projects.item!.owner_photo_url;
	  browse_projects.item!.ttl = browse_projects.item!.owner_user_name;
	  browse_projects.item!.ttl = browse_projects.item!.title;
	  browse_projects.item!.sbttl = browse_projects.item!.short_description;
      await _dbRepository.saveOrUpdateBrowseProjectsList(browse_projects);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBrowseProjectsList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveBrowseProjectsList1(BrowseProjectsListingModel list, String searchKey, int page) async{
    BrowseProjectsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBrowseProjectsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBrowseProjectsModel browse_projects;
      browse_projects = list.items.items[i];
      browse_projects.item!.cnt = i ;
      browse_projects.item!.age = age;
      browse_projects.item!.page = page;
	  browse_projects.item!.ttl = '';
	  browse_projects.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  browse_projects.item!.sbttl = '';
	  
	  browse_projects.item!.id = browse_projects.item!.project_id; 
	  
	  browse_projects.item!.pht = browse_projects.item!.owner_photo_url;
	  browse_projects.item!.ttl = browse_projects.item!.owner_user_name;
	  browse_projects.item!.ttl = browse_projects.item!.title;
	  browse_projects.item!.sbttl = browse_projects.item!.short_description;
      await _dbRepository.saveOrUpdateBrowseProjectsList(browse_projects);
    }

  }


  Future<BrowseProjectsListingModel> loadBrowseProjectsList( String searchKey) async{
    BrowseProjectsListingModel appList = await _dbRepository.loadBrowseProjectsListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBrowseProjectsList(searchKey)) ;
    return appList;
  }

  Future getBrowseProjectsEdit(String url, String id, String title)async{
    var editBrowseProjects;
    editBrowseProjects = await _apiProvider.getDataBrowseProjects(url, id, title);
    return editBrowseProjects;
  }

  Future getBrowseProjectsView(String url, String id, String title)async{
    var  viewBrowseProjects;
    viewBrowseProjects = await _apiProvider.getViewDataBrowseProjects(url, id, title);
    return viewBrowseProjects;
  }

  Future sendBrowseProjectsPost(String url, var formdata)async{
    var postBrowseProjects;
    postBrowseProjects = await _apiProvider.sendDataBrowseProjects(url, formdata);
    return postBrowseProjects;
  }
  
   Future sendBrowseProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postBrowseProjects;
    postBrowseProjects = await _apiProvider.sendDataWithIDBrowseProjects(url, formdata, id, title);
    return postBrowseProjects;
  }
  
    Future getPlaceNewBidBrowseProjectsEdit(String url, String id, String title)async{
    var editPlaceNewBid;
    editPlaceNewBid = await _apiProvider.getDataPlaceNewBidBrowseProjects(url, id, title);
    return editPlaceNewBid;
  }

  Future getPlaceNewBidBrowseProjectsView(String url, String id, String title)async{
    var  viewPlaceNewBid;
    viewPlaceNewBid = await _apiProvider.getDataPlaceNewBidBrowseProjects(url, id, title);
    return viewPlaceNewBid;
  }

  Future sendPlaceNewBidBrowseProjectsPost(String url, var formdata)async{
    var postPlaceNewBid;
    postPlaceNewBid = await _apiProvider.sendDataPlaceNewBidBrowseProjects(url, formdata);
    return postPlaceNewBid;
  }
  
   Future sendPlaceNewBidBrowseProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postPlaceNewBid;
    postPlaceNewBid = await _apiProvider.sendDataWithIDPlaceNewBidBrowseProjects(url, formdata, id, title);
    return postPlaceNewBid;
  }
  
    Future<PlaceNewBidBrowseProjectsModel> getPlaceNewBidBrowseProjects(String url, String id, String title, String spKey)async{
  PlaceNewBidBrowseProjectsModel browse_projects ;
   PlaceNewBidBrowseProjectsModel browse_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PlaceNewBid')){
			 browse_projects1 = await _apiProvider.getDataPlaceNewBidBrowseProjects(url, id, title)
					  .then((responsePlaceNewBidBrowseProjects) {
					   
						return responsePlaceNewBidBrowseProjects;
					  });
			spKey = browse_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PlaceNewBid')){
			 browse_projects1 = await _apiProvider.getDataPlaceNewBidBrowseProjects(url, id, title)
					  .then((responsePlaceNewBidBrowseProjects) {
					   
						return responsePlaceNewBidBrowseProjects;
					  });
			spKey = browse_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PlaceNewBid')){
			 browse_projects1 = await _apiProvider.getDataPlaceNewBidBrowseProjects(url, id, title)
					  .then((responsePlaceNewBidBrowseProjects) {
					   
						return responsePlaceNewBidBrowseProjects;
					  });
			spKey = browse_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PlaceNewBid')){
			 browse_projects1 = await _apiProvider.getDataPlaceNewBidBrowseProjects(url, id, title)
					  .then((responsePlaceNewBidBrowseProjects) {
					   
						return responsePlaceNewBidBrowseProjects;
					  });
			spKey = browse_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPlaceNewBidBrowseProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  browse_projects = await _apiProvider.getDataPlaceNewBidBrowseProjects(url, id, title)
                  .then((responsePlaceNewBidBrowseProjects) {
                    saveOrUpdatePlaceNewBidBrowseProjects(responsePlaceNewBidBrowseProjects, spKey, 1 );
					return responsePlaceNewBidBrowseProjects;
                  });
			  return browse_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PlaceNewBidBrowseProjectsModel?> loadPlaceNewBidBrowseProjects( String searchKey) async{
   return await _dbRepository.loadPlaceNewBidBrowseProjects(searchKey) ;   
  }
  
   Future<PlaceNewBidBrowseProjectsModel?> saveOrUpdatePlaceNewBidBrowseProjects(PlaceNewBidBrowseProjectsModel browse_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePlaceNewBidBrowseProjects(browse_projects, searchKey);   
    return await _dbRepository. loadPlaceNewBidBrowseProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllPlaceNewBidBrowseProjects(String spKey) async{
      return await _dbRepository.deleteAllPlaceNewBidBrowseProjects(spKey); 
   }
  
    Future getAskOwnerBrowseProjectsEdit(String url, String id, String title)async{
    var editAskOwner;
    editAskOwner = await _apiProvider.getDataAskOwnerBrowseProjects(url, id, title);
    return editAskOwner;
  }

  Future getAskOwnerBrowseProjectsView(String url, String id, String title)async{
    var  viewAskOwner;
    viewAskOwner = await _apiProvider.getDataAskOwnerBrowseProjects(url, id, title);
    return viewAskOwner;
  }

  Future sendAskOwnerBrowseProjectsPost(String url, var formdata)async{
    var postAskOwner;
    postAskOwner = await _apiProvider.sendDataAskOwnerBrowseProjects(url, formdata);
    return postAskOwner;
  }
  
   Future sendAskOwnerBrowseProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postAskOwner;
    postAskOwner = await _apiProvider.sendDataWithIDAskOwnerBrowseProjects(url, formdata, id, title);
    return postAskOwner;
  }
  
    Future<AskOwnerBrowseProjectsModel> getAskOwnerBrowseProjects(String url, String id, String title, String spKey)async{
  AskOwnerBrowseProjectsModel browse_projects ;
   AskOwnerBrowseProjectsModel browse_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('AskOwner')){
			 browse_projects1 = await _apiProvider.getDataAskOwnerBrowseProjects(url, id, title)
					  .then((responseAskOwnerBrowseProjects) {
					   
						return responseAskOwnerBrowseProjects;
					  });
			spKey = browse_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('AskOwner')){
			 browse_projects1 = await _apiProvider.getDataAskOwnerBrowseProjects(url, id, title)
					  .then((responseAskOwnerBrowseProjects) {
					   
						return responseAskOwnerBrowseProjects;
					  });
			spKey = browse_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('AskOwner')){
			 browse_projects1 = await _apiProvider.getDataAskOwnerBrowseProjects(url, id, title)
					  .then((responseAskOwnerBrowseProjects) {
					   
						return responseAskOwnerBrowseProjects;
					  });
			spKey = browse_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('AskOwner')){
			 browse_projects1 = await _apiProvider.getDataAskOwnerBrowseProjects(url, id, title)
					  .then((responseAskOwnerBrowseProjects) {
					   
						return responseAskOwnerBrowseProjects;
					  });
			spKey = browse_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadAskOwnerBrowseProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  browse_projects = await _apiProvider.getDataAskOwnerBrowseProjects(url, id, title)
                  .then((responseAskOwnerBrowseProjects) {
                    saveOrUpdateAskOwnerBrowseProjects(responseAskOwnerBrowseProjects, spKey, 1 );
					return responseAskOwnerBrowseProjects;
                  });
			  return browse_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<AskOwnerBrowseProjectsModel?> loadAskOwnerBrowseProjects( String searchKey) async{
   return await _dbRepository.loadAskOwnerBrowseProjects(searchKey) ;   
  }
  
   Future<AskOwnerBrowseProjectsModel?> saveOrUpdateAskOwnerBrowseProjects(AskOwnerBrowseProjectsModel browse_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateAskOwnerBrowseProjects(browse_projects, searchKey);   
    return await _dbRepository. loadAskOwnerBrowseProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllAskOwnerBrowseProjects(String spKey) async{
      return await _dbRepository.deleteAllAskOwnerBrowseProjects(spKey); 
   }
  
    Future getGuestCreateProjectBrowseProjectsEdit(String url, String id, String title)async{
    var editGuestCreateProject;
    editGuestCreateProject = await _apiProvider.getDataGuestCreateProjectBrowseProjects(url, id, title);
    return editGuestCreateProject;
  }

  Future getGuestCreateProjectBrowseProjectsView(String url, String id, String title)async{
    var  viewGuestCreateProject;
    viewGuestCreateProject = await _apiProvider.getDataGuestCreateProjectBrowseProjects(url, id, title);
    return viewGuestCreateProject;
  }

  Future sendGuestCreateProjectBrowseProjectsPost(String url, var formdata)async{
    var postGuestCreateProject;
    postGuestCreateProject = await _apiProvider.sendDataGuestCreateProjectBrowseProjects(url, formdata);
    return postGuestCreateProject;
  }
  
   Future sendGuestCreateProjectBrowseProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postGuestCreateProject;
    postGuestCreateProject = await _apiProvider.sendDataWithIDGuestCreateProjectBrowseProjects(url, formdata, id, title);
    return postGuestCreateProject;
  }
  
    Future<GuestCreateProjectBrowseProjectsModel> getGuestCreateProjectBrowseProjects(String url, String id, String title, String spKey)async{
  GuestCreateProjectBrowseProjectsModel browse_projects ;
   GuestCreateProjectBrowseProjectsModel browse_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('GuestCreateProject')){
			 browse_projects1 = await _apiProvider.getDataGuestCreateProjectBrowseProjects(url, id, title)
					  .then((responseGuestCreateProjectBrowseProjects) {
					   
						return responseGuestCreateProjectBrowseProjects;
					  });
			spKey = browse_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('GuestCreateProject')){
			 browse_projects1 = await _apiProvider.getDataGuestCreateProjectBrowseProjects(url, id, title)
					  .then((responseGuestCreateProjectBrowseProjects) {
					   
						return responseGuestCreateProjectBrowseProjects;
					  });
			spKey = browse_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('GuestCreateProject')){
			 browse_projects1 = await _apiProvider.getDataGuestCreateProjectBrowseProjects(url, id, title)
					  .then((responseGuestCreateProjectBrowseProjects) {
					   
						return responseGuestCreateProjectBrowseProjects;
					  });
			spKey = browse_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('GuestCreateProject')){
			 browse_projects1 = await _apiProvider.getDataGuestCreateProjectBrowseProjects(url, id, title)
					  .then((responseGuestCreateProjectBrowseProjects) {
					   
						return responseGuestCreateProjectBrowseProjects;
					  });
			spKey = browse_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadGuestCreateProjectBrowseProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  browse_projects = await _apiProvider.getDataGuestCreateProjectBrowseProjects(url, id, title)
                  .then((responseGuestCreateProjectBrowseProjects) {
                    saveOrUpdateGuestCreateProjectBrowseProjects(responseGuestCreateProjectBrowseProjects, spKey, 1 );
					return responseGuestCreateProjectBrowseProjects;
                  });
			  return browse_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<GuestCreateProjectBrowseProjectsModel?> loadGuestCreateProjectBrowseProjects( String searchKey) async{
   return await _dbRepository.loadGuestCreateProjectBrowseProjects(searchKey) ;   
  }
  
   Future<GuestCreateProjectBrowseProjectsModel?> saveOrUpdateGuestCreateProjectBrowseProjects(GuestCreateProjectBrowseProjectsModel browse_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateGuestCreateProjectBrowseProjects(browse_projects, searchKey);   
    return await _dbRepository. loadGuestCreateProjectBrowseProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllGuestCreateProjectBrowseProjects(String spKey) async{
      return await _dbRepository.deleteAllGuestCreateProjectBrowseProjects(spKey); 
   }
  
  


  Future<bool> isOldPastProjectsList()async{
    int ageDB = await _dbRepository.listPastProjectsAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyPastProjectsListDB() async {
    var past_projects;
    past_projects = await _dbRepository.loadPastProjectsList('');
    if ((past_projects != null) || (past_projects != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<PastProjectsListingModel?> getPastProjectsList(String url, int page)async{
  PastProjectsListingModel? past_projects ;

   if(page == 1){
			//await _dbRepository.deleteAllPastProjectsList();
            past_projects = await _apiProvider.getListPastProjects(url, page)
                  .then((responsePastProjectsList) {
                    _loadAndSavePastProjectsList1(responsePastProjectsList, '', page);
					return responsePastProjectsList;
                  });
   }else{
      past_projects = await _apiProvider.getListPastProjects(url, page)
                  .then((responsePastProjectsList) {
				  try{
				      return  _loadAndSavePastProjectsList(responsePastProjectsList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return past_projects;
	}



Future<PastProjectsListingModel?> getPastProjectsListSearch(String url, int page)async{
  PastProjectsListingModel? past_projects ;   
  past_projects = await _apiProvider.getListPastProjects(url, page)
		  .then((responsePastProjectsList) {
		  
   if(page == -1 ){
        return  _loadAndSavePastProjectsListSearch(responsePastProjectsList, '', responsePastProjectsList.tools.paging.total_pages);
      }else{
        return  _loadAndSavePastProjectsListSearch(responsePastProjectsList, '', page);
      }
		  
		  
			
		  }); 
  return past_projects;
}


Future<PastProjectsListingModel> _loadAndSavePastProjectsListSearch(PastProjectsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.pht = list.items.items[i].item!.owner_photo_url;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.owner_user_name;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.short_description;
    }
    return list;
 }

Future<PastProjectsListingModel?> _loadAndSavePastProjectsList(PastProjectsListingModel list, String searchKey, int page) async{
    PastProjectsListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePastProjectsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPastProjectsModel past_projects;
      past_projects = list.items.items[i];
      past_projects.item!.cnt = i ;
      past_projects.item!.age = age;
      past_projects.item!.page = page;
	  past_projects.item!.ttl = '';
	  past_projects.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  past_projects.item!.sbttl = '';
	  
	  past_projects.item!.id = past_projects.item!.project_id; 
	  
	  past_projects.item!.pht = past_projects.item!.owner_photo_url;
	  past_projects.item!.ttl = past_projects.item!.owner_user_name;
	  past_projects.item!.ttl = past_projects.item!.title;
	  past_projects.item!.sbttl = past_projects.item!.short_description;
      await _dbRepository.saveOrUpdatePastProjectsList(past_projects);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPastProjectsList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSavePastProjectsList1(PastProjectsListingModel list, String searchKey, int page) async{
    PastProjectsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdatePastProjectsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemPastProjectsModel past_projects;
      past_projects = list.items.items[i];
      past_projects.item!.cnt = i ;
      past_projects.item!.age = age;
      past_projects.item!.page = page;
	  past_projects.item!.ttl = '';
	  past_projects.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  past_projects.item!.sbttl = '';
	  
	  past_projects.item!.id = past_projects.item!.project_id; 
	  
	  past_projects.item!.pht = past_projects.item!.owner_photo_url;
	  past_projects.item!.ttl = past_projects.item!.owner_user_name;
	  past_projects.item!.ttl = past_projects.item!.title;
	  past_projects.item!.sbttl = past_projects.item!.short_description;
      await _dbRepository.saveOrUpdatePastProjectsList(past_projects);
    }

  }


  Future<PastProjectsListingModel> loadPastProjectsList( String searchKey) async{
    PastProjectsListingModel appList = await _dbRepository.loadPastProjectsListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadPastProjectsList(searchKey)) ;
    return appList;
  }

  Future getPastProjectsEdit(String url, String id, String title)async{
    var editPastProjects;
    editPastProjects = await _apiProvider.getDataPastProjects(url, id, title);
    return editPastProjects;
  }

  Future getPastProjectsView(String url, String id, String title)async{
    var  viewPastProjects;
    viewPastProjects = await _apiProvider.getViewDataPastProjects(url, id, title);
    return viewPastProjects;
  }

  Future sendPastProjectsPost(String url, var formdata)async{
    var postPastProjects;
    postPastProjects = await _apiProvider.sendDataPastProjects(url, formdata);
    return postPastProjects;
  }
  
   Future sendPastProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postPastProjects;
    postPastProjects = await _apiProvider.sendDataWithIDPastProjects(url, formdata, id, title);
    return postPastProjects;
  }
  
  


  Future<bool> isOldNewUserList()async{
    int ageDB = await _dbRepository.listNewUserAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyNewUserListDB() async {
    var new_user;
    new_user = await _dbRepository.loadNewUserList('');
    if ((new_user != null) || (new_user != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<NewUserListingModel?> getNewUserList(String url, int page)async{
  NewUserListingModel? new_user ;

   if(page == 1){
			//await _dbRepository.deleteAllNewUserList();
            new_user = await _apiProvider.getListNewUser(url, page)
                  .then((responseNewUserList) {
                    _loadAndSaveNewUserList1(responseNewUserList, '', page);
					return responseNewUserList;
                  });
   }else{
      new_user = await _apiProvider.getListNewUser(url, page)
                  .then((responseNewUserList) {
				  try{
				      return  _loadAndSaveNewUserList(responseNewUserList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return new_user;
	}



Future<NewUserListingModel?> getNewUserListSearch(String url, int page)async{
  NewUserListingModel? new_user ;   
  new_user = await _apiProvider.getListNewUser(url, page)
		  .then((responseNewUserList) {
		  
   if(page == -1 ){
        return  _loadAndSaveNewUserListSearch(responseNewUserList, '', responseNewUserList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveNewUserListSearch(responseNewUserList, '', page);
      }
		  
		  
			
		  }); 
  return new_user;
}


Future<NewUserListingModel> _loadAndSaveNewUserListSearch(NewUserListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_ktp_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_siup_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_notes;
    }
    return list;
 }

Future<NewUserListingModel?> _loadAndSaveNewUserList(NewUserListingModel list, String searchKey, int page) async{
    NewUserListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateNewUserListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemNewUserModel new_user;
      new_user = list.items.items[i];
      new_user.item!.cnt = i ;
      new_user.item!.age = age;
      new_user.item!.page = page;
	  new_user.item!.ttl = '';
	  new_user.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  new_user.item!.sbttl = '';
	  
	  new_user.item!.id = new_user.item!.user_id; 
	  
	  new_user.item!.ttl = new_user.item!.user_name;
	  new_user.item!.pht = new_user.item!.scan_ktp_url;
	  new_user.item!.pht = new_user.item!.scan_siup_url;
	  new_user.item!.pht = new_user.item!.photo_url;
	  new_user.item!.sbttl = new_user.item!.self_introduction;
	  new_user.item!.sbttl = new_user.item!.admin_notes;
      await _dbRepository.saveOrUpdateNewUserList(new_user);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadNewUserList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveNewUserList1(NewUserListingModel list, String searchKey, int page) async{
    NewUserListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateNewUserListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemNewUserModel new_user;
      new_user = list.items.items[i];
      new_user.item!.cnt = i ;
      new_user.item!.age = age;
      new_user.item!.page = page;
	  new_user.item!.ttl = '';
	  new_user.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  new_user.item!.sbttl = '';
	  
	  new_user.item!.id = new_user.item!.user_id; 
	  
	  new_user.item!.ttl = new_user.item!.user_name;
	  new_user.item!.pht = new_user.item!.scan_ktp_url;
	  new_user.item!.pht = new_user.item!.scan_siup_url;
	  new_user.item!.pht = new_user.item!.photo_url;
	  new_user.item!.sbttl = new_user.item!.self_introduction;
	  new_user.item!.sbttl = new_user.item!.admin_notes;
      await _dbRepository.saveOrUpdateNewUserList(new_user);
    }

  }


  Future<NewUserListingModel> loadNewUserList( String searchKey) async{
    NewUserListingModel appList = await _dbRepository.loadNewUserListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadNewUserList(searchKey)) ;
    return appList;
  }

  Future getNewUserEdit(String url, String id, String title)async{
    var editNewUser;
    editNewUser = await _apiProvider.getDataNewUser(url, id, title);
    return editNewUser;
  }

  Future getNewUserView(String url, String id, String title)async{
    var  viewNewUser;
    viewNewUser = await _apiProvider.getViewDataNewUser(url, id, title);
    return viewNewUser;
  }

  Future sendNewUserPost(String url, var formdata)async{
    var postNewUser;
    postNewUser = await _apiProvider.sendDataNewUser(url, formdata);
    return postNewUser;
  }
  
   Future sendNewUserPostWithID(String url, var formdata, String id, String title)async{
    var postNewUser;
    postNewUser = await _apiProvider.sendDataWithIDNewUser(url, formdata, id, title);
    return postNewUser;
  }
  
    Future getRegisterNewUserEdit(String url, String id, String title)async{
    var editRegister;
    editRegister = await _apiProvider.getDataRegisterNewUser(url, id, title);
    return editRegister;
  }

  Future getRegisterNewUserView(String url, String id, String title)async{
    var  viewRegister;
    viewRegister = await _apiProvider.getDataRegisterNewUser(url, id, title);
    return viewRegister;
  }

  Future sendRegisterNewUserPost(String url, var formdata)async{
    var postRegister;
    postRegister = await _apiProvider.sendDataRegisterNewUser(url, formdata);
    return postRegister;
  }
  
   Future sendRegisterNewUserPostWithID(String url, var formdata, String id, String title)async{
    var postRegister;
    postRegister = await _apiProvider.sendDataWithIDRegisterNewUser(url, formdata, id, title);
    return postRegister;
  }
  
    Future<RegisterNewUserModel> getRegisterNewUser(String url, String id, String title, String spKey)async{
  RegisterNewUserModel new_user ;
   RegisterNewUserModel new_user1 ;
          var data ;
			  if(['PlaceNewBid'].contains('Register')){
			 new_user1 = await _apiProvider.getDataRegisterNewUser(url, id, title)
					  .then((responseRegisterNewUser) {
					   
						return responseRegisterNewUser;
					  });
			spKey = new_user1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('Register')){
			 new_user1 = await _apiProvider.getDataRegisterNewUser(url, id, title)
					  .then((responseRegisterNewUser) {
					   
						return responseRegisterNewUser;
					  });
			spKey = new_user1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('Register')){
			 new_user1 = await _apiProvider.getDataRegisterNewUser(url, id, title)
					  .then((responseRegisterNewUser) {
					   
						return responseRegisterNewUser;
					  });
			spKey = new_user1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('Register')){
			 new_user1 = await _apiProvider.getDataRegisterNewUser(url, id, title)
					  .then((responseRegisterNewUser) {
					   
						return responseRegisterNewUser;
					  });
			spKey = new_user1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadRegisterNewUser(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  new_user = await _apiProvider.getDataRegisterNewUser(url, id, title)
                  .then((responseRegisterNewUser) {
                    saveOrUpdateRegisterNewUser(responseRegisterNewUser, spKey, 1 );
					return responseRegisterNewUser;
                  });
			  return new_user;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<RegisterNewUserModel?> loadRegisterNewUser( String searchKey) async{
   return await _dbRepository.loadRegisterNewUser(searchKey) ;   
  }
  
   Future<RegisterNewUserModel?> saveOrUpdateRegisterNewUser(RegisterNewUserModel new_user, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateRegisterNewUser(new_user, searchKey);   
    return await _dbRepository. loadRegisterNewUser(searchKey) ;  
  }	
  
    Future<void> deleteAllRegisterNewUser(String spKey) async{
      return await _dbRepository.deleteAllRegisterNewUser(spKey); 
   }
  
    Future getVerifyNewUserEdit(String url, String id, String title)async{
    var editVerify;
    editVerify = await _apiProvider.getDataVerifyNewUser(url, id, title);
    return editVerify;
  }

  Future getVerifyNewUserView(String url, String id, String title)async{
    var  viewVerify;
    viewVerify = await _apiProvider.getDataVerifyNewUser(url, id, title);
    return viewVerify;
  }

  Future sendVerifyNewUserPost(String url, var formdata)async{
    var postVerify;
    postVerify = await _apiProvider.sendDataVerifyNewUser(url, formdata);
    return postVerify;
  }
  
   Future sendVerifyNewUserPostWithID(String url, var formdata, String id, String title)async{
    var postVerify;
    postVerify = await _apiProvider.sendDataWithIDVerifyNewUser(url, formdata, id, title);
    return postVerify;
  }
  
    Future<VerifyNewUserModel> getVerifyNewUser(String url, String id, String title, String spKey)async{
  VerifyNewUserModel new_user ;
   VerifyNewUserModel new_user1 ;
          var data ;
			  if(['PlaceNewBid'].contains('Verify')){
			 new_user1 = await _apiProvider.getDataVerifyNewUser(url, id, title)
					  .then((responseVerifyNewUser) {
					   
						return responseVerifyNewUser;
					  });
			spKey = new_user1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('Verify')){
			 new_user1 = await _apiProvider.getDataVerifyNewUser(url, id, title)
					  .then((responseVerifyNewUser) {
					   
						return responseVerifyNewUser;
					  });
			spKey = new_user1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('Verify')){
			 new_user1 = await _apiProvider.getDataVerifyNewUser(url, id, title)
					  .then((responseVerifyNewUser) {
					   
						return responseVerifyNewUser;
					  });
			spKey = new_user1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('Verify')){
			 new_user1 = await _apiProvider.getDataVerifyNewUser(url, id, title)
					  .then((responseVerifyNewUser) {
					   
						return responseVerifyNewUser;
					  });
			spKey = new_user1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadVerifyNewUser(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  new_user = await _apiProvider.getDataVerifyNewUser(url, id, title)
                  .then((responseVerifyNewUser) {
                    saveOrUpdateVerifyNewUser(responseVerifyNewUser, spKey, 1 );
					return responseVerifyNewUser;
                  });
			  return new_user;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<VerifyNewUserModel?> loadVerifyNewUser( String searchKey) async{
   return await _dbRepository.loadVerifyNewUser(searchKey) ;   
  }
  
   Future<VerifyNewUserModel?> saveOrUpdateVerifyNewUser(VerifyNewUserModel new_user, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateVerifyNewUser(new_user, searchKey);   
    return await _dbRepository. loadVerifyNewUser(searchKey) ;  
  }	
  
    Future<void> deleteAllVerifyNewUser(String spKey) async{
      return await _dbRepository.deleteAllVerifyNewUser(spKey); 
   }
  
  


  Future<bool> isOldProgramList()async{
    int ageDB = await _dbRepository.listProgramAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyProgramListDB() async {
    var program;
    program = await _dbRepository.loadProgramList('');
    if ((program != null) || (program != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<ProgramListingModel?> getProgramList(String url, int page)async{
  ProgramListingModel? program ;

   if(page == 1){
			//await _dbRepository.deleteAllProgramList();
            program = await _apiProvider.getListProgram(url, page)
                  .then((responseProgramList) {
                    _loadAndSaveProgramList1(responseProgramList, '', page);
					return responseProgramList;
                  });
   }else{
      program = await _apiProvider.getListProgram(url, page)
                  .then((responseProgramList) {
				  try{
				      return  _loadAndSaveProgramList(responseProgramList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return program;
	}



Future<ProgramListingModel?> getProgramListSearch(String url, int page)async{
  ProgramListingModel? program ;   
  program = await _apiProvider.getListProgram(url, page)
		  .then((responseProgramList) {
		  
   if(page == -1 ){
        return  _loadAndSaveProgramListSearch(responseProgramList, '', responseProgramList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveProgramListSearch(responseProgramList, '', page);
      }
		  
		  
			
		  }); 
  return program;
}


Future<ProgramListingModel> _loadAndSaveProgramListSearch(ProgramListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_ktp_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_siup_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_notes;
    }
    return list;
 }

Future<ProgramListingModel?> _loadAndSaveProgramList(ProgramListingModel list, String searchKey, int page) async{
    ProgramListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateProgramListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemProgramModel program;
      program = list.items.items[i];
      program.item!.cnt = i ;
      program.item!.age = age;
      program.item!.page = page;
	  program.item!.ttl = '';
	  program.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  program.item!.sbttl = '';
	  
	  program.item!.id = program.item!.user_id; 
	  
	  program.item!.ttl = program.item!.user_name;
	  program.item!.pht = program.item!.scan_ktp_url;
	  program.item!.pht = program.item!.scan_siup_url;
	  program.item!.pht = program.item!.photo_url;
	  program.item!.sbttl = program.item!.self_introduction;
	  program.item!.sbttl = program.item!.admin_notes;
      await _dbRepository.saveOrUpdateProgramList(program);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadProgramList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveProgramList1(ProgramListingModel list, String searchKey, int page) async{
    ProgramListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateProgramListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemProgramModel program;
      program = list.items.items[i];
      program.item!.cnt = i ;
      program.item!.age = age;
      program.item!.page = page;
	  program.item!.ttl = '';
	  program.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  program.item!.sbttl = '';
	  
	  program.item!.id = program.item!.user_id; 
	  
	  program.item!.ttl = program.item!.user_name;
	  program.item!.pht = program.item!.scan_ktp_url;
	  program.item!.pht = program.item!.scan_siup_url;
	  program.item!.pht = program.item!.photo_url;
	  program.item!.sbttl = program.item!.self_introduction;
	  program.item!.sbttl = program.item!.admin_notes;
      await _dbRepository.saveOrUpdateProgramList(program);
    }

  }


  Future<ProgramListingModel> loadProgramList( String searchKey) async{
    ProgramListingModel appList = await _dbRepository.loadProgramListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadProgramList(searchKey)) ;
    return appList;
  }

  Future getProgramEdit(String url, String id, String title)async{
    var editProgram;
    editProgram = await _apiProvider.getDataProgram(url, id, title);
    return editProgram;
  }

  Future getProgramView(String url, String id, String title)async{
    var  viewProgram;
    viewProgram = await _apiProvider.getViewDataProgram(url, id, title);
    return viewProgram;
  }

  Future sendProgramPost(String url, var formdata)async{
    var postProgram;
    postProgram = await _apiProvider.sendDataProgram(url, formdata);
    return postProgram;
  }
  
   Future sendProgramPostWithID(String url, var formdata, String id, String title)async{
    var postProgram;
    postProgram = await _apiProvider.sendDataWithIDProgram(url, formdata, id, title);
    return postProgram;
  }
  
    Future getPromoProgramEdit(String url, String id, String title)async{
    var editPromo;
    editPromo = await _apiProvider.getDataPromoProgram(url, id, title);
    return editPromo;
  }

  Future getPromoProgramView(String url, String id, String title)async{
    var  viewPromo;
    viewPromo = await _apiProvider.getDataPromoProgram(url, id, title);
    return viewPromo;
  }

  Future sendPromoProgramPost(String url, var formdata)async{
    var postPromo;
    postPromo = await _apiProvider.sendDataPromoProgram(url, formdata);
    return postPromo;
  }
  
   Future sendPromoProgramPostWithID(String url, var formdata, String id, String title)async{
    var postPromo;
    postPromo = await _apiProvider.sendDataWithIDPromoProgram(url, formdata, id, title);
    return postPromo;
  }
  
    Future<PromoProgramModel> getPromoProgram(String url, String id, String title, String spKey)async{
  PromoProgramModel program ;
   PromoProgramModel program1 ;
          var data ;
			  if(['PlaceNewBid'].contains('Promo')){
			 program1 = await _apiProvider.getDataPromoProgram(url, id, title)
					  .then((responsePromoProgram) {
					   
						return responsePromoProgram;
					  });
			spKey = program1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('Promo')){
			 program1 = await _apiProvider.getDataPromoProgram(url, id, title)
					  .then((responsePromoProgram) {
					   
						return responsePromoProgram;
					  });
			spKey = program1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('Promo')){
			 program1 = await _apiProvider.getDataPromoProgram(url, id, title)
					  .then((responsePromoProgram) {
					   
						return responsePromoProgram;
					  });
			spKey = program1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('Promo')){
			 program1 = await _apiProvider.getDataPromoProgram(url, id, title)
					  .then((responsePromoProgram) {
					   
						return responsePromoProgram;
					  });
			spKey = program1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPromoProgram(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  program = await _apiProvider.getDataPromoProgram(url, id, title)
                  .then((responsePromoProgram) {
                    saveOrUpdatePromoProgram(responsePromoProgram, spKey, 1 );
					return responsePromoProgram;
                  });
			  return program;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PromoProgramModel?> loadPromoProgram( String searchKey) async{
   return await _dbRepository.loadPromoProgram(searchKey) ;   
  }
  
   Future<PromoProgramModel?> saveOrUpdatePromoProgram(PromoProgramModel program, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePromoProgram(program, searchKey);   
    return await _dbRepository. loadPromoProgram(searchKey) ;  
  }	
  
    Future<void> deleteAllPromoProgram(String spKey) async{
      return await _dbRepository.deleteAllPromoProgram(spKey); 
   }
  
  


  Future<bool> isOldExistingUserList()async{
    int ageDB = await _dbRepository.listExistingUserAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyExistingUserListDB() async {
    var existing_user;
    existing_user = await _dbRepository.loadExistingUserList('');
    if ((existing_user != null) || (existing_user != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<ExistingUserListingModel?> getExistingUserList(String url, int page)async{
  ExistingUserListingModel? existing_user ;

   if(page == 1){
			//await _dbRepository.deleteAllExistingUserList();
            existing_user = await _apiProvider.getListExistingUser(url, page)
                  .then((responseExistingUserList) {
                    _loadAndSaveExistingUserList1(responseExistingUserList, '', page);
					return responseExistingUserList;
                  });
   }else{
      existing_user = await _apiProvider.getListExistingUser(url, page)
                  .then((responseExistingUserList) {
				  try{
				      return  _loadAndSaveExistingUserList(responseExistingUserList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return existing_user;
	}



Future<ExistingUserListingModel?> getExistingUserListSearch(String url, int page)async{
  ExistingUserListingModel? existing_user ;   
  existing_user = await _apiProvider.getListExistingUser(url, page)
		  .then((responseExistingUserList) {
		  
   if(page == -1 ){
        return  _loadAndSaveExistingUserListSearch(responseExistingUserList, '', responseExistingUserList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveExistingUserListSearch(responseExistingUserList, '', page);
      }
		  
		  
			
		  }); 
  return existing_user;
}


Future<ExistingUserListingModel> _loadAndSaveExistingUserListSearch(ExistingUserListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_ktp_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_siup_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_notes;
    }
    return list;
 }

Future<ExistingUserListingModel?> _loadAndSaveExistingUserList(ExistingUserListingModel list, String searchKey, int page) async{
    ExistingUserListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateExistingUserListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemExistingUserModel existing_user;
      existing_user = list.items.items[i];
      existing_user.item!.cnt = i ;
      existing_user.item!.age = age;
      existing_user.item!.page = page;
	  existing_user.item!.ttl = '';
	  existing_user.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  existing_user.item!.sbttl = '';
	  
	  existing_user.item!.id = existing_user.item!.user_id; 
	  
	  existing_user.item!.ttl = existing_user.item!.user_name;
	  existing_user.item!.pht = existing_user.item!.scan_ktp_url;
	  existing_user.item!.pht = existing_user.item!.scan_siup_url;
	  existing_user.item!.pht = existing_user.item!.photo_url;
	  existing_user.item!.sbttl = existing_user.item!.self_introduction;
	  existing_user.item!.sbttl = existing_user.item!.admin_notes;
      await _dbRepository.saveOrUpdateExistingUserList(existing_user);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadExistingUserList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveExistingUserList1(ExistingUserListingModel list, String searchKey, int page) async{
    ExistingUserListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateExistingUserListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemExistingUserModel existing_user;
      existing_user = list.items.items[i];
      existing_user.item!.cnt = i ;
      existing_user.item!.age = age;
      existing_user.item!.page = page;
	  existing_user.item!.ttl = '';
	  existing_user.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  existing_user.item!.sbttl = '';
	  
	  existing_user.item!.id = existing_user.item!.user_id; 
	  
	  existing_user.item!.ttl = existing_user.item!.user_name;
	  existing_user.item!.pht = existing_user.item!.scan_ktp_url;
	  existing_user.item!.pht = existing_user.item!.scan_siup_url;
	  existing_user.item!.pht = existing_user.item!.photo_url;
	  existing_user.item!.sbttl = existing_user.item!.self_introduction;
	  existing_user.item!.sbttl = existing_user.item!.admin_notes;
      await _dbRepository.saveOrUpdateExistingUserList(existing_user);
    }

  }


  Future<ExistingUserListingModel> loadExistingUserList( String searchKey) async{
    ExistingUserListingModel appList = await _dbRepository.loadExistingUserListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadExistingUserList(searchKey)) ;
    return appList;
  }

  Future getExistingUserEdit(String url, String id, String title)async{
    var editExistingUser;
    editExistingUser = await _apiProvider.getDataExistingUser(url, id, title);
    return editExistingUser;
  }

  Future getExistingUserView(String url, String id, String title)async{
    var  viewExistingUser;
    viewExistingUser = await _apiProvider.getViewDataExistingUser(url, id, title);
    return viewExistingUser;
  }

  Future sendExistingUserPost(String url, var formdata)async{
    var postExistingUser;
    postExistingUser = await _apiProvider.sendDataExistingUser(url, formdata);
    return postExistingUser;
  }
  
   Future sendExistingUserPostWithID(String url, var formdata, String id, String title)async{
    var postExistingUser;
    postExistingUser = await _apiProvider.sendDataWithIDExistingUser(url, formdata, id, title);
    return postExistingUser;
  }
  
    Future getForgotPasswordExistingUserEdit(String url, String id, String title)async{
    var editForgotPassword;
    editForgotPassword = await _apiProvider.getDataForgotPasswordExistingUser(url, id, title);
    return editForgotPassword;
  }

  Future getForgotPasswordExistingUserView(String url, String id, String title)async{
    var  viewForgotPassword;
    viewForgotPassword = await _apiProvider.getDataForgotPasswordExistingUser(url, id, title);
    return viewForgotPassword;
  }

  Future sendForgotPasswordExistingUserPost(String url, var formdata)async{
    var postForgotPassword;
    postForgotPassword = await _apiProvider.sendDataForgotPasswordExistingUser(url, formdata);
    return postForgotPassword;
  }
  
   Future sendForgotPasswordExistingUserPostWithID(String url, var formdata, String id, String title)async{
    var postForgotPassword;
    postForgotPassword = await _apiProvider.sendDataWithIDForgotPasswordExistingUser(url, formdata, id, title);
    return postForgotPassword;
  }
  
    Future<ForgotPasswordExistingUserModel> getForgotPasswordExistingUser(String url, String id, String title, String spKey)async{
  ForgotPasswordExistingUserModel existing_user ;
   ForgotPasswordExistingUserModel existing_user1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ForgotPassword')){
			 existing_user1 = await _apiProvider.getDataForgotPasswordExistingUser(url, id, title)
					  .then((responseForgotPasswordExistingUser) {
					   
						return responseForgotPasswordExistingUser;
					  });
			spKey = existing_user1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ForgotPassword')){
			 existing_user1 = await _apiProvider.getDataForgotPasswordExistingUser(url, id, title)
					  .then((responseForgotPasswordExistingUser) {
					   
						return responseForgotPasswordExistingUser;
					  });
			spKey = existing_user1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ForgotPassword')){
			 existing_user1 = await _apiProvider.getDataForgotPasswordExistingUser(url, id, title)
					  .then((responseForgotPasswordExistingUser) {
					   
						return responseForgotPasswordExistingUser;
					  });
			spKey = existing_user1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ForgotPassword')){
			 existing_user1 = await _apiProvider.getDataForgotPasswordExistingUser(url, id, title)
					  .then((responseForgotPasswordExistingUser) {
					   
						return responseForgotPasswordExistingUser;
					  });
			spKey = existing_user1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadForgotPasswordExistingUser(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  existing_user = await _apiProvider.getDataForgotPasswordExistingUser(url, id, title)
                  .then((responseForgotPasswordExistingUser) {
                    saveOrUpdateForgotPasswordExistingUser(responseForgotPasswordExistingUser, spKey, 1 );
					return responseForgotPasswordExistingUser;
                  });
			  return existing_user;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ForgotPasswordExistingUserModel?> loadForgotPasswordExistingUser( String searchKey) async{
   return await _dbRepository.loadForgotPasswordExistingUser(searchKey) ;   
  }
  
   Future<ForgotPasswordExistingUserModel?> saveOrUpdateForgotPasswordExistingUser(ForgotPasswordExistingUserModel existing_user, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateForgotPasswordExistingUser(existing_user, searchKey);   
    return await _dbRepository. loadForgotPasswordExistingUser(searchKey) ;  
  }	
  
    Future<void> deleteAllForgotPasswordExistingUser(String spKey) async{
      return await _dbRepository.deleteAllForgotPasswordExistingUser(spKey); 
   }
  
    Future getResetPasswordExistingUserEdit(String url, String id, String title)async{
    var editResetPassword;
    editResetPassword = await _apiProvider.getDataResetPasswordExistingUser(url, id, title);
    return editResetPassword;
  }

  Future getResetPasswordExistingUserView(String url, String id, String title)async{
    var  viewResetPassword;
    viewResetPassword = await _apiProvider.getDataResetPasswordExistingUser(url, id, title);
    return viewResetPassword;
  }

  Future sendResetPasswordExistingUserPost(String url, var formdata)async{
    var postResetPassword;
    postResetPassword = await _apiProvider.sendDataResetPasswordExistingUser(url, formdata);
    return postResetPassword;
  }
  
   Future sendResetPasswordExistingUserPostWithID(String url, var formdata, String id, String title)async{
    var postResetPassword;
    postResetPassword = await _apiProvider.sendDataWithIDResetPasswordExistingUser(url, formdata, id, title);
    return postResetPassword;
  }
  
    Future<ResetPasswordExistingUserModel> getResetPasswordExistingUser(String url, String id, String title, String spKey)async{
  ResetPasswordExistingUserModel existing_user ;
   ResetPasswordExistingUserModel existing_user1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ResetPassword')){
			 existing_user1 = await _apiProvider.getDataResetPasswordExistingUser(url, id, title)
					  .then((responseResetPasswordExistingUser) {
					   
						return responseResetPasswordExistingUser;
					  });
			spKey = existing_user1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ResetPassword')){
			 existing_user1 = await _apiProvider.getDataResetPasswordExistingUser(url, id, title)
					  .then((responseResetPasswordExistingUser) {
					   
						return responseResetPasswordExistingUser;
					  });
			spKey = existing_user1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ResetPassword')){
			 existing_user1 = await _apiProvider.getDataResetPasswordExistingUser(url, id, title)
					  .then((responseResetPasswordExistingUser) {
					   
						return responseResetPasswordExistingUser;
					  });
			spKey = existing_user1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ResetPassword')){
			 existing_user1 = await _apiProvider.getDataResetPasswordExistingUser(url, id, title)
					  .then((responseResetPasswordExistingUser) {
					   
						return responseResetPasswordExistingUser;
					  });
			spKey = existing_user1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadResetPasswordExistingUser(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  existing_user = await _apiProvider.getDataResetPasswordExistingUser(url, id, title)
                  .then((responseResetPasswordExistingUser) {
                    saveOrUpdateResetPasswordExistingUser(responseResetPasswordExistingUser, spKey, 1 );
					return responseResetPasswordExistingUser;
                  });
			  return existing_user;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ResetPasswordExistingUserModel?> loadResetPasswordExistingUser( String searchKey) async{
   return await _dbRepository.loadResetPasswordExistingUser(searchKey) ;   
  }
  
   Future<ResetPasswordExistingUserModel?> saveOrUpdateResetPasswordExistingUser(ResetPasswordExistingUserModel existing_user, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateResetPasswordExistingUser(existing_user, searchKey);   
    return await _dbRepository. loadResetPasswordExistingUser(searchKey) ;  
  }	
  
    Future<void> deleteAllResetPasswordExistingUser(String spKey) async{
      return await _dbRepository.deleteAllResetPasswordExistingUser(spKey); 
   }
  
  


  Future<bool> isOldSupportList()async{
    int ageDB = await _dbRepository.listSupportAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptySupportListDB() async {
    var support;
    support = await _dbRepository.loadSupportList('');
    if ((support != null) || (support != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<SupportListingModel?> getSupportList(String url, int page)async{
  SupportListingModel? support ;

   if(page == 1){
			//await _dbRepository.deleteAllSupportList();
            support = await _apiProvider.getListSupport(url, page)
                  .then((responseSupportList) {
                    _loadAndSaveSupportList1(responseSupportList, '', page);
					return responseSupportList;
                  });
   }else{
      support = await _apiProvider.getListSupport(url, page)
                  .then((responseSupportList) {
				  try{
				      return  _loadAndSaveSupportList(responseSupportList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return support;
	}



Future<SupportListingModel?> getSupportListSearch(String url, int page)async{
  SupportListingModel? support ;   
  support = await _apiProvider.getListSupport(url, page)
		  .then((responseSupportList) {
		  
   if(page == -1 ){
        return  _loadAndSaveSupportListSearch(responseSupportList, '', responseSupportList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveSupportListSearch(responseSupportList, '', page);
      }
		  
		  
			
		  }); 
  return support;
}


Future<SupportListingModel> _loadAndSaveSupportListSearch(SupportListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.question;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.reply;
    }
    return list;
 }

Future<SupportListingModel?> _loadAndSaveSupportList(SupportListingModel list, String searchKey, int page) async{
    SupportListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateSupportListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemSupportModel support;
      support = list.items.items[i];
      support.item!.cnt = i ;
      support.item!.age = age;
      support.item!.page = page;
	  support.item!.ttl = '';
	  support.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  support.item!.sbttl = '';
	  
	  support.item!.id = support.item!.contact_form_id; 
	  
	  support.item!.sbttl = support.item!.question;
	  support.item!.sbttl = support.item!.reply;
      await _dbRepository.saveOrUpdateSupportList(support);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadSupportList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveSupportList1(SupportListingModel list, String searchKey, int page) async{
    SupportListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateSupportListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemSupportModel support;
      support = list.items.items[i];
      support.item!.cnt = i ;
      support.item!.age = age;
      support.item!.page = page;
	  support.item!.ttl = '';
	  support.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  support.item!.sbttl = '';
	  
	  support.item!.id = support.item!.contact_form_id; 
	  
	  support.item!.sbttl = support.item!.question;
	  support.item!.sbttl = support.item!.reply;
      await _dbRepository.saveOrUpdateSupportList(support);
    }

  }


  Future<SupportListingModel> loadSupportList( String searchKey) async{
    SupportListingModel appList = await _dbRepository.loadSupportListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadSupportList(searchKey)) ;
    return appList;
  }

  Future getSupportEdit(String url, String id, String title)async{
    var editSupport;
    editSupport = await _apiProvider.getDataSupport(url, id, title);
    return editSupport;
  }

  Future getSupportView(String url, String id, String title)async{
    var  viewSupport;
    viewSupport = await _apiProvider.getViewDataSupport(url, id, title);
    return viewSupport;
  }

  Future sendSupportPost(String url, var formdata)async{
    var postSupport;
    postSupport = await _apiProvider.sendDataSupport(url, formdata);
    return postSupport;
  }
  
   Future sendSupportPostWithID(String url, var formdata, String id, String title)async{
    var postSupport;
    postSupport = await _apiProvider.sendDataWithIDSupport(url, formdata, id, title);
    return postSupport;
  }
  
    Future getContactFormSupportEdit(String url, String id, String title)async{
    var editContactForm;
    editContactForm = await _apiProvider.getDataContactFormSupport(url, id, title);
    return editContactForm;
  }

  Future getContactFormSupportView(String url, String id, String title)async{
    var  viewContactForm;
    viewContactForm = await _apiProvider.getDataContactFormSupport(url, id, title);
    return viewContactForm;
  }

  Future sendContactFormSupportPost(String url, var formdata)async{
    var postContactForm;
    postContactForm = await _apiProvider.sendDataContactFormSupport(url, formdata);
    return postContactForm;
  }
  
   Future sendContactFormSupportPostWithID(String url, var formdata, String id, String title)async{
    var postContactForm;
    postContactForm = await _apiProvider.sendDataWithIDContactFormSupport(url, formdata, id, title);
    return postContactForm;
  }
  
    Future<ContactFormSupportModel> getContactFormSupport(String url, String id, String title, String spKey)async{
  ContactFormSupportModel support ;
   ContactFormSupportModel support1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ContactForm')){
			 support1 = await _apiProvider.getDataContactFormSupport(url, id, title)
					  .then((responseContactFormSupport) {
					   
						return responseContactFormSupport;
					  });
			spKey = support1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ContactForm')){
			 support1 = await _apiProvider.getDataContactFormSupport(url, id, title)
					  .then((responseContactFormSupport) {
					   
						return responseContactFormSupport;
					  });
			spKey = support1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ContactForm')){
			 support1 = await _apiProvider.getDataContactFormSupport(url, id, title)
					  .then((responseContactFormSupport) {
					   
						return responseContactFormSupport;
					  });
			spKey = support1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ContactForm')){
			 support1 = await _apiProvider.getDataContactFormSupport(url, id, title)
					  .then((responseContactFormSupport) {
					   
						return responseContactFormSupport;
					  });
			spKey = support1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadContactFormSupport(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  support = await _apiProvider.getDataContactFormSupport(url, id, title)
                  .then((responseContactFormSupport) {
                    saveOrUpdateContactFormSupport(responseContactFormSupport, spKey, 1 );
					return responseContactFormSupport;
                  });
			  return support;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ContactFormSupportModel?> loadContactFormSupport( String searchKey) async{
   return await _dbRepository.loadContactFormSupport(searchKey) ;   
  }
  
   Future<ContactFormSupportModel?> saveOrUpdateContactFormSupport(ContactFormSupportModel support, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateContactFormSupport(support, searchKey);   
    return await _dbRepository. loadContactFormSupport(searchKey) ;  
  }	
  
    Future<void> deleteAllContactFormSupport(String spKey) async{
      return await _dbRepository.deleteAllContactFormSupport(spKey); 
   }
  
  


  Future<bool> isOldBrowseServicesList()async{
    int ageDB = await _dbRepository.listBrowseServicesAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyBrowseServicesListDB() async {
    var browse_services;
    browse_services = await _dbRepository.loadBrowseServicesList('');
    if ((browse_services != null) || (browse_services != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<BrowseServicesListingModel?> getBrowseServicesList(String url, int page)async{
  BrowseServicesListingModel? browse_services ;

   if(page == 1){
			//await _dbRepository.deleteAllBrowseServicesList();
            browse_services = await _apiProvider.getListBrowseServices(url, page)
                  .then((responseBrowseServicesList) {
                    _loadAndSaveBrowseServicesList1(responseBrowseServicesList, '', page);
					return responseBrowseServicesList;
                  });
   }else{
      browse_services = await _apiProvider.getListBrowseServices(url, page)
                  .then((responseBrowseServicesList) {
				  try{
				      return  _loadAndSaveBrowseServicesList(responseBrowseServicesList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return browse_services;
	}



Future<BrowseServicesListingModel?> getBrowseServicesListSearch(String url, int page)async{
  BrowseServicesListingModel? browse_services ;   
  browse_services = await _apiProvider.getListBrowseServices(url, page)
		  .then((responseBrowseServicesList) {
		  
   if(page == -1 ){
        return  _loadAndSaveBrowseServicesListSearch(responseBrowseServicesList, '', responseBrowseServicesList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveBrowseServicesListSearch(responseBrowseServicesList, '', page);
      }
		  
		  
			
		  }); 
  return browse_services;
}


Future<BrowseServicesListingModel> _loadAndSaveBrowseServicesListSearch(BrowseServicesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.short_description;
	  list.items.items[i].item!.pht = list.items.items[i].item!.logo_url;
    }
    return list;
 }

Future<BrowseServicesListingModel?> _loadAndSaveBrowseServicesList(BrowseServicesListingModel list, String searchKey, int page) async{
    BrowseServicesListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBrowseServicesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBrowseServicesModel browse_services;
      browse_services = list.items.items[i];
      browse_services.item!.cnt = i ;
      browse_services.item!.age = age;
      browse_services.item!.page = page;
	  browse_services.item!.ttl = '';
	  browse_services.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  browse_services.item!.sbttl = '';
	  
	  browse_services.item!.id = browse_services.item!.service_id; 
	  
	  browse_services.item!.ttl = browse_services.item!.title;
	  browse_services.item!.sbttl = browse_services.item!.short_description;
	  browse_services.item!.pht = browse_services.item!.logo_url;
      await _dbRepository.saveOrUpdateBrowseServicesList(browse_services);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBrowseServicesList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveBrowseServicesList1(BrowseServicesListingModel list, String searchKey, int page) async{
    BrowseServicesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBrowseServicesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBrowseServicesModel browse_services;
      browse_services = list.items.items[i];
      browse_services.item!.cnt = i ;
      browse_services.item!.age = age;
      browse_services.item!.page = page;
	  browse_services.item!.ttl = '';
	  browse_services.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  browse_services.item!.sbttl = '';
	  
	  browse_services.item!.id = browse_services.item!.service_id; 
	  
	  browse_services.item!.ttl = browse_services.item!.title;
	  browse_services.item!.sbttl = browse_services.item!.short_description;
	  browse_services.item!.pht = browse_services.item!.logo_url;
      await _dbRepository.saveOrUpdateBrowseServicesList(browse_services);
    }

  }


  Future<BrowseServicesListingModel> loadBrowseServicesList( String searchKey) async{
    BrowseServicesListingModel appList = await _dbRepository.loadBrowseServicesListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBrowseServicesList(searchKey)) ;
    return appList;
  }

  Future getBrowseServicesEdit(String url, String id, String title)async{
    var editBrowseServices;
    editBrowseServices = await _apiProvider.getDataBrowseServices(url, id, title);
    return editBrowseServices;
  }

  Future getBrowseServicesView(String url, String id, String title)async{
    var  viewBrowseServices;
    viewBrowseServices = await _apiProvider.getViewDataBrowseServices(url, id, title);
    return viewBrowseServices;
  }

  Future sendBrowseServicesPost(String url, var formdata)async{
    var postBrowseServices;
    postBrowseServices = await _apiProvider.sendDataBrowseServices(url, formdata);
    return postBrowseServices;
  }
  
   Future sendBrowseServicesPostWithID(String url, var formdata, String id, String title)async{
    var postBrowseServices;
    postBrowseServices = await _apiProvider.sendDataWithIDBrowseServices(url, formdata, id, title);
    return postBrowseServices;
  }
  
    Future getPlaceOrderBrowseServicesEdit(String url, String id, String title)async{
    var editPlaceOrder;
    editPlaceOrder = await _apiProvider.getDataPlaceOrderBrowseServices(url, id, title);
    return editPlaceOrder;
  }

  Future getPlaceOrderBrowseServicesView(String url, String id, String title)async{
    var  viewPlaceOrder;
    viewPlaceOrder = await _apiProvider.getDataPlaceOrderBrowseServices(url, id, title);
    return viewPlaceOrder;
  }

  Future sendPlaceOrderBrowseServicesPost(String url, var formdata)async{
    var postPlaceOrder;
    postPlaceOrder = await _apiProvider.sendDataPlaceOrderBrowseServices(url, formdata);
    return postPlaceOrder;
  }
  
   Future sendPlaceOrderBrowseServicesPostWithID(String url, var formdata, String id, String title)async{
    var postPlaceOrder;
    postPlaceOrder = await _apiProvider.sendDataWithIDPlaceOrderBrowseServices(url, formdata, id, title);
    return postPlaceOrder;
  }
  
    Future<PlaceOrderBrowseServicesModel> getPlaceOrderBrowseServices(String url, String id, String title, String spKey)async{
  PlaceOrderBrowseServicesModel browse_services ;
   PlaceOrderBrowseServicesModel browse_services1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PlaceOrder')){
			 browse_services1 = await _apiProvider.getDataPlaceOrderBrowseServices(url, id, title)
					  .then((responsePlaceOrderBrowseServices) {
					   
						return responsePlaceOrderBrowseServices;
					  });
			spKey = browse_services1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PlaceOrder')){
			 browse_services1 = await _apiProvider.getDataPlaceOrderBrowseServices(url, id, title)
					  .then((responsePlaceOrderBrowseServices) {
					   
						return responsePlaceOrderBrowseServices;
					  });
			spKey = browse_services1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PlaceOrder')){
			 browse_services1 = await _apiProvider.getDataPlaceOrderBrowseServices(url, id, title)
					  .then((responsePlaceOrderBrowseServices) {
					   
						return responsePlaceOrderBrowseServices;
					  });
			spKey = browse_services1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PlaceOrder')){
			 browse_services1 = await _apiProvider.getDataPlaceOrderBrowseServices(url, id, title)
					  .then((responsePlaceOrderBrowseServices) {
					   
						return responsePlaceOrderBrowseServices;
					  });
			spKey = browse_services1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPlaceOrderBrowseServices(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  browse_services = await _apiProvider.getDataPlaceOrderBrowseServices(url, id, title)
                  .then((responsePlaceOrderBrowseServices) {
                    saveOrUpdatePlaceOrderBrowseServices(responsePlaceOrderBrowseServices, spKey, 1 );
					return responsePlaceOrderBrowseServices;
                  });
			  return browse_services;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PlaceOrderBrowseServicesModel?> loadPlaceOrderBrowseServices( String searchKey) async{
   return await _dbRepository.loadPlaceOrderBrowseServices(searchKey) ;   
  }
  
   Future<PlaceOrderBrowseServicesModel?> saveOrUpdatePlaceOrderBrowseServices(PlaceOrderBrowseServicesModel browse_services, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePlaceOrderBrowseServices(browse_services, searchKey);   
    return await _dbRepository. loadPlaceOrderBrowseServices(searchKey) ;  
  }	
  
    Future<void> deleteAllPlaceOrderBrowseServices(String spKey) async{
      return await _dbRepository.deleteAllPlaceOrderBrowseServices(spKey); 
   }
  
  


  Future<bool> isOldBrowseUsersList()async{
    int ageDB = await _dbRepository.listBrowseUsersAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyBrowseUsersListDB() async {
    var browse_users;
    browse_users = await _dbRepository.loadBrowseUsersList('');
    if ((browse_users != null) || (browse_users != [])){
      return false;
    }else {
      return true;
    }
  }
    Future<BrowseUsersListingModel?> getBrowseUsersList(String url, int page)async{
  BrowseUsersListingModel? browse_users ;
  final isEmpty = await isEmptyBrowseUsersListDB();
  final isOld = await isOldBrowseUsersList();

  if((page == 1)&& (!isEmpty) &&(!isOld)) {
    browse_users = await _dbRepository.loadBrowseUsersListInfo('');
	browse_users.items.items.clear();
    browse_users.items.items.addAll(await _dbRepository.loadBrowseUsersList(''));
  }else {
    if(isEmpty || isOld ){
      browse_users = await _apiProvider.getListBrowseUsers(url, page)
                  .then((responseBrowseUsersList) {
				//  print(responseBrowseUsersList);
                //  BrowseUsersListingModel list = null;
                //  for (var test in responseBrowseUsersList) {
                //  list.add(BrowseUsersModel.fromJson(test));
                //  }
                    return  _loadAndSaveBrowseUsersList(responseBrowseUsersList, '', page);
                  });
    }else{
      if(page == 1){
          browse_users = await _dbRepository.loadBrowseUsersListInfo('');
	      browse_users.items.items.clear();
          browse_users.items.items.addAll(await _dbRepository.loadBrowseUsersList(''));
      }else{
        browse_users = await _apiProvider.getListBrowseUsers(url, page)
                    .then((responseBrowseUsersList) {
					 //  print(responseBrowseUsersList);
                    //    BrowseUsersListingModel list = null;
                    //    for (var test in responseBrowseUsersList) {
                    //    list.add(BrowseUsersModel.fromJson(test));
                    //    }
                         return  _loadAndSaveBrowseUsersList(responseBrowseUsersList, '', page);
                    });
      }
    }
  }
	  return browse_users;
	}
 




Future<BrowseUsersListingModel?> getBrowseUsersListSearch(String url, int page)async{
  BrowseUsersListingModel? browse_users ;   
  browse_users = await _apiProvider.getListBrowseUsers(url, page)
		  .then((responseBrowseUsersList) {
		  
   if(page == -1 ){
        return  _loadAndSaveBrowseUsersListSearch(responseBrowseUsersList, '', responseBrowseUsersList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveBrowseUsersListSearch(responseBrowseUsersList, '', page);
      }
		  
		  
			
		  }); 
  return browse_users;
}


Future<BrowseUsersListingModel> _loadAndSaveBrowseUsersListSearch(BrowseUsersListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
    }
    return list;
 }

Future<BrowseUsersListingModel?> _loadAndSaveBrowseUsersList(BrowseUsersListingModel list, String searchKey, int page) async{
    BrowseUsersListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBrowseUsersListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBrowseUsersModel browse_users;
      browse_users = list.items.items[i];
      browse_users.item!.cnt = i ;
      browse_users.item!.age = age;
      browse_users.item!.page = page;
	  browse_users.item!.ttl = '';
	  browse_users.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  browse_users.item!.sbttl = '';
	  
	  browse_users.item!.id = browse_users.item!.user_id; 
	  
	  browse_users.item!.pht = browse_users.item!.photo_url;
	  browse_users.item!.ttl = browse_users.item!.user_name;
	  browse_users.item!.sbttl = browse_users.item!.self_introduction;
      await _dbRepository.saveOrUpdateBrowseUsersList(browse_users);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBrowseUsersList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveBrowseUsersList1(BrowseUsersListingModel list, String searchKey, int page) async{
    BrowseUsersListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBrowseUsersListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBrowseUsersModel browse_users;
      browse_users = list.items.items[i];
      browse_users.item!.cnt = i ;
      browse_users.item!.age = age;
      browse_users.item!.page = page;
	  browse_users.item!.ttl = '';
	  browse_users.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  browse_users.item!.sbttl = '';
	  
	  browse_users.item!.id = browse_users.item!.user_id; 
	  
	  browse_users.item!.pht = browse_users.item!.photo_url;
	  browse_users.item!.ttl = browse_users.item!.user_name;
	  browse_users.item!.sbttl = browse_users.item!.self_introduction;
      await _dbRepository.saveOrUpdateBrowseUsersList(browse_users);
    }

  }


  Future<BrowseUsersListingModel> loadBrowseUsersList( String searchKey) async{
    BrowseUsersListingModel appList = await _dbRepository.loadBrowseUsersListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBrowseUsersList(searchKey)) ;
    return appList;
  }

  Future getBrowseUsersEdit(String url, String id, String title)async{
    var editBrowseUsers;
    editBrowseUsers = await _apiProvider.getDataBrowseUsers(url, id, title);
    return editBrowseUsers;
  }

  Future getBrowseUsersView(String url, String id, String title)async{
    var  viewBrowseUsers;
    viewBrowseUsers = await _apiProvider.getViewDataBrowseUsers(url, id, title);
    return viewBrowseUsers;
  }

  Future sendBrowseUsersPost(String url, var formdata)async{
    var postBrowseUsers;
    postBrowseUsers = await _apiProvider.sendDataBrowseUsers(url, formdata);
    return postBrowseUsers;
  }
  
   Future sendBrowseUsersPostWithID(String url, var formdata, String id, String title)async{
    var postBrowseUsers;
    postBrowseUsers = await _apiProvider.sendDataWithIDBrowseUsers(url, formdata, id, title);
    return postBrowseUsers;
  }
  
    Future getInviteToBidBrowseUsersEdit(String url, String id, String title)async{
    var editInviteToBid;
    editInviteToBid = await _apiProvider.getDataInviteToBidBrowseUsers(url, id, title);
    return editInviteToBid;
  }

  Future getInviteToBidBrowseUsersView(String url, String id, String title)async{
    var  viewInviteToBid;
    viewInviteToBid = await _apiProvider.getDataInviteToBidBrowseUsers(url, id, title);
    return viewInviteToBid;
  }

  Future sendInviteToBidBrowseUsersPost(String url, var formdata)async{
    var postInviteToBid;
    postInviteToBid = await _apiProvider.sendDataInviteToBidBrowseUsers(url, formdata);
    return postInviteToBid;
  }
  
   Future sendInviteToBidBrowseUsersPostWithID(String url, var formdata, String id, String title)async{
    var postInviteToBid;
    postInviteToBid = await _apiProvider.sendDataWithIDInviteToBidBrowseUsers(url, formdata, id, title);
    return postInviteToBid;
  }
  
    Future<InviteToBidBrowseUsersModel> getInviteToBidBrowseUsers(String url, String id, String title, String spKey)async{
  InviteToBidBrowseUsersModel browse_users ;
   InviteToBidBrowseUsersModel browse_users1 ;
          var data ;
			  if(['PlaceNewBid'].contains('InviteToBid')){
			 browse_users1 = await _apiProvider.getDataInviteToBidBrowseUsers(url, id, title)
					  .then((responseInviteToBidBrowseUsers) {
					   
						return responseInviteToBidBrowseUsers;
					  });
			spKey = browse_users1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('InviteToBid')){
			 browse_users1 = await _apiProvider.getDataInviteToBidBrowseUsers(url, id, title)
					  .then((responseInviteToBidBrowseUsers) {
					   
						return responseInviteToBidBrowseUsers;
					  });
			spKey = browse_users1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('InviteToBid')){
			 browse_users1 = await _apiProvider.getDataInviteToBidBrowseUsers(url, id, title)
					  .then((responseInviteToBidBrowseUsers) {
					   
						return responseInviteToBidBrowseUsers;
					  });
			spKey = browse_users1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('InviteToBid')){
			 browse_users1 = await _apiProvider.getDataInviteToBidBrowseUsers(url, id, title)
					  .then((responseInviteToBidBrowseUsers) {
					   
						return responseInviteToBidBrowseUsers;
					  });
			spKey = browse_users1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadInviteToBidBrowseUsers(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  browse_users = await _apiProvider.getDataInviteToBidBrowseUsers(url, id, title)
                  .then((responseInviteToBidBrowseUsers) {
                    saveOrUpdateInviteToBidBrowseUsers(responseInviteToBidBrowseUsers, spKey, 1 );
					return responseInviteToBidBrowseUsers;
                  });
			  return browse_users;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<InviteToBidBrowseUsersModel?> loadInviteToBidBrowseUsers( String searchKey) async{
   return await _dbRepository.loadInviteToBidBrowseUsers(searchKey) ;   
  }
  
   Future<InviteToBidBrowseUsersModel?> saveOrUpdateInviteToBidBrowseUsers(InviteToBidBrowseUsersModel browse_users, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateInviteToBidBrowseUsers(browse_users, searchKey);   
    return await _dbRepository. loadInviteToBidBrowseUsers(searchKey) ;  
  }	
  
    Future<void> deleteAllInviteToBidBrowseUsers(String spKey) async{
      return await _dbRepository.deleteAllInviteToBidBrowseUsers(spKey); 
   }
  
    Future getHireMeBrowseUsersEdit(String url, String id, String title)async{
    var editHireMe;
    editHireMe = await _apiProvider.getDataHireMeBrowseUsers(url, id, title);
    return editHireMe;
  }

  Future getHireMeBrowseUsersView(String url, String id, String title)async{
    var  viewHireMe;
    viewHireMe = await _apiProvider.getDataHireMeBrowseUsers(url, id, title);
    return viewHireMe;
  }

  Future sendHireMeBrowseUsersPost(String url, var formdata)async{
    var postHireMe;
    postHireMe = await _apiProvider.sendDataHireMeBrowseUsers(url, formdata);
    return postHireMe;
  }
  
   Future sendHireMeBrowseUsersPostWithID(String url, var formdata, String id, String title)async{
    var postHireMe;
    postHireMe = await _apiProvider.sendDataWithIDHireMeBrowseUsers(url, formdata, id, title);
    return postHireMe;
  }
  
    Future<HireMeBrowseUsersModel> getHireMeBrowseUsers(String url, String id, String title, String spKey)async{
  HireMeBrowseUsersModel browse_users ;
   HireMeBrowseUsersModel browse_users1 ;
          var data ;
			  if(['PlaceNewBid'].contains('HireMe')){
			 browse_users1 = await _apiProvider.getDataHireMeBrowseUsers(url, id, title)
					  .then((responseHireMeBrowseUsers) {
					   
						return responseHireMeBrowseUsers;
					  });
			spKey = browse_users1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('HireMe')){
			 browse_users1 = await _apiProvider.getDataHireMeBrowseUsers(url, id, title)
					  .then((responseHireMeBrowseUsers) {
					   
						return responseHireMeBrowseUsers;
					  });
			spKey = browse_users1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('HireMe')){
			 browse_users1 = await _apiProvider.getDataHireMeBrowseUsers(url, id, title)
					  .then((responseHireMeBrowseUsers) {
					   
						return responseHireMeBrowseUsers;
					  });
			spKey = browse_users1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('HireMe')){
			 browse_users1 = await _apiProvider.getDataHireMeBrowseUsers(url, id, title)
					  .then((responseHireMeBrowseUsers) {
					   
						return responseHireMeBrowseUsers;
					  });
			spKey = browse_users1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadHireMeBrowseUsers(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  browse_users = await _apiProvider.getDataHireMeBrowseUsers(url, id, title)
                  .then((responseHireMeBrowseUsers) {
                    saveOrUpdateHireMeBrowseUsers(responseHireMeBrowseUsers, spKey, 1 );
					return responseHireMeBrowseUsers;
                  });
			  return browse_users;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<HireMeBrowseUsersModel?> loadHireMeBrowseUsers( String searchKey) async{
   return await _dbRepository.loadHireMeBrowseUsers(searchKey) ;   
  }
  
   Future<HireMeBrowseUsersModel?> saveOrUpdateHireMeBrowseUsers(HireMeBrowseUsersModel browse_users, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateHireMeBrowseUsers(browse_users, searchKey);   
    return await _dbRepository. loadHireMeBrowseUsers(searchKey) ;  
  }	
  
    Future<void> deleteAllHireMeBrowseUsers(String spKey) async{
      return await _dbRepository.deleteAllHireMeBrowseUsers(spKey); 
   }
  
  


  Future<bool> isOldBrowseProductsList()async{
    int ageDB = await _dbRepository.listBrowseProductsAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyBrowseProductsListDB() async {
    var browse_products;
    browse_products = await _dbRepository.loadBrowseProductsList('');
    if ((browse_products != null) || (browse_products != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<BrowseProductsListingModel?> getBrowseProductsList(String url, int page)async{
  BrowseProductsListingModel? browse_products ;

   if(page == 1){
			//await _dbRepository.deleteAllBrowseProductsList();
            browse_products = await _apiProvider.getListBrowseProducts(url, page)
                  .then((responseBrowseProductsList) {
                    _loadAndSaveBrowseProductsList1(responseBrowseProductsList, '', page);
					return responseBrowseProductsList;
                  });
   }else{
      browse_products = await _apiProvider.getListBrowseProducts(url, page)
                  .then((responseBrowseProductsList) {
				  try{
				      return  _loadAndSaveBrowseProductsList(responseBrowseProductsList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return browse_products;
	}



Future<BrowseProductsListingModel?> getBrowseProductsListSearch(String url, int page)async{
  BrowseProductsListingModel? browse_products ;   
  browse_products = await _apiProvider.getListBrowseProducts(url, page)
		  .then((responseBrowseProductsList) {
		  
   if(page == -1 ){
        return  _loadAndSaveBrowseProductsListSearch(responseBrowseProductsList, '', responseBrowseProductsList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveBrowseProductsListSearch(responseBrowseProductsList, '', page);
      }
		  
		  
			
		  }); 
  return browse_products;
}


Future<BrowseProductsListingModel> _loadAndSaveBrowseProductsListSearch(BrowseProductsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.short_description;
	  list.items.items[i].item!.pht = list.items.items[i].item!.logo_url;
    }
    return list;
 }

Future<BrowseProductsListingModel?> _loadAndSaveBrowseProductsList(BrowseProductsListingModel list, String searchKey, int page) async{
    BrowseProductsListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBrowseProductsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBrowseProductsModel browse_products;
      browse_products = list.items.items[i];
      browse_products.item!.cnt = i ;
      browse_products.item!.age = age;
      browse_products.item!.page = page;
	  browse_products.item!.ttl = '';
	  browse_products.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  browse_products.item!.sbttl = '';
	  
	  browse_products.item!.id = browse_products.item!.product_id; 
	  
	  browse_products.item!.ttl = browse_products.item!.title;
	  browse_products.item!.sbttl = browse_products.item!.short_description;
	  browse_products.item!.pht = browse_products.item!.logo_url;
      await _dbRepository.saveOrUpdateBrowseProductsList(browse_products);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBrowseProductsList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveBrowseProductsList1(BrowseProductsListingModel list, String searchKey, int page) async{
    BrowseProductsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBrowseProductsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBrowseProductsModel browse_products;
      browse_products = list.items.items[i];
      browse_products.item!.cnt = i ;
      browse_products.item!.age = age;
      browse_products.item!.page = page;
	  browse_products.item!.ttl = '';
	  browse_products.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  browse_products.item!.sbttl = '';
	  
	  browse_products.item!.id = browse_products.item!.product_id; 
	  
	  browse_products.item!.ttl = browse_products.item!.title;
	  browse_products.item!.sbttl = browse_products.item!.short_description;
	  browse_products.item!.pht = browse_products.item!.logo_url;
      await _dbRepository.saveOrUpdateBrowseProductsList(browse_products);
    }

  }


  Future<BrowseProductsListingModel> loadBrowseProductsList( String searchKey) async{
    BrowseProductsListingModel appList = await _dbRepository.loadBrowseProductsListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBrowseProductsList(searchKey)) ;
    return appList;
  }

  Future getBrowseProductsEdit(String url, String id, String title)async{
    var editBrowseProducts;
    editBrowseProducts = await _apiProvider.getDataBrowseProducts(url, id, title);
    return editBrowseProducts;
  }

  Future getBrowseProductsView(String url, String id, String title)async{
    var  viewBrowseProducts;
    viewBrowseProducts = await _apiProvider.getViewDataBrowseProducts(url, id, title);
    return viewBrowseProducts;
  }

  Future sendBrowseProductsPost(String url, var formdata)async{
    var postBrowseProducts;
    postBrowseProducts = await _apiProvider.sendDataBrowseProducts(url, formdata);
    return postBrowseProducts;
  }
  
   Future sendBrowseProductsPostWithID(String url, var formdata, String id, String title)async{
    var postBrowseProducts;
    postBrowseProducts = await _apiProvider.sendDataWithIDBrowseProducts(url, formdata, id, title);
    return postBrowseProducts;
  }
  
    Future getAddToCartBrowseProductsEdit(String url, String id, String title)async{
    var editAddToCart;
    editAddToCart = await _apiProvider.getDataAddToCartBrowseProducts(url, id, title);
    return editAddToCart;
  }

  Future getAddToCartBrowseProductsView(String url, String id, String title)async{
    var  viewAddToCart;
    viewAddToCart = await _apiProvider.getDataAddToCartBrowseProducts(url, id, title);
    return viewAddToCart;
  }

  Future sendAddToCartBrowseProductsPost(String url, var formdata)async{
    var postAddToCart;
    postAddToCart = await _apiProvider.sendDataAddToCartBrowseProducts(url, formdata);
    return postAddToCart;
  }
  
   Future sendAddToCartBrowseProductsPostWithID(String url, var formdata, String id, String title)async{
    var postAddToCart;
    postAddToCart = await _apiProvider.sendDataWithIDAddToCartBrowseProducts(url, formdata, id, title);
    return postAddToCart;
  }
  
    Future<AddToCartBrowseProductsModel> getAddToCartBrowseProducts(String url, String id, String title, String spKey)async{
  AddToCartBrowseProductsModel browse_products ;
   AddToCartBrowseProductsModel browse_products1 ;
          var data ;
			  if(['PlaceNewBid'].contains('AddToCart')){
			 browse_products1 = await _apiProvider.getDataAddToCartBrowseProducts(url, id, title)
					  .then((responseAddToCartBrowseProducts) {
					   
						return responseAddToCartBrowseProducts;
					  });
			spKey = browse_products1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('AddToCart')){
			 browse_products1 = await _apiProvider.getDataAddToCartBrowseProducts(url, id, title)
					  .then((responseAddToCartBrowseProducts) {
					   
						return responseAddToCartBrowseProducts;
					  });
			spKey = browse_products1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('AddToCart')){
			 browse_products1 = await _apiProvider.getDataAddToCartBrowseProducts(url, id, title)
					  .then((responseAddToCartBrowseProducts) {
					   
						return responseAddToCartBrowseProducts;
					  });
			spKey = browse_products1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('AddToCart')){
			 browse_products1 = await _apiProvider.getDataAddToCartBrowseProducts(url, id, title)
					  .then((responseAddToCartBrowseProducts) {
					   
						return responseAddToCartBrowseProducts;
					  });
			spKey = browse_products1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadAddToCartBrowseProducts(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  browse_products = await _apiProvider.getDataAddToCartBrowseProducts(url, id, title)
                  .then((responseAddToCartBrowseProducts) {
                    saveOrUpdateAddToCartBrowseProducts(responseAddToCartBrowseProducts, spKey, 1 );
					return responseAddToCartBrowseProducts;
                  });
			  return browse_products;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<AddToCartBrowseProductsModel?> loadAddToCartBrowseProducts( String searchKey) async{
   return await _dbRepository.loadAddToCartBrowseProducts(searchKey) ;   
  }
  
   Future<AddToCartBrowseProductsModel?> saveOrUpdateAddToCartBrowseProducts(AddToCartBrowseProductsModel browse_products, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateAddToCartBrowseProducts(browse_products, searchKey);   
    return await _dbRepository. loadAddToCartBrowseProducts(searchKey) ;  
  }	
  
    Future<void> deleteAllAddToCartBrowseProducts(String spKey) async{
      return await _dbRepository.deleteAllAddToCartBrowseProducts(spKey); 
   }
  
  


  Future<bool> isOldCartList()async{
    int ageDB = await _dbRepository.listCartAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyCartListDB() async {
    var cart;
    cart = await _dbRepository.loadCartList('');
    if ((cart != null) || (cart != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<CartListingModel?> getCartList(String url, int page)async{
  CartListingModel? cart ;

   if(page == 1){
			//await _dbRepository.deleteAllCartList();
            cart = await _apiProvider.getListCart(url, page)
                  .then((responseCartList) {
                    _loadAndSaveCartList1(responseCartList, '', page);
					return responseCartList;
                  });
   }else{
      cart = await _apiProvider.getListCart(url, page)
                  .then((responseCartList) {
				  try{
				      return  _loadAndSaveCartList(responseCartList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return cart;
	}



Future<CartListingModel?> getCartListSearch(String url, int page)async{
  CartListingModel? cart ;   
  cart = await _apiProvider.getListCart(url, page)
		  .then((responseCartList) {
		  
   if(page == -1 ){
        return  _loadAndSaveCartListSearch(responseCartList, '', responseCartList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveCartListSearch(responseCartList, '', page);
      }
		  
		  
			
		  }); 
  return cart;
}


Future<CartListingModel> _loadAndSaveCartListSearch(CartListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_ktp_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_siup_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_notes;
    }
    return list;
 }

Future<CartListingModel?> _loadAndSaveCartList(CartListingModel list, String searchKey, int page) async{
    CartListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCartListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCartModel cart;
      cart = list.items.items[i];
      cart.item!.cnt = i ;
      cart.item!.age = age;
      cart.item!.page = page;
	  cart.item!.ttl = '';
	  cart.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  cart.item!.sbttl = '';
	  
	  cart.item!.id = cart.item!.user_id; 
	  
	  cart.item!.ttl = cart.item!.user_name;
	  cart.item!.pht = cart.item!.scan_ktp_url;
	  cart.item!.pht = cart.item!.scan_siup_url;
	  cart.item!.pht = cart.item!.photo_url;
	  cart.item!.sbttl = cart.item!.self_introduction;
	  cart.item!.sbttl = cart.item!.admin_notes;
      await _dbRepository.saveOrUpdateCartList(cart);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCartList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveCartList1(CartListingModel list, String searchKey, int page) async{
    CartListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCartListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCartModel cart;
      cart = list.items.items[i];
      cart.item!.cnt = i ;
      cart.item!.age = age;
      cart.item!.page = page;
	  cart.item!.ttl = '';
	  cart.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  cart.item!.sbttl = '';
	  
	  cart.item!.id = cart.item!.user_id; 
	  
	  cart.item!.ttl = cart.item!.user_name;
	  cart.item!.pht = cart.item!.scan_ktp_url;
	  cart.item!.pht = cart.item!.scan_siup_url;
	  cart.item!.pht = cart.item!.photo_url;
	  cart.item!.sbttl = cart.item!.self_introduction;
	  cart.item!.sbttl = cart.item!.admin_notes;
      await _dbRepository.saveOrUpdateCartList(cart);
    }

  }


  Future<CartListingModel> loadCartList( String searchKey) async{
    CartListingModel appList = await _dbRepository.loadCartListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCartList(searchKey)) ;
    return appList;
  }

  Future getCartEdit(String url, String id, String title)async{
    var editCart;
    editCart = await _apiProvider.getDataCart(url, id, title);
    return editCart;
  }

  Future getCartView(String url, String id, String title)async{
    var  viewCart;
    viewCart = await _apiProvider.getViewDataCart(url, id, title);
    return viewCart;
  }

  Future sendCartPost(String url, var formdata)async{
    var postCart;
    postCart = await _apiProvider.sendDataCart(url, formdata);
    return postCart;
  }
  
   Future sendCartPostWithID(String url, var formdata, String id, String title)async{
    var postCart;
    postCart = await _apiProvider.sendDataWithIDCart(url, formdata, id, title);
    return postCart;
  }
  
    Future getEmptyCartCartEdit(String url, String id, String title)async{
    var editEmptyCart;
    editEmptyCart = await _apiProvider.getDataEmptyCartCart(url, id, title);
    return editEmptyCart;
  }

  Future getEmptyCartCartView(String url, String id, String title)async{
    var  viewEmptyCart;
    viewEmptyCart = await _apiProvider.getDataEmptyCartCart(url, id, title);
    return viewEmptyCart;
  }

  Future sendEmptyCartCartPost(String url, var formdata)async{
    var postEmptyCart;
    postEmptyCart = await _apiProvider.sendDataEmptyCartCart(url, formdata);
    return postEmptyCart;
  }
  
   Future sendEmptyCartCartPostWithID(String url, var formdata, String id, String title)async{
    var postEmptyCart;
    postEmptyCart = await _apiProvider.sendDataWithIDEmptyCartCart(url, formdata, id, title);
    return postEmptyCart;
  }
  
    Future<EmptyCartCartModel> getEmptyCartCart(String url, String id, String title, String spKey)async{
  EmptyCartCartModel cart ;
   EmptyCartCartModel cart1 ;
          var data ;
			  if(['PlaceNewBid'].contains('EmptyCart')){
			 cart1 = await _apiProvider.getDataEmptyCartCart(url, id, title)
					  .then((responseEmptyCartCart) {
					   
						return responseEmptyCartCart;
					  });
			spKey = cart1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('EmptyCart')){
			 cart1 = await _apiProvider.getDataEmptyCartCart(url, id, title)
					  .then((responseEmptyCartCart) {
					   
						return responseEmptyCartCart;
					  });
			spKey = cart1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('EmptyCart')){
			 cart1 = await _apiProvider.getDataEmptyCartCart(url, id, title)
					  .then((responseEmptyCartCart) {
					   
						return responseEmptyCartCart;
					  });
			spKey = cart1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('EmptyCart')){
			 cart1 = await _apiProvider.getDataEmptyCartCart(url, id, title)
					  .then((responseEmptyCartCart) {
					   
						return responseEmptyCartCart;
					  });
			spKey = cart1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadEmptyCartCart(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  cart = await _apiProvider.getDataEmptyCartCart(url, id, title)
                  .then((responseEmptyCartCart) {
                    saveOrUpdateEmptyCartCart(responseEmptyCartCart, spKey, 1 );
					return responseEmptyCartCart;
                  });
			  return cart;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<EmptyCartCartModel?> loadEmptyCartCart( String searchKey) async{
   return await _dbRepository.loadEmptyCartCart(searchKey) ;   
  }
  
   Future<EmptyCartCartModel?> saveOrUpdateEmptyCartCart(EmptyCartCartModel cart, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateEmptyCartCart(cart, searchKey);   
    return await _dbRepository. loadEmptyCartCart(searchKey) ;  
  }	
  
    Future<void> deleteAllEmptyCartCart(String spKey) async{
      return await _dbRepository.deleteAllEmptyCartCart(spKey); 
   }
  
    Future getApplyCouponCartEdit(String url, String id, String title)async{
    var editApplyCoupon;
    editApplyCoupon = await _apiProvider.getDataApplyCouponCart(url, id, title);
    return editApplyCoupon;
  }

  Future getApplyCouponCartView(String url, String id, String title)async{
    var  viewApplyCoupon;
    viewApplyCoupon = await _apiProvider.getDataApplyCouponCart(url, id, title);
    return viewApplyCoupon;
  }

  Future sendApplyCouponCartPost(String url, var formdata)async{
    var postApplyCoupon;
    postApplyCoupon = await _apiProvider.sendDataApplyCouponCart(url, formdata);
    return postApplyCoupon;
  }
  
   Future sendApplyCouponCartPostWithID(String url, var formdata, String id, String title)async{
    var postApplyCoupon;
    postApplyCoupon = await _apiProvider.sendDataWithIDApplyCouponCart(url, formdata, id, title);
    return postApplyCoupon;
  }
  
    Future<ApplyCouponCartModel> getApplyCouponCart(String url, String id, String title, String spKey)async{
  ApplyCouponCartModel cart ;
   ApplyCouponCartModel cart1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ApplyCoupon')){
			 cart1 = await _apiProvider.getDataApplyCouponCart(url, id, title)
					  .then((responseApplyCouponCart) {
					   
						return responseApplyCouponCart;
					  });
			spKey = cart1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ApplyCoupon')){
			 cart1 = await _apiProvider.getDataApplyCouponCart(url, id, title)
					  .then((responseApplyCouponCart) {
					   
						return responseApplyCouponCart;
					  });
			spKey = cart1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ApplyCoupon')){
			 cart1 = await _apiProvider.getDataApplyCouponCart(url, id, title)
					  .then((responseApplyCouponCart) {
					   
						return responseApplyCouponCart;
					  });
			spKey = cart1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ApplyCoupon')){
			 cart1 = await _apiProvider.getDataApplyCouponCart(url, id, title)
					  .then((responseApplyCouponCart) {
					   
						return responseApplyCouponCart;
					  });
			spKey = cart1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadApplyCouponCart(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  cart = await _apiProvider.getDataApplyCouponCart(url, id, title)
                  .then((responseApplyCouponCart) {
                    saveOrUpdateApplyCouponCart(responseApplyCouponCart, spKey, 1 );
					return responseApplyCouponCart;
                  });
			  return cart;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ApplyCouponCartModel?> loadApplyCouponCart( String searchKey) async{
   return await _dbRepository.loadApplyCouponCart(searchKey) ;   
  }
  
   Future<ApplyCouponCartModel?> saveOrUpdateApplyCouponCart(ApplyCouponCartModel cart, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateApplyCouponCart(cart, searchKey);   
    return await _dbRepository. loadApplyCouponCart(searchKey) ;  
  }	
  
    Future<void> deleteAllApplyCouponCart(String spKey) async{
      return await _dbRepository.deleteAllApplyCouponCart(spKey); 
   }
  
  


  Future<bool> isOldCheckoutList()async{
    int ageDB = await _dbRepository.listCheckoutAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyCheckoutListDB() async {
    var checkout;
    checkout = await _dbRepository.loadCheckoutList('');
    if ((checkout != null) || (checkout != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<CheckoutListingModel?> getCheckoutList(String url, int page)async{
  CheckoutListingModel? checkout ;

   if(page == 1){
			//await _dbRepository.deleteAllCheckoutList();
            checkout = await _apiProvider.getListCheckout(url, page)
                  .then((responseCheckoutList) {
                    _loadAndSaveCheckoutList1(responseCheckoutList, '', page);
					return responseCheckoutList;
                  });
   }else{
      checkout = await _apiProvider.getListCheckout(url, page)
                  .then((responseCheckoutList) {
				  try{
				      return  _loadAndSaveCheckoutList(responseCheckoutList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return checkout;
	}



Future<CheckoutListingModel?> getCheckoutListSearch(String url, int page)async{
  CheckoutListingModel? checkout ;   
  checkout = await _apiProvider.getListCheckout(url, page)
		  .then((responseCheckoutList) {
		  
   if(page == -1 ){
        return  _loadAndSaveCheckoutListSearch(responseCheckoutList, '', responseCheckoutList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveCheckoutListSearch(responseCheckoutList, '', page);
      }
		  
		  
			
		  }); 
  return checkout;
}


Future<CheckoutListingModel> _loadAndSaveCheckoutListSearch(CheckoutListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_ktp_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_siup_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_notes;
    }
    return list;
 }

Future<CheckoutListingModel?> _loadAndSaveCheckoutList(CheckoutListingModel list, String searchKey, int page) async{
    CheckoutListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCheckoutListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCheckoutModel checkout;
      checkout = list.items.items[i];
      checkout.item!.cnt = i ;
      checkout.item!.age = age;
      checkout.item!.page = page;
	  checkout.item!.ttl = '';
	  checkout.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  checkout.item!.sbttl = '';
	  
	  checkout.item!.id = checkout.item!.user_id; 
	  
	  checkout.item!.ttl = checkout.item!.user_name;
	  checkout.item!.pht = checkout.item!.scan_ktp_url;
	  checkout.item!.pht = checkout.item!.scan_siup_url;
	  checkout.item!.pht = checkout.item!.photo_url;
	  checkout.item!.sbttl = checkout.item!.self_introduction;
	  checkout.item!.sbttl = checkout.item!.admin_notes;
      await _dbRepository.saveOrUpdateCheckoutList(checkout);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCheckoutList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveCheckoutList1(CheckoutListingModel list, String searchKey, int page) async{
    CheckoutListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateCheckoutListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemCheckoutModel checkout;
      checkout = list.items.items[i];
      checkout.item!.cnt = i ;
      checkout.item!.age = age;
      checkout.item!.page = page;
	  checkout.item!.ttl = '';
	  checkout.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  checkout.item!.sbttl = '';
	  
	  checkout.item!.id = checkout.item!.user_id; 
	  
	  checkout.item!.ttl = checkout.item!.user_name;
	  checkout.item!.pht = checkout.item!.scan_ktp_url;
	  checkout.item!.pht = checkout.item!.scan_siup_url;
	  checkout.item!.pht = checkout.item!.photo_url;
	  checkout.item!.sbttl = checkout.item!.self_introduction;
	  checkout.item!.sbttl = checkout.item!.admin_notes;
      await _dbRepository.saveOrUpdateCheckoutList(checkout);
    }

  }


  Future<CheckoutListingModel> loadCheckoutList( String searchKey) async{
    CheckoutListingModel appList = await _dbRepository.loadCheckoutListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadCheckoutList(searchKey)) ;
    return appList;
  }

  Future getCheckoutEdit(String url, String id, String title)async{
    var editCheckout;
    editCheckout = await _apiProvider.getDataCheckout(url, id, title);
    return editCheckout;
  }

  Future getCheckoutView(String url, String id, String title)async{
    var  viewCheckout;
    viewCheckout = await _apiProvider.getViewDataCheckout(url, id, title);
    return viewCheckout;
  }

  Future sendCheckoutPost(String url, var formdata)async{
    var postCheckout;
    postCheckout = await _apiProvider.sendDataCheckout(url, formdata);
    return postCheckout;
  }
  
   Future sendCheckoutPostWithID(String url, var formdata, String id, String title)async{
    var postCheckout;
    postCheckout = await _apiProvider.sendDataWithIDCheckout(url, formdata, id, title);
    return postCheckout;
  }
  
    Future getPayWithAvailableBalanceCheckoutEdit(String url, String id, String title)async{
    var editPayWithAvailableBalance;
    editPayWithAvailableBalance = await _apiProvider.getDataPayWithAvailableBalanceCheckout(url, id, title);
    return editPayWithAvailableBalance;
  }

  Future getPayWithAvailableBalanceCheckoutView(String url, String id, String title)async{
    var  viewPayWithAvailableBalance;
    viewPayWithAvailableBalance = await _apiProvider.getDataPayWithAvailableBalanceCheckout(url, id, title);
    return viewPayWithAvailableBalance;
  }

  Future sendPayWithAvailableBalanceCheckoutPost(String url, var formdata)async{
    var postPayWithAvailableBalance;
    postPayWithAvailableBalance = await _apiProvider.sendDataPayWithAvailableBalanceCheckout(url, formdata);
    return postPayWithAvailableBalance;
  }
  
   Future sendPayWithAvailableBalanceCheckoutPostWithID(String url, var formdata, String id, String title)async{
    var postPayWithAvailableBalance;
    postPayWithAvailableBalance = await _apiProvider.sendDataWithIDPayWithAvailableBalanceCheckout(url, formdata, id, title);
    return postPayWithAvailableBalance;
  }
  
    Future<PayWithAvailableBalanceCheckoutModel> getPayWithAvailableBalanceCheckout(String url, String id, String title, String spKey)async{
  PayWithAvailableBalanceCheckoutModel checkout ;
   PayWithAvailableBalanceCheckoutModel checkout1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PayWithAvailableBalance')){
			 checkout1 = await _apiProvider.getDataPayWithAvailableBalanceCheckout(url, id, title)
					  .then((responsePayWithAvailableBalanceCheckout) {
					   
						return responsePayWithAvailableBalanceCheckout;
					  });
			spKey = checkout1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PayWithAvailableBalance')){
			 checkout1 = await _apiProvider.getDataPayWithAvailableBalanceCheckout(url, id, title)
					  .then((responsePayWithAvailableBalanceCheckout) {
					   
						return responsePayWithAvailableBalanceCheckout;
					  });
			spKey = checkout1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PayWithAvailableBalance')){
			 checkout1 = await _apiProvider.getDataPayWithAvailableBalanceCheckout(url, id, title)
					  .then((responsePayWithAvailableBalanceCheckout) {
					   
						return responsePayWithAvailableBalanceCheckout;
					  });
			spKey = checkout1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PayWithAvailableBalance')){
			 checkout1 = await _apiProvider.getDataPayWithAvailableBalanceCheckout(url, id, title)
					  .then((responsePayWithAvailableBalanceCheckout) {
					   
						return responsePayWithAvailableBalanceCheckout;
					  });
			spKey = checkout1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPayWithAvailableBalanceCheckout(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  checkout = await _apiProvider.getDataPayWithAvailableBalanceCheckout(url, id, title)
                  .then((responsePayWithAvailableBalanceCheckout) {
                    saveOrUpdatePayWithAvailableBalanceCheckout(responsePayWithAvailableBalanceCheckout, spKey, 1 );
					return responsePayWithAvailableBalanceCheckout;
                  });
			  return checkout;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PayWithAvailableBalanceCheckoutModel?> loadPayWithAvailableBalanceCheckout( String searchKey) async{
   return await _dbRepository.loadPayWithAvailableBalanceCheckout(searchKey) ;   
  }
  
   Future<PayWithAvailableBalanceCheckoutModel?> saveOrUpdatePayWithAvailableBalanceCheckout(PayWithAvailableBalanceCheckoutModel checkout, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePayWithAvailableBalanceCheckout(checkout, searchKey);   
    return await _dbRepository. loadPayWithAvailableBalanceCheckout(searchKey) ;  
  }	
  
    Future<void> deleteAllPayWithAvailableBalanceCheckout(String spKey) async{
      return await _dbRepository.deleteAllPayWithAvailableBalanceCheckout(spKey); 
   }
  
    Future getPayViaBankTransferCheckoutEdit(String url, String id, String title)async{
    var editPayViaBankTransfer;
    editPayViaBankTransfer = await _apiProvider.getDataPayViaBankTransferCheckout(url, id, title);
    return editPayViaBankTransfer;
  }

  Future getPayViaBankTransferCheckoutView(String url, String id, String title)async{
    var  viewPayViaBankTransfer;
    viewPayViaBankTransfer = await _apiProvider.getDataPayViaBankTransferCheckout(url, id, title);
    return viewPayViaBankTransfer;
  }

  Future sendPayViaBankTransferCheckoutPost(String url, var formdata)async{
    var postPayViaBankTransfer;
    postPayViaBankTransfer = await _apiProvider.sendDataPayViaBankTransferCheckout(url, formdata);
    return postPayViaBankTransfer;
  }
  
   Future sendPayViaBankTransferCheckoutPostWithID(String url, var formdata, String id, String title)async{
    var postPayViaBankTransfer;
    postPayViaBankTransfer = await _apiProvider.sendDataWithIDPayViaBankTransferCheckout(url, formdata, id, title);
    return postPayViaBankTransfer;
  }
  
    Future<PayViaBankTransferCheckoutModel> getPayViaBankTransferCheckout(String url, String id, String title, String spKey)async{
  PayViaBankTransferCheckoutModel checkout ;
   PayViaBankTransferCheckoutModel checkout1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PayViaBankTransfer')){
			 checkout1 = await _apiProvider.getDataPayViaBankTransferCheckout(url, id, title)
					  .then((responsePayViaBankTransferCheckout) {
					   
						return responsePayViaBankTransferCheckout;
					  });
			spKey = checkout1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PayViaBankTransfer')){
			 checkout1 = await _apiProvider.getDataPayViaBankTransferCheckout(url, id, title)
					  .then((responsePayViaBankTransferCheckout) {
					   
						return responsePayViaBankTransferCheckout;
					  });
			spKey = checkout1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PayViaBankTransfer')){
			 checkout1 = await _apiProvider.getDataPayViaBankTransferCheckout(url, id, title)
					  .then((responsePayViaBankTransferCheckout) {
					   
						return responsePayViaBankTransferCheckout;
					  });
			spKey = checkout1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PayViaBankTransfer')){
			 checkout1 = await _apiProvider.getDataPayViaBankTransferCheckout(url, id, title)
					  .then((responsePayViaBankTransferCheckout) {
					   
						return responsePayViaBankTransferCheckout;
					  });
			spKey = checkout1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPayViaBankTransferCheckout(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  checkout = await _apiProvider.getDataPayViaBankTransferCheckout(url, id, title)
                  .then((responsePayViaBankTransferCheckout) {
                    saveOrUpdatePayViaBankTransferCheckout(responsePayViaBankTransferCheckout, spKey, 1 );
					return responsePayViaBankTransferCheckout;
                  });
			  return checkout;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PayViaBankTransferCheckoutModel?> loadPayViaBankTransferCheckout( String searchKey) async{
   return await _dbRepository.loadPayViaBankTransferCheckout(searchKey) ;   
  }
  
   Future<PayViaBankTransferCheckoutModel?> saveOrUpdatePayViaBankTransferCheckout(PayViaBankTransferCheckoutModel checkout, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePayViaBankTransferCheckout(checkout, searchKey);   
    return await _dbRepository. loadPayViaBankTransferCheckout(searchKey) ;  
  }	
  
    Future<void> deleteAllPayViaBankTransferCheckout(String spKey) async{
      return await _dbRepository.deleteAllPayViaBankTransferCheckout(spKey); 
   }
  
    Future getPayWithCreditCardCheckoutEdit(String url, String id, String title)async{
    var editPayWithCreditCard;
    editPayWithCreditCard = await _apiProvider.getDataPayWithCreditCardCheckout(url, id, title);
    return editPayWithCreditCard;
  }

  Future getPayWithCreditCardCheckoutView(String url, String id, String title)async{
    var  viewPayWithCreditCard;
    viewPayWithCreditCard = await _apiProvider.getDataPayWithCreditCardCheckout(url, id, title);
    return viewPayWithCreditCard;
  }

  Future sendPayWithCreditCardCheckoutPost(String url, var formdata)async{
    var postPayWithCreditCard;
    postPayWithCreditCard = await _apiProvider.sendDataPayWithCreditCardCheckout(url, formdata);
    return postPayWithCreditCard;
  }
  
   Future sendPayWithCreditCardCheckoutPostWithID(String url, var formdata, String id, String title)async{
    var postPayWithCreditCard;
    postPayWithCreditCard = await _apiProvider.sendDataWithIDPayWithCreditCardCheckout(url, formdata, id, title);
    return postPayWithCreditCard;
  }
  
    Future<PayWithCreditCardCheckoutModel> getPayWithCreditCardCheckout(String url, String id, String title, String spKey)async{
  PayWithCreditCardCheckoutModel checkout ;
   PayWithCreditCardCheckoutModel checkout1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PayWithCreditCard')){
			 checkout1 = await _apiProvider.getDataPayWithCreditCardCheckout(url, id, title)
					  .then((responsePayWithCreditCardCheckout) {
					   
						return responsePayWithCreditCardCheckout;
					  });
			spKey = checkout1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PayWithCreditCard')){
			 checkout1 = await _apiProvider.getDataPayWithCreditCardCheckout(url, id, title)
					  .then((responsePayWithCreditCardCheckout) {
					   
						return responsePayWithCreditCardCheckout;
					  });
			spKey = checkout1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PayWithCreditCard')){
			 checkout1 = await _apiProvider.getDataPayWithCreditCardCheckout(url, id, title)
					  .then((responsePayWithCreditCardCheckout) {
					   
						return responsePayWithCreditCardCheckout;
					  });
			spKey = checkout1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PayWithCreditCard')){
			 checkout1 = await _apiProvider.getDataPayWithCreditCardCheckout(url, id, title)
					  .then((responsePayWithCreditCardCheckout) {
					   
						return responsePayWithCreditCardCheckout;
					  });
			spKey = checkout1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPayWithCreditCardCheckout(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  checkout = await _apiProvider.getDataPayWithCreditCardCheckout(url, id, title)
                  .then((responsePayWithCreditCardCheckout) {
                    saveOrUpdatePayWithCreditCardCheckout(responsePayWithCreditCardCheckout, spKey, 1 );
					return responsePayWithCreditCardCheckout;
                  });
			  return checkout;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PayWithCreditCardCheckoutModel?> loadPayWithCreditCardCheckout( String searchKey) async{
   return await _dbRepository.loadPayWithCreditCardCheckout(searchKey) ;   
  }
  
   Future<PayWithCreditCardCheckoutModel?> saveOrUpdatePayWithCreditCardCheckout(PayWithCreditCardCheckoutModel checkout, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePayWithCreditCardCheckout(checkout, searchKey);   
    return await _dbRepository. loadPayWithCreditCardCheckout(searchKey) ;  
  }	
  
    Future<void> deleteAllPayWithCreditCardCheckout(String spKey) async{
      return await _dbRepository.deleteAllPayWithCreditCardCheckout(spKey); 
   }
  
    Future getPayWithCimbClicksCheckoutEdit(String url, String id, String title)async{
    var editPayWithCimbClicks;
    editPayWithCimbClicks = await _apiProvider.getDataPayWithCimbClicksCheckout(url, id, title);
    return editPayWithCimbClicks;
  }

  Future getPayWithCimbClicksCheckoutView(String url, String id, String title)async{
    var  viewPayWithCimbClicks;
    viewPayWithCimbClicks = await _apiProvider.getDataPayWithCimbClicksCheckout(url, id, title);
    return viewPayWithCimbClicks;
  }

  Future sendPayWithCimbClicksCheckoutPost(String url, var formdata)async{
    var postPayWithCimbClicks;
    postPayWithCimbClicks = await _apiProvider.sendDataPayWithCimbClicksCheckout(url, formdata);
    return postPayWithCimbClicks;
  }
  
   Future sendPayWithCimbClicksCheckoutPostWithID(String url, var formdata, String id, String title)async{
    var postPayWithCimbClicks;
    postPayWithCimbClicks = await _apiProvider.sendDataWithIDPayWithCimbClicksCheckout(url, formdata, id, title);
    return postPayWithCimbClicks;
  }
  
    Future<PayWithCimbClicksCheckoutModel> getPayWithCimbClicksCheckout(String url, String id, String title, String spKey)async{
  PayWithCimbClicksCheckoutModel checkout ;
   PayWithCimbClicksCheckoutModel checkout1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PayWithCimbClicks')){
			 checkout1 = await _apiProvider.getDataPayWithCimbClicksCheckout(url, id, title)
					  .then((responsePayWithCimbClicksCheckout) {
					   
						return responsePayWithCimbClicksCheckout;
					  });
			spKey = checkout1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PayWithCimbClicks')){
			 checkout1 = await _apiProvider.getDataPayWithCimbClicksCheckout(url, id, title)
					  .then((responsePayWithCimbClicksCheckout) {
					   
						return responsePayWithCimbClicksCheckout;
					  });
			spKey = checkout1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PayWithCimbClicks')){
			 checkout1 = await _apiProvider.getDataPayWithCimbClicksCheckout(url, id, title)
					  .then((responsePayWithCimbClicksCheckout) {
					   
						return responsePayWithCimbClicksCheckout;
					  });
			spKey = checkout1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PayWithCimbClicks')){
			 checkout1 = await _apiProvider.getDataPayWithCimbClicksCheckout(url, id, title)
					  .then((responsePayWithCimbClicksCheckout) {
					   
						return responsePayWithCimbClicksCheckout;
					  });
			spKey = checkout1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPayWithCimbClicksCheckout(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  checkout = await _apiProvider.getDataPayWithCimbClicksCheckout(url, id, title)
                  .then((responsePayWithCimbClicksCheckout) {
                    saveOrUpdatePayWithCimbClicksCheckout(responsePayWithCimbClicksCheckout, spKey, 1 );
					return responsePayWithCimbClicksCheckout;
                  });
			  return checkout;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PayWithCimbClicksCheckoutModel?> loadPayWithCimbClicksCheckout( String searchKey) async{
   return await _dbRepository.loadPayWithCimbClicksCheckout(searchKey) ;   
  }
  
   Future<PayWithCimbClicksCheckoutModel?> saveOrUpdatePayWithCimbClicksCheckout(PayWithCimbClicksCheckoutModel checkout, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePayWithCimbClicksCheckout(checkout, searchKey);   
    return await _dbRepository. loadPayWithCimbClicksCheckout(searchKey) ;  
  }	
  
    Future<void> deleteAllPayWithCimbClicksCheckout(String spKey) async{
      return await _dbRepository.deleteAllPayWithCimbClicksCheckout(spKey); 
   }
  
    Future getPayWithBcaKlikpayCheckoutEdit(String url, String id, String title)async{
    var editPayWithBcaKlikpay;
    editPayWithBcaKlikpay = await _apiProvider.getDataPayWithBcaKlikpayCheckout(url, id, title);
    return editPayWithBcaKlikpay;
  }

  Future getPayWithBcaKlikpayCheckoutView(String url, String id, String title)async{
    var  viewPayWithBcaKlikpay;
    viewPayWithBcaKlikpay = await _apiProvider.getDataPayWithBcaKlikpayCheckout(url, id, title);
    return viewPayWithBcaKlikpay;
  }

  Future sendPayWithBcaKlikpayCheckoutPost(String url, var formdata)async{
    var postPayWithBcaKlikpay;
    postPayWithBcaKlikpay = await _apiProvider.sendDataPayWithBcaKlikpayCheckout(url, formdata);
    return postPayWithBcaKlikpay;
  }
  
   Future sendPayWithBcaKlikpayCheckoutPostWithID(String url, var formdata, String id, String title)async{
    var postPayWithBcaKlikpay;
    postPayWithBcaKlikpay = await _apiProvider.sendDataWithIDPayWithBcaKlikpayCheckout(url, formdata, id, title);
    return postPayWithBcaKlikpay;
  }
  
    Future<PayWithBcaKlikpayCheckoutModel> getPayWithBcaKlikpayCheckout(String url, String id, String title, String spKey)async{
  PayWithBcaKlikpayCheckoutModel checkout ;
   PayWithBcaKlikpayCheckoutModel checkout1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PayWithBcaKlikpay')){
			 checkout1 = await _apiProvider.getDataPayWithBcaKlikpayCheckout(url, id, title)
					  .then((responsePayWithBcaKlikpayCheckout) {
					   
						return responsePayWithBcaKlikpayCheckout;
					  });
			spKey = checkout1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PayWithBcaKlikpay')){
			 checkout1 = await _apiProvider.getDataPayWithBcaKlikpayCheckout(url, id, title)
					  .then((responsePayWithBcaKlikpayCheckout) {
					   
						return responsePayWithBcaKlikpayCheckout;
					  });
			spKey = checkout1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PayWithBcaKlikpay')){
			 checkout1 = await _apiProvider.getDataPayWithBcaKlikpayCheckout(url, id, title)
					  .then((responsePayWithBcaKlikpayCheckout) {
					   
						return responsePayWithBcaKlikpayCheckout;
					  });
			spKey = checkout1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PayWithBcaKlikpay')){
			 checkout1 = await _apiProvider.getDataPayWithBcaKlikpayCheckout(url, id, title)
					  .then((responsePayWithBcaKlikpayCheckout) {
					   
						return responsePayWithBcaKlikpayCheckout;
					  });
			spKey = checkout1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPayWithBcaKlikpayCheckout(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  checkout = await _apiProvider.getDataPayWithBcaKlikpayCheckout(url, id, title)
                  .then((responsePayWithBcaKlikpayCheckout) {
                    saveOrUpdatePayWithBcaKlikpayCheckout(responsePayWithBcaKlikpayCheckout, spKey, 1 );
					return responsePayWithBcaKlikpayCheckout;
                  });
			  return checkout;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PayWithBcaKlikpayCheckoutModel?> loadPayWithBcaKlikpayCheckout( String searchKey) async{
   return await _dbRepository.loadPayWithBcaKlikpayCheckout(searchKey) ;   
  }
  
   Future<PayWithBcaKlikpayCheckoutModel?> saveOrUpdatePayWithBcaKlikpayCheckout(PayWithBcaKlikpayCheckoutModel checkout, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePayWithBcaKlikpayCheckout(checkout, searchKey);   
    return await _dbRepository. loadPayWithBcaKlikpayCheckout(searchKey) ;  
  }	
  
    Future<void> deleteAllPayWithBcaKlikpayCheckout(String spKey) async{
      return await _dbRepository.deleteAllPayWithBcaKlikpayCheckout(spKey); 
   }
  
    Future getPayWithMandiriClickpayCheckoutEdit(String url, String id, String title)async{
    var editPayWithMandiriClickpay;
    editPayWithMandiriClickpay = await _apiProvider.getDataPayWithMandiriClickpayCheckout(url, id, title);
    return editPayWithMandiriClickpay;
  }

  Future getPayWithMandiriClickpayCheckoutView(String url, String id, String title)async{
    var  viewPayWithMandiriClickpay;
    viewPayWithMandiriClickpay = await _apiProvider.getDataPayWithMandiriClickpayCheckout(url, id, title);
    return viewPayWithMandiriClickpay;
  }

  Future sendPayWithMandiriClickpayCheckoutPost(String url, var formdata)async{
    var postPayWithMandiriClickpay;
    postPayWithMandiriClickpay = await _apiProvider.sendDataPayWithMandiriClickpayCheckout(url, formdata);
    return postPayWithMandiriClickpay;
  }
  
   Future sendPayWithMandiriClickpayCheckoutPostWithID(String url, var formdata, String id, String title)async{
    var postPayWithMandiriClickpay;
    postPayWithMandiriClickpay = await _apiProvider.sendDataWithIDPayWithMandiriClickpayCheckout(url, formdata, id, title);
    return postPayWithMandiriClickpay;
  }
  
    Future<PayWithMandiriClickpayCheckoutModel> getPayWithMandiriClickpayCheckout(String url, String id, String title, String spKey)async{
  PayWithMandiriClickpayCheckoutModel checkout ;
   PayWithMandiriClickpayCheckoutModel checkout1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PayWithMandiriClickpay')){
			 checkout1 = await _apiProvider.getDataPayWithMandiriClickpayCheckout(url, id, title)
					  .then((responsePayWithMandiriClickpayCheckout) {
					   
						return responsePayWithMandiriClickpayCheckout;
					  });
			spKey = checkout1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PayWithMandiriClickpay')){
			 checkout1 = await _apiProvider.getDataPayWithMandiriClickpayCheckout(url, id, title)
					  .then((responsePayWithMandiriClickpayCheckout) {
					   
						return responsePayWithMandiriClickpayCheckout;
					  });
			spKey = checkout1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PayWithMandiriClickpay')){
			 checkout1 = await _apiProvider.getDataPayWithMandiriClickpayCheckout(url, id, title)
					  .then((responsePayWithMandiriClickpayCheckout) {
					   
						return responsePayWithMandiriClickpayCheckout;
					  });
			spKey = checkout1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PayWithMandiriClickpay')){
			 checkout1 = await _apiProvider.getDataPayWithMandiriClickpayCheckout(url, id, title)
					  .then((responsePayWithMandiriClickpayCheckout) {
					   
						return responsePayWithMandiriClickpayCheckout;
					  });
			spKey = checkout1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPayWithMandiriClickpayCheckout(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  checkout = await _apiProvider.getDataPayWithMandiriClickpayCheckout(url, id, title)
                  .then((responsePayWithMandiriClickpayCheckout) {
                    saveOrUpdatePayWithMandiriClickpayCheckout(responsePayWithMandiriClickpayCheckout, spKey, 1 );
					return responsePayWithMandiriClickpayCheckout;
                  });
			  return checkout;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PayWithMandiriClickpayCheckoutModel?> loadPayWithMandiriClickpayCheckout( String searchKey) async{
   return await _dbRepository.loadPayWithMandiriClickpayCheckout(searchKey) ;   
  }
  
   Future<PayWithMandiriClickpayCheckoutModel?> saveOrUpdatePayWithMandiriClickpayCheckout(PayWithMandiriClickpayCheckoutModel checkout, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePayWithMandiriClickpayCheckout(checkout, searchKey);   
    return await _dbRepository. loadPayWithMandiriClickpayCheckout(searchKey) ;  
  }	
  
    Future<void> deleteAllPayWithMandiriClickpayCheckout(String spKey) async{
      return await _dbRepository.deleteAllPayWithMandiriClickpayCheckout(spKey); 
   }
  
    Future getPayWithQrisCheckoutEdit(String url, String id, String title)async{
    var editPayWithQris;
    editPayWithQris = await _apiProvider.getDataPayWithQrisCheckout(url, id, title);
    return editPayWithQris;
  }

  Future getPayWithQrisCheckoutView(String url, String id, String title)async{
    var  viewPayWithQris;
    viewPayWithQris = await _apiProvider.getDataPayWithQrisCheckout(url, id, title);
    return viewPayWithQris;
  }

  Future sendPayWithQrisCheckoutPost(String url, var formdata)async{
    var postPayWithQris;
    postPayWithQris = await _apiProvider.sendDataPayWithQrisCheckout(url, formdata);
    return postPayWithQris;
  }
  
   Future sendPayWithQrisCheckoutPostWithID(String url, var formdata, String id, String title)async{
    var postPayWithQris;
    postPayWithQris = await _apiProvider.sendDataWithIDPayWithQrisCheckout(url, formdata, id, title);
    return postPayWithQris;
  }
  
    Future<PayWithQrisCheckoutModel> getPayWithQrisCheckout(String url, String id, String title, String spKey)async{
  PayWithQrisCheckoutModel checkout ;
   PayWithQrisCheckoutModel checkout1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PayWithQris')){
			 checkout1 = await _apiProvider.getDataPayWithQrisCheckout(url, id, title)
					  .then((responsePayWithQrisCheckout) {
					   
						return responsePayWithQrisCheckout;
					  });
			spKey = checkout1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PayWithQris')){
			 checkout1 = await _apiProvider.getDataPayWithQrisCheckout(url, id, title)
					  .then((responsePayWithQrisCheckout) {
					   
						return responsePayWithQrisCheckout;
					  });
			spKey = checkout1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PayWithQris')){
			 checkout1 = await _apiProvider.getDataPayWithQrisCheckout(url, id, title)
					  .then((responsePayWithQrisCheckout) {
					   
						return responsePayWithQrisCheckout;
					  });
			spKey = checkout1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PayWithQris')){
			 checkout1 = await _apiProvider.getDataPayWithQrisCheckout(url, id, title)
					  .then((responsePayWithQrisCheckout) {
					   
						return responsePayWithQrisCheckout;
					  });
			spKey = checkout1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPayWithQrisCheckout(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  checkout = await _apiProvider.getDataPayWithQrisCheckout(url, id, title)
                  .then((responsePayWithQrisCheckout) {
                    saveOrUpdatePayWithQrisCheckout(responsePayWithQrisCheckout, spKey, 1 );
					return responsePayWithQrisCheckout;
                  });
			  return checkout;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PayWithQrisCheckoutModel?> loadPayWithQrisCheckout( String searchKey) async{
   return await _dbRepository.loadPayWithQrisCheckout(searchKey) ;   
  }
  
   Future<PayWithQrisCheckoutModel?> saveOrUpdatePayWithQrisCheckout(PayWithQrisCheckoutModel checkout, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePayWithQrisCheckout(checkout, searchKey);   
    return await _dbRepository. loadPayWithQrisCheckout(searchKey) ;  
  }	
  
    Future<void> deleteAllPayWithQrisCheckout(String spKey) async{
      return await _dbRepository.deleteAllPayWithQrisCheckout(spKey); 
   }
  
    Future getPayWithPaypalCheckoutEdit(String url, String id, String title)async{
    var editPayWithPaypal;
    editPayWithPaypal = await _apiProvider.getDataPayWithPaypalCheckout(url, id, title);
    return editPayWithPaypal;
  }

  Future getPayWithPaypalCheckoutView(String url, String id, String title)async{
    var  viewPayWithPaypal;
    viewPayWithPaypal = await _apiProvider.getDataPayWithPaypalCheckout(url, id, title);
    return viewPayWithPaypal;
  }

  Future sendPayWithPaypalCheckoutPost(String url, var formdata)async{
    var postPayWithPaypal;
    postPayWithPaypal = await _apiProvider.sendDataPayWithPaypalCheckout(url, formdata);
    return postPayWithPaypal;
  }
  
   Future sendPayWithPaypalCheckoutPostWithID(String url, var formdata, String id, String title)async{
    var postPayWithPaypal;
    postPayWithPaypal = await _apiProvider.sendDataWithIDPayWithPaypalCheckout(url, formdata, id, title);
    return postPayWithPaypal;
  }
  
    Future<PayWithPaypalCheckoutModel> getPayWithPaypalCheckout(String url, String id, String title, String spKey)async{
  PayWithPaypalCheckoutModel checkout ;
   PayWithPaypalCheckoutModel checkout1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PayWithPaypal')){
			 checkout1 = await _apiProvider.getDataPayWithPaypalCheckout(url, id, title)
					  .then((responsePayWithPaypalCheckout) {
					   
						return responsePayWithPaypalCheckout;
					  });
			spKey = checkout1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PayWithPaypal')){
			 checkout1 = await _apiProvider.getDataPayWithPaypalCheckout(url, id, title)
					  .then((responsePayWithPaypalCheckout) {
					   
						return responsePayWithPaypalCheckout;
					  });
			spKey = checkout1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PayWithPaypal')){
			 checkout1 = await _apiProvider.getDataPayWithPaypalCheckout(url, id, title)
					  .then((responsePayWithPaypalCheckout) {
					   
						return responsePayWithPaypalCheckout;
					  });
			spKey = checkout1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PayWithPaypal')){
			 checkout1 = await _apiProvider.getDataPayWithPaypalCheckout(url, id, title)
					  .then((responsePayWithPaypalCheckout) {
					   
						return responsePayWithPaypalCheckout;
					  });
			spKey = checkout1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPayWithPaypalCheckout(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  checkout = await _apiProvider.getDataPayWithPaypalCheckout(url, id, title)
                  .then((responsePayWithPaypalCheckout) {
                    saveOrUpdatePayWithPaypalCheckout(responsePayWithPaypalCheckout, spKey, 1 );
					return responsePayWithPaypalCheckout;
                  });
			  return checkout;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PayWithPaypalCheckoutModel?> loadPayWithPaypalCheckout( String searchKey) async{
   return await _dbRepository.loadPayWithPaypalCheckout(searchKey) ;   
  }
  
   Future<PayWithPaypalCheckoutModel?> saveOrUpdatePayWithPaypalCheckout(PayWithPaypalCheckoutModel checkout, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePayWithPaypalCheckout(checkout, searchKey);   
    return await _dbRepository. loadPayWithPaypalCheckout(searchKey) ;  
  }	
  
    Future<void> deleteAllPayWithPaypalCheckout(String spKey) async{
      return await _dbRepository.deleteAllPayWithPaypalCheckout(spKey); 
   }
  
  


  Future<bool> isOldBlogList()async{
    int ageDB = await _dbRepository.listBlogAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyBlogListDB() async {
    var blog;
    blog = await _dbRepository.loadBlogList('');
    if ((blog != null) || (blog != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<BlogListingModel?> getBlogList(String url, int page)async{
  BlogListingModel? blog ;

   if(page == 1){
			//await _dbRepository.deleteAllBlogList();
            blog = await _apiProvider.getListBlog(url, page)
                  .then((responseBlogList) {
                    _loadAndSaveBlogList1(responseBlogList, '', page);
					return responseBlogList;
                  });
   }else{
      blog = await _apiProvider.getListBlog(url, page)
                  .then((responseBlogList) {
				  try{
				      return  _loadAndSaveBlogList(responseBlogList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return blog;
	}



Future<BlogListingModel?> getBlogListSearch(String url, int page)async{
  BlogListingModel? blog ;   
  blog = await _apiProvider.getListBlog(url, page)
		  .then((responseBlogList) {
		  
   if(page == -1 ){
        return  _loadAndSaveBlogListSearch(responseBlogList, '', responseBlogList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveBlogListSearch(responseBlogList, '', page);
      }
		  
		  
			
		  }); 
  return blog;
}


Future<BlogListingModel> _loadAndSaveBlogListSearch(BlogListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.teaser;
	  list.items.items[i].item!.pht = list.items.items[i].item!.image_url;
    }
    return list;
 }

Future<BlogListingModel?> _loadAndSaveBlogList(BlogListingModel list, String searchKey, int page) async{
    BlogListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBlogListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBlogModel blog;
      blog = list.items.items[i];
      blog.item!.cnt = i ;
      blog.item!.age = age;
      blog.item!.page = page;
	  blog.item!.ttl = '';
	  blog.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  blog.item!.sbttl = '';
	  
	  blog.item!.id = blog.item!.article_id; 
	  
	  blog.item!.ttl = blog.item!.title;
	  blog.item!.sbttl = blog.item!.teaser;
	  blog.item!.pht = blog.item!.image_url;
      await _dbRepository.saveOrUpdateBlogList(blog);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBlogList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveBlogList1(BlogListingModel list, String searchKey, int page) async{
    BlogListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateBlogListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemBlogModel blog;
      blog = list.items.items[i];
      blog.item!.cnt = i ;
      blog.item!.age = age;
      blog.item!.page = page;
	  blog.item!.ttl = '';
	  blog.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  blog.item!.sbttl = '';
	  
	  blog.item!.id = blog.item!.article_id; 
	  
	  blog.item!.ttl = blog.item!.title;
	  blog.item!.sbttl = blog.item!.teaser;
	  blog.item!.pht = blog.item!.image_url;
      await _dbRepository.saveOrUpdateBlogList(blog);
    }

  }


  Future<BlogListingModel> loadBlogList( String searchKey) async{
    BlogListingModel appList = await _dbRepository.loadBlogListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadBlogList(searchKey)) ;
    return appList;
  }

  Future getBlogEdit(String url, String id, String title)async{
    var editBlog;
    editBlog = await _apiProvider.getDataBlog(url, id, title);
    return editBlog;
  }

  Future getBlogView(String url, String id, String title)async{
    var  viewBlog;
    viewBlog = await _apiProvider.getViewDataBlog(url, id, title);
    return viewBlog;
  }

  Future sendBlogPost(String url, var formdata)async{
    var postBlog;
    postBlog = await _apiProvider.sendDataBlog(url, formdata);
    return postBlog;
  }
  
   Future sendBlogPostWithID(String url, var formdata, String id, String title)async{
    var postBlog;
    postBlog = await _apiProvider.sendDataWithIDBlog(url, formdata, id, title);
    return postBlog;
  }
  
  


  Future<bool> isOldMyProjectsList()async{
    int ageDB = await _dbRepository.listMyProjectsAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyProjectsListDB() async {
    var my_projects;
    my_projects = await _dbRepository.loadMyProjectsList('');
    if ((my_projects != null) || (my_projects != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyProjectsListingModel?> getMyProjectsList(String url, int page)async{
  MyProjectsListingModel? my_projects ;

   if(page == 1){
			//await _dbRepository.deleteAllMyProjectsList();
            my_projects = await _apiProvider.getListMyProjects(url, page)
                  .then((responseMyProjectsList) {
                    _loadAndSaveMyProjectsList1(responseMyProjectsList, '', page);
					return responseMyProjectsList;
                  });
   }else{
      my_projects = await _apiProvider.getListMyProjects(url, page)
                  .then((responseMyProjectsList) {
				  try{
				      return  _loadAndSaveMyProjectsList(responseMyProjectsList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_projects;
	}



Future<MyProjectsListingModel?> getMyProjectsListSearch(String url, int page)async{
  MyProjectsListingModel? my_projects ;   
  my_projects = await _apiProvider.getListMyProjects(url, page)
		  .then((responseMyProjectsList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyProjectsListSearch(responseMyProjectsList, '', responseMyProjectsList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyProjectsListSearch(responseMyProjectsList, '', page);
      }
		  
		  
			
		  }); 
  return my_projects;
}


Future<MyProjectsListingModel> _loadAndSaveMyProjectsListSearch(MyProjectsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.pht = list.items.items[i].item!.accepted_worker_photo_url;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.accepted_worker_user_name;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.short_description;
    }
    return list;
 }

Future<MyProjectsListingModel?> _loadAndSaveMyProjectsList(MyProjectsListingModel list, String searchKey, int page) async{
    MyProjectsListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyProjectsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyProjectsModel my_projects;
      my_projects = list.items.items[i];
      my_projects.item!.cnt = i ;
      my_projects.item!.age = age;
      my_projects.item!.page = page;
	  my_projects.item!.ttl = '';
	  my_projects.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_projects.item!.sbttl = '';
	  
	  my_projects.item!.id = my_projects.item!.project_id; 
	  
	  my_projects.item!.pht = my_projects.item!.accepted_worker_photo_url;
	  my_projects.item!.ttl = my_projects.item!.accepted_worker_user_name;
	  my_projects.item!.ttl = my_projects.item!.title;
	  my_projects.item!.sbttl = my_projects.item!.short_description;
      await _dbRepository.saveOrUpdateMyProjectsList(my_projects);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyProjectsList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyProjectsList1(MyProjectsListingModel list, String searchKey, int page) async{
    MyProjectsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyProjectsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyProjectsModel my_projects;
      my_projects = list.items.items[i];
      my_projects.item!.cnt = i ;
      my_projects.item!.age = age;
      my_projects.item!.page = page;
	  my_projects.item!.ttl = '';
	  my_projects.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_projects.item!.sbttl = '';
	  
	  my_projects.item!.id = my_projects.item!.project_id; 
	  
	  my_projects.item!.pht = my_projects.item!.accepted_worker_photo_url;
	  my_projects.item!.ttl = my_projects.item!.accepted_worker_user_name;
	  my_projects.item!.ttl = my_projects.item!.title;
	  my_projects.item!.sbttl = my_projects.item!.short_description;
      await _dbRepository.saveOrUpdateMyProjectsList(my_projects);
    }

  }


  Future<MyProjectsListingModel> loadMyProjectsList( String searchKey) async{
    MyProjectsListingModel appList = await _dbRepository.loadMyProjectsListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyProjectsList(searchKey)) ;
    return appList;
  }

  Future getMyProjectsEdit(String url, String id, String title)async{
    var editMyProjects;
    editMyProjects = await _apiProvider.getDataMyProjects(url, id, title);
    return editMyProjects;
  }

  Future getMyProjectsView(String url, String id, String title)async{
    var  viewMyProjects;
    viewMyProjects = await _apiProvider.getViewDataMyProjects(url, id, title);
    return viewMyProjects;
  }

  Future sendMyProjectsPost(String url, var formdata)async{
    var postMyProjects;
    postMyProjects = await _apiProvider.sendDataMyProjects(url, formdata);
    return postMyProjects;
  }
  
   Future sendMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postMyProjects;
    postMyProjects = await _apiProvider.sendDataWithIDMyProjects(url, formdata, id, title);
    return postMyProjects;
  }
  
    Future getBumpUpMyProjectsEdit(String url, String id, String title)async{
    var editBumpUp;
    editBumpUp = await _apiProvider.getDataBumpUpMyProjects(url, id, title);
    return editBumpUp;
  }

  Future getBumpUpMyProjectsView(String url, String id, String title)async{
    var  viewBumpUp;
    viewBumpUp = await _apiProvider.getDataBumpUpMyProjects(url, id, title);
    return viewBumpUp;
  }

  Future sendBumpUpMyProjectsPost(String url, var formdata)async{
    var postBumpUp;
    postBumpUp = await _apiProvider.sendDataBumpUpMyProjects(url, formdata);
    return postBumpUp;
  }
  
   Future sendBumpUpMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postBumpUp;
    postBumpUp = await _apiProvider.sendDataWithIDBumpUpMyProjects(url, formdata, id, title);
    return postBumpUp;
  }
  
    Future<BumpUpMyProjectsModel> getBumpUpMyProjects(String url, String id, String title, String spKey)async{
  BumpUpMyProjectsModel my_projects ;
   BumpUpMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('BumpUp')){
			 my_projects1 = await _apiProvider.getDataBumpUpMyProjects(url, id, title)
					  .then((responseBumpUpMyProjects) {
					   
						return responseBumpUpMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('BumpUp')){
			 my_projects1 = await _apiProvider.getDataBumpUpMyProjects(url, id, title)
					  .then((responseBumpUpMyProjects) {
					   
						return responseBumpUpMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('BumpUp')){
			 my_projects1 = await _apiProvider.getDataBumpUpMyProjects(url, id, title)
					  .then((responseBumpUpMyProjects) {
					   
						return responseBumpUpMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('BumpUp')){
			 my_projects1 = await _apiProvider.getDataBumpUpMyProjects(url, id, title)
					  .then((responseBumpUpMyProjects) {
					   
						return responseBumpUpMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadBumpUpMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataBumpUpMyProjects(url, id, title)
                  .then((responseBumpUpMyProjects) {
                    saveOrUpdateBumpUpMyProjects(responseBumpUpMyProjects, spKey, 1 );
					return responseBumpUpMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<BumpUpMyProjectsModel?> loadBumpUpMyProjects( String searchKey) async{
   return await _dbRepository.loadBumpUpMyProjects(searchKey) ;   
  }
  
   Future<BumpUpMyProjectsModel?> saveOrUpdateBumpUpMyProjects(BumpUpMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateBumpUpMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadBumpUpMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllBumpUpMyProjects(String spKey) async{
      return await _dbRepository.deleteAllBumpUpMyProjects(spKey); 
   }
  
    Future getBroadcastMessageMyProjectsEdit(String url, String id, String title)async{
    var editBroadcastMessage;
    editBroadcastMessage = await _apiProvider.getDataBroadcastMessageMyProjects(url, id, title);
    return editBroadcastMessage;
  }

  Future getBroadcastMessageMyProjectsView(String url, String id, String title)async{
    var  viewBroadcastMessage;
    viewBroadcastMessage = await _apiProvider.getDataBroadcastMessageMyProjects(url, id, title);
    return viewBroadcastMessage;
  }

  Future sendBroadcastMessageMyProjectsPost(String url, var formdata)async{
    var postBroadcastMessage;
    postBroadcastMessage = await _apiProvider.sendDataBroadcastMessageMyProjects(url, formdata);
    return postBroadcastMessage;
  }
  
   Future sendBroadcastMessageMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postBroadcastMessage;
    postBroadcastMessage = await _apiProvider.sendDataWithIDBroadcastMessageMyProjects(url, formdata, id, title);
    return postBroadcastMessage;
  }
  
    Future<BroadcastMessageMyProjectsModel> getBroadcastMessageMyProjects(String url, String id, String title, String spKey)async{
  BroadcastMessageMyProjectsModel my_projects ;
   BroadcastMessageMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('BroadcastMessage')){
			 my_projects1 = await _apiProvider.getDataBroadcastMessageMyProjects(url, id, title)
					  .then((responseBroadcastMessageMyProjects) {
					   
						return responseBroadcastMessageMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('BroadcastMessage')){
			 my_projects1 = await _apiProvider.getDataBroadcastMessageMyProjects(url, id, title)
					  .then((responseBroadcastMessageMyProjects) {
					   
						return responseBroadcastMessageMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('BroadcastMessage')){
			 my_projects1 = await _apiProvider.getDataBroadcastMessageMyProjects(url, id, title)
					  .then((responseBroadcastMessageMyProjects) {
					   
						return responseBroadcastMessageMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('BroadcastMessage')){
			 my_projects1 = await _apiProvider.getDataBroadcastMessageMyProjects(url, id, title)
					  .then((responseBroadcastMessageMyProjects) {
					   
						return responseBroadcastMessageMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadBroadcastMessageMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataBroadcastMessageMyProjects(url, id, title)
                  .then((responseBroadcastMessageMyProjects) {
                    saveOrUpdateBroadcastMessageMyProjects(responseBroadcastMessageMyProjects, spKey, 1 );
					return responseBroadcastMessageMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<BroadcastMessageMyProjectsModel?> loadBroadcastMessageMyProjects( String searchKey) async{
   return await _dbRepository.loadBroadcastMessageMyProjects(searchKey) ;   
  }
  
   Future<BroadcastMessageMyProjectsModel?> saveOrUpdateBroadcastMessageMyProjects(BroadcastMessageMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateBroadcastMessageMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadBroadcastMessageMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllBroadcastMessageMyProjects(String spKey) async{
      return await _dbRepository.deleteAllBroadcastMessageMyProjects(spKey); 
   }
  

Future<ShowBidsListingModel> getShowBidsMyProjectsListSearch(String url, int page)async{
  ShowBidsListingModel show_bids ;   
 
  show_bids = await _apiProvider.getListShowBidsMyProjects(url, page)
		  .then((responseShowBidsMyProjectsList) {
		   if(page == -1 ){
				return  _loadAndSaveShowBidsMyProjectsListSearch(responseShowBidsMyProjectsList, '', responseShowBidsMyProjectsList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveShowBidsMyProjectsListSearch(responseShowBidsMyProjectsList, '', page);
			  }
		  
			//return  _loadAndSaveShowBidsMyProjectsListSearch(responseShowBidsMyProjectsList, '', page);
		  
		  }); 
  return show_bids;
}
Future<ShowBidsListingModel> _loadAndSaveShowBidsMyProjectsListSearch(ShowBidsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.message;
	// list.items.items[i].item!.ttl = list.items.items[i].item!.project_title;
    }
	
    return list;
 }


Future<ShowThreadListingModel> getShowThreadMyProjectsListSearch(String url, int page)async{
  ShowThreadListingModel show_thread ;   
 
  show_thread = await _apiProvider.getListShowThreadMyProjects(url, page)
		  .then((responseShowThreadMyProjectsList) {
		   if(page == -1 ){
				return  _loadAndSaveShowThreadMyProjectsListSearch(responseShowThreadMyProjectsList, '', responseShowThreadMyProjectsList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveShowThreadMyProjectsListSearch(responseShowThreadMyProjectsList, '', page);
			  }
		  
			//return  _loadAndSaveShowThreadMyProjectsListSearch(responseShowThreadMyProjectsList, '', page);
		  
		  }); 
  return show_thread;
}
Future<ShowThreadListingModel> _loadAndSaveShowThreadMyProjectsListSearch(ShowThreadListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.message;
    }
	
    return list;
 }


Future<ShowFilesListingModel> getShowFilesMyProjectsListSearch(String url, int page)async{
  ShowFilesListingModel show_files ;   
 
  show_files = await _apiProvider.getListShowFilesMyProjects(url, page)
		  .then((responseShowFilesMyProjectsList) {
		   if(page == -1 ){
				return  _loadAndSaveShowFilesMyProjectsListSearch(responseShowFilesMyProjectsList, '', responseShowFilesMyProjectsList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveShowFilesMyProjectsListSearch(responseShowFilesMyProjectsList, '', page);
			  }
		  
			//return  _loadAndSaveShowFilesMyProjectsListSearch(responseShowFilesMyProjectsList, '', page);
		  
		  }); 
  return show_files;
}
Future<ShowFilesListingModel> _loadAndSaveShowFilesMyProjectsListSearch(ShowFilesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.message;
    }
	
    return list;
 }


Future<ShowConversationListingModel> getShowConversationMyProjectsListSearch(String url, int page)async{
  ShowConversationListingModel show_conversation ;   
 
  show_conversation = await _apiProvider.getListShowConversationMyProjects(url, page)
		  .then((responseShowConversationMyProjectsList) {
		   if(page == -1 ){
				return  _loadAndSaveShowConversationMyProjectsListSearch(responseShowConversationMyProjectsList, '', responseShowConversationMyProjectsList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveShowConversationMyProjectsListSearch(responseShowConversationMyProjectsList, '', page);
			  }
		  
			//return  _loadAndSaveShowConversationMyProjectsListSearch(responseShowConversationMyProjectsList, '', page);
		  
		  }); 
  return show_conversation;
}
Future<ShowConversationListingModel> _loadAndSaveShowConversationMyProjectsListSearch(ShowConversationListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.message;
    }
	
    return list;
 }

    Future getCreateProjectMyProjectsEdit(String url, String id, String title)async{
    var editCreateProject;
    editCreateProject = await _apiProvider.getDataCreateProjectMyProjects(url, id, title);
    return editCreateProject;
  }

  Future getCreateProjectMyProjectsView(String url, String id, String title)async{
    var  viewCreateProject;
    viewCreateProject = await _apiProvider.getDataCreateProjectMyProjects(url, id, title);
    return viewCreateProject;
  }

  Future sendCreateProjectMyProjectsPost(String url, var formdata)async{
    var postCreateProject;
    postCreateProject = await _apiProvider.sendDataCreateProjectMyProjects(url, formdata);
    return postCreateProject;
  }
  
   Future sendCreateProjectMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postCreateProject;
    postCreateProject = await _apiProvider.sendDataWithIDCreateProjectMyProjects(url, formdata, id, title);
    return postCreateProject;
  }
  
    Future<CreateProjectMyProjectsModel> getCreateProjectMyProjects(String url, String id, String title, String spKey)async{
  CreateProjectMyProjectsModel my_projects ;
   CreateProjectMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('CreateProject')){
			 my_projects1 = await _apiProvider.getDataCreateProjectMyProjects(url, id, title)
					  .then((responseCreateProjectMyProjects) {
					   
						return responseCreateProjectMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('CreateProject')){
			 my_projects1 = await _apiProvider.getDataCreateProjectMyProjects(url, id, title)
					  .then((responseCreateProjectMyProjects) {
					   
						return responseCreateProjectMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('CreateProject')){
			 my_projects1 = await _apiProvider.getDataCreateProjectMyProjects(url, id, title)
					  .then((responseCreateProjectMyProjects) {
					   
						return responseCreateProjectMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('CreateProject')){
			 my_projects1 = await _apiProvider.getDataCreateProjectMyProjects(url, id, title)
					  .then((responseCreateProjectMyProjects) {
					   
						return responseCreateProjectMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadCreateProjectMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataCreateProjectMyProjects(url, id, title)
                  .then((responseCreateProjectMyProjects) {
                    saveOrUpdateCreateProjectMyProjects(responseCreateProjectMyProjects, spKey, 1 );
					return responseCreateProjectMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<CreateProjectMyProjectsModel?> loadCreateProjectMyProjects( String searchKey) async{
   return await _dbRepository.loadCreateProjectMyProjects(searchKey) ;   
  }
  
   Future<CreateProjectMyProjectsModel?> saveOrUpdateCreateProjectMyProjects(CreateProjectMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateCreateProjectMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadCreateProjectMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllCreateProjectMyProjects(String spKey) async{
      return await _dbRepository.deleteAllCreateProjectMyProjects(spKey); 
   }
  
    Future getEditDraftMyProjectsEdit(String url, String id, String title)async{
    var editEditDraft;
    editEditDraft = await _apiProvider.getDataEditDraftMyProjects(url, id, title);
    return editEditDraft;
  }

  Future getEditDraftMyProjectsView(String url, String id, String title)async{
    var  viewEditDraft;
    viewEditDraft = await _apiProvider.getDataEditDraftMyProjects(url, id, title);
    return viewEditDraft;
  }

  Future sendEditDraftMyProjectsPost(String url, var formdata)async{
    var postEditDraft;
    postEditDraft = await _apiProvider.sendDataEditDraftMyProjects(url, formdata);
    return postEditDraft;
  }
  
   Future sendEditDraftMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postEditDraft;
    postEditDraft = await _apiProvider.sendDataWithIDEditDraftMyProjects(url, formdata, id, title);
    return postEditDraft;
  }
  
    Future<EditDraftMyProjectsModel> getEditDraftMyProjects(String url, String id, String title, String spKey)async{
  EditDraftMyProjectsModel my_projects ;
   EditDraftMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('EditDraft')){
			 my_projects1 = await _apiProvider.getDataEditDraftMyProjects(url, id, title)
					  .then((responseEditDraftMyProjects) {
					   
						return responseEditDraftMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('EditDraft')){
			 my_projects1 = await _apiProvider.getDataEditDraftMyProjects(url, id, title)
					  .then((responseEditDraftMyProjects) {
					   
						return responseEditDraftMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('EditDraft')){
			 my_projects1 = await _apiProvider.getDataEditDraftMyProjects(url, id, title)
					  .then((responseEditDraftMyProjects) {
					   
						return responseEditDraftMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('EditDraft')){
			 my_projects1 = await _apiProvider.getDataEditDraftMyProjects(url, id, title)
					  .then((responseEditDraftMyProjects) {
					   
						return responseEditDraftMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadEditDraftMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataEditDraftMyProjects(url, id, title)
                  .then((responseEditDraftMyProjects) {
                    saveOrUpdateEditDraftMyProjects(responseEditDraftMyProjects, spKey, 1 );
					return responseEditDraftMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<EditDraftMyProjectsModel?> loadEditDraftMyProjects( String searchKey) async{
   return await _dbRepository.loadEditDraftMyProjects(searchKey) ;   
  }
  
   Future<EditDraftMyProjectsModel?> saveOrUpdateEditDraftMyProjects(EditDraftMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateEditDraftMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadEditDraftMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllEditDraftMyProjects(String spKey) async{
      return await _dbRepository.deleteAllEditDraftMyProjects(spKey); 
   }
  
    Future getPublishProjectMyProjectsEdit(String url, String id, String title)async{
    var editPublishProject;
    editPublishProject = await _apiProvider.getDataPublishProjectMyProjects(url, id, title);
    return editPublishProject;
  }

  Future getPublishProjectMyProjectsView(String url, String id, String title)async{
    var  viewPublishProject;
    viewPublishProject = await _apiProvider.getDataPublishProjectMyProjects(url, id, title);
    return viewPublishProject;
  }

  Future sendPublishProjectMyProjectsPost(String url, var formdata)async{
    var postPublishProject;
    postPublishProject = await _apiProvider.sendDataPublishProjectMyProjects(url, formdata);
    return postPublishProject;
  }
  
   Future sendPublishProjectMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postPublishProject;
    postPublishProject = await _apiProvider.sendDataWithIDPublishProjectMyProjects(url, formdata, id, title);
    return postPublishProject;
  }
  
    Future<PublishProjectMyProjectsModel> getPublishProjectMyProjects(String url, String id, String title, String spKey)async{
  PublishProjectMyProjectsModel my_projects ;
   PublishProjectMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PublishProject')){
			 my_projects1 = await _apiProvider.getDataPublishProjectMyProjects(url, id, title)
					  .then((responsePublishProjectMyProjects) {
					   
						return responsePublishProjectMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PublishProject')){
			 my_projects1 = await _apiProvider.getDataPublishProjectMyProjects(url, id, title)
					  .then((responsePublishProjectMyProjects) {
					   
						return responsePublishProjectMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PublishProject')){
			 my_projects1 = await _apiProvider.getDataPublishProjectMyProjects(url, id, title)
					  .then((responsePublishProjectMyProjects) {
					   
						return responsePublishProjectMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PublishProject')){
			 my_projects1 = await _apiProvider.getDataPublishProjectMyProjects(url, id, title)
					  .then((responsePublishProjectMyProjects) {
					   
						return responsePublishProjectMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPublishProjectMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataPublishProjectMyProjects(url, id, title)
                  .then((responsePublishProjectMyProjects) {
                    saveOrUpdatePublishProjectMyProjects(responsePublishProjectMyProjects, spKey, 1 );
					return responsePublishProjectMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PublishProjectMyProjectsModel?> loadPublishProjectMyProjects( String searchKey) async{
   return await _dbRepository.loadPublishProjectMyProjects(searchKey) ;   
  }
  
   Future<PublishProjectMyProjectsModel?> saveOrUpdatePublishProjectMyProjects(PublishProjectMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePublishProjectMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadPublishProjectMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllPublishProjectMyProjects(String spKey) async{
      return await _dbRepository.deleteAllPublishProjectMyProjects(spKey); 
   }
  
    Future getCancelProjectMyProjectsEdit(String url, String id, String title)async{
    var editCancelProject;
    editCancelProject = await _apiProvider.getDataCancelProjectMyProjects(url, id, title);
    return editCancelProject;
  }

  Future getCancelProjectMyProjectsView(String url, String id, String title)async{
    var  viewCancelProject;
    viewCancelProject = await _apiProvider.getDataCancelProjectMyProjects(url, id, title);
    return viewCancelProject;
  }

  Future sendCancelProjectMyProjectsPost(String url, var formdata)async{
    var postCancelProject;
    postCancelProject = await _apiProvider.sendDataCancelProjectMyProjects(url, formdata);
    return postCancelProject;
  }
  
   Future sendCancelProjectMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postCancelProject;
    postCancelProject = await _apiProvider.sendDataWithIDCancelProjectMyProjects(url, formdata, id, title);
    return postCancelProject;
  }
  
    Future<CancelProjectMyProjectsModel> getCancelProjectMyProjects(String url, String id, String title, String spKey)async{
  CancelProjectMyProjectsModel my_projects ;
   CancelProjectMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('CancelProject')){
			 my_projects1 = await _apiProvider.getDataCancelProjectMyProjects(url, id, title)
					  .then((responseCancelProjectMyProjects) {
					   
						return responseCancelProjectMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('CancelProject')){
			 my_projects1 = await _apiProvider.getDataCancelProjectMyProjects(url, id, title)
					  .then((responseCancelProjectMyProjects) {
					   
						return responseCancelProjectMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('CancelProject')){
			 my_projects1 = await _apiProvider.getDataCancelProjectMyProjects(url, id, title)
					  .then((responseCancelProjectMyProjects) {
					   
						return responseCancelProjectMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('CancelProject')){
			 my_projects1 = await _apiProvider.getDataCancelProjectMyProjects(url, id, title)
					  .then((responseCancelProjectMyProjects) {
					   
						return responseCancelProjectMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadCancelProjectMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataCancelProjectMyProjects(url, id, title)
                  .then((responseCancelProjectMyProjects) {
                    saveOrUpdateCancelProjectMyProjects(responseCancelProjectMyProjects, spKey, 1 );
					return responseCancelProjectMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<CancelProjectMyProjectsModel?> loadCancelProjectMyProjects( String searchKey) async{
   return await _dbRepository.loadCancelProjectMyProjects(searchKey) ;   
  }
  
   Future<CancelProjectMyProjectsModel?> saveOrUpdateCancelProjectMyProjects(CancelProjectMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateCancelProjectMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadCancelProjectMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllCancelProjectMyProjects(String spKey) async{
      return await _dbRepository.deleteAllCancelProjectMyProjects(spKey); 
   }
  
    Future getAcceptOrRejectWorkMyProjectsEdit(String url, String id, String title)async{
    var editAcceptOrRejectWork;
    editAcceptOrRejectWork = await _apiProvider.getDataAcceptOrRejectWorkMyProjects(url, id, title);
    return editAcceptOrRejectWork;
  }

  Future getAcceptOrRejectWorkMyProjectsView(String url, String id, String title)async{
    var  viewAcceptOrRejectWork;
    viewAcceptOrRejectWork = await _apiProvider.getDataAcceptOrRejectWorkMyProjects(url, id, title);
    return viewAcceptOrRejectWork;
  }

  Future sendAcceptOrRejectWorkMyProjectsPost(String url, var formdata)async{
    var postAcceptOrRejectWork;
    postAcceptOrRejectWork = await _apiProvider.sendDataAcceptOrRejectWorkMyProjects(url, formdata);
    return postAcceptOrRejectWork;
  }
  
   Future sendAcceptOrRejectWorkMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postAcceptOrRejectWork;
    postAcceptOrRejectWork = await _apiProvider.sendDataWithIDAcceptOrRejectWorkMyProjects(url, formdata, id, title);
    return postAcceptOrRejectWork;
  }
  
    Future<AcceptOrRejectWorkMyProjectsModel> getAcceptOrRejectWorkMyProjects(String url, String id, String title, String spKey)async{
  AcceptOrRejectWorkMyProjectsModel my_projects ;
   AcceptOrRejectWorkMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('AcceptOrRejectWork')){
			 my_projects1 = await _apiProvider.getDataAcceptOrRejectWorkMyProjects(url, id, title)
					  .then((responseAcceptOrRejectWorkMyProjects) {
					   
						return responseAcceptOrRejectWorkMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('AcceptOrRejectWork')){
			 my_projects1 = await _apiProvider.getDataAcceptOrRejectWorkMyProjects(url, id, title)
					  .then((responseAcceptOrRejectWorkMyProjects) {
					   
						return responseAcceptOrRejectWorkMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('AcceptOrRejectWork')){
			 my_projects1 = await _apiProvider.getDataAcceptOrRejectWorkMyProjects(url, id, title)
					  .then((responseAcceptOrRejectWorkMyProjects) {
					   
						return responseAcceptOrRejectWorkMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('AcceptOrRejectWork')){
			 my_projects1 = await _apiProvider.getDataAcceptOrRejectWorkMyProjects(url, id, title)
					  .then((responseAcceptOrRejectWorkMyProjects) {
					   
						return responseAcceptOrRejectWorkMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadAcceptOrRejectWorkMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataAcceptOrRejectWorkMyProjects(url, id, title)
                  .then((responseAcceptOrRejectWorkMyProjects) {
                    saveOrUpdateAcceptOrRejectWorkMyProjects(responseAcceptOrRejectWorkMyProjects, spKey, 1 );
					return responseAcceptOrRejectWorkMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<AcceptOrRejectWorkMyProjectsModel?> loadAcceptOrRejectWorkMyProjects( String searchKey) async{
   return await _dbRepository.loadAcceptOrRejectWorkMyProjects(searchKey) ;   
  }
  
   Future<AcceptOrRejectWorkMyProjectsModel?> saveOrUpdateAcceptOrRejectWorkMyProjects(AcceptOrRejectWorkMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateAcceptOrRejectWorkMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadAcceptOrRejectWorkMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllAcceptOrRejectWorkMyProjects(String spKey) async{
      return await _dbRepository.deleteAllAcceptOrRejectWorkMyProjects(spKey); 
   }
  
    Future getRateWorkerMyProjectsEdit(String url, String id, String title)async{
    var editRateWorker;
    editRateWorker = await _apiProvider.getDataRateWorkerMyProjects(url, id, title);
    return editRateWorker;
  }

  Future getRateWorkerMyProjectsView(String url, String id, String title)async{
    var  viewRateWorker;
    viewRateWorker = await _apiProvider.getDataRateWorkerMyProjects(url, id, title);
    return viewRateWorker;
  }

  Future sendRateWorkerMyProjectsPost(String url, var formdata)async{
    var postRateWorker;
    postRateWorker = await _apiProvider.sendDataRateWorkerMyProjects(url, formdata);
    return postRateWorker;
  }
  
   Future sendRateWorkerMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postRateWorker;
    postRateWorker = await _apiProvider.sendDataWithIDRateWorkerMyProjects(url, formdata, id, title);
    return postRateWorker;
  }
  
    Future<RateWorkerMyProjectsModel> getRateWorkerMyProjects(String url, String id, String title, String spKey)async{
  RateWorkerMyProjectsModel my_projects ;
   RateWorkerMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('RateWorker')){
			 my_projects1 = await _apiProvider.getDataRateWorkerMyProjects(url, id, title)
					  .then((responseRateWorkerMyProjects) {
					   
						return responseRateWorkerMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('RateWorker')){
			 my_projects1 = await _apiProvider.getDataRateWorkerMyProjects(url, id, title)
					  .then((responseRateWorkerMyProjects) {
					   
						return responseRateWorkerMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('RateWorker')){
			 my_projects1 = await _apiProvider.getDataRateWorkerMyProjects(url, id, title)
					  .then((responseRateWorkerMyProjects) {
					   
						return responseRateWorkerMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('RateWorker')){
			 my_projects1 = await _apiProvider.getDataRateWorkerMyProjects(url, id, title)
					  .then((responseRateWorkerMyProjects) {
					   
						return responseRateWorkerMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadRateWorkerMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataRateWorkerMyProjects(url, id, title)
                  .then((responseRateWorkerMyProjects) {
                    saveOrUpdateRateWorkerMyProjects(responseRateWorkerMyProjects, spKey, 1 );
					return responseRateWorkerMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<RateWorkerMyProjectsModel?> loadRateWorkerMyProjects( String searchKey) async{
   return await _dbRepository.loadRateWorkerMyProjects(searchKey) ;   
  }
  
   Future<RateWorkerMyProjectsModel?> saveOrUpdateRateWorkerMyProjects(RateWorkerMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateRateWorkerMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadRateWorkerMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllRateWorkerMyProjects(String spKey) async{
      return await _dbRepository.deleteAllRateWorkerMyProjects(spKey); 
   }
  
    Future getReportProgressMyProjectsEdit(String url, String id, String title)async{
    var editReportProgress;
    editReportProgress = await _apiProvider.getDataReportProgressMyProjects(url, id, title);
    return editReportProgress;
  }

  Future getReportProgressMyProjectsView(String url, String id, String title)async{
    var  viewReportProgress;
    viewReportProgress = await _apiProvider.getDataReportProgressMyProjects(url, id, title);
    return viewReportProgress;
  }

  Future sendReportProgressMyProjectsPost(String url, var formdata)async{
    var postReportProgress;
    postReportProgress = await _apiProvider.sendDataReportProgressMyProjects(url, formdata);
    return postReportProgress;
  }
  
   Future sendReportProgressMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postReportProgress;
    postReportProgress = await _apiProvider.sendDataWithIDReportProgressMyProjects(url, formdata, id, title);
    return postReportProgress;
  }
  
    Future<ReportProgressMyProjectsModel> getReportProgressMyProjects(String url, String id, String title, String spKey)async{
  ReportProgressMyProjectsModel my_projects ;
   ReportProgressMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ReportProgress')){
			 my_projects1 = await _apiProvider.getDataReportProgressMyProjects(url, id, title)
					  .then((responseReportProgressMyProjects) {
					   
						return responseReportProgressMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ReportProgress')){
			 my_projects1 = await _apiProvider.getDataReportProgressMyProjects(url, id, title)
					  .then((responseReportProgressMyProjects) {
					   
						return responseReportProgressMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ReportProgress')){
			 my_projects1 = await _apiProvider.getDataReportProgressMyProjects(url, id, title)
					  .then((responseReportProgressMyProjects) {
					   
						return responseReportProgressMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ReportProgress')){
			 my_projects1 = await _apiProvider.getDataReportProgressMyProjects(url, id, title)
					  .then((responseReportProgressMyProjects) {
					   
						return responseReportProgressMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadReportProgressMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataReportProgressMyProjects(url, id, title)
                  .then((responseReportProgressMyProjects) {
                    saveOrUpdateReportProgressMyProjects(responseReportProgressMyProjects, spKey, 1 );
					return responseReportProgressMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ReportProgressMyProjectsModel?> loadReportProgressMyProjects( String searchKey) async{
   return await _dbRepository.loadReportProgressMyProjects(searchKey) ;   
  }
  
   Future<ReportProgressMyProjectsModel?> saveOrUpdateReportProgressMyProjects(ReportProgressMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateReportProgressMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadReportProgressMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllReportProgressMyProjects(String spKey) async{
      return await _dbRepository.deleteAllReportProgressMyProjects(spKey); 
   }
  
    Future getWeeklyReportMyProjectsEdit(String url, String id, String title)async{
    var editWeeklyReport;
    editWeeklyReport = await _apiProvider.getDataWeeklyReportMyProjects(url, id, title);
    return editWeeklyReport;
  }

  Future getWeeklyReportMyProjectsView(String url, String id, String title)async{
    var  viewWeeklyReport;
    viewWeeklyReport = await _apiProvider.getDataWeeklyReportMyProjects(url, id, title);
    return viewWeeklyReport;
  }

  Future sendWeeklyReportMyProjectsPost(String url, var formdata)async{
    var postWeeklyReport;
    postWeeklyReport = await _apiProvider.sendDataWeeklyReportMyProjects(url, formdata);
    return postWeeklyReport;
  }
  
   Future sendWeeklyReportMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postWeeklyReport;
    postWeeklyReport = await _apiProvider.sendDataWithIDWeeklyReportMyProjects(url, formdata, id, title);
    return postWeeklyReport;
  }
  
    Future<WeeklyReportMyProjectsModel> getWeeklyReportMyProjects(String url, String id, String title, String spKey)async{
  WeeklyReportMyProjectsModel my_projects ;
   WeeklyReportMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('WeeklyReport')){
			 my_projects1 = await _apiProvider.getDataWeeklyReportMyProjects(url, id, title)
					  .then((responseWeeklyReportMyProjects) {
					   
						return responseWeeklyReportMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('WeeklyReport')){
			 my_projects1 = await _apiProvider.getDataWeeklyReportMyProjects(url, id, title)
					  .then((responseWeeklyReportMyProjects) {
					   
						return responseWeeklyReportMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('WeeklyReport')){
			 my_projects1 = await _apiProvider.getDataWeeklyReportMyProjects(url, id, title)
					  .then((responseWeeklyReportMyProjects) {
					   
						return responseWeeklyReportMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('WeeklyReport')){
			 my_projects1 = await _apiProvider.getDataWeeklyReportMyProjects(url, id, title)
					  .then((responseWeeklyReportMyProjects) {
					   
						return responseWeeklyReportMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadWeeklyReportMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataWeeklyReportMyProjects(url, id, title)
                  .then((responseWeeklyReportMyProjects) {
                    saveOrUpdateWeeklyReportMyProjects(responseWeeklyReportMyProjects, spKey, 1 );
					return responseWeeklyReportMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<WeeklyReportMyProjectsModel?> loadWeeklyReportMyProjects( String searchKey) async{
   return await _dbRepository.loadWeeklyReportMyProjects(searchKey) ;   
  }
  
   Future<WeeklyReportMyProjectsModel?> saveOrUpdateWeeklyReportMyProjects(WeeklyReportMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateWeeklyReportMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadWeeklyReportMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllWeeklyReportMyProjects(String spKey) async{
      return await _dbRepository.deleteAllWeeklyReportMyProjects(spKey); 
   }
  
    Future getReportDoneMyProjectsEdit(String url, String id, String title)async{
    var editReportDone;
    editReportDone = await _apiProvider.getDataReportDoneMyProjects(url, id, title);
    return editReportDone;
  }

  Future getReportDoneMyProjectsView(String url, String id, String title)async{
    var  viewReportDone;
    viewReportDone = await _apiProvider.getDataReportDoneMyProjects(url, id, title);
    return viewReportDone;
  }

  Future sendReportDoneMyProjectsPost(String url, var formdata)async{
    var postReportDone;
    postReportDone = await _apiProvider.sendDataReportDoneMyProjects(url, formdata);
    return postReportDone;
  }
  
   Future sendReportDoneMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postReportDone;
    postReportDone = await _apiProvider.sendDataWithIDReportDoneMyProjects(url, formdata, id, title);
    return postReportDone;
  }
  
    Future<ReportDoneMyProjectsModel> getReportDoneMyProjects(String url, String id, String title, String spKey)async{
  ReportDoneMyProjectsModel my_projects ;
   ReportDoneMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ReportDone')){
			 my_projects1 = await _apiProvider.getDataReportDoneMyProjects(url, id, title)
					  .then((responseReportDoneMyProjects) {
					   
						return responseReportDoneMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ReportDone')){
			 my_projects1 = await _apiProvider.getDataReportDoneMyProjects(url, id, title)
					  .then((responseReportDoneMyProjects) {
					   
						return responseReportDoneMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ReportDone')){
			 my_projects1 = await _apiProvider.getDataReportDoneMyProjects(url, id, title)
					  .then((responseReportDoneMyProjects) {
					   
						return responseReportDoneMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ReportDone')){
			 my_projects1 = await _apiProvider.getDataReportDoneMyProjects(url, id, title)
					  .then((responseReportDoneMyProjects) {
					   
						return responseReportDoneMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadReportDoneMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataReportDoneMyProjects(url, id, title)
                  .then((responseReportDoneMyProjects) {
                    saveOrUpdateReportDoneMyProjects(responseReportDoneMyProjects, spKey, 1 );
					return responseReportDoneMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ReportDoneMyProjectsModel?> loadReportDoneMyProjects( String searchKey) async{
   return await _dbRepository.loadReportDoneMyProjects(searchKey) ;   
  }
  
   Future<ReportDoneMyProjectsModel?> saveOrUpdateReportDoneMyProjects(ReportDoneMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateReportDoneMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadReportDoneMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllReportDoneMyProjects(String spKey) async{
      return await _dbRepository.deleteAllReportDoneMyProjects(spKey); 
   }
  
    Future getRateOwnerMyProjectsEdit(String url, String id, String title)async{
    var editRateOwner;
    editRateOwner = await _apiProvider.getDataRateOwnerMyProjects(url, id, title);
    return editRateOwner;
  }

  Future getRateOwnerMyProjectsView(String url, String id, String title)async{
    var  viewRateOwner;
    viewRateOwner = await _apiProvider.getDataRateOwnerMyProjects(url, id, title);
    return viewRateOwner;
  }

  Future sendRateOwnerMyProjectsPost(String url, var formdata)async{
    var postRateOwner;
    postRateOwner = await _apiProvider.sendDataRateOwnerMyProjects(url, formdata);
    return postRateOwner;
  }
  
   Future sendRateOwnerMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postRateOwner;
    postRateOwner = await _apiProvider.sendDataWithIDRateOwnerMyProjects(url, formdata, id, title);
    return postRateOwner;
  }
  
    Future<RateOwnerMyProjectsModel> getRateOwnerMyProjects(String url, String id, String title, String spKey)async{
  RateOwnerMyProjectsModel my_projects ;
   RateOwnerMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('RateOwner')){
			 my_projects1 = await _apiProvider.getDataRateOwnerMyProjects(url, id, title)
					  .then((responseRateOwnerMyProjects) {
					   
						return responseRateOwnerMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('RateOwner')){
			 my_projects1 = await _apiProvider.getDataRateOwnerMyProjects(url, id, title)
					  .then((responseRateOwnerMyProjects) {
					   
						return responseRateOwnerMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('RateOwner')){
			 my_projects1 = await _apiProvider.getDataRateOwnerMyProjects(url, id, title)
					  .then((responseRateOwnerMyProjects) {
					   
						return responseRateOwnerMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('RateOwner')){
			 my_projects1 = await _apiProvider.getDataRateOwnerMyProjects(url, id, title)
					  .then((responseRateOwnerMyProjects) {
					   
						return responseRateOwnerMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadRateOwnerMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataRateOwnerMyProjects(url, id, title)
                  .then((responseRateOwnerMyProjects) {
                    saveOrUpdateRateOwnerMyProjects(responseRateOwnerMyProjects, spKey, 1 );
					return responseRateOwnerMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<RateOwnerMyProjectsModel?> loadRateOwnerMyProjects( String searchKey) async{
   return await _dbRepository.loadRateOwnerMyProjects(searchKey) ;   
  }
  
   Future<RateOwnerMyProjectsModel?> saveOrUpdateRateOwnerMyProjects(RateOwnerMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateRateOwnerMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadRateOwnerMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllRateOwnerMyProjects(String spKey) async{
      return await _dbRepository.deleteAllRateOwnerMyProjects(spKey); 
   }
  
    Future getFileArbitrationMyProjectsEdit(String url, String id, String title)async{
    var editFileArbitration;
    editFileArbitration = await _apiProvider.getDataFileArbitrationMyProjects(url, id, title);
    return editFileArbitration;
  }

  Future getFileArbitrationMyProjectsView(String url, String id, String title)async{
    var  viewFileArbitration;
    viewFileArbitration = await _apiProvider.getDataFileArbitrationMyProjects(url, id, title);
    return viewFileArbitration;
  }

  Future sendFileArbitrationMyProjectsPost(String url, var formdata)async{
    var postFileArbitration;
    postFileArbitration = await _apiProvider.sendDataFileArbitrationMyProjects(url, formdata);
    return postFileArbitration;
  }
  
   Future sendFileArbitrationMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postFileArbitration;
    postFileArbitration = await _apiProvider.sendDataWithIDFileArbitrationMyProjects(url, formdata, id, title);
    return postFileArbitration;
  }
  
    Future<FileArbitrationMyProjectsModel> getFileArbitrationMyProjects(String url, String id, String title, String spKey)async{
  FileArbitrationMyProjectsModel my_projects ;
   FileArbitrationMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('FileArbitration')){
			 my_projects1 = await _apiProvider.getDataFileArbitrationMyProjects(url, id, title)
					  .then((responseFileArbitrationMyProjects) {
					   
						return responseFileArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('FileArbitration')){
			 my_projects1 = await _apiProvider.getDataFileArbitrationMyProjects(url, id, title)
					  .then((responseFileArbitrationMyProjects) {
					   
						return responseFileArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('FileArbitration')){
			 my_projects1 = await _apiProvider.getDataFileArbitrationMyProjects(url, id, title)
					  .then((responseFileArbitrationMyProjects) {
					   
						return responseFileArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('FileArbitration')){
			 my_projects1 = await _apiProvider.getDataFileArbitrationMyProjects(url, id, title)
					  .then((responseFileArbitrationMyProjects) {
					   
						return responseFileArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadFileArbitrationMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataFileArbitrationMyProjects(url, id, title)
                  .then((responseFileArbitrationMyProjects) {
                    saveOrUpdateFileArbitrationMyProjects(responseFileArbitrationMyProjects, spKey, 1 );
					return responseFileArbitrationMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<FileArbitrationMyProjectsModel?> loadFileArbitrationMyProjects( String searchKey) async{
   return await _dbRepository.loadFileArbitrationMyProjects(searchKey) ;   
  }
  
   Future<FileArbitrationMyProjectsModel?> saveOrUpdateFileArbitrationMyProjects(FileArbitrationMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateFileArbitrationMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadFileArbitrationMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllFileArbitrationMyProjects(String spKey) async{
      return await _dbRepository.deleteAllFileArbitrationMyProjects(spKey); 
   }
  
    Future getNewOfferMyProjectsEdit(String url, String id, String title)async{
    var editNewOffer;
    editNewOffer = await _apiProvider.getDataNewOfferMyProjects(url, id, title);
    return editNewOffer;
  }

  Future getNewOfferMyProjectsView(String url, String id, String title)async{
    var  viewNewOffer;
    viewNewOffer = await _apiProvider.getDataNewOfferMyProjects(url, id, title);
    return viewNewOffer;
  }

  Future sendNewOfferMyProjectsPost(String url, var formdata)async{
    var postNewOffer;
    postNewOffer = await _apiProvider.sendDataNewOfferMyProjects(url, formdata);
    return postNewOffer;
  }
  
   Future sendNewOfferMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postNewOffer;
    postNewOffer = await _apiProvider.sendDataWithIDNewOfferMyProjects(url, formdata, id, title);
    return postNewOffer;
  }
  
    Future<NewOfferMyProjectsModel> getNewOfferMyProjects(String url, String id, String title, String spKey)async{
  NewOfferMyProjectsModel my_projects ;
   NewOfferMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('NewOffer')){
			 my_projects1 = await _apiProvider.getDataNewOfferMyProjects(url, id, title)
					  .then((responseNewOfferMyProjects) {
					   
						return responseNewOfferMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('NewOffer')){
			 my_projects1 = await _apiProvider.getDataNewOfferMyProjects(url, id, title)
					  .then((responseNewOfferMyProjects) {
					   
						return responseNewOfferMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('NewOffer')){
			 my_projects1 = await _apiProvider.getDataNewOfferMyProjects(url, id, title)
					  .then((responseNewOfferMyProjects) {
					   
						return responseNewOfferMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('NewOffer')){
			 my_projects1 = await _apiProvider.getDataNewOfferMyProjects(url, id, title)
					  .then((responseNewOfferMyProjects) {
					   
						return responseNewOfferMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadNewOfferMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataNewOfferMyProjects(url, id, title)
                  .then((responseNewOfferMyProjects) {
                    saveOrUpdateNewOfferMyProjects(responseNewOfferMyProjects, spKey, 1 );
					return responseNewOfferMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<NewOfferMyProjectsModel?> loadNewOfferMyProjects( String searchKey) async{
   return await _dbRepository.loadNewOfferMyProjects(searchKey) ;   
  }
  
   Future<NewOfferMyProjectsModel?> saveOrUpdateNewOfferMyProjects(NewOfferMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateNewOfferMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadNewOfferMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllNewOfferMyProjects(String spKey) async{
      return await _dbRepository.deleteAllNewOfferMyProjects(spKey); 
   }
  
    Future getAcceptOfferMyProjectsEdit(String url, String id, String title)async{
    var editAcceptOffer;
    editAcceptOffer = await _apiProvider.getDataAcceptOfferMyProjects(url, id, title);
    return editAcceptOffer;
  }

  Future getAcceptOfferMyProjectsView(String url, String id, String title)async{
    var  viewAcceptOffer;
    viewAcceptOffer = await _apiProvider.getDataAcceptOfferMyProjects(url, id, title);
    return viewAcceptOffer;
  }

  Future sendAcceptOfferMyProjectsPost(String url, var formdata)async{
    var postAcceptOffer;
    postAcceptOffer = await _apiProvider.sendDataAcceptOfferMyProjects(url, formdata);
    return postAcceptOffer;
  }
  
   Future sendAcceptOfferMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postAcceptOffer;
    postAcceptOffer = await _apiProvider.sendDataWithIDAcceptOfferMyProjects(url, formdata, id, title);
    return postAcceptOffer;
  }
  
    Future<AcceptOfferMyProjectsModel> getAcceptOfferMyProjects(String url, String id, String title, String spKey)async{
  AcceptOfferMyProjectsModel my_projects ;
   AcceptOfferMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('AcceptOffer')){
			 my_projects1 = await _apiProvider.getDataAcceptOfferMyProjects(url, id, title)
					  .then((responseAcceptOfferMyProjects) {
					   
						return responseAcceptOfferMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('AcceptOffer')){
			 my_projects1 = await _apiProvider.getDataAcceptOfferMyProjects(url, id, title)
					  .then((responseAcceptOfferMyProjects) {
					   
						return responseAcceptOfferMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('AcceptOffer')){
			 my_projects1 = await _apiProvider.getDataAcceptOfferMyProjects(url, id, title)
					  .then((responseAcceptOfferMyProjects) {
					   
						return responseAcceptOfferMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('AcceptOffer')){
			 my_projects1 = await _apiProvider.getDataAcceptOfferMyProjects(url, id, title)
					  .then((responseAcceptOfferMyProjects) {
					   
						return responseAcceptOfferMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadAcceptOfferMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataAcceptOfferMyProjects(url, id, title)
                  .then((responseAcceptOfferMyProjects) {
                    saveOrUpdateAcceptOfferMyProjects(responseAcceptOfferMyProjects, spKey, 1 );
					return responseAcceptOfferMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<AcceptOfferMyProjectsModel?> loadAcceptOfferMyProjects( String searchKey) async{
   return await _dbRepository.loadAcceptOfferMyProjects(searchKey) ;   
  }
  
   Future<AcceptOfferMyProjectsModel?> saveOrUpdateAcceptOfferMyProjects(AcceptOfferMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateAcceptOfferMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadAcceptOfferMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllAcceptOfferMyProjects(String spKey) async{
      return await _dbRepository.deleteAllAcceptOfferMyProjects(spKey); 
   }
  
    Future getRespondArbitrationMyProjectsEdit(String url, String id, String title)async{
    var editRespondArbitration;
    editRespondArbitration = await _apiProvider.getDataRespondArbitrationMyProjects(url, id, title);
    return editRespondArbitration;
  }

  Future getRespondArbitrationMyProjectsView(String url, String id, String title)async{
    var  viewRespondArbitration;
    viewRespondArbitration = await _apiProvider.getDataRespondArbitrationMyProjects(url, id, title);
    return viewRespondArbitration;
  }

  Future sendRespondArbitrationMyProjectsPost(String url, var formdata)async{
    var postRespondArbitration;
    postRespondArbitration = await _apiProvider.sendDataRespondArbitrationMyProjects(url, formdata);
    return postRespondArbitration;
  }
  
   Future sendRespondArbitrationMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postRespondArbitration;
    postRespondArbitration = await _apiProvider.sendDataWithIDRespondArbitrationMyProjects(url, formdata, id, title);
    return postRespondArbitration;
  }
  
    Future<RespondArbitrationMyProjectsModel> getRespondArbitrationMyProjects(String url, String id, String title, String spKey)async{
  RespondArbitrationMyProjectsModel my_projects ;
   RespondArbitrationMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('RespondArbitration')){
			 my_projects1 = await _apiProvider.getDataRespondArbitrationMyProjects(url, id, title)
					  .then((responseRespondArbitrationMyProjects) {
					   
						return responseRespondArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('RespondArbitration')){
			 my_projects1 = await _apiProvider.getDataRespondArbitrationMyProjects(url, id, title)
					  .then((responseRespondArbitrationMyProjects) {
					   
						return responseRespondArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('RespondArbitration')){
			 my_projects1 = await _apiProvider.getDataRespondArbitrationMyProjects(url, id, title)
					  .then((responseRespondArbitrationMyProjects) {
					   
						return responseRespondArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('RespondArbitration')){
			 my_projects1 = await _apiProvider.getDataRespondArbitrationMyProjects(url, id, title)
					  .then((responseRespondArbitrationMyProjects) {
					   
						return responseRespondArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadRespondArbitrationMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataRespondArbitrationMyProjects(url, id, title)
                  .then((responseRespondArbitrationMyProjects) {
                    saveOrUpdateRespondArbitrationMyProjects(responseRespondArbitrationMyProjects, spKey, 1 );
					return responseRespondArbitrationMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<RespondArbitrationMyProjectsModel?> loadRespondArbitrationMyProjects( String searchKey) async{
   return await _dbRepository.loadRespondArbitrationMyProjects(searchKey) ;   
  }
  
   Future<RespondArbitrationMyProjectsModel?> saveOrUpdateRespondArbitrationMyProjects(RespondArbitrationMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateRespondArbitrationMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadRespondArbitrationMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllRespondArbitrationMyProjects(String spKey) async{
      return await _dbRepository.deleteAllRespondArbitrationMyProjects(spKey); 
   }
  
    Future getCancelArbitrationMyProjectsEdit(String url, String id, String title)async{
    var editCancelArbitration;
    editCancelArbitration = await _apiProvider.getDataCancelArbitrationMyProjects(url, id, title);
    return editCancelArbitration;
  }

  Future getCancelArbitrationMyProjectsView(String url, String id, String title)async{
    var  viewCancelArbitration;
    viewCancelArbitration = await _apiProvider.getDataCancelArbitrationMyProjects(url, id, title);
    return viewCancelArbitration;
  }

  Future sendCancelArbitrationMyProjectsPost(String url, var formdata)async{
    var postCancelArbitration;
    postCancelArbitration = await _apiProvider.sendDataCancelArbitrationMyProjects(url, formdata);
    return postCancelArbitration;
  }
  
   Future sendCancelArbitrationMyProjectsPostWithID(String url, var formdata, String id, String title)async{
    var postCancelArbitration;
    postCancelArbitration = await _apiProvider.sendDataWithIDCancelArbitrationMyProjects(url, formdata, id, title);
    return postCancelArbitration;
  }
  
    Future<CancelArbitrationMyProjectsModel> getCancelArbitrationMyProjects(String url, String id, String title, String spKey)async{
  CancelArbitrationMyProjectsModel my_projects ;
   CancelArbitrationMyProjectsModel my_projects1 ;
          var data ;
			  if(['PlaceNewBid'].contains('CancelArbitration')){
			 my_projects1 = await _apiProvider.getDataCancelArbitrationMyProjects(url, id, title)
					  .then((responseCancelArbitrationMyProjects) {
					   
						return responseCancelArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('CancelArbitration')){
			 my_projects1 = await _apiProvider.getDataCancelArbitrationMyProjects(url, id, title)
					  .then((responseCancelArbitrationMyProjects) {
					   
						return responseCancelArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('CancelArbitration')){
			 my_projects1 = await _apiProvider.getDataCancelArbitrationMyProjects(url, id, title)
					  .then((responseCancelArbitrationMyProjects) {
					   
						return responseCancelArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('CancelArbitration')){
			 my_projects1 = await _apiProvider.getDataCancelArbitrationMyProjects(url, id, title)
					  .then((responseCancelArbitrationMyProjects) {
					   
						return responseCancelArbitrationMyProjects;
					  });
			spKey = my_projects1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadCancelArbitrationMyProjects(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_projects = await _apiProvider.getDataCancelArbitrationMyProjects(url, id, title)
                  .then((responseCancelArbitrationMyProjects) {
                    saveOrUpdateCancelArbitrationMyProjects(responseCancelArbitrationMyProjects, spKey, 1 );
					return responseCancelArbitrationMyProjects;
                  });
			  return my_projects;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<CancelArbitrationMyProjectsModel?> loadCancelArbitrationMyProjects( String searchKey) async{
   return await _dbRepository.loadCancelArbitrationMyProjects(searchKey) ;   
  }
  
   Future<CancelArbitrationMyProjectsModel?> saveOrUpdateCancelArbitrationMyProjects(CancelArbitrationMyProjectsModel my_projects, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateCancelArbitrationMyProjects(my_projects, searchKey);   
    return await _dbRepository. loadCancelArbitrationMyProjects(searchKey) ;  
  }	
  
    Future<void> deleteAllCancelArbitrationMyProjects(String spKey) async{
      return await _dbRepository.deleteAllCancelArbitrationMyProjects(spKey); 
   }
  
  


  Future<bool> isOldMyBidsList()async{
    int ageDB = await _dbRepository.listMyBidsAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyBidsListDB() async {
    var my_bids;
    my_bids = await _dbRepository.loadMyBidsList('');
    if ((my_bids != null) || (my_bids != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyBidsListingModel?> getMyBidsList(String url, int page)async{
  MyBidsListingModel? my_bids ;

   if(page == 1){
			//await _dbRepository.deleteAllMyBidsList();
            my_bids = await _apiProvider.getListMyBids(url, page)
                  .then((responseMyBidsList) {
                    _loadAndSaveMyBidsList1(responseMyBidsList, '', page);
					return responseMyBidsList;
                  });
   }else{
      my_bids = await _apiProvider.getListMyBids(url, page)
                  .then((responseMyBidsList) {
				  try{
				      return  _loadAndSaveMyBidsList(responseMyBidsList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_bids;
	}



Future<MyBidsListingModel?> getMyBidsListSearch(String url, int page)async{
  MyBidsListingModel? my_bids ;   
  my_bids = await _apiProvider.getListMyBids(url, page)
		  .then((responseMyBidsList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyBidsListSearch(responseMyBidsList, '', responseMyBidsList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyBidsListSearch(responseMyBidsList, '', page);
      }
		  
		  
			
		  }); 
  return my_bids;
}


Future<MyBidsListingModel> _loadAndSaveMyBidsListSearch(MyBidsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.message;
    }
    return list;
 }

Future<MyBidsListingModel?> _loadAndSaveMyBidsList(MyBidsListingModel list, String searchKey, int page) async{
    MyBidsListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyBidsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyBidsModel my_bids;
      my_bids = list.items.items[i];
      my_bids.item!.cnt = i ;
      my_bids.item!.age = age;
      my_bids.item!.page = page;
	  my_bids.item!.ttl = '';
	  my_bids.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_bids.item!.sbttl = '';
	  
	  my_bids.item!.id = my_bids.item!.bid_id; 
	  
	  my_bids.item!.sbttl = my_bids.item!.message;
      await _dbRepository.saveOrUpdateMyBidsList(my_bids);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyBidsList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyBidsList1(MyBidsListingModel list, String searchKey, int page) async{
    MyBidsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyBidsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyBidsModel my_bids;
      my_bids = list.items.items[i];
      my_bids.item!.cnt = i ;
      my_bids.item!.age = age;
      my_bids.item!.page = page;
	  my_bids.item!.ttl = '';
	  my_bids.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_bids.item!.sbttl = '';
	  
	  my_bids.item!.id = my_bids.item!.bid_id; 
	  
	  my_bids.item!.sbttl = my_bids.item!.message;
      await _dbRepository.saveOrUpdateMyBidsList(my_bids);
    }

  }


  Future<MyBidsListingModel> loadMyBidsList( String searchKey) async{
    MyBidsListingModel appList = await _dbRepository.loadMyBidsListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyBidsList(searchKey)) ;
    return appList;
  }

  Future getMyBidsEdit(String url, String id, String title)async{
    var editMyBids;
    editMyBids = await _apiProvider.getDataMyBids(url, id, title);
    return editMyBids;
  }

  Future getMyBidsView(String url, String id, String title)async{
    var  viewMyBids;
    viewMyBids = await _apiProvider.getViewDataMyBids(url, id, title);
    return viewMyBids;
  }

  Future sendMyBidsPost(String url, var formdata)async{
    var postMyBids;
    postMyBids = await _apiProvider.sendDataMyBids(url, formdata);
    return postMyBids;
  }
  
   Future sendMyBidsPostWithID(String url, var formdata, String id, String title)async{
    var postMyBids;
    postMyBids = await _apiProvider.sendDataWithIDMyBids(url, formdata, id, title);
    return postMyBids;
  }
  

Future<ShowConversationListingModel> getShowConversationMyBidsListSearch(String url, int page)async{
  ShowConversationListingModel show_conversation ;   
 
  show_conversation = await _apiProvider.getListShowConversationMyBids(url, page)
		  .then((responseShowConversationMyBidsList) {
		   if(page == -1 ){
				return  _loadAndSaveShowConversationMyBidsListSearch(responseShowConversationMyBidsList, '', responseShowConversationMyBidsList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveShowConversationMyBidsListSearch(responseShowConversationMyBidsList, '', page);
			  }
		  
			//return  _loadAndSaveShowConversationMyBidsListSearch(responseShowConversationMyBidsList, '', page);
		  
		  }); 
  return show_conversation;
}
Future<ShowConversationListingModel> _loadAndSaveShowConversationMyBidsListSearch(ShowConversationListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.message;
    }
	
    return list;
 }

    Future getCancelBidMyBidsEdit(String url, String id, String title)async{
    var editCancelBid;
    editCancelBid = await _apiProvider.getDataCancelBidMyBids(url, id, title);
    return editCancelBid;
  }

  Future getCancelBidMyBidsView(String url, String id, String title)async{
    var  viewCancelBid;
    viewCancelBid = await _apiProvider.getDataCancelBidMyBids(url, id, title);
    return viewCancelBid;
  }

  Future sendCancelBidMyBidsPost(String url, var formdata)async{
    var postCancelBid;
    postCancelBid = await _apiProvider.sendDataCancelBidMyBids(url, formdata);
    return postCancelBid;
  }
  
   Future sendCancelBidMyBidsPostWithID(String url, var formdata, String id, String title)async{
    var postCancelBid;
    postCancelBid = await _apiProvider.sendDataWithIDCancelBidMyBids(url, formdata, id, title);
    return postCancelBid;
  }
  
    Future<CancelBidMyBidsModel> getCancelBidMyBids(String url, String id, String title, String spKey)async{
  CancelBidMyBidsModel my_bids ;
   CancelBidMyBidsModel my_bids1 ;
          var data ;
			  if(['PlaceNewBid'].contains('CancelBid')){
			 my_bids1 = await _apiProvider.getDataCancelBidMyBids(url, id, title)
					  .then((responseCancelBidMyBids) {
					   
						return responseCancelBidMyBids;
					  });
			spKey = my_bids1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('CancelBid')){
			 my_bids1 = await _apiProvider.getDataCancelBidMyBids(url, id, title)
					  .then((responseCancelBidMyBids) {
					   
						return responseCancelBidMyBids;
					  });
			spKey = my_bids1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('CancelBid')){
			 my_bids1 = await _apiProvider.getDataCancelBidMyBids(url, id, title)
					  .then((responseCancelBidMyBids) {
					   
						return responseCancelBidMyBids;
					  });
			spKey = my_bids1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('CancelBid')){
			 my_bids1 = await _apiProvider.getDataCancelBidMyBids(url, id, title)
					  .then((responseCancelBidMyBids) {
					   
						return responseCancelBidMyBids;
					  });
			spKey = my_bids1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadCancelBidMyBids(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_bids = await _apiProvider.getDataCancelBidMyBids(url, id, title)
                  .then((responseCancelBidMyBids) {
                    saveOrUpdateCancelBidMyBids(responseCancelBidMyBids, spKey, 1 );
					return responseCancelBidMyBids;
                  });
			  return my_bids;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<CancelBidMyBidsModel?> loadCancelBidMyBids( String searchKey) async{
   return await _dbRepository.loadCancelBidMyBids(searchKey) ;   
  }
  
   Future<CancelBidMyBidsModel?> saveOrUpdateCancelBidMyBids(CancelBidMyBidsModel my_bids, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateCancelBidMyBids(my_bids, searchKey);   
    return await _dbRepository. loadCancelBidMyBids(searchKey) ;  
  }	
  
    Future<void> deleteAllCancelBidMyBids(String spKey) async{
      return await _dbRepository.deleteAllCancelBidMyBids(spKey); 
   }
  
  


  Future<bool> isOldMyProductsList()async{
    int ageDB = await _dbRepository.listMyProductsAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyProductsListDB() async {
    var my_products;
    my_products = await _dbRepository.loadMyProductsList('');
    if ((my_products != null) || (my_products != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyProductsListingModel?> getMyProductsList(String url, int page)async{
  MyProductsListingModel? my_products ;

   if(page == 1){
			//await _dbRepository.deleteAllMyProductsList();
            my_products = await _apiProvider.getListMyProducts(url, page)
                  .then((responseMyProductsList) {
                    _loadAndSaveMyProductsList1(responseMyProductsList, '', page);
					return responseMyProductsList;
                  });
   }else{
      my_products = await _apiProvider.getListMyProducts(url, page)
                  .then((responseMyProductsList) {
				  try{
				      return  _loadAndSaveMyProductsList(responseMyProductsList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_products;
	}



Future<MyProductsListingModel?> getMyProductsListSearch(String url, int page)async{
  MyProductsListingModel? my_products ;   
  my_products = await _apiProvider.getListMyProducts(url, page)
		  .then((responseMyProductsList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyProductsListSearch(responseMyProductsList, '', responseMyProductsList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyProductsListSearch(responseMyProductsList, '', page);
      }
		  
		  
			
		  }); 
  return my_products;
}


Future<MyProductsListingModel> _loadAndSaveMyProductsListSearch(MyProductsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.pht = list.items.items[i].item!.logo_url;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.short_description;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_note;
    }
    return list;
 }

Future<MyProductsListingModel?> _loadAndSaveMyProductsList(MyProductsListingModel list, String searchKey, int page) async{
    MyProductsListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyProductsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyProductsModel my_products;
      my_products = list.items.items[i];
      my_products.item!.cnt = i ;
      my_products.item!.age = age;
      my_products.item!.page = page;
	  my_products.item!.ttl = '';
	  my_products.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_products.item!.sbttl = '';
	  
	  my_products.item!.id = my_products.item!.product_id; 
	  
	  my_products.item!.pht = my_products.item!.logo_url;
	  my_products.item!.ttl = my_products.item!.title;
	  my_products.item!.sbttl = my_products.item!.short_description;
	  my_products.item!.sbttl = my_products.item!.admin_note;
      await _dbRepository.saveOrUpdateMyProductsList(my_products);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyProductsList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyProductsList1(MyProductsListingModel list, String searchKey, int page) async{
    MyProductsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyProductsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyProductsModel my_products;
      my_products = list.items.items[i];
      my_products.item!.cnt = i ;
      my_products.item!.age = age;
      my_products.item!.page = page;
	  my_products.item!.ttl = '';
	  my_products.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_products.item!.sbttl = '';
	  
	  my_products.item!.id = my_products.item!.product_id; 
	  
	  my_products.item!.pht = my_products.item!.logo_url;
	  my_products.item!.ttl = my_products.item!.title;
	  my_products.item!.sbttl = my_products.item!.short_description;
	  my_products.item!.sbttl = my_products.item!.admin_note;
      await _dbRepository.saveOrUpdateMyProductsList(my_products);
    }

  }


  Future<MyProductsListingModel> loadMyProductsList( String searchKey) async{
    MyProductsListingModel appList = await _dbRepository.loadMyProductsListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyProductsList(searchKey)) ;
    return appList;
  }

  Future getMyProductsEdit(String url, String id, String title)async{
    var editMyProducts;
    editMyProducts = await _apiProvider.getDataMyProducts(url, id, title);
    return editMyProducts;
  }

  Future getMyProductsView(String url, String id, String title)async{
    var  viewMyProducts;
    viewMyProducts = await _apiProvider.getViewDataMyProducts(url, id, title);
    return viewMyProducts;
  }

  Future sendMyProductsPost(String url, var formdata)async{
    var postMyProducts;
    postMyProducts = await _apiProvider.sendDataMyProducts(url, formdata);
    return postMyProducts;
  }
  
   Future sendMyProductsPostWithID(String url, var formdata, String id, String title)async{
    var postMyProducts;
    postMyProducts = await _apiProvider.sendDataWithIDMyProducts(url, formdata, id, title);
    return postMyProducts;
  }
  

Future<SalesListingModel> getSalesMyProductsListSearch(String url, int page)async{
  SalesListingModel sales ;   
 
  sales = await _apiProvider.getListSalesMyProducts(url, page)
		  .then((responseSalesMyProductsList) {
		   if(page == -1 ){
				return  _loadAndSaveSalesMyProductsListSearch(responseSalesMyProductsList, '', responseSalesMyProductsList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveSalesMyProductsListSearch(responseSalesMyProductsList, '', page);
			  }
		  
			//return  _loadAndSaveSalesMyProductsListSearch(responseSalesMyProductsList, '', page);
		  
		  }); 
  return sales;
}
Future<SalesListingModel> _loadAndSaveSalesMyProductsListSearch(SalesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.testimony;
    }
	
    return list;
 }


Future<CommentsListingModel> getCommentsMyProductsListSearch(String url, int page)async{
  CommentsListingModel comments ;   
 
  comments = await _apiProvider.getListCommentsMyProducts(url, page)
		  .then((responseCommentsMyProductsList) {
		   if(page == -1 ){
				return  _loadAndSaveCommentsMyProductsListSearch(responseCommentsMyProductsList, '', responseCommentsMyProductsList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveCommentsMyProductsListSearch(responseCommentsMyProductsList, '', page);
			  }
		  
			//return  _loadAndSaveCommentsMyProductsListSearch(responseCommentsMyProductsList, '', page);
		  
		  }); 
  return comments;
}
Future<CommentsListingModel> _loadAndSaveCommentsMyProductsListSearch(CommentsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.message;
    }
	
    return list;
 }

    Future getAddNewProductMyProductsEdit(String url, String id, String title)async{
    var editAddNewProduct;
    editAddNewProduct = await _apiProvider.getDataAddNewProductMyProducts(url, id, title);
    return editAddNewProduct;
  }

  Future getAddNewProductMyProductsView(String url, String id, String title)async{
    var  viewAddNewProduct;
    viewAddNewProduct = await _apiProvider.getDataAddNewProductMyProducts(url, id, title);
    return viewAddNewProduct;
  }

  Future sendAddNewProductMyProductsPost(String url, var formdata)async{
    var postAddNewProduct;
    postAddNewProduct = await _apiProvider.sendDataAddNewProductMyProducts(url, formdata);
    return postAddNewProduct;
  }
  
   Future sendAddNewProductMyProductsPostWithID(String url, var formdata, String id, String title)async{
    var postAddNewProduct;
    postAddNewProduct = await _apiProvider.sendDataWithIDAddNewProductMyProducts(url, formdata, id, title);
    return postAddNewProduct;
  }
  
    Future<AddNewProductMyProductsModel> getAddNewProductMyProducts(String url, String id, String title, String spKey)async{
  AddNewProductMyProductsModel my_products ;
   AddNewProductMyProductsModel my_products1 ;
          var data ;
			  if(['PlaceNewBid'].contains('AddNewProduct')){
			 my_products1 = await _apiProvider.getDataAddNewProductMyProducts(url, id, title)
					  .then((responseAddNewProductMyProducts) {
					   
						return responseAddNewProductMyProducts;
					  });
			spKey = my_products1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('AddNewProduct')){
			 my_products1 = await _apiProvider.getDataAddNewProductMyProducts(url, id, title)
					  .then((responseAddNewProductMyProducts) {
					   
						return responseAddNewProductMyProducts;
					  });
			spKey = my_products1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('AddNewProduct')){
			 my_products1 = await _apiProvider.getDataAddNewProductMyProducts(url, id, title)
					  .then((responseAddNewProductMyProducts) {
					   
						return responseAddNewProductMyProducts;
					  });
			spKey = my_products1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('AddNewProduct')){
			 my_products1 = await _apiProvider.getDataAddNewProductMyProducts(url, id, title)
					  .then((responseAddNewProductMyProducts) {
					   
						return responseAddNewProductMyProducts;
					  });
			spKey = my_products1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadAddNewProductMyProducts(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_products = await _apiProvider.getDataAddNewProductMyProducts(url, id, title)
                  .then((responseAddNewProductMyProducts) {
                    saveOrUpdateAddNewProductMyProducts(responseAddNewProductMyProducts, spKey, 1 );
					return responseAddNewProductMyProducts;
                  });
			  return my_products;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<AddNewProductMyProductsModel?> loadAddNewProductMyProducts( String searchKey) async{
   return await _dbRepository.loadAddNewProductMyProducts(searchKey) ;   
  }
  
   Future<AddNewProductMyProductsModel?> saveOrUpdateAddNewProductMyProducts(AddNewProductMyProductsModel my_products, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateAddNewProductMyProducts(my_products, searchKey);   
    return await _dbRepository. loadAddNewProductMyProducts(searchKey) ;  
  }	
  
    Future<void> deleteAllAddNewProductMyProducts(String spKey) async{
      return await _dbRepository.deleteAllAddNewProductMyProducts(spKey); 
   }
  
    Future getPublishProductMyProductsEdit(String url, String id, String title)async{
    var editPublishProduct;
    editPublishProduct = await _apiProvider.getDataPublishProductMyProducts(url, id, title);
    return editPublishProduct;
  }

  Future getPublishProductMyProductsView(String url, String id, String title)async{
    var  viewPublishProduct;
    viewPublishProduct = await _apiProvider.getDataPublishProductMyProducts(url, id, title);
    return viewPublishProduct;
  }

  Future sendPublishProductMyProductsPost(String url, var formdata)async{
    var postPublishProduct;
    postPublishProduct = await _apiProvider.sendDataPublishProductMyProducts(url, formdata);
    return postPublishProduct;
  }
  
   Future sendPublishProductMyProductsPostWithID(String url, var formdata, String id, String title)async{
    var postPublishProduct;
    postPublishProduct = await _apiProvider.sendDataWithIDPublishProductMyProducts(url, formdata, id, title);
    return postPublishProduct;
  }
  
    Future<PublishProductMyProductsModel> getPublishProductMyProducts(String url, String id, String title, String spKey)async{
  PublishProductMyProductsModel my_products ;
   PublishProductMyProductsModel my_products1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PublishProduct')){
			 my_products1 = await _apiProvider.getDataPublishProductMyProducts(url, id, title)
					  .then((responsePublishProductMyProducts) {
					   
						return responsePublishProductMyProducts;
					  });
			spKey = my_products1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PublishProduct')){
			 my_products1 = await _apiProvider.getDataPublishProductMyProducts(url, id, title)
					  .then((responsePublishProductMyProducts) {
					   
						return responsePublishProductMyProducts;
					  });
			spKey = my_products1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PublishProduct')){
			 my_products1 = await _apiProvider.getDataPublishProductMyProducts(url, id, title)
					  .then((responsePublishProductMyProducts) {
					   
						return responsePublishProductMyProducts;
					  });
			spKey = my_products1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PublishProduct')){
			 my_products1 = await _apiProvider.getDataPublishProductMyProducts(url, id, title)
					  .then((responsePublishProductMyProducts) {
					   
						return responsePublishProductMyProducts;
					  });
			spKey = my_products1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPublishProductMyProducts(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_products = await _apiProvider.getDataPublishProductMyProducts(url, id, title)
                  .then((responsePublishProductMyProducts) {
                    saveOrUpdatePublishProductMyProducts(responsePublishProductMyProducts, spKey, 1 );
					return responsePublishProductMyProducts;
                  });
			  return my_products;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PublishProductMyProductsModel?> loadPublishProductMyProducts( String searchKey) async{
   return await _dbRepository.loadPublishProductMyProducts(searchKey) ;   
  }
  
   Future<PublishProductMyProductsModel?> saveOrUpdatePublishProductMyProducts(PublishProductMyProductsModel my_products, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePublishProductMyProducts(my_products, searchKey);   
    return await _dbRepository. loadPublishProductMyProducts(searchKey) ;  
  }	
  
    Future<void> deleteAllPublishProductMyProducts(String spKey) async{
      return await _dbRepository.deleteAllPublishProductMyProducts(spKey); 
   }
  
    Future getEditProductMyProductsEdit(String url, String id, String title)async{
    var editEditProduct;
    editEditProduct = await _apiProvider.getDataEditProductMyProducts(url, id, title);
    return editEditProduct;
  }

  Future getEditProductMyProductsView(String url, String id, String title)async{
    var  viewEditProduct;
    viewEditProduct = await _apiProvider.getDataEditProductMyProducts(url, id, title);
    return viewEditProduct;
  }

  Future sendEditProductMyProductsPost(String url, var formdata)async{
    var postEditProduct;
    postEditProduct = await _apiProvider.sendDataEditProductMyProducts(url, formdata);
    return postEditProduct;
  }
  
   Future sendEditProductMyProductsPostWithID(String url, var formdata, String id, String title)async{
    var postEditProduct;
    postEditProduct = await _apiProvider.sendDataWithIDEditProductMyProducts(url, formdata, id, title);
    return postEditProduct;
  }
  
    Future<EditProductMyProductsModel> getEditProductMyProducts(String url, String id, String title, String spKey)async{
  EditProductMyProductsModel my_products ;
   EditProductMyProductsModel my_products1 ;
          var data ;
			  if(['PlaceNewBid'].contains('EditProduct')){
			 my_products1 = await _apiProvider.getDataEditProductMyProducts(url, id, title)
					  .then((responseEditProductMyProducts) {
					   
						return responseEditProductMyProducts;
					  });
			spKey = my_products1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('EditProduct')){
			 my_products1 = await _apiProvider.getDataEditProductMyProducts(url, id, title)
					  .then((responseEditProductMyProducts) {
					   
						return responseEditProductMyProducts;
					  });
			spKey = my_products1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('EditProduct')){
			 my_products1 = await _apiProvider.getDataEditProductMyProducts(url, id, title)
					  .then((responseEditProductMyProducts) {
					   
						return responseEditProductMyProducts;
					  });
			spKey = my_products1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('EditProduct')){
			 my_products1 = await _apiProvider.getDataEditProductMyProducts(url, id, title)
					  .then((responseEditProductMyProducts) {
					   
						return responseEditProductMyProducts;
					  });
			spKey = my_products1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadEditProductMyProducts(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_products = await _apiProvider.getDataEditProductMyProducts(url, id, title)
                  .then((responseEditProductMyProducts) {
                    saveOrUpdateEditProductMyProducts(responseEditProductMyProducts, spKey, 1 );
					return responseEditProductMyProducts;
                  });
			  return my_products;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<EditProductMyProductsModel?> loadEditProductMyProducts( String searchKey) async{
   return await _dbRepository.loadEditProductMyProducts(searchKey) ;   
  }
  
   Future<EditProductMyProductsModel?> saveOrUpdateEditProductMyProducts(EditProductMyProductsModel my_products, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateEditProductMyProducts(my_products, searchKey);   
    return await _dbRepository. loadEditProductMyProducts(searchKey) ;  
  }	
  
    Future<void> deleteAllEditProductMyProducts(String spKey) async{
      return await _dbRepository.deleteAllEditProductMyProducts(spKey); 
   }
  
    Future getBumpUpMyProductsEdit(String url, String id, String title)async{
    var editBumpUp;
    editBumpUp = await _apiProvider.getDataBumpUpMyProducts(url, id, title);
    return editBumpUp;
  }

  Future getBumpUpMyProductsView(String url, String id, String title)async{
    var  viewBumpUp;
    viewBumpUp = await _apiProvider.getDataBumpUpMyProducts(url, id, title);
    return viewBumpUp;
  }

  Future sendBumpUpMyProductsPost(String url, var formdata)async{
    var postBumpUp;
    postBumpUp = await _apiProvider.sendDataBumpUpMyProducts(url, formdata);
    return postBumpUp;
  }
  
   Future sendBumpUpMyProductsPostWithID(String url, var formdata, String id, String title)async{
    var postBumpUp;
    postBumpUp = await _apiProvider.sendDataWithIDBumpUpMyProducts(url, formdata, id, title);
    return postBumpUp;
  }
  
    Future<BumpUpMyProductsModel> getBumpUpMyProducts(String url, String id, String title, String spKey)async{
  BumpUpMyProductsModel my_products ;
   BumpUpMyProductsModel my_products1 ;
          var data ;
			  if(['PlaceNewBid'].contains('BumpUp')){
			 my_products1 = await _apiProvider.getDataBumpUpMyProducts(url, id, title)
					  .then((responseBumpUpMyProducts) {
					   
						return responseBumpUpMyProducts;
					  });
			spKey = my_products1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('BumpUp')){
			 my_products1 = await _apiProvider.getDataBumpUpMyProducts(url, id, title)
					  .then((responseBumpUpMyProducts) {
					   
						return responseBumpUpMyProducts;
					  });
			spKey = my_products1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('BumpUp')){
			 my_products1 = await _apiProvider.getDataBumpUpMyProducts(url, id, title)
					  .then((responseBumpUpMyProducts) {
					   
						return responseBumpUpMyProducts;
					  });
			spKey = my_products1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('BumpUp')){
			 my_products1 = await _apiProvider.getDataBumpUpMyProducts(url, id, title)
					  .then((responseBumpUpMyProducts) {
					   
						return responseBumpUpMyProducts;
					  });
			spKey = my_products1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadBumpUpMyProducts(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_products = await _apiProvider.getDataBumpUpMyProducts(url, id, title)
                  .then((responseBumpUpMyProducts) {
                    saveOrUpdateBumpUpMyProducts(responseBumpUpMyProducts, spKey, 1 );
					return responseBumpUpMyProducts;
                  });
			  return my_products;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<BumpUpMyProductsModel?> loadBumpUpMyProducts( String searchKey) async{
   return await _dbRepository.loadBumpUpMyProducts(searchKey) ;   
  }
  
   Future<BumpUpMyProductsModel?> saveOrUpdateBumpUpMyProducts(BumpUpMyProductsModel my_products, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateBumpUpMyProducts(my_products, searchKey);   
    return await _dbRepository. loadBumpUpMyProducts(searchKey) ;  
  }	
  
    Future<void> deleteAllBumpUpMyProducts(String spKey) async{
      return await _dbRepository.deleteAllBumpUpMyProducts(spKey); 
   }
  

Future<ScreenshotsListingModel> getScreenshotsMyProductsListSearch(String url, int page)async{
  ScreenshotsListingModel screenshots ;   
 
  screenshots = await _apiProvider.getListScreenshotsMyProducts(url, page)
		  .then((responseScreenshotsMyProductsList) {
		   if(page == -1 ){
				return  _loadAndSaveScreenshotsMyProductsListSearch(responseScreenshotsMyProductsList, '', responseScreenshotsMyProductsList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveScreenshotsMyProductsListSearch(responseScreenshotsMyProductsList, '', page);
			  }
		  
			//return  _loadAndSaveScreenshotsMyProductsListSearch(responseScreenshotsMyProductsList, '', page);
		  
		  }); 
  return screenshots;
}
Future<ScreenshotsListingModel> _loadAndSaveScreenshotsMyProductsListSearch(ScreenshotsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.description;
	  list.items.items[i].item!.pht = list.items.items[i].item!.image_url;
    }
	
    return list;
 }

    Future getUnlistMyProductsEdit(String url, String id, String title)async{
    var editUnlist;
    editUnlist = await _apiProvider.getDataUnlistMyProducts(url, id, title);
    return editUnlist;
  }

  Future getUnlistMyProductsView(String url, String id, String title)async{
    var  viewUnlist;
    viewUnlist = await _apiProvider.getDataUnlistMyProducts(url, id, title);
    return viewUnlist;
  }

  Future sendUnlistMyProductsPost(String url, var formdata)async{
    var postUnlist;
    postUnlist = await _apiProvider.sendDataUnlistMyProducts(url, formdata);
    return postUnlist;
  }
  
   Future sendUnlistMyProductsPostWithID(String url, var formdata, String id, String title)async{
    var postUnlist;
    postUnlist = await _apiProvider.sendDataWithIDUnlistMyProducts(url, formdata, id, title);
    return postUnlist;
  }
  
    Future<UnlistMyProductsModel> getUnlistMyProducts(String url, String id, String title, String spKey)async{
  UnlistMyProductsModel my_products ;
   UnlistMyProductsModel my_products1 ;
          var data ;
			  if(['PlaceNewBid'].contains('Unlist')){
			 my_products1 = await _apiProvider.getDataUnlistMyProducts(url, id, title)
					  .then((responseUnlistMyProducts) {
					   
						return responseUnlistMyProducts;
					  });
			spKey = my_products1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('Unlist')){
			 my_products1 = await _apiProvider.getDataUnlistMyProducts(url, id, title)
					  .then((responseUnlistMyProducts) {
					   
						return responseUnlistMyProducts;
					  });
			spKey = my_products1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('Unlist')){
			 my_products1 = await _apiProvider.getDataUnlistMyProducts(url, id, title)
					  .then((responseUnlistMyProducts) {
					   
						return responseUnlistMyProducts;
					  });
			spKey = my_products1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('Unlist')){
			 my_products1 = await _apiProvider.getDataUnlistMyProducts(url, id, title)
					  .then((responseUnlistMyProducts) {
					   
						return responseUnlistMyProducts;
					  });
			spKey = my_products1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadUnlistMyProducts(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_products = await _apiProvider.getDataUnlistMyProducts(url, id, title)
                  .then((responseUnlistMyProducts) {
                    saveOrUpdateUnlistMyProducts(responseUnlistMyProducts, spKey, 1 );
					return responseUnlistMyProducts;
                  });
			  return my_products;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<UnlistMyProductsModel?> loadUnlistMyProducts( String searchKey) async{
   return await _dbRepository.loadUnlistMyProducts(searchKey) ;   
  }
  
   Future<UnlistMyProductsModel?> saveOrUpdateUnlistMyProducts(UnlistMyProductsModel my_products, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateUnlistMyProducts(my_products, searchKey);   
    return await _dbRepository. loadUnlistMyProducts(searchKey) ;  
  }	
  
    Future<void> deleteAllUnlistMyProducts(String spKey) async{
      return await _dbRepository.deleteAllUnlistMyProducts(spKey); 
   }
  
    Future getReactivateProductMyProductsEdit(String url, String id, String title)async{
    var editReactivateProduct;
    editReactivateProduct = await _apiProvider.getDataReactivateProductMyProducts(url, id, title);
    return editReactivateProduct;
  }

  Future getReactivateProductMyProductsView(String url, String id, String title)async{
    var  viewReactivateProduct;
    viewReactivateProduct = await _apiProvider.getDataReactivateProductMyProducts(url, id, title);
    return viewReactivateProduct;
  }

  Future sendReactivateProductMyProductsPost(String url, var formdata)async{
    var postReactivateProduct;
    postReactivateProduct = await _apiProvider.sendDataReactivateProductMyProducts(url, formdata);
    return postReactivateProduct;
  }
  
   Future sendReactivateProductMyProductsPostWithID(String url, var formdata, String id, String title)async{
    var postReactivateProduct;
    postReactivateProduct = await _apiProvider.sendDataWithIDReactivateProductMyProducts(url, formdata, id, title);
    return postReactivateProduct;
  }
  
    Future<ReactivateProductMyProductsModel> getReactivateProductMyProducts(String url, String id, String title, String spKey)async{
  ReactivateProductMyProductsModel my_products ;
   ReactivateProductMyProductsModel my_products1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ReactivateProduct')){
			 my_products1 = await _apiProvider.getDataReactivateProductMyProducts(url, id, title)
					  .then((responseReactivateProductMyProducts) {
					   
						return responseReactivateProductMyProducts;
					  });
			spKey = my_products1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ReactivateProduct')){
			 my_products1 = await _apiProvider.getDataReactivateProductMyProducts(url, id, title)
					  .then((responseReactivateProductMyProducts) {
					   
						return responseReactivateProductMyProducts;
					  });
			spKey = my_products1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ReactivateProduct')){
			 my_products1 = await _apiProvider.getDataReactivateProductMyProducts(url, id, title)
					  .then((responseReactivateProductMyProducts) {
					   
						return responseReactivateProductMyProducts;
					  });
			spKey = my_products1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ReactivateProduct')){
			 my_products1 = await _apiProvider.getDataReactivateProductMyProducts(url, id, title)
					  .then((responseReactivateProductMyProducts) {
					   
						return responseReactivateProductMyProducts;
					  });
			spKey = my_products1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadReactivateProductMyProducts(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_products = await _apiProvider.getDataReactivateProductMyProducts(url, id, title)
                  .then((responseReactivateProductMyProducts) {
                    saveOrUpdateReactivateProductMyProducts(responseReactivateProductMyProducts, spKey, 1 );
					return responseReactivateProductMyProducts;
                  });
			  return my_products;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ReactivateProductMyProductsModel?> loadReactivateProductMyProducts( String searchKey) async{
   return await _dbRepository.loadReactivateProductMyProducts(searchKey) ;   
  }
  
   Future<ReactivateProductMyProductsModel?> saveOrUpdateReactivateProductMyProducts(ReactivateProductMyProductsModel my_products, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateReactivateProductMyProducts(my_products, searchKey);   
    return await _dbRepository. loadReactivateProductMyProducts(searchKey) ;  
  }	
  
    Future<void> deleteAllReactivateProductMyProducts(String spKey) async{
      return await _dbRepository.deleteAllReactivateProductMyProducts(spKey); 
   }
  
  


  Future<bool> isOldMyServicesList()async{
    int ageDB = await _dbRepository.listMyServicesAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyServicesListDB() async {
    var my_services;
    my_services = await _dbRepository.loadMyServicesList('');
    if ((my_services != null) || (my_services != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyServicesListingModel?> getMyServicesList(String url, int page)async{
  MyServicesListingModel? my_services ;

   if(page == 1){
			//await _dbRepository.deleteAllMyServicesList();
            my_services = await _apiProvider.getListMyServices(url, page)
                  .then((responseMyServicesList) {
                    _loadAndSaveMyServicesList1(responseMyServicesList, '', page);
					return responseMyServicesList;
                  });
   }else{
      my_services = await _apiProvider.getListMyServices(url, page)
                  .then((responseMyServicesList) {
				  try{
				      return  _loadAndSaveMyServicesList(responseMyServicesList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_services;
	}



Future<MyServicesListingModel?> getMyServicesListSearch(String url, int page)async{
  MyServicesListingModel? my_services ;   
  my_services = await _apiProvider.getListMyServices(url, page)
		  .then((responseMyServicesList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyServicesListSearch(responseMyServicesList, '', responseMyServicesList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyServicesListSearch(responseMyServicesList, '', page);
      }
		  
		  
			
		  }); 
  return my_services;
}


Future<MyServicesListingModel> _loadAndSaveMyServicesListSearch(MyServicesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.pht = list.items.items[i].item!.logo_url;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.short_description;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_note;
    }
    return list;
 }

Future<MyServicesListingModel?> _loadAndSaveMyServicesList(MyServicesListingModel list, String searchKey, int page) async{
    MyServicesListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyServicesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyServicesModel my_services;
      my_services = list.items.items[i];
      my_services.item!.cnt = i ;
      my_services.item!.age = age;
      my_services.item!.page = page;
	  my_services.item!.ttl = '';
	  my_services.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_services.item!.sbttl = '';
	  
	  my_services.item!.id = my_services.item!.service_id; 
	  
	  my_services.item!.pht = my_services.item!.logo_url;
	  my_services.item!.ttl = my_services.item!.title;
	  my_services.item!.sbttl = my_services.item!.short_description;
	  my_services.item!.sbttl = my_services.item!.admin_note;
      await _dbRepository.saveOrUpdateMyServicesList(my_services);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyServicesList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyServicesList1(MyServicesListingModel list, String searchKey, int page) async{
    MyServicesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyServicesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyServicesModel my_services;
      my_services = list.items.items[i];
      my_services.item!.cnt = i ;
      my_services.item!.age = age;
      my_services.item!.page = page;
	  my_services.item!.ttl = '';
	  my_services.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_services.item!.sbttl = '';
	  
	  my_services.item!.id = my_services.item!.service_id; 
	  
	  my_services.item!.pht = my_services.item!.logo_url;
	  my_services.item!.ttl = my_services.item!.title;
	  my_services.item!.sbttl = my_services.item!.short_description;
	  my_services.item!.sbttl = my_services.item!.admin_note;
      await _dbRepository.saveOrUpdateMyServicesList(my_services);
    }

  }


  Future<MyServicesListingModel> loadMyServicesList( String searchKey) async{
    MyServicesListingModel appList = await _dbRepository.loadMyServicesListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyServicesList(searchKey)) ;
    return appList;
  }

  Future getMyServicesEdit(String url, String id, String title)async{
    var editMyServices;
    editMyServices = await _apiProvider.getDataMyServices(url, id, title);
    return editMyServices;
  }

  Future getMyServicesView(String url, String id, String title)async{
    var  viewMyServices;
    viewMyServices = await _apiProvider.getViewDataMyServices(url, id, title);
    return viewMyServices;
  }

  Future sendMyServicesPost(String url, var formdata)async{
    var postMyServices;
    postMyServices = await _apiProvider.sendDataMyServices(url, formdata);
    return postMyServices;
  }
  
   Future sendMyServicesPostWithID(String url, var formdata, String id, String title)async{
    var postMyServices;
    postMyServices = await _apiProvider.sendDataWithIDMyServices(url, formdata, id, title);
    return postMyServices;
  }
  

Future<SalesListingModel> getSalesMyServicesListSearch(String url, int page)async{
  SalesListingModel sales ;   
 
  sales = await _apiProvider.getListSalesMyServices(url, page)
		  .then((responseSalesMyServicesList) {
		   if(page == -1 ){
				return  _loadAndSaveSalesMyServicesListSearch(responseSalesMyServicesList, '', responseSalesMyServicesList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveSalesMyServicesListSearch(responseSalesMyServicesList, '', page);
			  }
		  
			//return  _loadAndSaveSalesMyServicesListSearch(responseSalesMyServicesList, '', page);
		  
		  }); 
  return sales;
}
Future<SalesListingModel> _loadAndSaveSalesMyServicesListSearch(SalesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.testimony;
    }
	
    return list;
 }


Future<CommentsListingModel> getCommentsMyServicesListSearch(String url, int page)async{
  CommentsListingModel comments ;   
 
  comments = await _apiProvider.getListCommentsMyServices(url, page)
		  .then((responseCommentsMyServicesList) {
		   if(page == -1 ){
				return  _loadAndSaveCommentsMyServicesListSearch(responseCommentsMyServicesList, '', responseCommentsMyServicesList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveCommentsMyServicesListSearch(responseCommentsMyServicesList, '', page);
			  }
		  
			//return  _loadAndSaveCommentsMyServicesListSearch(responseCommentsMyServicesList, '', page);
		  
		  }); 
  return comments;
}
Future<CommentsListingModel> _loadAndSaveCommentsMyServicesListSearch(CommentsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.message;
    }
	
    return list;
 }

    Future getAddNewServiceMyServicesEdit(String url, String id, String title)async{
    var editAddNewService;
    editAddNewService = await _apiProvider.getDataAddNewServiceMyServices(url, id, title);
    return editAddNewService;
  }

  Future getAddNewServiceMyServicesView(String url, String id, String title)async{
    var  viewAddNewService;
    viewAddNewService = await _apiProvider.getDataAddNewServiceMyServices(url, id, title);
    return viewAddNewService;
  }

  Future sendAddNewServiceMyServicesPost(String url, var formdata)async{
    var postAddNewService;
    postAddNewService = await _apiProvider.sendDataAddNewServiceMyServices(url, formdata);
    return postAddNewService;
  }
  
   Future sendAddNewServiceMyServicesPostWithID(String url, var formdata, String id, String title)async{
    var postAddNewService;
    postAddNewService = await _apiProvider.sendDataWithIDAddNewServiceMyServices(url, formdata, id, title);
    return postAddNewService;
  }
  
    Future<AddNewServiceMyServicesModel> getAddNewServiceMyServices(String url, String id, String title, String spKey)async{
  AddNewServiceMyServicesModel my_services ;
   AddNewServiceMyServicesModel my_services1 ;
          var data ;
			  if(['PlaceNewBid'].contains('AddNewService')){
			 my_services1 = await _apiProvider.getDataAddNewServiceMyServices(url, id, title)
					  .then((responseAddNewServiceMyServices) {
					   
						return responseAddNewServiceMyServices;
					  });
			spKey = my_services1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('AddNewService')){
			 my_services1 = await _apiProvider.getDataAddNewServiceMyServices(url, id, title)
					  .then((responseAddNewServiceMyServices) {
					   
						return responseAddNewServiceMyServices;
					  });
			spKey = my_services1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('AddNewService')){
			 my_services1 = await _apiProvider.getDataAddNewServiceMyServices(url, id, title)
					  .then((responseAddNewServiceMyServices) {
					   
						return responseAddNewServiceMyServices;
					  });
			spKey = my_services1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('AddNewService')){
			 my_services1 = await _apiProvider.getDataAddNewServiceMyServices(url, id, title)
					  .then((responseAddNewServiceMyServices) {
					   
						return responseAddNewServiceMyServices;
					  });
			spKey = my_services1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadAddNewServiceMyServices(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_services = await _apiProvider.getDataAddNewServiceMyServices(url, id, title)
                  .then((responseAddNewServiceMyServices) {
                    saveOrUpdateAddNewServiceMyServices(responseAddNewServiceMyServices, spKey, 1 );
					return responseAddNewServiceMyServices;
                  });
			  return my_services;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<AddNewServiceMyServicesModel?> loadAddNewServiceMyServices( String searchKey) async{
   return await _dbRepository.loadAddNewServiceMyServices(searchKey) ;   
  }
  
   Future<AddNewServiceMyServicesModel?> saveOrUpdateAddNewServiceMyServices(AddNewServiceMyServicesModel my_services, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateAddNewServiceMyServices(my_services, searchKey);   
    return await _dbRepository. loadAddNewServiceMyServices(searchKey) ;  
  }	
  
    Future<void> deleteAllAddNewServiceMyServices(String spKey) async{
      return await _dbRepository.deleteAllAddNewServiceMyServices(spKey); 
   }
  
    Future getPublishServiceMyServicesEdit(String url, String id, String title)async{
    var editPublishService;
    editPublishService = await _apiProvider.getDataPublishServiceMyServices(url, id, title);
    return editPublishService;
  }

  Future getPublishServiceMyServicesView(String url, String id, String title)async{
    var  viewPublishService;
    viewPublishService = await _apiProvider.getDataPublishServiceMyServices(url, id, title);
    return viewPublishService;
  }

  Future sendPublishServiceMyServicesPost(String url, var formdata)async{
    var postPublishService;
    postPublishService = await _apiProvider.sendDataPublishServiceMyServices(url, formdata);
    return postPublishService;
  }
  
   Future sendPublishServiceMyServicesPostWithID(String url, var formdata, String id, String title)async{
    var postPublishService;
    postPublishService = await _apiProvider.sendDataWithIDPublishServiceMyServices(url, formdata, id, title);
    return postPublishService;
  }
  
    Future<PublishServiceMyServicesModel> getPublishServiceMyServices(String url, String id, String title, String spKey)async{
  PublishServiceMyServicesModel my_services ;
   PublishServiceMyServicesModel my_services1 ;
          var data ;
			  if(['PlaceNewBid'].contains('PublishService')){
			 my_services1 = await _apiProvider.getDataPublishServiceMyServices(url, id, title)
					  .then((responsePublishServiceMyServices) {
					   
						return responsePublishServiceMyServices;
					  });
			spKey = my_services1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('PublishService')){
			 my_services1 = await _apiProvider.getDataPublishServiceMyServices(url, id, title)
					  .then((responsePublishServiceMyServices) {
					   
						return responsePublishServiceMyServices;
					  });
			spKey = my_services1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('PublishService')){
			 my_services1 = await _apiProvider.getDataPublishServiceMyServices(url, id, title)
					  .then((responsePublishServiceMyServices) {
					   
						return responsePublishServiceMyServices;
					  });
			spKey = my_services1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('PublishService')){
			 my_services1 = await _apiProvider.getDataPublishServiceMyServices(url, id, title)
					  .then((responsePublishServiceMyServices) {
					   
						return responsePublishServiceMyServices;
					  });
			spKey = my_services1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadPublishServiceMyServices(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_services = await _apiProvider.getDataPublishServiceMyServices(url, id, title)
                  .then((responsePublishServiceMyServices) {
                    saveOrUpdatePublishServiceMyServices(responsePublishServiceMyServices, spKey, 1 );
					return responsePublishServiceMyServices;
                  });
			  return my_services;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<PublishServiceMyServicesModel?> loadPublishServiceMyServices( String searchKey) async{
   return await _dbRepository.loadPublishServiceMyServices(searchKey) ;   
  }
  
   Future<PublishServiceMyServicesModel?> saveOrUpdatePublishServiceMyServices(PublishServiceMyServicesModel my_services, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdatePublishServiceMyServices(my_services, searchKey);   
    return await _dbRepository. loadPublishServiceMyServices(searchKey) ;  
  }	
  
    Future<void> deleteAllPublishServiceMyServices(String spKey) async{
      return await _dbRepository.deleteAllPublishServiceMyServices(spKey); 
   }
  
    Future getBumpUpMyServicesEdit(String url, String id, String title)async{
    var editBumpUp;
    editBumpUp = await _apiProvider.getDataBumpUpMyServices(url, id, title);
    return editBumpUp;
  }

  Future getBumpUpMyServicesView(String url, String id, String title)async{
    var  viewBumpUp;
    viewBumpUp = await _apiProvider.getDataBumpUpMyServices(url, id, title);
    return viewBumpUp;
  }

  Future sendBumpUpMyServicesPost(String url, var formdata)async{
    var postBumpUp;
    postBumpUp = await _apiProvider.sendDataBumpUpMyServices(url, formdata);
    return postBumpUp;
  }
  
   Future sendBumpUpMyServicesPostWithID(String url, var formdata, String id, String title)async{
    var postBumpUp;
    postBumpUp = await _apiProvider.sendDataWithIDBumpUpMyServices(url, formdata, id, title);
    return postBumpUp;
  }
  
    Future<BumpUpMyServicesModel> getBumpUpMyServices(String url, String id, String title, String spKey)async{
  BumpUpMyServicesModel my_services ;
   BumpUpMyServicesModel my_services1 ;
          var data ;
			  if(['PlaceNewBid'].contains('BumpUp')){
			 my_services1 = await _apiProvider.getDataBumpUpMyServices(url, id, title)
					  .then((responseBumpUpMyServices) {
					   
						return responseBumpUpMyServices;
					  });
			spKey = my_services1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('BumpUp')){
			 my_services1 = await _apiProvider.getDataBumpUpMyServices(url, id, title)
					  .then((responseBumpUpMyServices) {
					   
						return responseBumpUpMyServices;
					  });
			spKey = my_services1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('BumpUp')){
			 my_services1 = await _apiProvider.getDataBumpUpMyServices(url, id, title)
					  .then((responseBumpUpMyServices) {
					   
						return responseBumpUpMyServices;
					  });
			spKey = my_services1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('BumpUp')){
			 my_services1 = await _apiProvider.getDataBumpUpMyServices(url, id, title)
					  .then((responseBumpUpMyServices) {
					   
						return responseBumpUpMyServices;
					  });
			spKey = my_services1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadBumpUpMyServices(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_services = await _apiProvider.getDataBumpUpMyServices(url, id, title)
                  .then((responseBumpUpMyServices) {
                    saveOrUpdateBumpUpMyServices(responseBumpUpMyServices, spKey, 1 );
					return responseBumpUpMyServices;
                  });
			  return my_services;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<BumpUpMyServicesModel?> loadBumpUpMyServices( String searchKey) async{
   return await _dbRepository.loadBumpUpMyServices(searchKey) ;   
  }
  
   Future<BumpUpMyServicesModel?> saveOrUpdateBumpUpMyServices(BumpUpMyServicesModel my_services, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateBumpUpMyServices(my_services, searchKey);   
    return await _dbRepository. loadBumpUpMyServices(searchKey) ;  
  }	
  
    Future<void> deleteAllBumpUpMyServices(String spKey) async{
      return await _dbRepository.deleteAllBumpUpMyServices(spKey); 
   }
  
    Future getEditServiceMyServicesEdit(String url, String id, String title)async{
    var editEditService;
    editEditService = await _apiProvider.getDataEditServiceMyServices(url, id, title);
    return editEditService;
  }

  Future getEditServiceMyServicesView(String url, String id, String title)async{
    var  viewEditService;
    viewEditService = await _apiProvider.getDataEditServiceMyServices(url, id, title);
    return viewEditService;
  }

  Future sendEditServiceMyServicesPost(String url, var formdata)async{
    var postEditService;
    postEditService = await _apiProvider.sendDataEditServiceMyServices(url, formdata);
    return postEditService;
  }
  
   Future sendEditServiceMyServicesPostWithID(String url, var formdata, String id, String title)async{
    var postEditService;
    postEditService = await _apiProvider.sendDataWithIDEditServiceMyServices(url, formdata, id, title);
    return postEditService;
  }
  
    Future<EditServiceMyServicesModel> getEditServiceMyServices(String url, String id, String title, String spKey)async{
  EditServiceMyServicesModel my_services ;
   EditServiceMyServicesModel my_services1 ;
          var data ;
			  if(['PlaceNewBid'].contains('EditService')){
			 my_services1 = await _apiProvider.getDataEditServiceMyServices(url, id, title)
					  .then((responseEditServiceMyServices) {
					   
						return responseEditServiceMyServices;
					  });
			spKey = my_services1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('EditService')){
			 my_services1 = await _apiProvider.getDataEditServiceMyServices(url, id, title)
					  .then((responseEditServiceMyServices) {
					   
						return responseEditServiceMyServices;
					  });
			spKey = my_services1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('EditService')){
			 my_services1 = await _apiProvider.getDataEditServiceMyServices(url, id, title)
					  .then((responseEditServiceMyServices) {
					   
						return responseEditServiceMyServices;
					  });
			spKey = my_services1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('EditService')){
			 my_services1 = await _apiProvider.getDataEditServiceMyServices(url, id, title)
					  .then((responseEditServiceMyServices) {
					   
						return responseEditServiceMyServices;
					  });
			spKey = my_services1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadEditServiceMyServices(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_services = await _apiProvider.getDataEditServiceMyServices(url, id, title)
                  .then((responseEditServiceMyServices) {
                    saveOrUpdateEditServiceMyServices(responseEditServiceMyServices, spKey, 1 );
					return responseEditServiceMyServices;
                  });
			  return my_services;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<EditServiceMyServicesModel?> loadEditServiceMyServices( String searchKey) async{
   return await _dbRepository.loadEditServiceMyServices(searchKey) ;   
  }
  
   Future<EditServiceMyServicesModel?> saveOrUpdateEditServiceMyServices(EditServiceMyServicesModel my_services, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateEditServiceMyServices(my_services, searchKey);   
    return await _dbRepository. loadEditServiceMyServices(searchKey) ;  
  }	
  
    Future<void> deleteAllEditServiceMyServices(String spKey) async{
      return await _dbRepository.deleteAllEditServiceMyServices(spKey); 
   }
  

Future<ScreenshotsListingModel> getScreenshotsMyServicesListSearch(String url, int page)async{
  ScreenshotsListingModel screenshots ;   
 
  screenshots = await _apiProvider.getListScreenshotsMyServices(url, page)
		  .then((responseScreenshotsMyServicesList) {
		   if(page == -1 ){
				return  _loadAndSaveScreenshotsMyServicesListSearch(responseScreenshotsMyServicesList, '', responseScreenshotsMyServicesList.tools.paging.total_pages);
			  }else{
				return  _loadAndSaveScreenshotsMyServicesListSearch(responseScreenshotsMyServicesList, '', page);
			  }
		  
			//return  _loadAndSaveScreenshotsMyServicesListSearch(responseScreenshotsMyServicesList, '', page);
		  
		  }); 
  return screenshots;
}
Future<ScreenshotsListingModel> _loadAndSaveScreenshotsMyServicesListSearch(ScreenshotsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.description;
	  list.items.items[i].item!.pht = list.items.items[i].item!.image_url;
    }
	
    return list;
 }

    Future getUnlistMyServicesEdit(String url, String id, String title)async{
    var editUnlist;
    editUnlist = await _apiProvider.getDataUnlistMyServices(url, id, title);
    return editUnlist;
  }

  Future getUnlistMyServicesView(String url, String id, String title)async{
    var  viewUnlist;
    viewUnlist = await _apiProvider.getDataUnlistMyServices(url, id, title);
    return viewUnlist;
  }

  Future sendUnlistMyServicesPost(String url, var formdata)async{
    var postUnlist;
    postUnlist = await _apiProvider.sendDataUnlistMyServices(url, formdata);
    return postUnlist;
  }
  
   Future sendUnlistMyServicesPostWithID(String url, var formdata, String id, String title)async{
    var postUnlist;
    postUnlist = await _apiProvider.sendDataWithIDUnlistMyServices(url, formdata, id, title);
    return postUnlist;
  }
  
    Future<UnlistMyServicesModel> getUnlistMyServices(String url, String id, String title, String spKey)async{
  UnlistMyServicesModel my_services ;
   UnlistMyServicesModel my_services1 ;
          var data ;
			  if(['PlaceNewBid'].contains('Unlist')){
			 my_services1 = await _apiProvider.getDataUnlistMyServices(url, id, title)
					  .then((responseUnlistMyServices) {
					   
						return responseUnlistMyServices;
					  });
			spKey = my_services1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('Unlist')){
			 my_services1 = await _apiProvider.getDataUnlistMyServices(url, id, title)
					  .then((responseUnlistMyServices) {
					   
						return responseUnlistMyServices;
					  });
			spKey = my_services1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('Unlist')){
			 my_services1 = await _apiProvider.getDataUnlistMyServices(url, id, title)
					  .then((responseUnlistMyServices) {
					   
						return responseUnlistMyServices;
					  });
			spKey = my_services1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('Unlist')){
			 my_services1 = await _apiProvider.getDataUnlistMyServices(url, id, title)
					  .then((responseUnlistMyServices) {
					   
						return responseUnlistMyServices;
					  });
			spKey = my_services1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadUnlistMyServices(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_services = await _apiProvider.getDataUnlistMyServices(url, id, title)
                  .then((responseUnlistMyServices) {
                    saveOrUpdateUnlistMyServices(responseUnlistMyServices, spKey, 1 );
					return responseUnlistMyServices;
                  });
			  return my_services;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<UnlistMyServicesModel?> loadUnlistMyServices( String searchKey) async{
   return await _dbRepository.loadUnlistMyServices(searchKey) ;   
  }
  
   Future<UnlistMyServicesModel?> saveOrUpdateUnlistMyServices(UnlistMyServicesModel my_services, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateUnlistMyServices(my_services, searchKey);   
    return await _dbRepository. loadUnlistMyServices(searchKey) ;  
  }	
  
    Future<void> deleteAllUnlistMyServices(String spKey) async{
      return await _dbRepository.deleteAllUnlistMyServices(spKey); 
   }
  
    Future getReactivateServiceMyServicesEdit(String url, String id, String title)async{
    var editReactivateService;
    editReactivateService = await _apiProvider.getDataReactivateServiceMyServices(url, id, title);
    return editReactivateService;
  }

  Future getReactivateServiceMyServicesView(String url, String id, String title)async{
    var  viewReactivateService;
    viewReactivateService = await _apiProvider.getDataReactivateServiceMyServices(url, id, title);
    return viewReactivateService;
  }

  Future sendReactivateServiceMyServicesPost(String url, var formdata)async{
    var postReactivateService;
    postReactivateService = await _apiProvider.sendDataReactivateServiceMyServices(url, formdata);
    return postReactivateService;
  }
  
   Future sendReactivateServiceMyServicesPostWithID(String url, var formdata, String id, String title)async{
    var postReactivateService;
    postReactivateService = await _apiProvider.sendDataWithIDReactivateServiceMyServices(url, formdata, id, title);
    return postReactivateService;
  }
  
    Future<ReactivateServiceMyServicesModel> getReactivateServiceMyServices(String url, String id, String title, String spKey)async{
  ReactivateServiceMyServicesModel my_services ;
   ReactivateServiceMyServicesModel my_services1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ReactivateService')){
			 my_services1 = await _apiProvider.getDataReactivateServiceMyServices(url, id, title)
					  .then((responseReactivateServiceMyServices) {
					   
						return responseReactivateServiceMyServices;
					  });
			spKey = my_services1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ReactivateService')){
			 my_services1 = await _apiProvider.getDataReactivateServiceMyServices(url, id, title)
					  .then((responseReactivateServiceMyServices) {
					   
						return responseReactivateServiceMyServices;
					  });
			spKey = my_services1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ReactivateService')){
			 my_services1 = await _apiProvider.getDataReactivateServiceMyServices(url, id, title)
					  .then((responseReactivateServiceMyServices) {
					   
						return responseReactivateServiceMyServices;
					  });
			spKey = my_services1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ReactivateService')){
			 my_services1 = await _apiProvider.getDataReactivateServiceMyServices(url, id, title)
					  .then((responseReactivateServiceMyServices) {
					   
						return responseReactivateServiceMyServices;
					  });
			spKey = my_services1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadReactivateServiceMyServices(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_services = await _apiProvider.getDataReactivateServiceMyServices(url, id, title)
                  .then((responseReactivateServiceMyServices) {
                    saveOrUpdateReactivateServiceMyServices(responseReactivateServiceMyServices, spKey, 1 );
					return responseReactivateServiceMyServices;
                  });
			  return my_services;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ReactivateServiceMyServicesModel?> loadReactivateServiceMyServices( String searchKey) async{
   return await _dbRepository.loadReactivateServiceMyServices(searchKey) ;   
  }
  
   Future<ReactivateServiceMyServicesModel?> saveOrUpdateReactivateServiceMyServices(ReactivateServiceMyServicesModel my_services, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateReactivateServiceMyServices(my_services, searchKey);   
    return await _dbRepository. loadReactivateServiceMyServices(searchKey) ;  
  }	
  
    Future<void> deleteAllReactivateServiceMyServices(String spKey) async{
      return await _dbRepository.deleteAllReactivateServiceMyServices(spKey); 
   }
  
  
  Future<MySalesIndexModel> getMySalesIndex(String url, int page)async{
  MySalesIndexModel my_sales ;

  my_sales = await _apiProvider.getIndexMySales(url, page)
                  .then((responseMySalesList) {
		                    return  responseMySalesList;
                  });

 
  return my_sales;
}


  Future<bool> isOldMySalesList()async{
    int ageDB = await _dbRepository.listMySalesAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMySalesListDB() async {
    var my_sales;
    my_sales = await _dbRepository.loadMySalesList('');
    if ((my_sales != null) || (my_sales != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MySalesListingModel?> getMySalesList(String url, int page)async{
  MySalesListingModel? my_sales ;

   if(page == 1){
			//await _dbRepository.deleteAllMySalesList();
            my_sales = await _apiProvider.getListMySales(url, page)
                  .then((responseMySalesList) {
                    _loadAndSaveMySalesList1(responseMySalesList, '', page);
					return responseMySalesList;
                  });
   }else{
      my_sales = await _apiProvider.getListMySales(url, page)
                  .then((responseMySalesList) {
				  try{
				      return  _loadAndSaveMySalesList(responseMySalesList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_sales;
	}



Future<MySalesListingModel?> getMySalesListSearch(String url, int page)async{
  MySalesListingModel? my_sales ;   
  my_sales = await _apiProvider.getListMySales(url, page)
		  .then((responseMySalesList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMySalesListSearch(responseMySalesList, '', responseMySalesList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMySalesListSearch(responseMySalesList, '', page);
      }
		  
		  
			
		  }); 
  return my_sales;
}


Future<MySalesListingModel> _loadAndSaveMySalesListSearch(MySalesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.testimony;
    }
    return list;
 }

Future<MySalesListingModel?> _loadAndSaveMySalesList(MySalesListingModel list, String searchKey, int page) async{
    MySalesListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMySalesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMySalesModel my_sales;
      my_sales = list.items.items[i];
      my_sales.item!.cnt = i ;
      my_sales.item!.age = age;
      my_sales.item!.page = page;
	  my_sales.item!.ttl = '';
	  my_sales.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_sales.item!.sbttl = '';
	  
	  my_sales.item!.id = my_sales.item!.order_item_id; 
	  
	  my_sales.item!.sbttl = my_sales.item!.testimony;
      await _dbRepository.saveOrUpdateMySalesList(my_sales);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMySalesList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMySalesList1(MySalesListingModel list, String searchKey, int page) async{
    MySalesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMySalesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMySalesModel my_sales;
      my_sales = list.items.items[i];
      my_sales.item!.cnt = i ;
      my_sales.item!.age = age;
      my_sales.item!.page = page;
	  my_sales.item!.ttl = '';
	  my_sales.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_sales.item!.sbttl = '';
	  
	  my_sales.item!.id = my_sales.item!.order_item_id; 
	  
	  my_sales.item!.sbttl = my_sales.item!.testimony;
      await _dbRepository.saveOrUpdateMySalesList(my_sales);
    }

  }


  Future<MySalesListingModel> loadMySalesList( String searchKey) async{
    MySalesListingModel appList = await _dbRepository.loadMySalesListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMySalesList(searchKey)) ;
    return appList;
  }

  Future getMySalesEdit(String url, String id, String title)async{
    var editMySales;
    editMySales = await _apiProvider.getDataMySales(url, id, title);
    return editMySales;
  }

  Future getMySalesView(String url, String id, String title)async{
    var  viewMySales;
    viewMySales = await _apiProvider.getViewDataMySales(url, id, title);
    return viewMySales;
  }

  Future sendMySalesPost(String url, var formdata)async{
    var postMySales;
    postMySales = await _apiProvider.sendDataMySales(url, formdata);
    return postMySales;
  }
  
   Future sendMySalesPostWithID(String url, var formdata, String id, String title)async{
    var postMySales;
    postMySales = await _apiProvider.sendDataWithIDMySales(url, formdata, id, title);
    return postMySales;
  }
  
  
  Future<MyOrdersIndexModel> getMyOrdersIndex(String url, int page)async{
  MyOrdersIndexModel my_orders ;

  my_orders = await _apiProvider.getIndexMyOrders(url, page)
                  .then((responseMyOrdersList) {
		                    return  responseMyOrdersList;
                  });

 
  return my_orders;
}


  Future<bool> isOldMyOrdersList()async{
    int ageDB = await _dbRepository.listMyOrdersAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyOrdersListDB() async {
    var my_orders;
    my_orders = await _dbRepository.loadMyOrdersList('');
    if ((my_orders != null) || (my_orders != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyOrdersListingModel?> getMyOrdersList(String url, int page)async{
  MyOrdersListingModel? my_orders ;

   if(page == 1){
			//await _dbRepository.deleteAllMyOrdersList();
            my_orders = await _apiProvider.getListMyOrders(url, page)
                  .then((responseMyOrdersList) {
                    _loadAndSaveMyOrdersList1(responseMyOrdersList, '', page);
					return responseMyOrdersList;
                  });
   }else{
      my_orders = await _apiProvider.getListMyOrders(url, page)
                  .then((responseMyOrdersList) {
				  try{
				      return  _loadAndSaveMyOrdersList(responseMyOrdersList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_orders;
	}



Future<MyOrdersListingModel?> getMyOrdersListSearch(String url, int page)async{
  MyOrdersListingModel? my_orders ;   
  my_orders = await _apiProvider.getListMyOrders(url, page)
		  .then((responseMyOrdersList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyOrdersListSearch(responseMyOrdersList, '', responseMyOrdersList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyOrdersListSearch(responseMyOrdersList, '', page);
      }
		  
		  
			
		  }); 
  return my_orders;
}


Future<MyOrdersListingModel> _loadAndSaveMyOrdersListSearch(MyOrdersListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.notes;
    }
    return list;
 }

Future<MyOrdersListingModel?> _loadAndSaveMyOrdersList(MyOrdersListingModel list, String searchKey, int page) async{
    MyOrdersListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyOrdersListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyOrdersModel my_orders;
      my_orders = list.items.items[i];
      my_orders.item!.cnt = i ;
      my_orders.item!.age = age;
      my_orders.item!.page = page;
	  my_orders.item!.ttl = '';
	  my_orders.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_orders.item!.sbttl = '';
	  
	  my_orders.item!.id = my_orders.item!.order_id; 
	  
	  my_orders.item!.sbttl = my_orders.item!.notes;
      await _dbRepository.saveOrUpdateMyOrdersList(my_orders);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyOrdersList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyOrdersList1(MyOrdersListingModel list, String searchKey, int page) async{
    MyOrdersListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyOrdersListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyOrdersModel my_orders;
      my_orders = list.items.items[i];
      my_orders.item!.cnt = i ;
      my_orders.item!.age = age;
      my_orders.item!.page = page;
	  my_orders.item!.ttl = '';
	  my_orders.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_orders.item!.sbttl = '';
	  
	  my_orders.item!.id = my_orders.item!.order_id; 
	  
	  my_orders.item!.sbttl = my_orders.item!.notes;
      await _dbRepository.saveOrUpdateMyOrdersList(my_orders);
    }

  }


  Future<MyOrdersListingModel> loadMyOrdersList( String searchKey) async{
    MyOrdersListingModel appList = await _dbRepository.loadMyOrdersListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyOrdersList(searchKey)) ;
    return appList;
  }

  Future getMyOrdersEdit(String url, String id, String title)async{
    var editMyOrders;
    editMyOrders = await _apiProvider.getDataMyOrders(url, id, title);
    return editMyOrders;
  }

  Future getMyOrdersView(String url, String id, String title)async{
    var  viewMyOrders;
    viewMyOrders = await _apiProvider.getViewDataMyOrders(url, id, title);
    return viewMyOrders;
  }

  Future sendMyOrdersPost(String url, var formdata)async{
    var postMyOrders;
    postMyOrders = await _apiProvider.sendDataMyOrders(url, formdata);
    return postMyOrders;
  }
  
   Future sendMyOrdersPostWithID(String url, var formdata, String id, String title)async{
    var postMyOrders;
    postMyOrders = await _apiProvider.sendDataWithIDMyOrders(url, formdata, id, title);
    return postMyOrders;
  }
  
    Future getConfirmPaymentMyOrdersEdit(String url, String id, String title)async{
    var editConfirmPayment;
    editConfirmPayment = await _apiProvider.getDataConfirmPaymentMyOrders(url, id, title);
    return editConfirmPayment;
  }

  Future getConfirmPaymentMyOrdersView(String url, String id, String title)async{
    var  viewConfirmPayment;
    viewConfirmPayment = await _apiProvider.getDataConfirmPaymentMyOrders(url, id, title);
    return viewConfirmPayment;
  }

  Future sendConfirmPaymentMyOrdersPost(String url, var formdata)async{
    var postConfirmPayment;
    postConfirmPayment = await _apiProvider.sendDataConfirmPaymentMyOrders(url, formdata);
    return postConfirmPayment;
  }
  
   Future sendConfirmPaymentMyOrdersPostWithID(String url, var formdata, String id, String title)async{
    var postConfirmPayment;
    postConfirmPayment = await _apiProvider.sendDataWithIDConfirmPaymentMyOrders(url, formdata, id, title);
    return postConfirmPayment;
  }
  
    Future<ConfirmPaymentMyOrdersModel> getConfirmPaymentMyOrders(String url, String id, String title, String spKey)async{
  ConfirmPaymentMyOrdersModel my_orders ;
   ConfirmPaymentMyOrdersModel my_orders1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ConfirmPayment')){
			 my_orders1 = await _apiProvider.getDataConfirmPaymentMyOrders(url, id, title)
					  .then((responseConfirmPaymentMyOrders) {
					   
						return responseConfirmPaymentMyOrders;
					  });
			spKey = my_orders1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ConfirmPayment')){
			 my_orders1 = await _apiProvider.getDataConfirmPaymentMyOrders(url, id, title)
					  .then((responseConfirmPaymentMyOrders) {
					   
						return responseConfirmPaymentMyOrders;
					  });
			spKey = my_orders1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ConfirmPayment')){
			 my_orders1 = await _apiProvider.getDataConfirmPaymentMyOrders(url, id, title)
					  .then((responseConfirmPaymentMyOrders) {
					   
						return responseConfirmPaymentMyOrders;
					  });
			spKey = my_orders1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ConfirmPayment')){
			 my_orders1 = await _apiProvider.getDataConfirmPaymentMyOrders(url, id, title)
					  .then((responseConfirmPaymentMyOrders) {
					   
						return responseConfirmPaymentMyOrders;
					  });
			spKey = my_orders1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadConfirmPaymentMyOrders(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_orders = await _apiProvider.getDataConfirmPaymentMyOrders(url, id, title)
                  .then((responseConfirmPaymentMyOrders) {
                    saveOrUpdateConfirmPaymentMyOrders(responseConfirmPaymentMyOrders, spKey, 1 );
					return responseConfirmPaymentMyOrders;
                  });
			  return my_orders;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ConfirmPaymentMyOrdersModel?> loadConfirmPaymentMyOrders( String searchKey) async{
   return await _dbRepository.loadConfirmPaymentMyOrders(searchKey) ;   
  }
  
   Future<ConfirmPaymentMyOrdersModel?> saveOrUpdateConfirmPaymentMyOrders(ConfirmPaymentMyOrdersModel my_orders, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateConfirmPaymentMyOrders(my_orders, searchKey);   
    return await _dbRepository. loadConfirmPaymentMyOrders(searchKey) ;  
  }	
  
    Future<void> deleteAllConfirmPaymentMyOrders(String spKey) async{
      return await _dbRepository.deleteAllConfirmPaymentMyOrders(spKey); 
   }
  
  
  Future<MyPurchasesIndexModel> getMyPurchasesIndex(String url, int page)async{
  MyPurchasesIndexModel my_purchases ;

  my_purchases = await _apiProvider.getIndexMyPurchases(url, page)
                  .then((responseMyPurchasesList) {
		                    return  responseMyPurchasesList;
                  });

 
  return my_purchases;
}


  Future<bool> isOldMyPurchasesList()async{
    int ageDB = await _dbRepository.listMyPurchasesAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyPurchasesListDB() async {
    var my_purchases;
    my_purchases = await _dbRepository.loadMyPurchasesList('');
    if ((my_purchases != null) || (my_purchases != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyPurchasesListingModel?> getMyPurchasesList(String url, int page)async{
  MyPurchasesListingModel? my_purchases ;

   if(page == 1){
			//await _dbRepository.deleteAllMyPurchasesList();
            my_purchases = await _apiProvider.getListMyPurchases(url, page)
                  .then((responseMyPurchasesList) {
                    _loadAndSaveMyPurchasesList1(responseMyPurchasesList, '', page);
					return responseMyPurchasesList;
                  });
   }else{
      my_purchases = await _apiProvider.getListMyPurchases(url, page)
                  .then((responseMyPurchasesList) {
				  try{
				      return  _loadAndSaveMyPurchasesList(responseMyPurchasesList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_purchases;
	}



Future<MyPurchasesListingModel?> getMyPurchasesListSearch(String url, int page)async{
  MyPurchasesListingModel? my_purchases ;   
  my_purchases = await _apiProvider.getListMyPurchases(url, page)
		  .then((responseMyPurchasesList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyPurchasesListSearch(responseMyPurchasesList, '', responseMyPurchasesList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyPurchasesListSearch(responseMyPurchasesList, '', page);
      }
		  
		  
			
		  }); 
  return my_purchases;
}


Future<MyPurchasesListingModel> _loadAndSaveMyPurchasesListSearch(MyPurchasesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.testimony;
    }
    return list;
 }

Future<MyPurchasesListingModel?> _loadAndSaveMyPurchasesList(MyPurchasesListingModel list, String searchKey, int page) async{
    MyPurchasesListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyPurchasesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyPurchasesModel my_purchases;
      my_purchases = list.items.items[i];
      my_purchases.item!.cnt = i ;
      my_purchases.item!.age = age;
      my_purchases.item!.page = page;
	  my_purchases.item!.ttl = '';
	  my_purchases.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_purchases.item!.sbttl = '';
	  
	  my_purchases.item!.id = my_purchases.item!.order_item_id; 
	  
	  my_purchases.item!.sbttl = my_purchases.item!.testimony;
      await _dbRepository.saveOrUpdateMyPurchasesList(my_purchases);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyPurchasesList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyPurchasesList1(MyPurchasesListingModel list, String searchKey, int page) async{
    MyPurchasesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyPurchasesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyPurchasesModel my_purchases;
      my_purchases = list.items.items[i];
      my_purchases.item!.cnt = i ;
      my_purchases.item!.age = age;
      my_purchases.item!.page = page;
	  my_purchases.item!.ttl = '';
	  my_purchases.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_purchases.item!.sbttl = '';
	  
	  my_purchases.item!.id = my_purchases.item!.order_item_id; 
	  
	  my_purchases.item!.sbttl = my_purchases.item!.testimony;
      await _dbRepository.saveOrUpdateMyPurchasesList(my_purchases);
    }

  }


  Future<MyPurchasesListingModel> loadMyPurchasesList( String searchKey) async{
    MyPurchasesListingModel appList = await _dbRepository.loadMyPurchasesListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyPurchasesList(searchKey)) ;
    return appList;
  }

  Future getMyPurchasesEdit(String url, String id, String title)async{
    var editMyPurchases;
    editMyPurchases = await _apiProvider.getDataMyPurchases(url, id, title);
    return editMyPurchases;
  }

  Future getMyPurchasesView(String url, String id, String title)async{
    var  viewMyPurchases;
    viewMyPurchases = await _apiProvider.getViewDataMyPurchases(url, id, title);
    return viewMyPurchases;
  }

  Future sendMyPurchasesPost(String url, var formdata)async{
    var postMyPurchases;
    postMyPurchases = await _apiProvider.sendDataMyPurchases(url, formdata);
    return postMyPurchases;
  }
  
   Future sendMyPurchasesPostWithID(String url, var formdata, String id, String title)async{
    var postMyPurchases;
    postMyPurchases = await _apiProvider.sendDataWithIDMyPurchases(url, formdata, id, title);
    return postMyPurchases;
  }
  
    Future getDownloadMyPurchasesEdit(String url, String id, String title)async{
    var editDownload;
    editDownload = await _apiProvider.getDataDownloadMyPurchases(url, id, title);
    return editDownload;
  }

  Future getDownloadMyPurchasesView(String url, String id, String title)async{
    var  viewDownload;
    viewDownload = await _apiProvider.getDataDownloadMyPurchases(url, id, title);
    return viewDownload;
  }

  Future sendDownloadMyPurchasesPost(String url, var formdata)async{
    var postDownload;
    postDownload = await _apiProvider.sendDataDownloadMyPurchases(url, formdata);
    return postDownload;
  }
  
   Future sendDownloadMyPurchasesPostWithID(String url, var formdata, String id, String title)async{
    var postDownload;
    postDownload = await _apiProvider.sendDataWithIDDownloadMyPurchases(url, formdata, id, title);
    return postDownload;
  }
  
    Future<DownloadMyPurchasesModel> getDownloadMyPurchases(String url, String id, String title, String spKey)async{
  DownloadMyPurchasesModel my_purchases ;
   DownloadMyPurchasesModel my_purchases1 ;
          var data ;
			  if(['PlaceNewBid'].contains('Download')){
			 my_purchases1 = await _apiProvider.getDataDownloadMyPurchases(url, id, title)
					  .then((responseDownloadMyPurchases) {
					   
						return responseDownloadMyPurchases;
					  });
			spKey = my_purchases1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('Download')){
			 my_purchases1 = await _apiProvider.getDataDownloadMyPurchases(url, id, title)
					  .then((responseDownloadMyPurchases) {
					   
						return responseDownloadMyPurchases;
					  });
			spKey = my_purchases1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('Download')){
			 my_purchases1 = await _apiProvider.getDataDownloadMyPurchases(url, id, title)
					  .then((responseDownloadMyPurchases) {
					   
						return responseDownloadMyPurchases;
					  });
			spKey = my_purchases1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('Download')){
			 my_purchases1 = await _apiProvider.getDataDownloadMyPurchases(url, id, title)
					  .then((responseDownloadMyPurchases) {
					   
						return responseDownloadMyPurchases;
					  });
			spKey = my_purchases1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadDownloadMyPurchases(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_purchases = await _apiProvider.getDataDownloadMyPurchases(url, id, title)
                  .then((responseDownloadMyPurchases) {
                    saveOrUpdateDownloadMyPurchases(responseDownloadMyPurchases, spKey, 1 );
					return responseDownloadMyPurchases;
                  });
			  return my_purchases;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<DownloadMyPurchasesModel?> loadDownloadMyPurchases( String searchKey) async{
   return await _dbRepository.loadDownloadMyPurchases(searchKey) ;   
  }
  
   Future<DownloadMyPurchasesModel?> saveOrUpdateDownloadMyPurchases(DownloadMyPurchasesModel my_purchases, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateDownloadMyPurchases(my_purchases, searchKey);   
    return await _dbRepository. loadDownloadMyPurchases(searchKey) ;  
  }	
  
    Future<void> deleteAllDownloadMyPurchases(String spKey) async{
      return await _dbRepository.deleteAllDownloadMyPurchases(spKey); 
   }
  
    Future getRateProductMyPurchasesEdit(String url, String id, String title)async{
    var editRateProduct;
    editRateProduct = await _apiProvider.getDataRateProductMyPurchases(url, id, title);
    return editRateProduct;
  }

  Future getRateProductMyPurchasesView(String url, String id, String title)async{
    var  viewRateProduct;
    viewRateProduct = await _apiProvider.getDataRateProductMyPurchases(url, id, title);
    return viewRateProduct;
  }

  Future sendRateProductMyPurchasesPost(String url, var formdata)async{
    var postRateProduct;
    postRateProduct = await _apiProvider.sendDataRateProductMyPurchases(url, formdata);
    return postRateProduct;
  }
  
   Future sendRateProductMyPurchasesPostWithID(String url, var formdata, String id, String title)async{
    var postRateProduct;
    postRateProduct = await _apiProvider.sendDataWithIDRateProductMyPurchases(url, formdata, id, title);
    return postRateProduct;
  }
  
    Future<RateProductMyPurchasesModel> getRateProductMyPurchases(String url, String id, String title, String spKey)async{
  RateProductMyPurchasesModel my_purchases ;
   RateProductMyPurchasesModel my_purchases1 ;
          var data ;
			  if(['PlaceNewBid'].contains('RateProduct')){
			 my_purchases1 = await _apiProvider.getDataRateProductMyPurchases(url, id, title)
					  .then((responseRateProductMyPurchases) {
					   
						return responseRateProductMyPurchases;
					  });
			spKey = my_purchases1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('RateProduct')){
			 my_purchases1 = await _apiProvider.getDataRateProductMyPurchases(url, id, title)
					  .then((responseRateProductMyPurchases) {
					   
						return responseRateProductMyPurchases;
					  });
			spKey = my_purchases1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('RateProduct')){
			 my_purchases1 = await _apiProvider.getDataRateProductMyPurchases(url, id, title)
					  .then((responseRateProductMyPurchases) {
					   
						return responseRateProductMyPurchases;
					  });
			spKey = my_purchases1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('RateProduct')){
			 my_purchases1 = await _apiProvider.getDataRateProductMyPurchases(url, id, title)
					  .then((responseRateProductMyPurchases) {
					   
						return responseRateProductMyPurchases;
					  });
			spKey = my_purchases1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadRateProductMyPurchases(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_purchases = await _apiProvider.getDataRateProductMyPurchases(url, id, title)
                  .then((responseRateProductMyPurchases) {
                    saveOrUpdateRateProductMyPurchases(responseRateProductMyPurchases, spKey, 1 );
					return responseRateProductMyPurchases;
                  });
			  return my_purchases;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<RateProductMyPurchasesModel?> loadRateProductMyPurchases( String searchKey) async{
   return await _dbRepository.loadRateProductMyPurchases(searchKey) ;   
  }
  
   Future<RateProductMyPurchasesModel?> saveOrUpdateRateProductMyPurchases(RateProductMyPurchasesModel my_purchases, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateRateProductMyPurchases(my_purchases, searchKey);   
    return await _dbRepository. loadRateProductMyPurchases(searchKey) ;  
  }	
  
    Future<void> deleteAllRateProductMyPurchases(String spKey) async{
      return await _dbRepository.deleteAllRateProductMyPurchases(spKey); 
   }
  
  


  Future<bool> isOldMyReferalsList()async{
    int ageDB = await _dbRepository.listMyReferalsAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyReferalsListDB() async {
    var my_referals;
    my_referals = await _dbRepository.loadMyReferalsList('');
    if ((my_referals != null) || (my_referals != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyReferalsListingModel?> getMyReferalsList(String url, int page)async{
  MyReferalsListingModel? my_referals ;

   if(page == 1){
			//await _dbRepository.deleteAllMyReferalsList();
            my_referals = await _apiProvider.getListMyReferals(url, page)
                  .then((responseMyReferalsList) {
                    _loadAndSaveMyReferalsList1(responseMyReferalsList, '', page);
					return responseMyReferalsList;
                  });
   }else{
      my_referals = await _apiProvider.getListMyReferals(url, page)
                  .then((responseMyReferalsList) {
				  try{
				      return  _loadAndSaveMyReferalsList(responseMyReferalsList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_referals;
	}



Future<MyReferalsListingModel?> getMyReferalsListSearch(String url, int page)async{
  MyReferalsListingModel? my_referals ;   
  my_referals = await _apiProvider.getListMyReferals(url, page)
		  .then((responseMyReferalsList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyReferalsListSearch(responseMyReferalsList, '', responseMyReferalsList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyReferalsListSearch(responseMyReferalsList, '', page);
      }
		  
		  
			
		  }); 
  return my_referals;
}


Future<MyReferalsListingModel> _loadAndSaveMyReferalsListSearch(MyReferalsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_ktp_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_siup_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_notes;
    }
    return list;
 }

Future<MyReferalsListingModel?> _loadAndSaveMyReferalsList(MyReferalsListingModel list, String searchKey, int page) async{
    MyReferalsListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyReferalsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyReferalsModel my_referals;
      my_referals = list.items.items[i];
      my_referals.item!.cnt = i ;
      my_referals.item!.age = age;
      my_referals.item!.page = page;
	  my_referals.item!.ttl = '';
	  my_referals.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_referals.item!.sbttl = '';
	  
	  my_referals.item!.id = my_referals.item!.user_id; 
	  
	  my_referals.item!.ttl = my_referals.item!.user_name;
	  my_referals.item!.pht = my_referals.item!.scan_ktp_url;
	  my_referals.item!.pht = my_referals.item!.scan_siup_url;
	  my_referals.item!.pht = my_referals.item!.photo_url;
	  my_referals.item!.sbttl = my_referals.item!.self_introduction;
	  my_referals.item!.sbttl = my_referals.item!.admin_notes;
      await _dbRepository.saveOrUpdateMyReferalsList(my_referals);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyReferalsList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyReferalsList1(MyReferalsListingModel list, String searchKey, int page) async{
    MyReferalsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyReferalsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyReferalsModel my_referals;
      my_referals = list.items.items[i];
      my_referals.item!.cnt = i ;
      my_referals.item!.age = age;
      my_referals.item!.page = page;
	  my_referals.item!.ttl = '';
	  my_referals.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_referals.item!.sbttl = '';
	  
	  my_referals.item!.id = my_referals.item!.user_id; 
	  
	  my_referals.item!.ttl = my_referals.item!.user_name;
	  my_referals.item!.pht = my_referals.item!.scan_ktp_url;
	  my_referals.item!.pht = my_referals.item!.scan_siup_url;
	  my_referals.item!.pht = my_referals.item!.photo_url;
	  my_referals.item!.sbttl = my_referals.item!.self_introduction;
	  my_referals.item!.sbttl = my_referals.item!.admin_notes;
      await _dbRepository.saveOrUpdateMyReferalsList(my_referals);
    }

  }


  Future<MyReferalsListingModel> loadMyReferalsList( String searchKey) async{
    MyReferalsListingModel appList = await _dbRepository.loadMyReferalsListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyReferalsList(searchKey)) ;
    return appList;
  }

  Future getMyReferalsEdit(String url, String id, String title)async{
    var editMyReferals;
    editMyReferals = await _apiProvider.getDataMyReferals(url, id, title);
    return editMyReferals;
  }

  Future getMyReferalsView(String url, String id, String title)async{
    var  viewMyReferals;
    viewMyReferals = await _apiProvider.getViewDataMyReferals(url, id, title);
    return viewMyReferals;
  }

  Future sendMyReferalsPost(String url, var formdata)async{
    var postMyReferals;
    postMyReferals = await _apiProvider.sendDataMyReferals(url, formdata);
    return postMyReferals;
  }
  
   Future sendMyReferalsPostWithID(String url, var formdata, String id, String title)async{
    var postMyReferals;
    postMyReferals = await _apiProvider.sendDataWithIDMyReferals(url, formdata, id, title);
    return postMyReferals;
  }
  
  


  Future<bool> isOldMyFinanceList()async{
    int ageDB = await _dbRepository.listMyFinanceAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyFinanceListDB() async {
    var my_finance;
    my_finance = await _dbRepository.loadMyFinanceList('');
    if ((my_finance != null) || (my_finance != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyFinanceListingModel?> getMyFinanceList(String url, int page)async{
  MyFinanceListingModel? my_finance ;

   if(page == 1){
			//await _dbRepository.deleteAllMyFinanceList();
            my_finance = await _apiProvider.getListMyFinance(url, page)
                  .then((responseMyFinanceList) {
                    _loadAndSaveMyFinanceList1(responseMyFinanceList, '', page);
					return responseMyFinanceList;
                  });
   }else{
      my_finance = await _apiProvider.getListMyFinance(url, page)
                  .then((responseMyFinanceList) {
				  try{
				      return  _loadAndSaveMyFinanceList(responseMyFinanceList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_finance;
	}



Future<MyFinanceListingModel?> getMyFinanceListSearch(String url, int page)async{
  MyFinanceListingModel? my_finance ;   
  my_finance = await _apiProvider.getListMyFinance(url, page)
		  .then((responseMyFinanceList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyFinanceListSearch(responseMyFinanceList, '', responseMyFinanceList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyFinanceListSearch(responseMyFinanceList, '', page);
      }
		  
		  
			
		  }); 
  return my_finance;
}


Future<MyFinanceListingModel> _loadAndSaveMyFinanceListSearch(MyFinanceListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_ktp_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_siup_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_notes;
    }
    return list;
 }

Future<MyFinanceListingModel?> _loadAndSaveMyFinanceList(MyFinanceListingModel list, String searchKey, int page) async{
    MyFinanceListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyFinanceListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyFinanceModel my_finance;
      my_finance = list.items.items[i];
      my_finance.item!.cnt = i ;
      my_finance.item!.age = age;
      my_finance.item!.page = page;
	  my_finance.item!.ttl = '';
	  my_finance.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_finance.item!.sbttl = '';
	  
	  my_finance.item!.id = my_finance.item!.user_id; 
	  
	  my_finance.item!.ttl = my_finance.item!.user_name;
	  my_finance.item!.pht = my_finance.item!.scan_ktp_url;
	  my_finance.item!.pht = my_finance.item!.scan_siup_url;
	  my_finance.item!.pht = my_finance.item!.photo_url;
	  my_finance.item!.sbttl = my_finance.item!.self_introduction;
	  my_finance.item!.sbttl = my_finance.item!.admin_notes;
      await _dbRepository.saveOrUpdateMyFinanceList(my_finance);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyFinanceList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyFinanceList1(MyFinanceListingModel list, String searchKey, int page) async{
    MyFinanceListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyFinanceListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyFinanceModel my_finance;
      my_finance = list.items.items[i];
      my_finance.item!.cnt = i ;
      my_finance.item!.age = age;
      my_finance.item!.page = page;
	  my_finance.item!.ttl = '';
	  my_finance.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_finance.item!.sbttl = '';
	  
	  my_finance.item!.id = my_finance.item!.user_id; 
	  
	  my_finance.item!.ttl = my_finance.item!.user_name;
	  my_finance.item!.pht = my_finance.item!.scan_ktp_url;
	  my_finance.item!.pht = my_finance.item!.scan_siup_url;
	  my_finance.item!.pht = my_finance.item!.photo_url;
	  my_finance.item!.sbttl = my_finance.item!.self_introduction;
	  my_finance.item!.sbttl = my_finance.item!.admin_notes;
      await _dbRepository.saveOrUpdateMyFinanceList(my_finance);
    }

  }


  Future<MyFinanceListingModel> loadMyFinanceList( String searchKey) async{
    MyFinanceListingModel appList = await _dbRepository.loadMyFinanceListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyFinanceList(searchKey)) ;
    return appList;
  }

  Future getMyFinanceEdit(String url, String id, String title)async{
    var editMyFinance;
    editMyFinance = await _apiProvider.getDataMyFinance(url, id, title);
    return editMyFinance;
  }

  Future getMyFinanceView(String url, String id, String title)async{
    var  viewMyFinance;
    viewMyFinance = await _apiProvider.getViewDataMyFinance(url, id, title);
    return viewMyFinance;
  }

  Future sendMyFinancePost(String url, var formdata)async{
    var postMyFinance;
    postMyFinance = await _apiProvider.sendDataMyFinance(url, formdata);
    return postMyFinance;
  }
  
   Future sendMyFinancePostWithID(String url, var formdata, String id, String title)async{
    var postMyFinance;
    postMyFinance = await _apiProvider.sendDataWithIDMyFinance(url, formdata, id, title);
    return postMyFinance;
  }
  
    Future getChangePaymentSettingsMyFinanceEdit(String url, String id, String title)async{
    var editChangePaymentSettings;
    editChangePaymentSettings = await _apiProvider.getDataChangePaymentSettingsMyFinance(url, id, title);
    return editChangePaymentSettings;
  }

  Future getChangePaymentSettingsMyFinanceView(String url, String id, String title)async{
    var  viewChangePaymentSettings;
    viewChangePaymentSettings = await _apiProvider.getDataChangePaymentSettingsMyFinance(url, id, title);
    return viewChangePaymentSettings;
  }

  Future sendChangePaymentSettingsMyFinancePost(String url, var formdata)async{
    var postChangePaymentSettings;
    postChangePaymentSettings = await _apiProvider.sendDataChangePaymentSettingsMyFinance(url, formdata);
    return postChangePaymentSettings;
  }
  
   Future sendChangePaymentSettingsMyFinancePostWithID(String url, var formdata, String id, String title)async{
    var postChangePaymentSettings;
    postChangePaymentSettings = await _apiProvider.sendDataWithIDChangePaymentSettingsMyFinance(url, formdata, id, title);
    return postChangePaymentSettings;
  }
  
    Future<ChangePaymentSettingsMyFinanceModel> getChangePaymentSettingsMyFinance(String url, String id, String title, String spKey)async{
  ChangePaymentSettingsMyFinanceModel my_finance ;
   ChangePaymentSettingsMyFinanceModel my_finance1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ChangePaymentSettings')){
			 my_finance1 = await _apiProvider.getDataChangePaymentSettingsMyFinance(url, id, title)
					  .then((responseChangePaymentSettingsMyFinance) {
					   
						return responseChangePaymentSettingsMyFinance;
					  });
			spKey = my_finance1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ChangePaymentSettings')){
			 my_finance1 = await _apiProvider.getDataChangePaymentSettingsMyFinance(url, id, title)
					  .then((responseChangePaymentSettingsMyFinance) {
					   
						return responseChangePaymentSettingsMyFinance;
					  });
			spKey = my_finance1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ChangePaymentSettings')){
			 my_finance1 = await _apiProvider.getDataChangePaymentSettingsMyFinance(url, id, title)
					  .then((responseChangePaymentSettingsMyFinance) {
					   
						return responseChangePaymentSettingsMyFinance;
					  });
			spKey = my_finance1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ChangePaymentSettings')){
			 my_finance1 = await _apiProvider.getDataChangePaymentSettingsMyFinance(url, id, title)
					  .then((responseChangePaymentSettingsMyFinance) {
					   
						return responseChangePaymentSettingsMyFinance;
					  });
			spKey = my_finance1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadChangePaymentSettingsMyFinance(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_finance = await _apiProvider.getDataChangePaymentSettingsMyFinance(url, id, title)
                  .then((responseChangePaymentSettingsMyFinance) {
                    saveOrUpdateChangePaymentSettingsMyFinance(responseChangePaymentSettingsMyFinance, spKey, 1 );
					return responseChangePaymentSettingsMyFinance;
                  });
			  return my_finance;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ChangePaymentSettingsMyFinanceModel?> loadChangePaymentSettingsMyFinance( String searchKey) async{
   return await _dbRepository.loadChangePaymentSettingsMyFinance(searchKey) ;   
  }
  
   Future<ChangePaymentSettingsMyFinanceModel?> saveOrUpdateChangePaymentSettingsMyFinance(ChangePaymentSettingsMyFinanceModel my_finance, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateChangePaymentSettingsMyFinance(my_finance, searchKey);   
    return await _dbRepository. loadChangePaymentSettingsMyFinance(searchKey) ;  
  }	
  
    Future<void> deleteAllChangePaymentSettingsMyFinance(String spKey) async{
      return await _dbRepository.deleteAllChangePaymentSettingsMyFinance(spKey); 
   }
  
    Future getWithdrawPaymentMyFinanceEdit(String url, String id, String title)async{
    var editWithdrawPayment;
    editWithdrawPayment = await _apiProvider.getDataWithdrawPaymentMyFinance(url, id, title);
    return editWithdrawPayment;
  }

  Future getWithdrawPaymentMyFinanceView(String url, String id, String title)async{
    var  viewWithdrawPayment;
    viewWithdrawPayment = await _apiProvider.getDataWithdrawPaymentMyFinance(url, id, title);
    return viewWithdrawPayment;
  }

  Future sendWithdrawPaymentMyFinancePost(String url, var formdata)async{
    var postWithdrawPayment;
    postWithdrawPayment = await _apiProvider.sendDataWithdrawPaymentMyFinance(url, formdata);
    return postWithdrawPayment;
  }
  
   Future sendWithdrawPaymentMyFinancePostWithID(String url, var formdata, String id, String title)async{
    var postWithdrawPayment;
    postWithdrawPayment = await _apiProvider.sendDataWithIDWithdrawPaymentMyFinance(url, formdata, id, title);
    return postWithdrawPayment;
  }
  
    Future<WithdrawPaymentMyFinanceModel> getWithdrawPaymentMyFinance(String url, String id, String title, String spKey)async{
  WithdrawPaymentMyFinanceModel my_finance ;
   WithdrawPaymentMyFinanceModel my_finance1 ;
          var data ;
			  if(['PlaceNewBid'].contains('WithdrawPayment')){
			 my_finance1 = await _apiProvider.getDataWithdrawPaymentMyFinance(url, id, title)
					  .then((responseWithdrawPaymentMyFinance) {
					   
						return responseWithdrawPaymentMyFinance;
					  });
			spKey = my_finance1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('WithdrawPayment')){
			 my_finance1 = await _apiProvider.getDataWithdrawPaymentMyFinance(url, id, title)
					  .then((responseWithdrawPaymentMyFinance) {
					   
						return responseWithdrawPaymentMyFinance;
					  });
			spKey = my_finance1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('WithdrawPayment')){
			 my_finance1 = await _apiProvider.getDataWithdrawPaymentMyFinance(url, id, title)
					  .then((responseWithdrawPaymentMyFinance) {
					   
						return responseWithdrawPaymentMyFinance;
					  });
			spKey = my_finance1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('WithdrawPayment')){
			 my_finance1 = await _apiProvider.getDataWithdrawPaymentMyFinance(url, id, title)
					  .then((responseWithdrawPaymentMyFinance) {
					   
						return responseWithdrawPaymentMyFinance;
					  });
			spKey = my_finance1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadWithdrawPaymentMyFinance(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_finance = await _apiProvider.getDataWithdrawPaymentMyFinance(url, id, title)
                  .then((responseWithdrawPaymentMyFinance) {
                    saveOrUpdateWithdrawPaymentMyFinance(responseWithdrawPaymentMyFinance, spKey, 1 );
					return responseWithdrawPaymentMyFinance;
                  });
			  return my_finance;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<WithdrawPaymentMyFinanceModel?> loadWithdrawPaymentMyFinance( String searchKey) async{
   return await _dbRepository.loadWithdrawPaymentMyFinance(searchKey) ;   
  }
  
   Future<WithdrawPaymentMyFinanceModel?> saveOrUpdateWithdrawPaymentMyFinance(WithdrawPaymentMyFinanceModel my_finance, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateWithdrawPaymentMyFinance(my_finance, searchKey);   
    return await _dbRepository. loadWithdrawPaymentMyFinance(searchKey) ;  
  }	
  
    Future<void> deleteAllWithdrawPaymentMyFinance(String spKey) async{
      return await _dbRepository.deleteAllWithdrawPaymentMyFinance(spKey); 
   }
  
    Future getDepositBalanceMyFinanceEdit(String url, String id, String title)async{
    var editDepositBalance;
    editDepositBalance = await _apiProvider.getDataDepositBalanceMyFinance(url, id, title);
    return editDepositBalance;
  }

  Future getDepositBalanceMyFinanceView(String url, String id, String title)async{
    var  viewDepositBalance;
    viewDepositBalance = await _apiProvider.getDataDepositBalanceMyFinance(url, id, title);
    return viewDepositBalance;
  }

  Future sendDepositBalanceMyFinancePost(String url, var formdata)async{
    var postDepositBalance;
    postDepositBalance = await _apiProvider.sendDataDepositBalanceMyFinance(url, formdata);
    return postDepositBalance;
  }
  
   Future sendDepositBalanceMyFinancePostWithID(String url, var formdata, String id, String title)async{
    var postDepositBalance;
    postDepositBalance = await _apiProvider.sendDataWithIDDepositBalanceMyFinance(url, formdata, id, title);
    return postDepositBalance;
  }
  
    Future<DepositBalanceMyFinanceModel> getDepositBalanceMyFinance(String url, String id, String title, String spKey)async{
  DepositBalanceMyFinanceModel my_finance ;
   DepositBalanceMyFinanceModel my_finance1 ;
          var data ;
			  if(['PlaceNewBid'].contains('DepositBalance')){
			 my_finance1 = await _apiProvider.getDataDepositBalanceMyFinance(url, id, title)
					  .then((responseDepositBalanceMyFinance) {
					   
						return responseDepositBalanceMyFinance;
					  });
			spKey = my_finance1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('DepositBalance')){
			 my_finance1 = await _apiProvider.getDataDepositBalanceMyFinance(url, id, title)
					  .then((responseDepositBalanceMyFinance) {
					   
						return responseDepositBalanceMyFinance;
					  });
			spKey = my_finance1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('DepositBalance')){
			 my_finance1 = await _apiProvider.getDataDepositBalanceMyFinance(url, id, title)
					  .then((responseDepositBalanceMyFinance) {
					   
						return responseDepositBalanceMyFinance;
					  });
			spKey = my_finance1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('DepositBalance')){
			 my_finance1 = await _apiProvider.getDataDepositBalanceMyFinance(url, id, title)
					  .then((responseDepositBalanceMyFinance) {
					   
						return responseDepositBalanceMyFinance;
					  });
			spKey = my_finance1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadDepositBalanceMyFinance(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_finance = await _apiProvider.getDataDepositBalanceMyFinance(url, id, title)
                  .then((responseDepositBalanceMyFinance) {
                    saveOrUpdateDepositBalanceMyFinance(responseDepositBalanceMyFinance, spKey, 1 );
					return responseDepositBalanceMyFinance;
                  });
			  return my_finance;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<DepositBalanceMyFinanceModel?> loadDepositBalanceMyFinance( String searchKey) async{
   return await _dbRepository.loadDepositBalanceMyFinance(searchKey) ;   
  }
  
   Future<DepositBalanceMyFinanceModel?> saveOrUpdateDepositBalanceMyFinance(DepositBalanceMyFinanceModel my_finance, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateDepositBalanceMyFinance(my_finance, searchKey);   
    return await _dbRepository. loadDepositBalanceMyFinance(searchKey) ;  
  }	
  
    Future<void> deleteAllDepositBalanceMyFinance(String spKey) async{
      return await _dbRepository.deleteAllDepositBalanceMyFinance(spKey); 
   }
  
  


  Future<bool> isOldMyPointsList()async{
    int ageDB = await _dbRepository.listMyPointsAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyPointsListDB() async {
    var my_points;
    my_points = await _dbRepository.loadMyPointsList('');
    if ((my_points != null) || (my_points != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyPointsListingModel?> getMyPointsList(String url, int page)async{
  MyPointsListingModel? my_points ;

   if(page == 1){
			//await _dbRepository.deleteAllMyPointsList();
            my_points = await _apiProvider.getListMyPoints(url, page)
                  .then((responseMyPointsList) {
                    _loadAndSaveMyPointsList1(responseMyPointsList, '', page);
					return responseMyPointsList;
                  });
   }else{
      my_points = await _apiProvider.getListMyPoints(url, page)
                  .then((responseMyPointsList) {
				  try{
				      return  _loadAndSaveMyPointsList(responseMyPointsList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_points;
	}



Future<MyPointsListingModel?> getMyPointsListSearch(String url, int page)async{
  MyPointsListingModel? my_points ;   
  my_points = await _apiProvider.getListMyPoints(url, page)
		  .then((responseMyPointsList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyPointsListSearch(responseMyPointsList, '', responseMyPointsList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyPointsListSearch(responseMyPointsList, '', page);
      }
		  
		  
			
		  }); 
  return my_points;
}


Future<MyPointsListingModel> _loadAndSaveMyPointsListSearch(MyPointsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_ktp_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_siup_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_notes;
    }
    return list;
 }

Future<MyPointsListingModel?> _loadAndSaveMyPointsList(MyPointsListingModel list, String searchKey, int page) async{
    MyPointsListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyPointsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyPointsModel my_points;
      my_points = list.items.items[i];
      my_points.item!.cnt = i ;
      my_points.item!.age = age;
      my_points.item!.page = page;
	  my_points.item!.ttl = '';
	  my_points.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_points.item!.sbttl = '';
	  
	  my_points.item!.id = my_points.item!.user_id; 
	  
	  my_points.item!.ttl = my_points.item!.user_name;
	  my_points.item!.pht = my_points.item!.scan_ktp_url;
	  my_points.item!.pht = my_points.item!.scan_siup_url;
	  my_points.item!.pht = my_points.item!.photo_url;
	  my_points.item!.sbttl = my_points.item!.self_introduction;
	  my_points.item!.sbttl = my_points.item!.admin_notes;
      await _dbRepository.saveOrUpdateMyPointsList(my_points);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyPointsList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyPointsList1(MyPointsListingModel list, String searchKey, int page) async{
    MyPointsListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyPointsListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyPointsModel my_points;
      my_points = list.items.items[i];
      my_points.item!.cnt = i ;
      my_points.item!.age = age;
      my_points.item!.page = page;
	  my_points.item!.ttl = '';
	  my_points.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_points.item!.sbttl = '';
	  
	  my_points.item!.id = my_points.item!.user_id; 
	  
	  my_points.item!.ttl = my_points.item!.user_name;
	  my_points.item!.pht = my_points.item!.scan_ktp_url;
	  my_points.item!.pht = my_points.item!.scan_siup_url;
	  my_points.item!.pht = my_points.item!.photo_url;
	  my_points.item!.sbttl = my_points.item!.self_introduction;
	  my_points.item!.sbttl = my_points.item!.admin_notes;
      await _dbRepository.saveOrUpdateMyPointsList(my_points);
    }

  }


  Future<MyPointsListingModel> loadMyPointsList( String searchKey) async{
    MyPointsListingModel appList = await _dbRepository.loadMyPointsListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyPointsList(searchKey)) ;
    return appList;
  }

  Future getMyPointsEdit(String url, String id, String title)async{
    var editMyPoints;
    editMyPoints = await _apiProvider.getDataMyPoints(url, id, title);
    return editMyPoints;
  }

  Future getMyPointsView(String url, String id, String title)async{
    var  viewMyPoints;
    viewMyPoints = await _apiProvider.getViewDataMyPoints(url, id, title);
    return viewMyPoints;
  }

  Future sendMyPointsPost(String url, var formdata)async{
    var postMyPoints;
    postMyPoints = await _apiProvider.sendDataMyPoints(url, formdata);
    return postMyPoints;
  }
  
   Future sendMyPointsPostWithID(String url, var formdata, String id, String title)async{
    var postMyPoints;
    postMyPoints = await _apiProvider.sendDataWithIDMyPoints(url, formdata, id, title);
    return postMyPoints;
  }
  
  


  Future<bool> isOldMyProfileList()async{
    int ageDB = await _dbRepository.listMyProfileAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyProfileListDB() async {
    var my_profile;
    my_profile = await _dbRepository.loadMyProfileList('');
    if ((my_profile != null) || (my_profile != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyProfileListingModel?> getMyProfileList(String url, int page)async{
  MyProfileListingModel? my_profile ;

   if(page == 1){
			//await _dbRepository.deleteAllMyProfileList();
            my_profile = await _apiProvider.getListMyProfile(url, page)
                  .then((responseMyProfileList) {
                    _loadAndSaveMyProfileList1(responseMyProfileList, '', page);
					return responseMyProfileList;
                  });
   }else{
      my_profile = await _apiProvider.getListMyProfile(url, page)
                  .then((responseMyProfileList) {
				  try{
				      return  _loadAndSaveMyProfileList(responseMyProfileList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_profile;
	}



Future<MyProfileListingModel?> getMyProfileListSearch(String url, int page)async{
  MyProfileListingModel? my_profile ;   
  my_profile = await _apiProvider.getListMyProfile(url, page)
		  .then((responseMyProfileList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyProfileListSearch(responseMyProfileList, '', responseMyProfileList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyProfileListSearch(responseMyProfileList, '', page);
      }
		  
		  
			
		  }); 
  return my_profile;
}


Future<MyProfileListingModel> _loadAndSaveMyProfileListSearch(MyProfileListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.user_name;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_ktp_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.scan_siup_url;
	  list.items.items[i].item!.pht = list.items.items[i].item!.photo_url;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.self_introduction;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.admin_notes;
    }
    return list;
 }

Future<MyProfileListingModel?> _loadAndSaveMyProfileList(MyProfileListingModel list, String searchKey, int page) async{
    MyProfileListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyProfileListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyProfileModel my_profile;
      my_profile = list.items.items[i];
      my_profile.item!.cnt = i ;
      my_profile.item!.age = age;
      my_profile.item!.page = page;
	  my_profile.item!.ttl = '';
	  my_profile.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_profile.item!.sbttl = '';
	  
	  my_profile.item!.id = my_profile.item!.user_id; 
	  
	  my_profile.item!.ttl = my_profile.item!.user_name;
	  my_profile.item!.pht = my_profile.item!.scan_ktp_url;
	  my_profile.item!.pht = my_profile.item!.scan_siup_url;
	  my_profile.item!.pht = my_profile.item!.photo_url;
	  my_profile.item!.sbttl = my_profile.item!.self_introduction;
	  my_profile.item!.sbttl = my_profile.item!.admin_notes;
      await _dbRepository.saveOrUpdateMyProfileList(my_profile);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyProfileList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyProfileList1(MyProfileListingModel list, String searchKey, int page) async{
    MyProfileListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyProfileListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyProfileModel my_profile;
      my_profile = list.items.items[i];
      my_profile.item!.cnt = i ;
      my_profile.item!.age = age;
      my_profile.item!.page = page;
	  my_profile.item!.ttl = '';
	  my_profile.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_profile.item!.sbttl = '';
	  
	  my_profile.item!.id = my_profile.item!.user_id; 
	  
	  my_profile.item!.ttl = my_profile.item!.user_name;
	  my_profile.item!.pht = my_profile.item!.scan_ktp_url;
	  my_profile.item!.pht = my_profile.item!.scan_siup_url;
	  my_profile.item!.pht = my_profile.item!.photo_url;
	  my_profile.item!.sbttl = my_profile.item!.self_introduction;
	  my_profile.item!.sbttl = my_profile.item!.admin_notes;
      await _dbRepository.saveOrUpdateMyProfileList(my_profile);
    }

  }


  Future<MyProfileListingModel> loadMyProfileList( String searchKey) async{
    MyProfileListingModel appList = await _dbRepository.loadMyProfileListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyProfileList(searchKey)) ;
    return appList;
  }

  Future getMyProfileEdit(String url, String id, String title)async{
    var editMyProfile;
    editMyProfile = await _apiProvider.getDataMyProfile(url, id, title);
    return editMyProfile;
  }

  Future getMyProfileView(String url, String id, String title)async{
    var  viewMyProfile;
    viewMyProfile = await _apiProvider.getViewDataMyProfile(url, id, title);
    return viewMyProfile;
  }

  Future sendMyProfilePost(String url, var formdata)async{
    var postMyProfile;
    postMyProfile = await _apiProvider.sendDataMyProfile(url, formdata);
    return postMyProfile;
  }
  
   Future sendMyProfilePostWithID(String url, var formdata, String id, String title)async{
    var postMyProfile;
    postMyProfile = await _apiProvider.sendDataWithIDMyProfile(url, formdata, id, title);
    return postMyProfile;
  }
  
    Future getEditProfileMyProfileEdit(String url, String id, String title)async{
    var editEditProfile;
    editEditProfile = await _apiProvider.getDataEditProfileMyProfile(url, id, title);
    return editEditProfile;
  }

  Future getEditProfileMyProfileView(String url, String id, String title)async{
    var  viewEditProfile;
    viewEditProfile = await _apiProvider.getDataEditProfileMyProfile(url, id, title);
    return viewEditProfile;
  }

  Future sendEditProfileMyProfilePost(String url, var formdata)async{
    var postEditProfile;
    postEditProfile = await _apiProvider.sendDataEditProfileMyProfile(url, formdata);
    return postEditProfile;
  }
  
   Future sendEditProfileMyProfilePostWithID(String url, var formdata, String id, String title)async{
    var postEditProfile;
    postEditProfile = await _apiProvider.sendDataWithIDEditProfileMyProfile(url, formdata, id, title);
    return postEditProfile;
  }
  
    Future<EditProfileMyProfileModel> getEditProfileMyProfile(String url, String id, String title, String spKey)async{
  EditProfileMyProfileModel my_profile ;
   EditProfileMyProfileModel my_profile1 ;
          var data ;
			  if(['PlaceNewBid'].contains('EditProfile')){
			 my_profile1 = await _apiProvider.getDataEditProfileMyProfile(url, id, title)
					  .then((responseEditProfileMyProfile) {
					   
						return responseEditProfileMyProfile;
					  });
			spKey = my_profile1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('EditProfile')){
			 my_profile1 = await _apiProvider.getDataEditProfileMyProfile(url, id, title)
					  .then((responseEditProfileMyProfile) {
					   
						return responseEditProfileMyProfile;
					  });
			spKey = my_profile1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('EditProfile')){
			 my_profile1 = await _apiProvider.getDataEditProfileMyProfile(url, id, title)
					  .then((responseEditProfileMyProfile) {
					   
						return responseEditProfileMyProfile;
					  });
			spKey = my_profile1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('EditProfile')){
			 my_profile1 = await _apiProvider.getDataEditProfileMyProfile(url, id, title)
					  .then((responseEditProfileMyProfile) {
					   
						return responseEditProfileMyProfile;
					  });
			spKey = my_profile1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadEditProfileMyProfile(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_profile = await _apiProvider.getDataEditProfileMyProfile(url, id, title)
                  .then((responseEditProfileMyProfile) {
                    saveOrUpdateEditProfileMyProfile(responseEditProfileMyProfile, spKey, 1 );
					return responseEditProfileMyProfile;
                  });
			  return my_profile;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<EditProfileMyProfileModel?> loadEditProfileMyProfile( String searchKey) async{
   return await _dbRepository.loadEditProfileMyProfile(searchKey) ;   
  }
  
   Future<EditProfileMyProfileModel?> saveOrUpdateEditProfileMyProfile(EditProfileMyProfileModel my_profile, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateEditProfileMyProfile(my_profile, searchKey);   
    return await _dbRepository. loadEditProfileMyProfile(searchKey) ;  
  }	
  
    Future<void> deleteAllEditProfileMyProfile(String spKey) async{
      return await _dbRepository.deleteAllEditProfileMyProfile(spKey); 
   }
  

Future<PortofolioListingModel> getPortofolioMyProfileListSearch(String url, int page)async{
  PortofolioListingModel portofolio ;   
 
  portofolio = await _apiProvider.getListPortofolioMyProfile(url, page)
		  .then((responsePortofolioMyProfileList) {
		   if(page == -1 ){
				return  _loadAndSavePortofolioMyProfileListSearch(responsePortofolioMyProfileList, '', responsePortofolioMyProfileList.tools.paging.total_pages);
			  }else{
				return  _loadAndSavePortofolioMyProfileListSearch(responsePortofolioMyProfileList, '', page);
			  }
		  
			//return  _loadAndSavePortofolioMyProfileListSearch(responsePortofolioMyProfileList, '', page);
		  
		  }); 
  return portofolio;
}
Future<PortofolioListingModel> _loadAndSavePortofolioMyProfileListSearch(PortofolioListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.description;
	  list.items.items[i].item!.pht = list.items.items[i].item!.image_url;
    }
	
    return list;
 }

    Future getChangePasswordMyProfileEdit(String url, String id, String title)async{
    var editChangePassword;
    editChangePassword = await _apiProvider.getDataChangePasswordMyProfile(url, id, title);
    return editChangePassword;
  }

  Future getChangePasswordMyProfileView(String url, String id, String title)async{
    var  viewChangePassword;
    viewChangePassword = await _apiProvider.getDataChangePasswordMyProfile(url, id, title);
    return viewChangePassword;
  }

  Future sendChangePasswordMyProfilePost(String url, var formdata)async{
    var postChangePassword;
    postChangePassword = await _apiProvider.sendDataChangePasswordMyProfile(url, formdata);
    return postChangePassword;
  }
  
   Future sendChangePasswordMyProfilePostWithID(String url, var formdata, String id, String title)async{
    var postChangePassword;
    postChangePassword = await _apiProvider.sendDataWithIDChangePasswordMyProfile(url, formdata, id, title);
    return postChangePassword;
  }
  
    Future<ChangePasswordMyProfileModel> getChangePasswordMyProfile(String url, String id, String title, String spKey)async{
  ChangePasswordMyProfileModel my_profile ;
   ChangePasswordMyProfileModel my_profile1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ChangePassword')){
			 my_profile1 = await _apiProvider.getDataChangePasswordMyProfile(url, id, title)
					  .then((responseChangePasswordMyProfile) {
					   
						return responseChangePasswordMyProfile;
					  });
			spKey = my_profile1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ChangePassword')){
			 my_profile1 = await _apiProvider.getDataChangePasswordMyProfile(url, id, title)
					  .then((responseChangePasswordMyProfile) {
					   
						return responseChangePasswordMyProfile;
					  });
			spKey = my_profile1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ChangePassword')){
			 my_profile1 = await _apiProvider.getDataChangePasswordMyProfile(url, id, title)
					  .then((responseChangePasswordMyProfile) {
					   
						return responseChangePasswordMyProfile;
					  });
			spKey = my_profile1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ChangePassword')){
			 my_profile1 = await _apiProvider.getDataChangePasswordMyProfile(url, id, title)
					  .then((responseChangePasswordMyProfile) {
					   
						return responseChangePasswordMyProfile;
					  });
			spKey = my_profile1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadChangePasswordMyProfile(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_profile = await _apiProvider.getDataChangePasswordMyProfile(url, id, title)
                  .then((responseChangePasswordMyProfile) {
                    saveOrUpdateChangePasswordMyProfile(responseChangePasswordMyProfile, spKey, 1 );
					return responseChangePasswordMyProfile;
                  });
			  return my_profile;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ChangePasswordMyProfileModel?> loadChangePasswordMyProfile( String searchKey) async{
   return await _dbRepository.loadChangePasswordMyProfile(searchKey) ;   
  }
  
   Future<ChangePasswordMyProfileModel?> saveOrUpdateChangePasswordMyProfile(ChangePasswordMyProfileModel my_profile, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateChangePasswordMyProfile(my_profile, searchKey);   
    return await _dbRepository. loadChangePasswordMyProfile(searchKey) ;  
  }	
  
    Future<void> deleteAllChangePasswordMyProfile(String spKey) async{
      return await _dbRepository.deleteAllChangePasswordMyProfile(spKey); 
   }
  
    Future getChangeEmailMyProfileEdit(String url, String id, String title)async{
    var editChangeEmail;
    editChangeEmail = await _apiProvider.getDataChangeEmailMyProfile(url, id, title);
    return editChangeEmail;
  }

  Future getChangeEmailMyProfileView(String url, String id, String title)async{
    var  viewChangeEmail;
    viewChangeEmail = await _apiProvider.getDataChangeEmailMyProfile(url, id, title);
    return viewChangeEmail;
  }

  Future sendChangeEmailMyProfilePost(String url, var formdata)async{
    var postChangeEmail;
    postChangeEmail = await _apiProvider.sendDataChangeEmailMyProfile(url, formdata);
    return postChangeEmail;
  }
  
   Future sendChangeEmailMyProfilePostWithID(String url, var formdata, String id, String title)async{
    var postChangeEmail;
    postChangeEmail = await _apiProvider.sendDataWithIDChangeEmailMyProfile(url, formdata, id, title);
    return postChangeEmail;
  }
  
    Future<ChangeEmailMyProfileModel> getChangeEmailMyProfile(String url, String id, String title, String spKey)async{
  ChangeEmailMyProfileModel my_profile ;
   ChangeEmailMyProfileModel my_profile1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ChangeEmail')){
			 my_profile1 = await _apiProvider.getDataChangeEmailMyProfile(url, id, title)
					  .then((responseChangeEmailMyProfile) {
					   
						return responseChangeEmailMyProfile;
					  });
			spKey = my_profile1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ChangeEmail')){
			 my_profile1 = await _apiProvider.getDataChangeEmailMyProfile(url, id, title)
					  .then((responseChangeEmailMyProfile) {
					   
						return responseChangeEmailMyProfile;
					  });
			spKey = my_profile1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ChangeEmail')){
			 my_profile1 = await _apiProvider.getDataChangeEmailMyProfile(url, id, title)
					  .then((responseChangeEmailMyProfile) {
					   
						return responseChangeEmailMyProfile;
					  });
			spKey = my_profile1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ChangeEmail')){
			 my_profile1 = await _apiProvider.getDataChangeEmailMyProfile(url, id, title)
					  .then((responseChangeEmailMyProfile) {
					   
						return responseChangeEmailMyProfile;
					  });
			spKey = my_profile1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadChangeEmailMyProfile(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_profile = await _apiProvider.getDataChangeEmailMyProfile(url, id, title)
                  .then((responseChangeEmailMyProfile) {
                    saveOrUpdateChangeEmailMyProfile(responseChangeEmailMyProfile, spKey, 1 );
					return responseChangeEmailMyProfile;
                  });
			  return my_profile;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ChangeEmailMyProfileModel?> loadChangeEmailMyProfile( String searchKey) async{
   return await _dbRepository.loadChangeEmailMyProfile(searchKey) ;   
  }
  
   Future<ChangeEmailMyProfileModel?> saveOrUpdateChangeEmailMyProfile(ChangeEmailMyProfileModel my_profile, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateChangeEmailMyProfile(my_profile, searchKey);   
    return await _dbRepository. loadChangeEmailMyProfile(searchKey) ;  
  }	
  
    Future<void> deleteAllChangeEmailMyProfile(String spKey) async{
      return await _dbRepository.deleteAllChangeEmailMyProfile(spKey); 
   }
  
    Future getChangeHandphoneMyProfileEdit(String url, String id, String title)async{
    var editChangeHandphone;
    editChangeHandphone = await _apiProvider.getDataChangeHandphoneMyProfile(url, id, title);
    return editChangeHandphone;
  }

  Future getChangeHandphoneMyProfileView(String url, String id, String title)async{
    var  viewChangeHandphone;
    viewChangeHandphone = await _apiProvider.getDataChangeHandphoneMyProfile(url, id, title);
    return viewChangeHandphone;
  }

  Future sendChangeHandphoneMyProfilePost(String url, var formdata)async{
    var postChangeHandphone;
    postChangeHandphone = await _apiProvider.sendDataChangeHandphoneMyProfile(url, formdata);
    return postChangeHandphone;
  }
  
   Future sendChangeHandphoneMyProfilePostWithID(String url, var formdata, String id, String title)async{
    var postChangeHandphone;
    postChangeHandphone = await _apiProvider.sendDataWithIDChangeHandphoneMyProfile(url, formdata, id, title);
    return postChangeHandphone;
  }
  
    Future<ChangeHandphoneMyProfileModel> getChangeHandphoneMyProfile(String url, String id, String title, String spKey)async{
  ChangeHandphoneMyProfileModel my_profile ;
   ChangeHandphoneMyProfileModel my_profile1 ;
          var data ;
			  if(['PlaceNewBid'].contains('ChangeHandphone')){
			 my_profile1 = await _apiProvider.getDataChangeHandphoneMyProfile(url, id, title)
					  .then((responseChangeHandphoneMyProfile) {
					   
						return responseChangeHandphoneMyProfile;
					  });
			spKey = my_profile1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('ChangeHandphone')){
			 my_profile1 = await _apiProvider.getDataChangeHandphoneMyProfile(url, id, title)
					  .then((responseChangeHandphoneMyProfile) {
					   
						return responseChangeHandphoneMyProfile;
					  });
			spKey = my_profile1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('ChangeHandphone')){
			 my_profile1 = await _apiProvider.getDataChangeHandphoneMyProfile(url, id, title)
					  .then((responseChangeHandphoneMyProfile) {
					   
						return responseChangeHandphoneMyProfile;
					  });
			spKey = my_profile1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('ChangeHandphone')){
			 my_profile1 = await _apiProvider.getDataChangeHandphoneMyProfile(url, id, title)
					  .then((responseChangeHandphoneMyProfile) {
					   
						return responseChangeHandphoneMyProfile;
					  });
			spKey = my_profile1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadChangeHandphoneMyProfile(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_profile = await _apiProvider.getDataChangeHandphoneMyProfile(url, id, title)
                  .then((responseChangeHandphoneMyProfile) {
                    saveOrUpdateChangeHandphoneMyProfile(responseChangeHandphoneMyProfile, spKey, 1 );
					return responseChangeHandphoneMyProfile;
                  });
			  return my_profile;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<ChangeHandphoneMyProfileModel?> loadChangeHandphoneMyProfile( String searchKey) async{
   return await _dbRepository.loadChangeHandphoneMyProfile(searchKey) ;   
  }
  
   Future<ChangeHandphoneMyProfileModel?> saveOrUpdateChangeHandphoneMyProfile(ChangeHandphoneMyProfileModel my_profile, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateChangeHandphoneMyProfile(my_profile, searchKey);   
    return await _dbRepository. loadChangeHandphoneMyProfile(searchKey) ;  
  }	
  
    Future<void> deleteAllChangeHandphoneMyProfile(String spKey) async{
      return await _dbRepository.deleteAllChangeHandphoneMyProfile(spKey); 
   }
  
  


  Future<bool> isOldKelurahanList()async{
    int ageDB = await _dbRepository.listKelurahanAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyKelurahanListDB() async {
    var kelurahan;
    kelurahan = await _dbRepository.loadKelurahanList('');
    if ((kelurahan != null) || (kelurahan != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<KelurahanListingModel?> getKelurahanList(String url, int page)async{
  KelurahanListingModel? kelurahan ;

   if(page == 1){
			//await _dbRepository.deleteAllKelurahanList();
            kelurahan = await _apiProvider.getListKelurahan(url, page)
                  .then((responseKelurahanList) {
                    _loadAndSaveKelurahanList1(responseKelurahanList, '', page);
					return responseKelurahanList;
                  });
   }else{
      kelurahan = await _apiProvider.getListKelurahan(url, page)
                  .then((responseKelurahanList) {
				  try{
				      return  _loadAndSaveKelurahanList(responseKelurahanList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return kelurahan;
	}



Future<KelurahanListingModel?> getKelurahanListSearch(String url, int page)async{
  KelurahanListingModel? kelurahan ;   
  kelurahan = await _apiProvider.getListKelurahan(url, page)
		  .then((responseKelurahanList) {
		  
   if(page == -1 ){
        return  _loadAndSaveKelurahanListSearch(responseKelurahanList, '', responseKelurahanList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveKelurahanListSearch(responseKelurahanList, '', page);
      }
		  
		  
			
		  }); 
  return kelurahan;
}


Future<KelurahanListingModel> _loadAndSaveKelurahanListSearch(KelurahanListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
    }
    return list;
 }

Future<KelurahanListingModel?> _loadAndSaveKelurahanList(KelurahanListingModel list, String searchKey, int page) async{
    KelurahanListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateKelurahanListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemKelurahanModel kelurahan;
      kelurahan = list.items.items[i];
      kelurahan.item!.cnt = i ;
      kelurahan.item!.age = age;
      kelurahan.item!.page = page;
	  kelurahan.item!.ttl = '';
	  kelurahan.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  kelurahan.item!.sbttl = '';
	  
	  kelurahan.item!.id = kelurahan.item!.kelurahan_id; 
	  
      await _dbRepository.saveOrUpdateKelurahanList(kelurahan);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadKelurahanList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveKelurahanList1(KelurahanListingModel list, String searchKey, int page) async{
    KelurahanListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateKelurahanListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemKelurahanModel kelurahan;
      kelurahan = list.items.items[i];
      kelurahan.item!.cnt = i ;
      kelurahan.item!.age = age;
      kelurahan.item!.page = page;
	  kelurahan.item!.ttl = '';
	  kelurahan.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  kelurahan.item!.sbttl = '';
	  
	  kelurahan.item!.id = kelurahan.item!.kelurahan_id; 
	  
      await _dbRepository.saveOrUpdateKelurahanList(kelurahan);
    }

  }


  Future<KelurahanListingModel> loadKelurahanList( String searchKey) async{
    KelurahanListingModel appList = await _dbRepository.loadKelurahanListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadKelurahanList(searchKey)) ;
    return appList;
  }

  Future getKelurahanEdit(String url, String id, String title)async{
    var editKelurahan;
    editKelurahan = await _apiProvider.getDataKelurahan(url, id, title);
    return editKelurahan;
  }

  Future getKelurahanView(String url, String id, String title)async{
    var  viewKelurahan;
    viewKelurahan = await _apiProvider.getViewDataKelurahan(url, id, title);
    return viewKelurahan;
  }

  Future sendKelurahanPost(String url, var formdata)async{
    var postKelurahan;
    postKelurahan = await _apiProvider.sendDataKelurahan(url, formdata);
    return postKelurahan;
  }
  
   Future sendKelurahanPostWithID(String url, var formdata, String id, String title)async{
    var postKelurahan;
    postKelurahan = await _apiProvider.sendDataWithIDKelurahan(url, formdata, id, title);
    return postKelurahan;
  }
  
  


  Future<bool> isOldMyPortofolioList()async{
    int ageDB = await _dbRepository.listMyPortofolioAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyPortofolioListDB() async {
    var my_portofolio;
    my_portofolio = await _dbRepository.loadMyPortofolioList('');
    if ((my_portofolio != null) || (my_portofolio != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyPortofolioListingModel?> getMyPortofolioList(String url, int page)async{
  MyPortofolioListingModel? my_portofolio ;

   if(page == 1){
			//await _dbRepository.deleteAllMyPortofolioList();
            my_portofolio = await _apiProvider.getListMyPortofolio(url, page)
                  .then((responseMyPortofolioList) {
                    _loadAndSaveMyPortofolioList1(responseMyPortofolioList, '', page);
					return responseMyPortofolioList;
                  });
   }else{
      my_portofolio = await _apiProvider.getListMyPortofolio(url, page)
                  .then((responseMyPortofolioList) {
				  try{
				      return  _loadAndSaveMyPortofolioList(responseMyPortofolioList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_portofolio;
	}



Future<MyPortofolioListingModel?> getMyPortofolioListSearch(String url, int page)async{
  MyPortofolioListingModel? my_portofolio ;   
  my_portofolio = await _apiProvider.getListMyPortofolio(url, page)
		  .then((responseMyPortofolioList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyPortofolioListSearch(responseMyPortofolioList, '', responseMyPortofolioList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyPortofolioListSearch(responseMyPortofolioList, '', page);
      }
		  
		  
			
		  }); 
  return my_portofolio;
}


Future<MyPortofolioListingModel> _loadAndSaveMyPortofolioListSearch(MyPortofolioListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.description;
	  list.items.items[i].item!.pht = list.items.items[i].item!.image_url;
    }
    return list;
 }

Future<MyPortofolioListingModel?> _loadAndSaveMyPortofolioList(MyPortofolioListingModel list, String searchKey, int page) async{
    MyPortofolioListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyPortofolioListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyPortofolioModel my_portofolio;
      my_portofolio = list.items.items[i];
      my_portofolio.item!.cnt = i ;
      my_portofolio.item!.age = age;
      my_portofolio.item!.page = page;
	  my_portofolio.item!.ttl = '';
	  my_portofolio.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_portofolio.item!.sbttl = '';
	  
	  my_portofolio.item!.id = my_portofolio.item!.portofolio_id; 
	  
	  my_portofolio.item!.sbttl = my_portofolio.item!.description;
	  my_portofolio.item!.pht = my_portofolio.item!.image_url;
      await _dbRepository.saveOrUpdateMyPortofolioList(my_portofolio);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyPortofolioList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyPortofolioList1(MyPortofolioListingModel list, String searchKey, int page) async{
    MyPortofolioListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyPortofolioListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyPortofolioModel my_portofolio;
      my_portofolio = list.items.items[i];
      my_portofolio.item!.cnt = i ;
      my_portofolio.item!.age = age;
      my_portofolio.item!.page = page;
	  my_portofolio.item!.ttl = '';
	  my_portofolio.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_portofolio.item!.sbttl = '';
	  
	  my_portofolio.item!.id = my_portofolio.item!.portofolio_id; 
	  
	  my_portofolio.item!.sbttl = my_portofolio.item!.description;
	  my_portofolio.item!.pht = my_portofolio.item!.image_url;
      await _dbRepository.saveOrUpdateMyPortofolioList(my_portofolio);
    }

  }


  Future<MyPortofolioListingModel> loadMyPortofolioList( String searchKey) async{
    MyPortofolioListingModel appList = await _dbRepository.loadMyPortofolioListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyPortofolioList(searchKey)) ;
    return appList;
  }

  Future getMyPortofolioEdit(String url, String id, String title)async{
    var editMyPortofolio;
    editMyPortofolio = await _apiProvider.getDataMyPortofolio(url, id, title);
    return editMyPortofolio;
  }

  Future getMyPortofolioView(String url, String id, String title)async{
    var  viewMyPortofolio;
    viewMyPortofolio = await _apiProvider.getViewDataMyPortofolio(url, id, title);
    return viewMyPortofolio;
  }

  Future sendMyPortofolioPost(String url, var formdata)async{
    var postMyPortofolio;
    postMyPortofolio = await _apiProvider.sendDataMyPortofolio(url, formdata);
    return postMyPortofolio;
  }
  
   Future sendMyPortofolioPostWithID(String url, var formdata, String id, String title)async{
    var postMyPortofolio;
    postMyPortofolio = await _apiProvider.sendDataWithIDMyPortofolio(url, formdata, id, title);
    return postMyPortofolio;
  }
  
    Future getAddPortofolioMyPortofolioEdit(String url, String id, String title)async{
    var editAddPortofolio;
    editAddPortofolio = await _apiProvider.getDataAddPortofolioMyPortofolio(url, id, title);
    return editAddPortofolio;
  }

  Future getAddPortofolioMyPortofolioView(String url, String id, String title)async{
    var  viewAddPortofolio;
    viewAddPortofolio = await _apiProvider.getDataAddPortofolioMyPortofolio(url, id, title);
    return viewAddPortofolio;
  }

  Future sendAddPortofolioMyPortofolioPost(String url, var formdata)async{
    var postAddPortofolio;
    postAddPortofolio = await _apiProvider.sendDataAddPortofolioMyPortofolio(url, formdata);
    return postAddPortofolio;
  }
  
   Future sendAddPortofolioMyPortofolioPostWithID(String url, var formdata, String id, String title)async{
    var postAddPortofolio;
    postAddPortofolio = await _apiProvider.sendDataWithIDAddPortofolioMyPortofolio(url, formdata, id, title);
    return postAddPortofolio;
  }
  
    Future<AddPortofolioMyPortofolioModel> getAddPortofolioMyPortofolio(String url, String id, String title, String spKey)async{
  AddPortofolioMyPortofolioModel my_portofolio ;
   AddPortofolioMyPortofolioModel my_portofolio1 ;
          var data ;
			  if(['PlaceNewBid'].contains('AddPortofolio')){
			 my_portofolio1 = await _apiProvider.getDataAddPortofolioMyPortofolio(url, id, title)
					  .then((responseAddPortofolioMyPortofolio) {
					   
						return responseAddPortofolioMyPortofolio;
					  });
			spKey = my_portofolio1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('AddPortofolio')){
			 my_portofolio1 = await _apiProvider.getDataAddPortofolioMyPortofolio(url, id, title)
					  .then((responseAddPortofolioMyPortofolio) {
					   
						return responseAddPortofolioMyPortofolio;
					  });
			spKey = my_portofolio1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('AddPortofolio')){
			 my_portofolio1 = await _apiProvider.getDataAddPortofolioMyPortofolio(url, id, title)
					  .then((responseAddPortofolioMyPortofolio) {
					   
						return responseAddPortofolioMyPortofolio;
					  });
			spKey = my_portofolio1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('AddPortofolio')){
			 my_portofolio1 = await _apiProvider.getDataAddPortofolioMyPortofolio(url, id, title)
					  .then((responseAddPortofolioMyPortofolio) {
					   
						return responseAddPortofolioMyPortofolio;
					  });
			spKey = my_portofolio1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadAddPortofolioMyPortofolio(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_portofolio = await _apiProvider.getDataAddPortofolioMyPortofolio(url, id, title)
                  .then((responseAddPortofolioMyPortofolio) {
                    saveOrUpdateAddPortofolioMyPortofolio(responseAddPortofolioMyPortofolio, spKey, 1 );
					return responseAddPortofolioMyPortofolio;
                  });
			  return my_portofolio;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<AddPortofolioMyPortofolioModel?> loadAddPortofolioMyPortofolio( String searchKey) async{
   return await _dbRepository.loadAddPortofolioMyPortofolio(searchKey) ;   
  }
  
   Future<AddPortofolioMyPortofolioModel?> saveOrUpdateAddPortofolioMyPortofolio(AddPortofolioMyPortofolioModel my_portofolio, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateAddPortofolioMyPortofolio(my_portofolio, searchKey);   
    return await _dbRepository. loadAddPortofolioMyPortofolio(searchKey) ;  
  }	
  
    Future<void> deleteAllAddPortofolioMyPortofolio(String spKey) async{
      return await _dbRepository.deleteAllAddPortofolioMyPortofolio(spKey); 
   }
  
    Future getEditMyPortofolioEdit(String url, String id, String title)async{
    var editEdit;
    editEdit = await _apiProvider.getDataEditMyPortofolio(url, id, title);
    return editEdit;
  }

  Future getEditMyPortofolioView(String url, String id, String title)async{
    var  viewEdit;
    viewEdit = await _apiProvider.getDataEditMyPortofolio(url, id, title);
    return viewEdit;
  }

  Future sendEditMyPortofolioPost(String url, var formdata)async{
    var postEdit;
    postEdit = await _apiProvider.sendDataEditMyPortofolio(url, formdata);
    return postEdit;
  }
  
   Future sendEditMyPortofolioPostWithID(String url, var formdata, String id, String title)async{
    var postEdit;
    postEdit = await _apiProvider.sendDataWithIDEditMyPortofolio(url, formdata, id, title);
    return postEdit;
  }
  
    Future<EditMyPortofolioModel> getEditMyPortofolio(String url, String id, String title, String spKey)async{
  EditMyPortofolioModel my_portofolio ;
   EditMyPortofolioModel my_portofolio1 ;
          var data ;
			  if(['PlaceNewBid'].contains('Edit')){
			 my_portofolio1 = await _apiProvider.getDataEditMyPortofolio(url, id, title)
					  .then((responseEditMyPortofolio) {
					   
						return responseEditMyPortofolio;
					  });
			spKey = my_portofolio1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('Edit')){
			 my_portofolio1 = await _apiProvider.getDataEditMyPortofolio(url, id, title)
					  .then((responseEditMyPortofolio) {
					   
						return responseEditMyPortofolio;
					  });
			spKey = my_portofolio1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('Edit')){
			 my_portofolio1 = await _apiProvider.getDataEditMyPortofolio(url, id, title)
					  .then((responseEditMyPortofolio) {
					   
						return responseEditMyPortofolio;
					  });
			spKey = my_portofolio1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('Edit')){
			 my_portofolio1 = await _apiProvider.getDataEditMyPortofolio(url, id, title)
					  .then((responseEditMyPortofolio) {
					   
						return responseEditMyPortofolio;
					  });
			spKey = my_portofolio1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadEditMyPortofolio(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_portofolio = await _apiProvider.getDataEditMyPortofolio(url, id, title)
                  .then((responseEditMyPortofolio) {
                    saveOrUpdateEditMyPortofolio(responseEditMyPortofolio, spKey, 1 );
					return responseEditMyPortofolio;
                  });
			  return my_portofolio;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<EditMyPortofolioModel?> loadEditMyPortofolio( String searchKey) async{
   return await _dbRepository.loadEditMyPortofolio(searchKey) ;   
  }
  
   Future<EditMyPortofolioModel?> saveOrUpdateEditMyPortofolio(EditMyPortofolioModel my_portofolio, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateEditMyPortofolio(my_portofolio, searchKey);   
    return await _dbRepository. loadEditMyPortofolio(searchKey) ;  
  }	
  
    Future<void> deleteAllEditMyPortofolio(String spKey) async{
      return await _dbRepository.deleteAllEditMyPortofolio(spKey); 
   }
  
  


  Future<bool> isOldMyBookmarksList()async{
    int ageDB = await _dbRepository.listMyBookmarksAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyBookmarksListDB() async {
    var my_bookmarks;
    my_bookmarks = await _dbRepository.loadMyBookmarksList('');
    if ((my_bookmarks != null) || (my_bookmarks != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyBookmarksListingModel?> getMyBookmarksList(String url, int page)async{
  MyBookmarksListingModel? my_bookmarks ;

   if(page == 1){
			//await _dbRepository.deleteAllMyBookmarksList();
            my_bookmarks = await _apiProvider.getListMyBookmarks(url, page)
                  .then((responseMyBookmarksList) {
                    _loadAndSaveMyBookmarksList1(responseMyBookmarksList, '', page);
					return responseMyBookmarksList;
                  });
   }else{
      my_bookmarks = await _apiProvider.getListMyBookmarks(url, page)
                  .then((responseMyBookmarksList) {
				  try{
				      return  _loadAndSaveMyBookmarksList(responseMyBookmarksList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_bookmarks;
	}



Future<MyBookmarksListingModel?> getMyBookmarksListSearch(String url, int page)async{
  MyBookmarksListingModel? my_bookmarks ;   
  my_bookmarks = await _apiProvider.getListMyBookmarks(url, page)
		  .then((responseMyBookmarksList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyBookmarksListSearch(responseMyBookmarksList, '', responseMyBookmarksList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyBookmarksListSearch(responseMyBookmarksList, '', page);
      }
		  
		  
			
		  }); 
  return my_bookmarks;
}


Future<MyBookmarksListingModel> _loadAndSaveMyBookmarksListSearch(MyBookmarksListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.ttl = list.items.items[i].item!.logo;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.title;
    }
    return list;
 }

Future<MyBookmarksListingModel?> _loadAndSaveMyBookmarksList(MyBookmarksListingModel list, String searchKey, int page) async{
    MyBookmarksListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyBookmarksListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyBookmarksModel my_bookmarks;
      my_bookmarks = list.items.items[i];
      my_bookmarks.item!.cnt = i ;
      my_bookmarks.item!.age = age;
      my_bookmarks.item!.page = page;
	  my_bookmarks.item!.ttl = '';
	  my_bookmarks.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_bookmarks.item!.sbttl = '';
	  
	  my_bookmarks.item!.id = my_bookmarks.item!.bookmark_id; 
	  
	  my_bookmarks.item!.ttl = my_bookmarks.item!.logo;
	  my_bookmarks.item!.ttl = my_bookmarks.item!.title;
      await _dbRepository.saveOrUpdateMyBookmarksList(my_bookmarks);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyBookmarksList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyBookmarksList1(MyBookmarksListingModel list, String searchKey, int page) async{
    MyBookmarksListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyBookmarksListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyBookmarksModel my_bookmarks;
      my_bookmarks = list.items.items[i];
      my_bookmarks.item!.cnt = i ;
      my_bookmarks.item!.age = age;
      my_bookmarks.item!.page = page;
	  my_bookmarks.item!.ttl = '';
	  my_bookmarks.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_bookmarks.item!.sbttl = '';
	  
	  my_bookmarks.item!.id = my_bookmarks.item!.bookmark_id; 
	  
	  my_bookmarks.item!.ttl = my_bookmarks.item!.logo;
	  my_bookmarks.item!.ttl = my_bookmarks.item!.title;
      await _dbRepository.saveOrUpdateMyBookmarksList(my_bookmarks);
    }

  }


  Future<MyBookmarksListingModel> loadMyBookmarksList( String searchKey) async{
    MyBookmarksListingModel appList = await _dbRepository.loadMyBookmarksListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyBookmarksList(searchKey)) ;
    return appList;
  }

  Future getMyBookmarksEdit(String url, String id, String title)async{
    var editMyBookmarks;
    editMyBookmarks = await _apiProvider.getDataMyBookmarks(url, id, title);
    return editMyBookmarks;
  }

  Future getMyBookmarksView(String url, String id, String title)async{
    var  viewMyBookmarks;
    viewMyBookmarks = await _apiProvider.getViewDataMyBookmarks(url, id, title);
    return viewMyBookmarks;
  }

  Future sendMyBookmarksPost(String url, var formdata)async{
    var postMyBookmarks;
    postMyBookmarks = await _apiProvider.sendDataMyBookmarks(url, formdata);
    return postMyBookmarks;
  }
  
   Future sendMyBookmarksPostWithID(String url, var formdata, String id, String title)async{
    var postMyBookmarks;
    postMyBookmarks = await _apiProvider.sendDataWithIDMyBookmarks(url, formdata, id, title);
    return postMyBookmarks;
  }
  
  


  Future<bool> isOldMyBuddiesList()async{
    int ageDB = await _dbRepository.listMyBuddiesAge();
    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int deltaAge = now - ageDB;
    if(deltaAge >= MaxAge){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isEmptyMyBuddiesListDB() async {
    var my_buddies;
    my_buddies = await _dbRepository.loadMyBuddiesList('');
    if ((my_buddies != null) || (my_buddies != [])){
      return false;
    }else {
      return true;
    }
  }
   Future<MyBuddiesListingModel?> getMyBuddiesList(String url, int page)async{
  MyBuddiesListingModel? my_buddies ;

   if(page == 1){
			//await _dbRepository.deleteAllMyBuddiesList();
            my_buddies = await _apiProvider.getListMyBuddies(url, page)
                  .then((responseMyBuddiesList) {
                    _loadAndSaveMyBuddiesList1(responseMyBuddiesList, '', page);
					return responseMyBuddiesList;
                  });
   }else{
      my_buddies = await _apiProvider.getListMyBuddies(url, page)
                  .then((responseMyBuddiesList) {
				  try{
				      return  _loadAndSaveMyBuddiesList(responseMyBuddiesList, '', page);
				  }catch(_){
				    return null;
				  }

                  });
   }  

	  return my_buddies;
	}



Future<MyBuddiesListingModel?> getMyBuddiesListSearch(String url, int page)async{
  MyBuddiesListingModel? my_buddies ;   
  my_buddies = await _apiProvider.getListMyBuddies(url, page)
		  .then((responseMyBuddiesList) {
		  
   if(page == -1 ){
        return  _loadAndSaveMyBuddiesListSearch(responseMyBuddiesList, '', responseMyBuddiesList.tools.paging.total_pages);
      }else{
        return  _loadAndSaveMyBuddiesListSearch(responseMyBuddiesList, '', page);
      }
		  
		  
			
		  }); 
  return my_buddies;
}


Future<MyBuddiesListingModel> _loadAndSaveMyBuddiesListSearch(MyBuddiesListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item!.cnt = i ;
      list.items.items[i].item!.age = age;
      list.items.items[i].item!.page = page;
	  list.items.items[i].item!.ttl = '';
	  list.items.items[i].item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item!.sbttl = '';
	  
	  list.items.items[i].item!.pht = list.items.items[i].item!.fav_photo_url;
	  list.items.items[i].item!.ttl = list.items.items[i].item!.fav_user_name;
	  list.items.items[i].item!.sbttl = list.items.items[i].item!.fav_self_introduction;
    }
    return list;
 }

Future<MyBuddiesListingModel?> _loadAndSaveMyBuddiesList(MyBuddiesListingModel list, String searchKey, int page) async{
    MyBuddiesListingModel? appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyBuddiesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyBuddiesModel my_buddies;
      my_buddies = list.items.items[i];
      my_buddies.item!.cnt = i ;
      my_buddies.item!.age = age;
      my_buddies.item!.page = page;
	  my_buddies.item!.ttl = '';
	  my_buddies.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_buddies.item!.sbttl = '';
	  
	  my_buddies.item!.id = my_buddies.item!.buddy_id; 
	  
	  my_buddies.item!.pht = my_buddies.item!.fav_photo_url;
	  my_buddies.item!.ttl = my_buddies.item!.fav_user_name;
	  my_buddies.item!.sbttl = my_buddies.item!.fav_self_introduction;
      await _dbRepository.saveOrUpdateMyBuddiesList(my_buddies);
    }
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyBuddiesList(searchKey)) ;
    return appList;
  }

Future<void> _loadAndSaveMyBuddiesList1(MyBuddiesListingModel list, String searchKey, int page) async{
    MyBuddiesListingModel appList = list;
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	await _dbRepository.saveOrUpdateMyBuddiesListInfo(list);
	
    for(var i = 0; i < list.items.items.length ; i++){
      ItemMyBuddiesModel my_buddies;
      my_buddies = list.items.items[i];
      my_buddies.item!.cnt = i ;
      my_buddies.item!.age = age;
      my_buddies.item!.page = page;
	  my_buddies.item!.ttl = '';
	  my_buddies.item!.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  my_buddies.item!.sbttl = '';
	  
	  my_buddies.item!.id = my_buddies.item!.buddy_id; 
	  
	  my_buddies.item!.pht = my_buddies.item!.fav_photo_url;
	  my_buddies.item!.ttl = my_buddies.item!.fav_user_name;
	  my_buddies.item!.sbttl = my_buddies.item!.fav_self_introduction;
      await _dbRepository.saveOrUpdateMyBuddiesList(my_buddies);
    }

  }


  Future<MyBuddiesListingModel> loadMyBuddiesList( String searchKey) async{
    MyBuddiesListingModel appList = await _dbRepository.loadMyBuddiesListInfo('');
	appList.items.items.clear();
    appList.items.items.addAll(await _dbRepository.loadMyBuddiesList(searchKey)) ;
    return appList;
  }

  Future getMyBuddiesEdit(String url, String id, String title)async{
    var editMyBuddies;
    editMyBuddies = await _apiProvider.getDataMyBuddies(url, id, title);
    return editMyBuddies;
  }

  Future getMyBuddiesView(String url, String id, String title)async{
    var  viewMyBuddies;
    viewMyBuddies = await _apiProvider.getViewDataMyBuddies(url, id, title);
    return viewMyBuddies;
  }

  Future sendMyBuddiesPost(String url, var formdata)async{
    var postMyBuddies;
    postMyBuddies = await _apiProvider.sendDataMyBuddies(url, formdata);
    return postMyBuddies;
  }
  
   Future sendMyBuddiesPostWithID(String url, var formdata, String id, String title)async{
    var postMyBuddies;
    postMyBuddies = await _apiProvider.sendDataWithIDMyBuddies(url, formdata, id, title);
    return postMyBuddies;
  }
  
    Future getRemoveMyBuddiesEdit(String url, String id, String title)async{
    var editRemove;
    editRemove = await _apiProvider.getDataRemoveMyBuddies(url, id, title);
    return editRemove;
  }

  Future getRemoveMyBuddiesView(String url, String id, String title)async{
    var  viewRemove;
    viewRemove = await _apiProvider.getDataRemoveMyBuddies(url, id, title);
    return viewRemove;
  }

  Future sendRemoveMyBuddiesPost(String url, var formdata)async{
    var postRemove;
    postRemove = await _apiProvider.sendDataRemoveMyBuddies(url, formdata);
    return postRemove;
  }
  
   Future sendRemoveMyBuddiesPostWithID(String url, var formdata, String id, String title)async{
    var postRemove;
    postRemove = await _apiProvider.sendDataWithIDRemoveMyBuddies(url, formdata, id, title);
    return postRemove;
  }
  
    Future<RemoveMyBuddiesModel> getRemoveMyBuddies(String url, String id, String title, String spKey)async{
  RemoveMyBuddiesModel my_buddies ;
   RemoveMyBuddiesModel my_buddies1 ;
          var data ;
			  if(['PlaceNewBid'].contains('Remove')){
			 my_buddies1 = await _apiProvider.getDataRemoveMyBuddies(url, id, title)
					  .then((responseRemoveMyBuddies) {
					   
						return responseRemoveMyBuddies;
					  });
			spKey = my_buddies1.model.model.project_title;
			print('ini spKey = $spKey');
			}else if(['AskOwner'].contains('Remove')){
			 my_buddies1 = await _apiProvider.getDataRemoveMyBuddies(url, id, title)
					  .then((responseRemoveMyBuddies) {
					   
						return responseRemoveMyBuddies;
					  });
			spKey = my_buddies1.model.model.project_id.toString();
			}
			else if(['HireMe'].contains('Remove')){
			 my_buddies1 = await _apiProvider.getDataRemoveMyBuddies(url, id, title)
					  .then((responseRemoveMyBuddies) {
					   
						return responseRemoveMyBuddies;
					  });
			spKey = my_buddies1.model.model.private_worker_id.toString();
			}
			else if(['InviteToBid'].contains('Remove')){
			 my_buddies1 = await _apiProvider.getDataRemoveMyBuddies(url, id, title)
					  .then((responseRemoveMyBuddies) {
					   
						return responseRemoveMyBuddies;
					  });
			spKey = my_buddies1.model.model.user_id;
			}else{
			spKey = '';
			}

		    
            try{
			 data  =  await loadRemoveMyBuddies(spKey);
			}catch(e){
			
			}
			
			if(data == null){
			print('ini spKey1 = $spKey');
			  my_buddies = await _apiProvider.getDataRemoveMyBuddies(url, id, title)
                  .then((responseRemoveMyBuddies) {
                    saveOrUpdateRemoveMyBuddies(responseRemoveMyBuddies, spKey, 1 );
					return responseRemoveMyBuddies;
                  });
			  return my_buddies;  
			}else{
			print('ini spKey2 = $spKey');
			   return data;
			}
          


	  
	}
   Future<RemoveMyBuddiesModel?> loadRemoveMyBuddies( String searchKey) async{
   return await _dbRepository.loadRemoveMyBuddies(searchKey) ;   
  }
  
   Future<RemoveMyBuddiesModel?> saveOrUpdateRemoveMyBuddies(RemoveMyBuddiesModel my_buddies, String searchKey, int page) async{  
      await _dbRepository.saveOrUpdateRemoveMyBuddies(my_buddies, searchKey);   
    return await _dbRepository. loadRemoveMyBuddies(searchKey) ;  
  }	
  
    Future<void> deleteAllRemoveMyBuddies(String spKey) async{
      return await _dbRepository.deleteAllRemoveMyBuddies(spKey); 
   }
  
  

  //---------------------------------------------------------------------------------------
  
  // non generate parent field api
  Future<ProductCommentsListingModel?> getProductCommentsListAPI(String url, int page)async{
               return await           getProductCommentsList( url, page, _apiProvider, _dbRepository);}
  Future<ProductCommentsListingModel> getProductCommentsListSearchAPI(String url, int page)async{
           return      await          getProductCommentsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ProductReviewsListingModel?> getProductReviewsListAPI(String url, int page)async{
    return await           getProductReviewsList( url, page, _apiProvider, _dbRepository);}
  Future<ProductReviewsListingModel> getProductReviewsListSearchAPI(String url, int page)async{
    return      await          getProductReviewsListSearch(url, page, _apiProvider, _dbRepository);}


  Future<ScreenshotsListingModel?> getScreenshotsListAPI(String url, int page)async{
    return await           getScreenshotsList( url, page, _apiProvider, _dbRepository);}
  Future<ScreenshotsListingModel> getScreenshotsListSearchAPI(String url, int page)async{
    return      await          getScreenshotsListSearch(url, page, _apiProvider, _dbRepository);}


  Future<UserBidsListingModel?> getUserBidsListAPI(String url, int page)async{
    return await           getUserBidsList( url, page, _apiProvider, _dbRepository);}
  Future<UserBidsListingModel> getUserBidsListSearchAPI(String url, int page)async{
    return      await          getUserBidsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ScreenshotsListingModel?> getScreenshotsListAPI1(String url, int page)async{
    return await           getScreenshotsList1( url, page, _apiProvider, _dbRepository);}
  Future<ScreenshotsListingModel> getScreenshotsListSearchAPI1(String url, int page)async{
    return      await          getScreenshotsListSearch1(url, page, _apiProvider, _dbRepository);}

  Future<ServiceCommentsListingModel?> getServiceCommentsListAPI(String url, int page)async{
    return await           getServiceCommentsList( url, page, _apiProvider, _dbRepository);}
  Future<ServiceCommentsListingModel> getServiceCommentsListSearchAPI(String url, int page)async{
    return      await          getServiceCommentsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ServiceReviewsListingModel?> getServiceReviewsListAPI(String url, int page)async{
    return await           getServiceReviewsList( url, page, _apiProvider, _dbRepository);}
  Future<ServiceReviewsListingModel> getServiceReviewsListSearchAPI(String url, int page)async{
    return      await          getServiceReviewsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<AsProjectOwnerListingModel?> getAsProjectOwnerListAPI(String url, int page)async{
    return await           getAsProjectOwnerList( url, page, _apiProvider, _dbRepository);}
  Future<AsProjectOwnerListingModel> getAsProjectOwnerListSearchAPI(String url, int page)async{
    return      await          getAsProjectOwnerListSearch(url, page, _apiProvider, _dbRepository);}

  Future<AsProjectWorkerListingModel?> getAsProjectWorkerListAPI(String url, int page)async{
    return await           getAsProjectWorkerList( url, page, _apiProvider, _dbRepository);}
  Future<AsProjectWorkerListingModel> getAsProjectWorkerListSearchAPI(String url, int page)async{
    return      await          getAsProjectWorkerListSearch(url, page, _apiProvider, _dbRepository);}

  Future<PortofolioListingModel?> getPortofolioListAPI(String url, int page)async{
    return await           getPortofolioList( url, page, _apiProvider, _dbRepository);}
  Future<PortofolioListingModel> getPortofolioListSearchAPI(String url, int page)async{
    return      await          getPortofolioListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ProductsListingModel?> getProductsListAPI(String url, int page)async{
    return await           getProductsList( url, page, _apiProvider, _dbRepository);}
  Future<ProductsListingModel> getProductsListSearchAPI(String url, int page)async{
    return      await          getProductsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ServicesListingModel?> getServicesListAPI(String url, int page)async{
    return await           getServicesList( url, page, _apiProvider, _dbRepository);}
  Future<ServicesListingModel> getServicesListSearchAPI(String url, int page)async{
    return      await          getServicesListSearch(url, page, _apiProvider, _dbRepository);}

  Future<UserArbitrationsListingModel?> getUserArbitrationsListAPI(String url, int page)async{
    return await           getUserArbitrationsList( url, page, _apiProvider, _dbRepository);}
  Future<UserArbitrationsListingModel> getUserArbitrationsListSearchAPI(String url, int page)async{
    return      await          getUserArbitrationsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<CartItemsListingModel?> getCartItemsListAPI(String url, int page)async{
    return await           getCartItemsList( url, page, _apiProvider, _dbRepository);}
  Future<CartItemsListingModel> getCartItemsListSearchAPI(String url, int page)async{
    return      await          getCartItemsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<CheckoutItemsListingModel?> getCheckoutItemsListAPI(String url, int page)async{
    return await           getCheckoutItemsList( url, page, _apiProvider, _dbRepository);}
  Future<CheckoutItemsListingModel> getCheckoutItemsListSearchAPI(String url, int page)async{
    return      await          getCheckoutItemsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ShowConversationListingModel?> getShowConversationListAPI(String url, int page)async{
    return await           getShowConversationList( url, page, _apiProvider, _dbRepository);}
  Future<ShowConversationListingModel> getShowConversationListSearchAPI(String url, int page)async{
    return      await          getShowConversationListSearch(url, page, _apiProvider, _dbRepository);}

  Future<CreditHistoryListingModel?> getCreditHistoryListAPI(String url, int page)async{
    return await           getCreditHistoryList( url, page, _apiProvider, _dbRepository);}
  Future<CreditHistoryListingModel> getCreditHistoryListSearchAPI(String url, int page)async{
    return      await          getCreditHistoryListSearch(url, page, _apiProvider, _dbRepository);}

  Future<PaymentHistoryListingModel?> getPaymentHistoryListAPI(String url, int page)async{
    return await           getPaymentHistoryList( url, page, _apiProvider, _dbRepository);}
  Future<PaymentHistoryListingModel> getPaymentHistoryListSearchAPI(String url, int page)async{
    return      await          getPaymentHistoryListSearch(url, page, _apiProvider, _dbRepository);}

  Future<PointsAffiliateListingModel?> getPointsAffiliateListAPI(String url, int page)async{
    return await           getPointsAffiliateList( url, page, _apiProvider, _dbRepository);}
  Future<PointsAffiliateListingModel> getPointsAffiliateListSearchAPI(String url, int page)async{
    return      await          getPointsAffiliateListSearch(url, page, _apiProvider, _dbRepository);}

  Future<PointsBuyerListingModel?> getPointsBuyerListAPI(String url, int page)async{
    return await           getPointsBuyerList( url, page, _apiProvider, _dbRepository);}
  Future<PointsBuyerListingModel> getPointsBuyerListSearchAPI(String url, int page)async{
    return      await          getPointsBuyerListSearch(url, page, _apiProvider, _dbRepository);}

  Future<PointsOwnerListingModel?> getPointsOwnerListAPI(String url, int page)async{
    return await           getPointsOwnerList( url, page, _apiProvider, _dbRepository);}
  Future<PointsOwnerListingModel> getPointsOwnerListSearchAPI(String url, int page)async{
    return      await          getPointsOwnerListSearch(url, page, _apiProvider, _dbRepository);}

  Future<PointsPestaListingModel?> getPointsPestaListAPI(String url, int page)async{
    return await           getPointsPestaList( url, page, _apiProvider, _dbRepository);}
  Future<PointsPestaListingModel> getPointsPestaListSearchAPI(String url, int page)async{
    return      await          getPointsPestaListSearch(url, page, _apiProvider, _dbRepository);}

  Future<PointsSellerListingModel?> getPointsSellerListAPI(String url, int page)async{
    return await           getPointsSellerList( url, page, _apiProvider, _dbRepository);}
  Future<PointsSellerListingModel> getPointsSellerListSearchAPI(String url, int page)async{
    return      await          getPointsSellerListSearch(url, page, _apiProvider, _dbRepository);}

  Future<PointsWorkerListingModel?> getPointsWorkerListAPI(String url, int page)async{
    return await           getPointsWorkerList( url, page, _apiProvider, _dbRepository);}
  Future<PointsWorkerListingModel> getPointsWorkerListSearchAPI(String url, int page)async{
    return      await          getPointsWorkerListSearch(url, page, _apiProvider, _dbRepository);}

  Future<CommentsListingModel?> getCommentsListAPI(String url, int page)async{
    return await           getCommentsList( url, page, _apiProvider, _dbRepository);}
  Future<CommentsListingModel> getCommentsListSearchAPI(String url, int page)async{
    return      await          getCommentsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<SalesListingModel?> getSalesListAPI(String url, int page)async{
    return await           getSalesList( url, page, _apiProvider, _dbRepository);}
  Future<SalesListingModel> getSalesListSearchAPI(String url, int page)async{
    return      await          getSalesListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ScreenshotsListingModel?> getScreenshotsListAPI2(String url, int page)async{
    return await           getScreenshotsList2( url, page, _apiProvider, _dbRepository);}
  Future<ScreenshotsListingModel> getScreenshotsListSearchAPI2(String url, int page)async{
    return      await          getScreenshotsListSearch2(url, page, _apiProvider, _dbRepository);}

  Future<PortofolioListingModel?> getPortofolioListAPI1(String url, int page)async{
    return await           getPortofolioList1( url, page, _apiProvider, _dbRepository);}
  Future<PortofolioListingModel> getPortofolioListSearchAPI1(String url, int page)async{
    return      await          getPortofolioListSearch1(url, page, _apiProvider, _dbRepository);}

  Future<ShortlistedBidsListingModel?> getShortlistedBidsListAPI(String url, int page)async{
    return await           getShortlistedBidsList( url, page, _apiProvider, _dbRepository);}
  Future<ShortlistedBidsListingModel> getShortlistedBidsListSearchAPI(String url, int page)async{
    return      await          getShortlistedBidsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ShowBidsListingModel?> getShowBidsListAPI(String url, int page)async{
    return await           getShowBidsList( url, page, _apiProvider, _dbRepository);}
  Future<ShowBidsListingModel> getShowBidsListSearchAPI(String url, int page)async{
    return      await          getShowBidsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ShowConversationListingModel?> getShowConversationListAPI1(String url, int page)async{
    return await           getShowConversationList1( url, page, _apiProvider, _dbRepository);}
  Future<ShowConversationListingModel> getShowConversationListSearchAPI1(String url, int page)async{
    return      await          getShowConversationListSearch1(url, page, _apiProvider, _dbRepository);}

  Future<ShowFilesListingModel?> getShowFilesListAPI(String url, int page)async{
    return await           getShowFilesList( url, page, _apiProvider, _dbRepository);}
  Future<ShowFilesListingModel> getShowFilesListSearchAPI(String url, int page)async{
    return      await          getShowFilesListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ShowThreadListingModel?> getShowThreadListAPI(String url, int page)async{
    return await           getShowThreadList( url, page, _apiProvider, _dbRepository);}
  Future<ShowThreadListingModel> getShowThreadListSearchAPI(String url, int page)async{
    return      await          getShowThreadListSearch(url, page, _apiProvider, _dbRepository);}

  Future<ReferalsListingModel?> getReferalsListAPI(String url, int page)async{
    return await           getReferalsList( url, page, _apiProvider, _dbRepository);}
  Future<ReferalsListingModel> getReferalsListSearchAPI(String url, int page)async{
    return      await          getReferalsListSearch(url, page, _apiProvider, _dbRepository);}

  Future<CommentsListingModel?> getCommentsListAPI1(String url, int page)async{
    return await           getCommentsList1( url, page, _apiProvider, _dbRepository);}
  Future<CommentsListingModel> getCommentsListSearchAPI1(String url, int page)async{
    return      await          getCommentsListSearch1(url, page, _apiProvider, _dbRepository);}
  Future<SalesListingModel?> getSalesListAPI1(String url, int page)async{
    return await           getSalesList1( url, page, _apiProvider, _dbRepository);}
  Future<SalesListingModel> getSalesListSearchAPI1(String url, int page)async{
    return      await          getSalesListSearch1(url, page, _apiProvider, _dbRepository);}

  Future<ScreenshotsListingModel?> getScreenshotsListAPI3(String url, int page)async{
    return await           getScreenshotsList3( url, page, _apiProvider, _dbRepository);}
  Future<ScreenshotsListingModel> getScreenshotsListSearchAPI3(String url, int page)async{
    return      await          getScreenshotsListSearch3(url, page, _apiProvider, _dbRepository);}
  Future<UserBidsListingModel?> getUserBidsListAPI1(String url, int page)async{
    return await           getUserBidsList1( url, page, _apiProvider, _dbRepository);}
  Future<UserBidsListingModel> getUserBidsListSearchAPI1(String url, int page)async{
    return      await          getUserBidsListSearch1(url, page, _apiProvider, _dbRepository);}

 // end non generate api
}

