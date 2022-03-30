part of 'package:projectscoid/api/APIProvider.dart';
  Future getListUserArbitrationsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = UserArbitrationsListingAPI();
   UserArbitrationsListingModel user_arbitrations;
    Response response = await dio.get(sprintf(url, [page]));

	final data = UserArbitrationsListingModel(response.data);
	return data;

  
  }












  

