part of 'package:projectscoid/api/APIProvider.dart';
  Future getListPaymentHistoryApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = PaymentHistoryListingAPI();
   PaymentHistoryListingModel user_payments;
    Response response = await dio.get(sprintf(url, [page]));

	final data = PaymentHistoryListingModel(response.data);
	return data;

  
  }












  

