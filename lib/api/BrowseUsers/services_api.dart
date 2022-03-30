part of 'package:projectscoid/api/APIProvider.dart';
  Future getListServicesApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ServicesListingAPI();
   ServicesListingModel user_services;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ServicesListingModel(response.data);
	return data;

  
  }












  

