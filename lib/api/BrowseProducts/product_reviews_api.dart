part of 'package:projectscoid/api/APIProvider.dart';
  Future getListProductReviewsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ProductReviewsListingAPI();
   ProductReviewsListingModel product_reviews;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ProductReviewsListingModel(response.data);
	return data;

  
  }












  

