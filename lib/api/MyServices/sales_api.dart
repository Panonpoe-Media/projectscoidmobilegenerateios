part of 'package:projectscoid/api/APIProvider.dart';
/** AUTOGENERATE OFF **/
  Future getListMyServicesSalesApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = SalesListingAPI();
   SalesListingModel service_sales;
    Response response = await dio.get(sprintf(url, [page]));

	final data = SalesListingModel(response.data);
	return data;

  
  }












  

