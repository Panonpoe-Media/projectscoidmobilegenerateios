part of 'package:projectscoid/api/APIProvider.dart';
  Future getListCheckoutItemsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = CheckoutItemsListingAPI();
   CheckoutItemsListingModel checkout_items;
    Response response = await dio.get(sprintf(url, [page]));

	final data = CheckoutItemsListingModel(response.data);
	return data;

  
  }












  

