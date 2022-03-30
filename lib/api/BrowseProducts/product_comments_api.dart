part of 'package:projectscoid/api/APIProvider.dart';
  Future getListProductCommentsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ProductCommentsListingAPI();
   ProductCommentsListingModel product_comments;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ProductCommentsListingModel(response.data);
	return data;

  
  }












  

