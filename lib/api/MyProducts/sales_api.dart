part of 'package:projectscoid/api/APIProvider.dart';
  Future getListSalesApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = SalesListingAPI();
   SalesListingModel product_sales;
    Response response = await dio.get(sprintf(url, [page]));

	final data = SalesListingModel(response.data);
	return data;

  
  }












  

