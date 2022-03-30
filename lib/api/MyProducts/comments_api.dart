part of 'package:projectscoid/api/APIProvider.dart';
  Future getListCommentsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = CommentsListingAPI();
   CommentsListingModel my_product_comments;
    Response response = await dio.get(sprintf(url, [page]));

	final data = CommentsListingModel(response.data);
	return data;

  
  }












  

