part of 'package:projectscoid/api/APIProvider.dart';
/** AUTOGENERATE OFF **/
  Future getListMyServicesScreenshotsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ScreenshotsListingAPI();
   ScreenshotsListingModel service_images;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ScreenshotsListingModel(response.data);
	return data;

  
  }












  

