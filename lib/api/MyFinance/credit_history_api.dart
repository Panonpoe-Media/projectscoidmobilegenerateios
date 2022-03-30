part of 'package:projectscoid/api/APIProvider.dart';
  Future getListCreditHistoryApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = CreditHistoryListingAPI();
   CreditHistoryListingModel user_credits;
    Response response = await dio.get(sprintf(url, [page]));

	final data = CreditHistoryListingModel(response.data);
	return data;

  
  }












  

