import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:projectscoid/models/model.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/core/components/utility/http/HttpException.dart';
import 'package:projectscoid/core/components/utility/log/DioLogger.dart';
import 'package:sprintf/sprintf.dart';
//import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'dart:convert';
import 'dart:developer' as l;


//non generate import
part 'package:projectscoid/api/BrowseProducts/product_comments_api.dart';
part 'package:projectscoid/api/BrowseProducts/product_reviews_api.dart';
part 'package:projectscoid/api/BrowseProducts/screenshots_api.dart';

part 'package:projectscoid/api/BrowseProjects/user_bids_api.dart';

part 'package:projectscoid/api/BrowseServices/screenshots_api.dart';
part 'package:projectscoid/api/BrowseServices/service_comments_api.dart';
part 'package:projectscoid/api/BrowseServices/service_reviews_api.dart';


part 'package:projectscoid/api/BrowseUsers/as_project_owner_api.dart';
part 'package:projectscoid/api/BrowseUsers/as_project_worker_api.dart';
part 'package:projectscoid/api/BrowseUsers/portofolio_api.dart';
part 'package:projectscoid/api/BrowseUsers/products_api.dart';
part 'package:projectscoid/api/BrowseUsers/services_api.dart';
part 'package:projectscoid/api/BrowseUsers/user_arbitrations_api.dart';


part 'package:projectscoid/api/Cart/cart_items_api.dart';

part 'package:projectscoid/api/Checkout/checkout_items_api.dart';

part 'package:projectscoid/api/MyBids/show_conversation_api.dart';

part 'package:projectscoid/api/MyFinance/credit_history_api.dart';
part 'package:projectscoid/api/MyFinance/payment_history_api.dart';



part 'package:projectscoid/api/MyPoints/points_affiliate_api.dart';
part 'package:projectscoid/api/MyPoints/points_buyer_api.dart';
part 'package:projectscoid/api/MyPoints/points_owner_api.dart';
part 'package:projectscoid/api/MyPoints/points_pesta_api.dart';
part 'package:projectscoid/api/MyPoints/points_seller_api.dart';
part 'package:projectscoid/api/MyPoints/points_worker_api.dart';


part 'package:projectscoid/api/MyProducts/comments_api.dart';
part 'package:projectscoid/api/MyProducts/sales_api.dart';
part 'package:projectscoid/api/MyProducts/screenshots_api.dart';


part 'package:projectscoid/api/MyProfile/portofolio_api.dart';


part 'package:projectscoid/api/MyProjects/shortlisted_bids_api.dart';
part 'package:projectscoid/api/MyProjects/show_bids_api.dart';
part 'package:projectscoid/api/MyProjects/show_conversation_api.dart';
part 'package:projectscoid/api/MyProjects/show_files_api.dart';
part 'package:projectscoid/api/MyProjects/show_thread_api.dart';

part 'package:projectscoid/api/MyReferals/referals_api.dart';

part 'package:projectscoid/api/MyServices/comments_api.dart';
part 'package:projectscoid/api/MyServices/sales_api.dart';
part 'package:projectscoid/api/MyServices/screenshots_api.dart';

part 'package:projectscoid/api/PastProjects/user_bids_api.dart';

///////////////////



class APIProvider {
  static const String TAG = 'APIProvider';
  Dio? dio;
 String? appDoc;
  CookieJar? cookieJar;
  Directory? _downloadsDirectory;
  var cj;
 APIProvider(this.appDoc){
/*
    getApplicationDocumentsDirectory().then((value){
      var path = value.path;
*/
      cj = PersistCookieJar(storage: FileStorage('$appDoc/.cookies/'), ignoreExpires: true);
      BaseOptions dioOptions =  BaseOptions()//(contentType: ContentType.json, responseType: ResponseType.plain)
        ..baseUrl = '';//APIProvider._baseUrl;
      dio = Dio(dioOptions);
      dio!.interceptors.add(CookieManager(cj));
     if(EnvType.DEVELOPMENT == Env.value!.environmentType || EnvType.STAGING == Env.value!.environmentType){

        //  dio!.interceptors.add(CookieManager(cookieJar));
        

        dio!.interceptors.add(InterceptorsWrapper(
            onRequest:(options,  handler){
              DioLogger.onSend(TAG, options);
              return handler.next(options);
            },
            onResponse: (response, handler){
              DioLogger.onSuccess(TAG, response);
              return handler.next(response);
            },
            onError: (DioError e, handler){
              DioLogger.onError(TAG, e);
              return handler.next(e);
            }
        ));


      }

   // });
  }
  
  
  
 Future<String> getCookies(String url) async {
    // url = 'https://api.projects.co.id';
    // dio!.interceptors..add(LogInterceptor())..add(CookieManager(cookieJar));
    await dio!.get(url);
    var ck = await cj.loadForRequest(Uri.parse(url));
    return CookieManager.getCookies(ck);
  }
  
    /////

  Future         getListProductComments(String url, int page) async{
    return await getListProductCommentsApi(url, page, dio!);
  }
  Future         getListProductReviews(String url, int page) async{
    return await getListProductReviewsApi(url, page, dio!);
  }
  Future         getListScreenshots(String url, int page) async{
    return await getListScreenshotsApi(url, page, dio!);
  }



  Future         getListUserBids(String url, int page) async{
    return await getListUserBidsApi(url, page, dio!);
  }


  Future         getListBrowseServicesScreenshots(String url, int page) async{
    return await getListBrowseServicesScreenshotsApi(url, page, dio!);
  }

  Future         getListServiceComments(String url, int page) async{
    return await getListServiceCommentsApi(url, page, dio!);
  }

  Future         getListServiceReviews(String url, int page) async{
    return await getListServiceReviewsApi(url, page, dio!);
  }



  Future         getListAsProjectOwner(String url, int page) async{
    return await getListAsProjectOwnerApi(url, page, dio!);
  }

  Future         getListAsProjectWorker(String url, int page) async{
    return await getListAsProjectWorkerApi(url, page, dio!);
  }

  Future         getListPortofolio(String url, int page) async{
    return await getListPortofolioApi(url, page, dio!);
  }

  Future         getListProducts(String url, int page) async{
    return await getListProductsApi(url, page, dio!);
  }

  Future         getListServices(String url, int page) async{
    return await getListServicesApi(url, page, dio!);
  }

  Future         getListUserArbitrations(String url, int page) async{
    return await getListUserArbitrationsApi(url, page, dio!);
  }



  Future         getListCartItems(String url, int page) async{
    return await getListCartItemsApi(url, page, dio!);
  }



  Future         getListCheckoutItems(String url, int page) async{
    return await getListCheckoutItemsApi(url, page, dio!);
  }



  Future         getListShowConversation(String url, int page) async{
    return await getListShowConversationApi(url, page, dio!);
  }



  Future         getListCreditHistory(String url, int page) async{
    return await getListCreditHistoryApi(url, page, dio!);
  }

  Future         getListPaymentHistory(String url, int page) async{
    return await getListPaymentHistoryApi(url, page, dio!);
  }





  Future         getListPointsAffiliate(String url, int page) async{
    return await getListPointsAffiliateApi(url, page, dio!);
  }

  Future         getListPointsBuyer(String url, int page) async{
    return await getListPointsBuyerApi(url, page, dio!);
  }

  Future         getListPointsOwner(String url, int page) async{
    return await getListPointsOwnerApi(url, page, dio!);
  }

  Future         getListPointsPesta(String url, int page) async{
    return await getListPointsPestaApi(url, page, dio!);
  }

  Future         getListPointsSeller(String url, int page) async{
    return await getListPointsSellerApi(url, page, dio!);
  }

