part of 'package:projectscoid/api/APIProvider.dart';
  Future getListUserBidsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = UserBidsListingAPI();
   UserBidsListingModel user_bids;
    Response response = await dio.get(sprintf(url, [page]));

	final data = UserBidsListingModel(response.data);
	return data;

  
  }












  

