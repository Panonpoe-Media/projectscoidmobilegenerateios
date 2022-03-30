part of 'package:projectscoid/api/APIProvider.dart';
  Future getListReferalsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ReferalsListingAPI();
   ReferalsListingModel user_referals;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ReferalsListingModel(response.data);
	return data;

  
  }












  