  Future         getListPointsWorker(String url, int page) async{
    return await getListPointsWorkerApi(url, page, dio!);
  }




  Future         getListComments(String url, int page) async{
    return await getListCommentsApi(url, page, dio!);
  }

  Future         getListSales(String url, int page) async{
    return await getListSalesApi(url, page, dio!);
  }

  Future         getListMyProductsScreenshots(String url, int page) async{
    return await getListMyProductsScreenshotsApi(url, page, dio!);
  }



  Future         getListMyProfilePortofolio(String url, int page) async{
    return await getListMyProfilePortofolioApi(url, page, dio!);
  }



  Future         getListShortlistedBids(String url, int page) async{
    return await getListShortlistedBidsApi(url, page, dio!);
  }

  Future         getListShowBids(String url, int page) async{
    return await getListShowBidsApi(url, page, dio!);
  }

  Future         getListMyProjectsShowConversation(String url, int page) async{
    return await getListMyProjectsShowConversationApi(url, page, dio!);
  }

  Future         getListShowFiles(String url, int page) async{
    return await getListShowFilesApi(url, page, dio!);
  }

  Future         getListShowThread(String url, int page) async{
    return await getListShowThreadApi(url, page, dio!);
  }




  Future         getListReferals(String url, int page) async{
    return await getListReferalsApi(url, page, dio!);
  }



  Future         getListMyServicesComments(String url, int page) async{
    return await getListMyServicesCommentsApi(url, page, dio!);
  }

  Future         getListMyServicesSales(String url, int page) async{
    return await getListMyServicesSalesApi(url, page, dio!);
  }

  Future         getListMyServicesScreenshots(String url, int page) async{
    return await getListMyServicesScreenshotsApi(url, page, dio!);
  }



  Future         getListPastProjectsUserBids(String url, int page) async{
    return await getListPastProjectsUserBidsApi(url, page, dio!);
  }



  ///////
  
  Future getList(String url, int page) async{
    dio!.options.connectTimeout = 15000;
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
    Response response = await dio!.get(sprintf(url, [page]));
    throwIfNoSuccess(response);
    return response.data;
  }
    Future getData(String url) async {
	dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
   	Response response = await dio!.get(url);
	// l.log('dataku ==== ${response.data}');
    throwIfNoSuccess(response);
    return response.data;
  }
  
   Future getDataRC(String url) async {
    dio!.options.connectTimeout = 15000;
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
    Response response = await dio!.get(url);
    // l.log('dataku ==== ${response.data}');
   // throwIfNoSuccess(response);
    return response.statusCode;
  }
  
  
 Future getPurchaseDownload(String url) async {


    Uri handleRedirects(Response r, int statusCode) {
      var redirects = 0;
      var redirecturl ;
   
        print("redirect #${redirects++}");
        redirecturl = r.headers['location']![0];
       
  
      return Uri.parse(redirecturl);
    }

    dio!.options.connectTimeout = 15000;
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
   // dio!.options.followRedirects = false;
    dio!.options.receiveDataWhenStatusError = true;
  //  dio!.options.validateStatus = (status) { return status < 500; };
    //l.log('dataku ==== horeee');


    var loc;
    Response? response ;
    // l.log('dataku ==== ${response.statusCode.toString()}');



    try{
      response = await dio!.get(url,
      options:  Options(
          followRedirects: false,
          validateStatus: (status) { return status! < 500; }
      ),);

     // data =  PlaceNewBidBrowseProjectsModel(response.data);
     // l.log('dataku ==== mantap');
     var res = handleRedirects(response, 302);
      loc = res;
    }catch(e){ 
      l.log('dataku ==== ${e.toString()}');
      loc = response!.redirects.first.location;
    }

   // throwIfNoSuccess(response);
    return loc;
   // return response.redirects.first.location;
   // return response.redirects.first.location;

  }
 Future getData1(String url) async {
   // Timer _timer;
   // dio!.options.connectTimeout = 15000;
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
    Response response;

    dio!.get(url);
    //dio!.get(Env.value.baseUrl + '/user/cart/view');
   // dio!.get(Env.value.baseUrl + '/user/cart/view');
    await dio!.get(Env.value!.baseUrl! + '/user/cart/view');
    response = await dio!.get(Env.value!.baseUrl! + '/user/cart/view');

   // throwIfNoSuccess(response);
    return response.data;

    // l.log('dataku ==== ${response.data}');

  }

