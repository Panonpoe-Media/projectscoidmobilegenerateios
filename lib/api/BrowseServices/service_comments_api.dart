part of 'package:projectscoid/api/APIProvider.dart';
  Future getListServiceCommentsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ServiceCommentsListingAPI();
   ServiceCommentsListingModel service_comments;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ServiceCommentsListingModel(response.data);
	return data;

  
  }












  

