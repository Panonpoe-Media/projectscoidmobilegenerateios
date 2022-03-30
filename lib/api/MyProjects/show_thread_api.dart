part of 'package:projectscoid/api/APIProvider.dart';
  Future getListShowThreadApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ShowThreadListingAPI();
   ShowThreadListingModel project_posts;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ShowThreadListingModel(response.data);
	return data;

  
  }












  