  //getDataHome
  Future getDataHome(String url) async{
  dio!.options.connectTimeout = 15000;
    // final future = TestListingAPI();
   // PublicHomeModel datahome;
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
    Response response = await dio!.get(url);
    throwIfNoSuccess(response);
    final data = PublicHomeModel.fromJson(response.data);
    return data;
  }
  //EndDataHome
    Future sendData(String url, var formdata) async{
	dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

//Home
  Future getListHome(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  // var data = await  HomeListingAPI();
    HomeListingModel home;
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
   // Response response = await dio!.get(sprintf(url, [page]));
   Response response = await dio!.get(sprintf(url, [page]));
	final data = HomeListingModel(response.data);
   return data;
	//print(json.encode(data));
   // return data;
  }

 /* Future getDataHome(String url, String id, String title) async {
    final future = HomeAPI();
	//final future = projectsJson();
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
     // return HomeModel.fromJson(value);
    });
    return data;
  } */

  Future sendDataHome(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDHome(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
  Future getDataPage(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
    Response response = await dio!.get(sprintf(url, [title]));
   // final data = future.then((value) {
   //   return Page.fromJson(value);
   // });
	var data;
	 data =  Page1.fromJson(response.data);
    return data;
  }


  Future getListTest(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = TestListingAPI();
   TestListingModel test;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = TestListingModel(response.data);
	return data;

  
  }

  Future getDataTest(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = TestAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = TestModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  TestModel(response.data);
    return data;
  }

  Future getViewDataTest(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = TestViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = TestViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  TestViewModel(response.data);

    return data;
  }

  Future sendDataTest(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDTest(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListTestimonial(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = TestimonialListingAPI();
   TestimonialListingModel testimonial;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = TestimonialListingModel(response.data);
	return data;

  
  }

  Future getDataTestimonial(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = TestimonialAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = TestimonialModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  TestimonialModel(response.data);
    return data;
  }

  Future getViewDataTestimonial(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = TestimonialViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = TestimonialViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  TestimonialViewModel(response.data);

    return data;
  }

  Future sendDataTestimonial(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDTestimonial(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListCeritaSukses(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = CeritaSuksesListingAPI();
   CeritaSuksesListingModel cerita_sukses;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = CeritaSuksesListingModel(response.data);
	return data;

  
  }

  Future getDataCeritaSukses(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = CeritaSuksesAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = CeritaSuksesModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  CeritaSuksesModel(response.data);
    return data;
  }

  Future getViewDataCeritaSukses(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = CeritaSuksesViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = CeritaSuksesViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  CeritaSuksesViewModel(response.data);

    return data;
  }

  Future sendDataCeritaSukses(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDCeritaSukses(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListTips(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = TipsListingAPI();
   TipsListingModel tips;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = TipsListingModel(response.data);
	return data;

  
  }

  Future getDataTips(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = TipsAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = TipsModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  TipsModel(response.data);
    return data;
  }

  Future getViewDataTips(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = TipsViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = TipsViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  TipsViewModel(response.data);

    return data;
  }

  Future sendDataTips(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDTips(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListBrowseProjects(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = BrowseProjectsListingAPI();
   BrowseProjectsListingModel browse_projects;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = BrowseProjectsListingModel(response.data);
	return data;

  
  }

  Future getDataBrowseProjects(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = BrowseProjectsAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = BrowseProjectsModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  BrowseProjectsModel(response.data);
    return data;
  }

  Future getViewDataBrowseProjects(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = BrowseProjectsViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = BrowseProjectsViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  BrowseProjectsViewModel(response.data);

    return data;
  }

  Future sendDataBrowseProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDBrowseProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListPastProjects(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = PastProjectsListingAPI();
   PastProjectsListingModel past_projects;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = PastProjectsListingModel(response.data);
	return data;

  
  }

  Future getDataPastProjects(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = PastProjectsAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PastProjectsModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  PastProjectsModel(response.data);
    return data;
  }

  Future getViewDataPastProjects(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = PastProjectsViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = PastProjectsViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  PastProjectsViewModel(response.data);

    return data;
  }

  Future sendDataPastProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPastProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListNewUser(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = NewUserListingAPI();
   NewUserListingModel new_user;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = NewUserListingModel(response.data);
	return data;

  
  }

  Future getDataNewUser(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = NewUserAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = NewUserModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  NewUserModel(response.data);
    return data;
  }

  Future getViewDataNewUser(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = NewUserViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = NewUserViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;

    return data;
  }

  Future sendDataNewUser(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDNewUser(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListProgram(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = ProgramListingAPI();
   ProgramListingModel program;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = ProgramListingModel(response.data);
	return data;

  
  }

  Future getDataProgram(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = ProgramAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ProgramModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  ProgramModel(response.data);
    return data;
  }

  Future getViewDataProgram(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = ProgramViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = ProgramViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;

    return data;
  }

  Future sendDataProgram(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDProgram(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListExistingUser(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = ExistingUserListingAPI();
   ExistingUserListingModel existing_user;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = ExistingUserListingModel(response.data);
	return data;

  
  }

  Future getDataExistingUser(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = ExistingUserAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ExistingUserModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  ExistingUserModel(response.data);
    return data;
  }

  Future getViewDataExistingUser(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = ExistingUserViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = ExistingUserViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;

    return data;
  }

  Future sendDataExistingUser(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDExistingUser(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListSupport(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = SupportListingAPI();
   SupportListingModel support;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = SupportListingModel(response.data);
	return data;

  
  }

  Future getDataSupport(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = SupportAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = SupportModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  SupportModel(response.data);
    return data;
  }

  Future getViewDataSupport(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = SupportViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = SupportViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  SupportViewModel(response.data);

    return data;
  }

  Future sendDataSupport(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDSupport(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListBrowseServices(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = BrowseServicesListingAPI();
   BrowseServicesListingModel browse_services;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = BrowseServicesListingModel(response.data);
	return data;

  
  }

  Future getDataBrowseServices(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = BrowseServicesAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = BrowseServicesModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  BrowseServicesModel(response.data);
    return data;
  }

  Future getViewDataBrowseServices(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = BrowseServicesViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = BrowseServicesViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  BrowseServicesViewModel(response.data);

    return data;
  }

  Future sendDataBrowseServices(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDBrowseServices(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListBrowseUsers(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = BrowseUsersListingAPI();
   BrowseUsersListingModel browse_users;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = BrowseUsersListingModel(response.data);
	return data;

  
  }

  Future getDataBrowseUsers(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = BrowseUsersAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = BrowseUsersModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  BrowseUsersModel(response.data);
    return data;
  }

  Future getViewDataBrowseUsers(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = BrowseUsersViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = BrowseUsersViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  BrowseUsersViewModel(response.data);

    return data;
  }

  Future sendDataBrowseUsers(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDBrowseUsers(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListBrowseProducts(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = BrowseProductsListingAPI();
   BrowseProductsListingModel browse_products;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = BrowseProductsListingModel(response.data);
	return data;

  
  }

  Future getDataBrowseProducts(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = BrowseProductsAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = BrowseProductsModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  BrowseProductsModel(response.data);
    return data;
  }

  Future getViewDataBrowseProducts(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = BrowseProductsViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = BrowseProductsViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  BrowseProductsViewModel(response.data);

    return data;
  }

  Future sendDataBrowseProducts(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDBrowseProducts(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListCart(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = CartListingAPI();
   CartListingModel cart;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = CartListingModel(response.data);
	return data;

  
  }

  Future getDataCart(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = CartAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = CartModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  CartModel(response.data);
    return data;
  }

  Future getViewDataCart(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = CartViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = CartViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  CartViewModel(response.data);

    return data;
  }

  Future sendDataCart(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDCart(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListCheckout(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = CheckoutListingAPI();
   CheckoutListingModel checkout;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = CheckoutListingModel(response.data);
	return data;

  
  }

  Future getDataCheckout(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = CheckoutAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = CheckoutModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  CheckoutModel(response.data);
    return data;
  }

  Future getViewDataCheckout(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = CheckoutViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = CheckoutViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  CheckoutViewModel(response.data);

    return data;
  }

  Future sendDataCheckout(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDCheckout(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListBlog(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = BlogListingAPI();
   BlogListingModel blog;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = BlogListingModel(response.data);
	return data;

  
  }

  Future getDataBlog(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = BlogAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = BlogModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  BlogModel(response.data);
    return data;
  }

  Future getViewDataBlog(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = BlogViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = BlogViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  BlogViewModel(response.data);

    return data;
  }

  Future sendDataBlog(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDBlog(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyProjects(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyProjectsListingAPI();
   MyProjectsListingModel my_projects;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyProjectsListingModel(response.data);
	return data;

  
  }

  Future getDataMyProjects(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyProjectsAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyProjectsModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyProjectsModel(response.data);
    return data;
  }

  Future getViewDataMyProjects(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyProjectsViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyProjectsViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyProjectsViewModel(response.data);

    return data;
  }

  Future sendDataMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyBids(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyBidsListingAPI();
   MyBidsListingModel my_bids;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyBidsListingModel(response.data);
	return data;

  
  }

  Future getDataMyBids(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyBidsAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyBidsModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyBidsModel(response.data);
    return data;
  }

  Future getViewDataMyBids(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyBidsViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyBidsViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;

    return data;
  }

  Future sendDataMyBids(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyBids(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyProducts(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyProductsListingAPI();
   MyProductsListingModel my_products;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyProductsListingModel(response.data);
	return data;

  
  }

  Future getDataMyProducts(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyProductsAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyProductsModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyProductsModel(response.data);
    return data;
  }

  Future getViewDataMyProducts(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyProductsViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyProductsViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyProductsViewModel(response.data);

    return data;
  }

  Future sendDataMyProducts(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyProducts(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyServices(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyServicesListingAPI();
   MyServicesListingModel my_services;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyServicesListingModel(response.data);
	return data;

  
  }

  Future getDataMyServices(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyServicesAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyServicesModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyServicesModel(response.data);
    return data;
  }

  Future getViewDataMyServices(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyServicesViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyServicesViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyServicesViewModel(response.data);

    return data;
  }

  Future sendDataMyServices(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyServices(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMySales(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MySalesListingAPI();
   MySalesListingModel my_sales;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MySalesListingModel(response.data);
	return data;

  
  }
     Future getIndexMySales(String url, int page) async{
  // final future = MySalesListingAPI();
   MySalesIndexModel my_sales;
    Response response = await dio!.get(sprintf(url, [page]));
	final data = MySalesIndexModel(response.data);
   return data;
  }

  Future getDataMySales(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MySalesAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MySalesModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MySalesModel(response.data);
    return data;
  }

  Future getViewDataMySales(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MySalesViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MySalesViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MySalesViewModel(response.data);

    return data;
  }

  Future sendDataMySales(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMySales(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyOrders(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyOrdersListingAPI();
   MyOrdersListingModel my_orders;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyOrdersListingModel(response.data);
	return data;

  
  }
     Future getIndexMyOrders(String url, int page) async{
  // final future = MyOrdersListingAPI();
   MyOrdersIndexModel my_orders;
    Response response = await dio!.get(sprintf(url, [page]));
	final data = MyOrdersIndexModel(response.data);
   return data;
  }

  Future getDataMyOrders(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyOrdersAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyOrdersModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyOrdersModel(response.data);
    return data;
  }

  Future getViewDataMyOrders(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyOrdersViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyOrdersViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyOrdersViewModel(response.data);

    return data;
  }

  Future sendDataMyOrders(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyOrders(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyPurchases(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyPurchasesListingAPI();
   MyPurchasesListingModel my_purchases;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyPurchasesListingModel(response.data);
	return data;

  
  }
     Future getIndexMyPurchases(String url, int page) async{
  // final future = MyPurchasesListingAPI();
   MyPurchasesIndexModel my_purchases;
    Response response = await dio!.get(sprintf(url, [page]));
	final data = MyPurchasesIndexModel(response.data);
   return data;
  }

  Future getDataMyPurchases(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyPurchasesAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyPurchasesModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyPurchasesModel(response.data);
    return data;
  }

  Future getViewDataMyPurchases(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyPurchasesViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyPurchasesViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyPurchasesViewModel(response.data);

    return data;
  }

  Future sendDataMyPurchases(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyPurchases(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyReferals(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyReferalsListingAPI();
   MyReferalsListingModel my_referals;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyReferalsListingModel(response.data);
	return data;

  
  }

  Future getDataMyReferals(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyReferalsAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyReferalsModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyReferalsModel(response.data);
    return data;
  }

  Future getViewDataMyReferals(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyReferalsViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyReferalsViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyReferalsViewModel(response.data);

    return data;
  }

  Future sendDataMyReferals(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyReferals(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyFinance(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyFinanceListingAPI();
   MyFinanceListingModel my_finance;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyFinanceListingModel(response.data);
	return data;

  
  }

  Future getDataMyFinance(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyFinanceAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyFinanceModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyFinanceModel(response.data);
    return data;
  }

  Future getViewDataMyFinance(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyFinanceViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyFinanceViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyFinanceViewModel(response.data);

    return data;
  }

  Future sendDataMyFinance(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyFinance(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyPoints(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyPointsListingAPI();
   MyPointsListingModel my_points;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyPointsListingModel(response.data);
	return data;

  
  }

  Future getDataMyPoints(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyPointsAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyPointsModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyPointsModel(response.data);
    return data;
  }

  Future getViewDataMyPoints(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyPointsViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyPointsViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyPointsViewModel(response.data);

    return data;
  }

  Future sendDataMyPoints(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyPoints(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyProfile(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyProfileListingAPI();
   MyProfileListingModel my_profile;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyProfileListingModel(response.data);
	return data;

  
  }

  Future getDataMyProfile(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyProfileAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyProfileModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyProfileModel(response.data);
    return data;
  }

  Future getViewDataMyProfile(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyProfileViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyProfileViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyProfileViewModel(response.data);

    return data;
  }

  Future sendDataMyProfile(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyProfile(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListKelurahan(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = KelurahanListingAPI();
   KelurahanListingModel kelurahan;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = KelurahanListingModel(response.data);
	return data;

  
  }

  Future getDataKelurahan(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = KelurahanAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = KelurahanModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  KelurahanModel(response.data);
    return data;
  }

  Future getViewDataKelurahan(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = KelurahanViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = KelurahanViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  KelurahanViewModel(response.data);

    return data;
  }

  Future sendDataKelurahan(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDKelurahan(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyPortofolio(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyPortofolioListingAPI();
   MyPortofolioListingModel my_portofolio;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyPortofolioListingModel(response.data);
	return data;

  
  }

  Future getDataMyPortofolio(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyPortofolioAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyPortofolioModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyPortofolioModel(response.data);
    return data;
  }

  Future getViewDataMyPortofolio(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyPortofolioViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyPortofolioViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;

    return data;
  }

  Future sendDataMyPortofolio(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyPortofolio(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyBookmarks(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyBookmarksListingAPI();
   MyBookmarksListingModel my_bookmarks;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyBookmarksListingModel(response.data);
	return data;

  
  }

  Future getDataMyBookmarks(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyBookmarksAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyBookmarksModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyBookmarksModel(response.data);
    return data;
  }

  Future getViewDataMyBookmarks(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyBookmarksViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyBookmarksViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;

    return data;
  }

  Future sendDataMyBookmarks(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyBookmarks(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


  Future getListMyBuddies(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
  // final future = MyBuddiesListingAPI();
   MyBuddiesListingModel my_buddies;
    Response response = await dio!.get(sprintf(url, [page]));

	final data = MyBuddiesListingModel(response.data);
	return data;

  
  }

  Future getDataMyBuddies(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
  /*  final future = MyBuddiesAPI();
	//final future = projectsJson();
    Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = MyBuddiesModel(value);
    });
	return data; */
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	data =  MyBuddiesModel(response.data);
    return data;
  }

  Future getViewDataMyBuddies(String url, String id, String title) async {
  dio!.options.connectTimeout = 15000;
    //final future = MyBuddiesViewAPI();
	//final future = projectsJson();
    //Response response = await dio!.get(sprintf(url, [id,title]));
    //final data = future.then((value) {
	//
	//  var model;
    //  return model = MyBuddiesViewModel(value);
	 // return null;
	//
   // });
dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	dio!.options.connectTimeout = 15000;
	var data;
		   data =  MyBuddiesViewModel(response.data);

    return data;
  }

  Future sendDataMyBuddies(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
  //  dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDMyBuddies(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
     sprintf(url, [id,title]),// url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }


 Future getDataPlaceNewBidBrowseProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PlaceNewBidBrowseProjectsAPI();
	//final future = projectsJson();
	PlaceNewBidBrowseProjectsModel browse_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PlaceNewBidBrowseProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PlaceNewBidBrowseProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PlaceNewBidBrowseProjectsModel(response.data);
    return data;
  }

  Future sendDataPlaceNewBidBrowseProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPlaceNewBidBrowseProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataAskOwnerBrowseProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = AskOwnerBrowseProjectsAPI();
	//final future = projectsJson();
	AskOwnerBrowseProjectsModel browse_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = AskOwnerBrowseProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  AskOwnerBrowseProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  AskOwnerBrowseProjectsModel(response.data);
    return data;
  }

  Future sendDataAskOwnerBrowseProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDAskOwnerBrowseProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataGuestCreateProjectBrowseProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = GuestCreateProjectBrowseProjectsAPI();
	//final future = projectsJson();
	GuestCreateProjectBrowseProjectsModel browse_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = GuestCreateProjectBrowseProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  GuestCreateProjectBrowseProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  GuestCreateProjectBrowseProjectsModel(response.data);
    return data;
  }

  Future sendDataGuestCreateProjectBrowseProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDGuestCreateProjectBrowseProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataRegisterNewUser(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = RegisterNewUserAPI();
	//final future = projectsJson();
	RegisterNewUserModel new_user;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = RegisterNewUserModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  RegisterNewUserModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  RegisterNewUserModel(response.data);
    return data;
  }

  Future sendDataRegisterNewUser(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDRegisterNewUser(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataVerifyNewUser(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = VerifyNewUserAPI();
	//final future = projectsJson();
	VerifyNewUserModel new_user;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = VerifyNewUserModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  VerifyNewUserModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  VerifyNewUserModel(response.data);
    return data;
  }

  Future sendDataVerifyNewUser(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDVerifyNewUser(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPromoProgram(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PromoProgramAPI();
	//final future = projectsJson();
	PromoProgramModel program;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PromoProgramModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PromoProgramModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PromoProgramModel(response.data);
    return data;
  }

  Future sendDataPromoProgram(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPromoProgram(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataForgotPasswordExistingUser(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ForgotPasswordExistingUserAPI();
	//final future = projectsJson();
	ForgotPasswordExistingUserModel existing_user;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ForgotPasswordExistingUserModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ForgotPasswordExistingUserModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ForgotPasswordExistingUserModel(response.data);
    return data;
  }

  Future sendDataForgotPasswordExistingUser(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDForgotPasswordExistingUser(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataResetPasswordExistingUser(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ResetPasswordExistingUserAPI();
	//final future = projectsJson();
	ResetPasswordExistingUserModel existing_user;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ResetPasswordExistingUserModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ResetPasswordExistingUserModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ResetPasswordExistingUserModel(response.data);
    return data;
  }

  Future sendDataResetPasswordExistingUser(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDResetPasswordExistingUser(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataContactFormSupport(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ContactFormSupportAPI();
	//final future = projectsJson();
	ContactFormSupportModel support;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ContactFormSupportModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ContactFormSupportModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ContactFormSupportModel(response.data);
    return data;
  }

  Future sendDataContactFormSupport(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDContactFormSupport(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPlaceOrderBrowseServices(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PlaceOrderBrowseServicesAPI();
	//final future = projectsJson();
	PlaceOrderBrowseServicesModel browse_services;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PlaceOrderBrowseServicesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PlaceOrderBrowseServicesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PlaceOrderBrowseServicesModel(response.data);
    return data;
  }

  Future sendDataPlaceOrderBrowseServices(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPlaceOrderBrowseServices(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataInviteToBidBrowseUsers(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = InviteToBidBrowseUsersAPI();
	//final future = projectsJson();
	InviteToBidBrowseUsersModel browse_users;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = InviteToBidBrowseUsersModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  InviteToBidBrowseUsersModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  InviteToBidBrowseUsersModel(response.data);
    return data;
  }

  Future sendDataInviteToBidBrowseUsers(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDInviteToBidBrowseUsers(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataHireMeBrowseUsers(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = HireMeBrowseUsersAPI();
	//final future = projectsJson();
	HireMeBrowseUsersModel browse_users;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = HireMeBrowseUsersModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  HireMeBrowseUsersModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  HireMeBrowseUsersModel(response.data);
    return data;
  }

  Future sendDataHireMeBrowseUsers(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDHireMeBrowseUsers(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataAddToCartBrowseProducts(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = AddToCartBrowseProductsAPI();
	//final future = projectsJson();
	AddToCartBrowseProductsModel browse_products;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = AddToCartBrowseProductsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  AddToCartBrowseProductsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  AddToCartBrowseProductsModel(response.data);
    return data;
  }

  Future sendDataAddToCartBrowseProducts(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDAddToCartBrowseProducts(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataEmptyCartCart(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = EmptyCartCartAPI();
	//final future = projectsJson();
	EmptyCartCartModel cart;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = EmptyCartCartModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  EmptyCartCartModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  EmptyCartCartModel(response.data);
    return data;
  }

  Future sendDataEmptyCartCart(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDEmptyCartCart(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataApplyCouponCart(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ApplyCouponCartAPI();
	//final future = projectsJson();
	ApplyCouponCartModel cart;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ApplyCouponCartModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ApplyCouponCartModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ApplyCouponCartModel(response.data);
    return data;
  }

  Future sendDataApplyCouponCart(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDApplyCouponCart(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPayWithAvailableBalanceCheckout(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PayWithAvailableBalanceCheckoutAPI();
	//final future = projectsJson();
	PayWithAvailableBalanceCheckoutModel checkout;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PayWithAvailableBalanceCheckoutModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PayWithAvailableBalanceCheckoutModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PayWithAvailableBalanceCheckoutModel(response.data);
    return data;
  }

  Future sendDataPayWithAvailableBalanceCheckout(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPayWithAvailableBalanceCheckout(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPayViaBankTransferCheckout(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PayViaBankTransferCheckoutAPI();
	//final future = projectsJson();
	PayViaBankTransferCheckoutModel checkout;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PayViaBankTransferCheckoutModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PayViaBankTransferCheckoutModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PayViaBankTransferCheckoutModel(response.data);
    return data;
  }

  Future sendDataPayViaBankTransferCheckout(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPayViaBankTransferCheckout(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPayWithCreditCardCheckout(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PayWithCreditCardCheckoutAPI();
	//final future = projectsJson();
	PayWithCreditCardCheckoutModel checkout;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PayWithCreditCardCheckoutModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PayWithCreditCardCheckoutModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PayWithCreditCardCheckoutModel(response.data);
    return data;
  }

  Future sendDataPayWithCreditCardCheckout(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPayWithCreditCardCheckout(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPayWithCimbClicksCheckout(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PayWithCimbClicksCheckoutAPI();
	//final future = projectsJson();
	PayWithCimbClicksCheckoutModel checkout;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PayWithCimbClicksCheckoutModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PayWithCimbClicksCheckoutModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PayWithCimbClicksCheckoutModel(response.data);
    return data;
  }

  Future sendDataPayWithCimbClicksCheckout(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPayWithCimbClicksCheckout(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPayWithBcaKlikpayCheckout(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PayWithBcaKlikpayCheckoutAPI();
	//final future = projectsJson();
	PayWithBcaKlikpayCheckoutModel checkout;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PayWithBcaKlikpayCheckoutModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PayWithBcaKlikpayCheckoutModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PayWithBcaKlikpayCheckoutModel(response.data);
    return data;
  }

  Future sendDataPayWithBcaKlikpayCheckout(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPayWithBcaKlikpayCheckout(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPayWithMandiriClickpayCheckout(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PayWithMandiriClickpayCheckoutAPI();
	//final future = projectsJson();
	PayWithMandiriClickpayCheckoutModel checkout;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PayWithMandiriClickpayCheckoutModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PayWithMandiriClickpayCheckoutModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PayWithMandiriClickpayCheckoutModel(response.data);
    return data;
  }

  Future sendDataPayWithMandiriClickpayCheckout(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPayWithMandiriClickpayCheckout(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPayWithQrisCheckout(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PayWithQrisCheckoutAPI();
	//final future = projectsJson();
	PayWithQrisCheckoutModel checkout;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PayWithQrisCheckoutModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PayWithQrisCheckoutModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PayWithQrisCheckoutModel(response.data);
    return data;
  }

  Future sendDataPayWithQrisCheckout(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPayWithQrisCheckout(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPayWithPaypalCheckout(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PayWithPaypalCheckoutAPI();
	//final future = projectsJson();
	PayWithPaypalCheckoutModel checkout;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PayWithPaypalCheckoutModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PayWithPaypalCheckoutModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PayWithPaypalCheckoutModel(response.data);
    return data;
  }

  Future sendDataPayWithPaypalCheckout(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPayWithPaypalCheckout(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataBumpUpMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = BumpUpMyProjectsAPI();
	//final future = projectsJson();
	BumpUpMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = BumpUpMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  BumpUpMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  BumpUpMyProjectsModel(response.data);
    return data;
  }

  Future sendDataBumpUpMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDBumpUpMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataBroadcastMessageMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = BroadcastMessageMyProjectsAPI();
	//final future = projectsJson();
	BroadcastMessageMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = BroadcastMessageMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  BroadcastMessageMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  BroadcastMessageMyProjectsModel(response.data);
    return data;
  }

  Future sendDataBroadcastMessageMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDBroadcastMessageMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
  Future getListShowBidsMyProjects(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = ShowBidsListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = ShowBidsListingModel(response.data);
       return data;
    }
   
  }
  Future getListShowThreadMyProjects(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = ShowThreadListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = ShowThreadListingModel(response.data);
       return data;
    }
   
  }
  Future getListShowFilesMyProjects(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = ShowFilesListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = ShowFilesListingModel(response.data);
       return data;
    }
   
  }
  Future getListShowConversationMyProjects(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = ShowConversationListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = ShowConversationListingModel(response.data);
       return data;
    }
   
  }
 Future getDataCreateProjectMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = CreateProjectMyProjectsAPI();
	//final future = projectsJson();
	CreateProjectMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = CreateProjectMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  CreateProjectMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  CreateProjectMyProjectsModel(response.data);
    return data;
  }

  Future sendDataCreateProjectMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDCreateProjectMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataEditDraftMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = EditDraftMyProjectsAPI();
	//final future = projectsJson();
	EditDraftMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = EditDraftMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  EditDraftMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  EditDraftMyProjectsModel(response.data);
    return data;
  }

  Future sendDataEditDraftMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDEditDraftMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPublishProjectMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PublishProjectMyProjectsAPI();
	//final future = projectsJson();
	PublishProjectMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PublishProjectMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PublishProjectMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PublishProjectMyProjectsModel(response.data);
    return data;
  }

  Future sendDataPublishProjectMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPublishProjectMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataCancelProjectMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = CancelProjectMyProjectsAPI();
	//final future = projectsJson();
	CancelProjectMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = CancelProjectMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  CancelProjectMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  CancelProjectMyProjectsModel(response.data);
    return data;
  }

  Future sendDataCancelProjectMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDCancelProjectMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataAcceptOrRejectWorkMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = AcceptOrRejectWorkMyProjectsAPI();
	//final future = projectsJson();
	AcceptOrRejectWorkMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = AcceptOrRejectWorkMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  AcceptOrRejectWorkMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  AcceptOrRejectWorkMyProjectsModel(response.data);
    return data;
  }

  Future sendDataAcceptOrRejectWorkMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDAcceptOrRejectWorkMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataRateWorkerMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = RateWorkerMyProjectsAPI();
	//final future = projectsJson();
	RateWorkerMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = RateWorkerMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  RateWorkerMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  RateWorkerMyProjectsModel(response.data);
    return data;
  }

  Future sendDataRateWorkerMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDRateWorkerMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataReportProgressMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ReportProgressMyProjectsAPI();
	//final future = projectsJson();
	ReportProgressMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ReportProgressMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ReportProgressMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ReportProgressMyProjectsModel(response.data);
    return data;
  }

  Future sendDataReportProgressMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDReportProgressMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataWeeklyReportMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = WeeklyReportMyProjectsAPI();
	//final future = projectsJson();
	WeeklyReportMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = WeeklyReportMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  WeeklyReportMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  WeeklyReportMyProjectsModel(response.data);
    return data;
  }

  Future sendDataWeeklyReportMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDWeeklyReportMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataReportDoneMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ReportDoneMyProjectsAPI();
	//final future = projectsJson();
	ReportDoneMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ReportDoneMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ReportDoneMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ReportDoneMyProjectsModel(response.data);
    return data;
  }

  Future sendDataReportDoneMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDReportDoneMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataRateOwnerMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = RateOwnerMyProjectsAPI();
	//final future = projectsJson();
	RateOwnerMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = RateOwnerMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  RateOwnerMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  RateOwnerMyProjectsModel(response.data);
    return data;
  }

  Future sendDataRateOwnerMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDRateOwnerMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataFileArbitrationMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = FileArbitrationMyProjectsAPI();
	//final future = projectsJson();
	FileArbitrationMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = FileArbitrationMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  FileArbitrationMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  FileArbitrationMyProjectsModel(response.data);
    return data;
  }

  Future sendDataFileArbitrationMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDFileArbitrationMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataNewOfferMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = NewOfferMyProjectsAPI();
	//final future = projectsJson();
	NewOfferMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = NewOfferMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  NewOfferMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  NewOfferMyProjectsModel(response.data);
    return data;
  }

  Future sendDataNewOfferMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDNewOfferMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataAcceptOfferMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = AcceptOfferMyProjectsAPI();
	//final future = projectsJson();
	AcceptOfferMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = AcceptOfferMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  AcceptOfferMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  AcceptOfferMyProjectsModel(response.data);
    return data;
  }

  Future sendDataAcceptOfferMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDAcceptOfferMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataRespondArbitrationMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = RespondArbitrationMyProjectsAPI();
	//final future = projectsJson();
	RespondArbitrationMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = RespondArbitrationMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  RespondArbitrationMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  RespondArbitrationMyProjectsModel(response.data);
    return data;
  }

  Future sendDataRespondArbitrationMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDRespondArbitrationMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataCancelArbitrationMyProjects(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = CancelArbitrationMyProjectsAPI();
	//final future = projectsJson();
	CancelArbitrationMyProjectsModel my_projects;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = CancelArbitrationMyProjectsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  CancelArbitrationMyProjectsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  CancelArbitrationMyProjectsModel(response.data);
    return data;
  }

  Future sendDataCancelArbitrationMyProjects(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDCancelArbitrationMyProjects(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
  Future getListShowConversationMyBids(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = ShowConversationListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = ShowConversationListingModel(response.data);
       return data;
    }
   
  }
 Future getDataCancelBidMyBids(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = CancelBidMyBidsAPI();
	//final future = projectsJson();
	CancelBidMyBidsModel my_bids;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = CancelBidMyBidsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  CancelBidMyBidsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  CancelBidMyBidsModel(response.data);
    return data;
  }

  Future sendDataCancelBidMyBids(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDCancelBidMyBids(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
  Future getListSalesMyProducts(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = SalesListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = SalesListingModel(response.data);
       return data;
    }
   
  }
  Future getListCommentsMyProducts(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = CommentsListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = CommentsListingModel(response.data);
       return data;
    }
   
  }
 Future getDataAddNewProductMyProducts(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = AddNewProductMyProductsAPI();
	//final future = projectsJson();
	AddNewProductMyProductsModel my_products;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = AddNewProductMyProductsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  AddNewProductMyProductsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  AddNewProductMyProductsModel(response.data);
    return data;
  }

  Future sendDataAddNewProductMyProducts(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDAddNewProductMyProducts(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPublishProductMyProducts(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PublishProductMyProductsAPI();
	//final future = projectsJson();
	PublishProductMyProductsModel my_products;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PublishProductMyProductsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PublishProductMyProductsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PublishProductMyProductsModel(response.data);
    return data;
  }

  Future sendDataPublishProductMyProducts(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPublishProductMyProducts(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataEditProductMyProducts(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = EditProductMyProductsAPI();
	//final future = projectsJson();
	EditProductMyProductsModel my_products;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = EditProductMyProductsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  EditProductMyProductsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  EditProductMyProductsModel(response.data);
    return data;
  }

  Future sendDataEditProductMyProducts(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDEditProductMyProducts(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataBumpUpMyProducts(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = BumpUpMyProductsAPI();
	//final future = projectsJson();
	BumpUpMyProductsModel my_products;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = BumpUpMyProductsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  BumpUpMyProductsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  BumpUpMyProductsModel(response.data);
    return data;
  }

  Future sendDataBumpUpMyProducts(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDBumpUpMyProducts(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
  Future getListScreenshotsMyProducts(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = ScreenshotsListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = ScreenshotsListingModel(response.data);
       return data;
    }
   
  }
 Future getDataUnlistMyProducts(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = UnlistMyProductsAPI();
	//final future = projectsJson();
	UnlistMyProductsModel my_products;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = UnlistMyProductsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  UnlistMyProductsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  UnlistMyProductsModel(response.data);
    return data;
  }

  Future sendDataUnlistMyProducts(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDUnlistMyProducts(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataReactivateProductMyProducts(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ReactivateProductMyProductsAPI();
	//final future = projectsJson();
	ReactivateProductMyProductsModel my_products;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ReactivateProductMyProductsModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ReactivateProductMyProductsModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ReactivateProductMyProductsModel(response.data);
    return data;
  }

  Future sendDataReactivateProductMyProducts(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDReactivateProductMyProducts(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
  Future getListSalesMyServices(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = SalesListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = SalesListingModel(response.data);
       return data;
    }
   
  }
  Future getListCommentsMyServices(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = CommentsListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = CommentsListingModel(response.data);
       return data;
    }
   
  }
 Future getDataAddNewServiceMyServices(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = AddNewServiceMyServicesAPI();
	//final future = projectsJson();
	AddNewServiceMyServicesModel my_services;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = AddNewServiceMyServicesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  AddNewServiceMyServicesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  AddNewServiceMyServicesModel(response.data);
    return data;
  }

  Future sendDataAddNewServiceMyServices(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDAddNewServiceMyServices(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataPublishServiceMyServices(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = PublishServiceMyServicesAPI();
	//final future = projectsJson();
	PublishServiceMyServicesModel my_services;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = PublishServiceMyServicesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  PublishServiceMyServicesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  PublishServiceMyServicesModel(response.data);
    return data;
  }

  Future sendDataPublishServiceMyServices(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDPublishServiceMyServices(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataBumpUpMyServices(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = BumpUpMyServicesAPI();
	//final future = projectsJson();
	BumpUpMyServicesModel my_services;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = BumpUpMyServicesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  BumpUpMyServicesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  BumpUpMyServicesModel(response.data);
    return data;
  }

  Future sendDataBumpUpMyServices(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDBumpUpMyServices(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataEditServiceMyServices(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = EditServiceMyServicesAPI();
	//final future = projectsJson();
	EditServiceMyServicesModel my_services;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = EditServiceMyServicesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  EditServiceMyServicesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  EditServiceMyServicesModel(response.data);
    return data;
  }

  Future sendDataEditServiceMyServices(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDEditServiceMyServices(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
  Future getListScreenshotsMyServices(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = ScreenshotsListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = ScreenshotsListingModel(response.data);
       return data;
    }
   
  }
 Future getDataUnlistMyServices(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = UnlistMyServicesAPI();
	//final future = projectsJson();
	UnlistMyServicesModel my_services;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = UnlistMyServicesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  UnlistMyServicesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  UnlistMyServicesModel(response.data);
    return data;
  }

  Future sendDataUnlistMyServices(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDUnlistMyServices(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataReactivateServiceMyServices(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ReactivateServiceMyServicesAPI();
	//final future = projectsJson();
	ReactivateServiceMyServicesModel my_services;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ReactivateServiceMyServicesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ReactivateServiceMyServicesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ReactivateServiceMyServicesModel(response.data);
    return data;
  }

  Future sendDataReactivateServiceMyServices(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDReactivateServiceMyServices(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataConfirmPaymentMyOrders(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ConfirmPaymentMyOrdersAPI();
	//final future = projectsJson();
	ConfirmPaymentMyOrdersModel my_orders;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ConfirmPaymentMyOrdersModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ConfirmPaymentMyOrdersModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ConfirmPaymentMyOrdersModel(response.data);
    return data;
  }

  Future sendDataConfirmPaymentMyOrders(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDConfirmPaymentMyOrders(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataDownloadMyPurchases(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = DownloadMyPurchasesAPI();
	//final future = projectsJson();
	DownloadMyPurchasesModel my_purchases;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = DownloadMyPurchasesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  DownloadMyPurchasesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  DownloadMyPurchasesModel(response.data);
    return data;
  }

  Future sendDataDownloadMyPurchases(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDDownloadMyPurchases(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataRateProductMyPurchases(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = RateProductMyPurchasesAPI();
	//final future = projectsJson();
	RateProductMyPurchasesModel my_purchases;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = RateProductMyPurchasesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  RateProductMyPurchasesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  RateProductMyPurchasesModel(response.data);
    return data;
  }

  Future sendDataRateProductMyPurchases(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDRateProductMyPurchases(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataChangePaymentSettingsMyFinance(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ChangePaymentSettingsMyFinanceAPI();
	//final future = projectsJson();
	ChangePaymentSettingsMyFinanceModel my_finance;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ChangePaymentSettingsMyFinanceModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ChangePaymentSettingsMyFinanceModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ChangePaymentSettingsMyFinanceModel(response.data);
    return data;
  }

  Future sendDataChangePaymentSettingsMyFinance(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDChangePaymentSettingsMyFinance(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataWithdrawPaymentMyFinance(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = WithdrawPaymentMyFinanceAPI();
	//final future = projectsJson();
	WithdrawPaymentMyFinanceModel my_finance;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = WithdrawPaymentMyFinanceModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  WithdrawPaymentMyFinanceModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  WithdrawPaymentMyFinanceModel(response.data);
    return data;
  }

  Future sendDataWithdrawPaymentMyFinance(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDWithdrawPaymentMyFinance(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataDepositBalanceMyFinance(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = DepositBalanceMyFinanceAPI();
	//final future = projectsJson();
	DepositBalanceMyFinanceModel my_finance;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = DepositBalanceMyFinanceModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  DepositBalanceMyFinanceModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  DepositBalanceMyFinanceModel(response.data);
    return data;
  }

  Future sendDataDepositBalanceMyFinance(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDDepositBalanceMyFinance(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataEditProfileMyProfile(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = EditProfileMyProfileAPI();
	//final future = projectsJson();
	EditProfileMyProfileModel my_profile;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = EditProfileMyProfileModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  EditProfileMyProfileModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  EditProfileMyProfileModel(response.data);
    return data;
  }

  Future sendDataEditProfileMyProfile(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDEditProfileMyProfile(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
  Future getListPortofolioMyProfile(String url, int page) async{
  dio!.options.connectTimeout = 15000;
  dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	 if(page == -1){
      Response response = await dio!.get(url.replaceAll('?page=%d', ''));
      final data = PortofolioListingModel(response.data);
      return data;
    }else{
       Response response = await dio!.get(sprintf(url, [page]));
	   final data = PortofolioListingModel(response.data);
       return data;
    }
   
  }
 Future getDataChangePasswordMyProfile(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ChangePasswordMyProfileAPI();
	//final future = projectsJson();
	ChangePasswordMyProfileModel my_profile;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ChangePasswordMyProfileModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ChangePasswordMyProfileModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ChangePasswordMyProfileModel(response.data);
    return data;
  }

  Future sendDataChangePasswordMyProfile(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDChangePasswordMyProfile(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataChangeEmailMyProfile(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ChangeEmailMyProfileAPI();
	//final future = projectsJson();
	ChangeEmailMyProfileModel my_profile;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ChangeEmailMyProfileModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ChangeEmailMyProfileModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ChangeEmailMyProfileModel(response.data);
    return data;
  }

  Future sendDataChangeEmailMyProfile(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDChangeEmailMyProfile(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataChangeHandphoneMyProfile(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = ChangeHandphoneMyProfileAPI();
	//final future = projectsJson();
	ChangeHandphoneMyProfileModel my_profile;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = ChangeHandphoneMyProfileModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  ChangeHandphoneMyProfileModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  ChangeHandphoneMyProfileModel(response.data);
    return data;
  }

  Future sendDataChangeHandphoneMyProfile(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDChangeHandphoneMyProfile(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataAddPortofolioMyPortofolio(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = AddPortofolioMyPortofolioAPI();
	//final future = projectsJson();
	AddPortofolioMyPortofolioModel my_portofolio;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = AddPortofolioMyPortofolioModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  AddPortofolioMyPortofolioModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  AddPortofolioMyPortofolioModel(response.data);
    return data;
  }

  Future sendDataAddPortofolioMyPortofolio(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDAddPortofolioMyPortofolio(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataEditMyPortofolio(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = EditMyPortofolioAPI();
	//final future = projectsJson();
	EditMyPortofolioModel my_portofolio;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = EditMyPortofolioModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  EditMyPortofolioModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  EditMyPortofolioModel(response.data);
    return data;
  }

  Future sendDataEditMyPortofolio(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDEditMyPortofolio(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
 Future getDataRemoveMyBuddies(String url, String id, String title) async {
 dio!.options.connectTimeout = 15000;
  /*  final future = RemoveMyBuddiesAPI();
	//final future = projectsJson();
	RemoveMyBuddiesModel my_buddies;
   // Response response = await dio!.get(sprintf(url, [id,title]));
    final data = future.then((value) {
	  var model;
      return model = RemoveMyBuddiesModel(value);
    }); */
    dio!.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	Response response = await dio!.get(sprintf(url, [id,title]));
	var data;
	try{
    data =  RemoveMyBuddiesModel(response.data);
	  }catch(e){
		  data = response.data;
	  }
	//data =  RemoveMyBuddiesModel(response.data);
    return data;
  }

  Future sendDataRemoveMyBuddies(String url, var formdata) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
      url ,  //sprintf(url, [id,title])
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }

  Future sendDataWithIDRemoveMyBuddies(String url, var formdata, String id, String title) async{
  dio!.options.connectTimeout = 15000;
    FormData postData = FormData.fromMap(formdata);

    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(
	 sprintf(url, [id,title]),// url ,
     // url ,
      data: postData,
      onSendProgress: showSendDataProgress,
    );
    throwIfNoSuccess(response);
    return response.data;
  }
/*
  Future<void> initDownloadsDirectoryState() async {
  dio!.options.connectTimeout = 15000;
    Directory downloadsDirectory;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    } on PlatformException {
      print('Could not get the downloads directory');
    }

  /* if (Platform.isAndroid) {
      downloadsDirectory  = (await getApplicationDocumentsDirectory());
    } else {
      downloadsDirectory  = (await getApplicationDocumentsDirectory());
    } */
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
   // if (!mounted) return;
      _downloadsDirectory = downloadsDirectory;
  }
  */

//https://api.projects.co.id/user/my_purchases/download/1c1611/a-classmore-hrefhttpwwwprojectscoidpublicbrowseproductsview0a1611video-tutorialvideo-tutoriala
  Future downloadFile(String url,String fileName) async {
  dio!.options.connectTimeout = 15000;
   // await initDownloadsDirectoryState();
    Response? res;
   // '${_downloadsDirectory.path}/${widget.value}'
    String savePath = '/storage/emulated/0/Download/$fileName';
    try {
      res = await dio!.download(
        url,
        savePath,
        onReceiveProgress: showDownloadProgress,
      );
    } catch (e) {
      print(e);
    }
    File('${_downloadsDirectory!.path}/$fileName')
        .renameSync('${_downloadsDirectory!.path}/${res!.headers.value('content-disposition')?.replaceAll(new RegExp('"'),'').replaceAll('filename=', '')}');
   // print('resp === ${res.headers.value('content-disposition').replaceAll(new RegExp('"'),'').replaceAll('filename=', '')}');

  }

  Future<String> downloadFile1(String url,String fileName, ProgressCallback showProgress) async {
  dio!.options.connectTimeout = 15000;
   // await initDownloadsDirectoryState();
    Response? res;
    // '${_downloadsDirectory.path}/${widget.value}'
    String savePath = '/storage/emulated/0/Download/$fileName';
    try {
      res = await dio!.download(
        url,
        savePath,
        onReceiveProgress: showProgress,
      );
    } catch (e) {
      print(e);
    }
    File('${_downloadsDirectory!.path}/$fileName')
        .renameSync('${_downloadsDirectory!.path}/${res?.headers.value('content-disposition')?.replaceAll(new RegExp('"'),'').replaceAll('filename=', '')}');
    // print('resp === ${res.headers.value('content-disposition').replaceAll(new RegExp('"'),'').replaceAll('filename=', '')}');
    return res!.headers.value('content-disposition')!.replaceAll(new RegExp('"'),'').replaceAll('filename=', '');
  }


  Future redirect() async{
  dio!.options.connectTimeout = 15000;
    String url = Env.value!.baseUrl! + '/dont4getme87882588.php';
    dio!.options.headers = {
      'Accept': 'application/json'
    };

    Response response = await dio!.get(url,
        options: Options(
            followRedirects: false,
            validateStatus: (status) { return status! < 500; }
        ));

   // throwIfNoSuccess(response);
    return response.data;
  }

  Future userLogin(String username, String pwd) async{
  dio!.options.connectTimeout = 15000;
    String url = Env.value!.baseUrl! + '/public/home/login/?ajax=1';
    // String  projectsResponse = '';
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(url, data :'LoginActivity[_trigger_]=1&LoginActivity[user_name]=' + username +  '&LoginActivity[password]='+  pwd +'&LoginActivity[remember]=1');
    throwIfNoSuccess(response);
    return response.data;
  }

  Future getContact(String url) async{
  dio!.options.connectTimeout = 15000;
    //String  projectsResponse = '';
    dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };

   // dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    Response response = await dio!.post(url, data :'buddylist=1&initialize=1');
    throwIfNoSuccess(response);
    return response.data;
  }

  void showSendDataProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  void throwIfNoSuccess(Response response) {
    if(response.statusCode! < 200 || response.statusCode! > 299) {
      throw new HttpException(response);
    }
  }
/*
  Future<Test> getTestEdit(String url, String id, String title) async {
    final future = projectsJson();
    final test = future.then((value) {
      return DataTest.fromJson(value);
    });
    return test;
  }

  Future<List<ProjectItem>> getProjectsList(String url, int page) async{
  dio!.options.connectTimeout = 15000;
    List<dynamic>  projectsResponse = [];
    List<ProjectItem> projectsList = [];
    Response response = await dio!.get(sprintf(url, [page]));
    throwIfNoSuccess(response);
    projectsResponse = response.data;
    for (dynamic project in projectsResponse) {
      projectsList.add(ProjectItem.fromJson(project) );
    }
    return projectsList;
  }

  */


}
