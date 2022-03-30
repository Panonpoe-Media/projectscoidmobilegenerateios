part of 'package:projectscoid/api/APIProvider.dart';
  Future getListServiceReviewsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ServiceReviewsListingAPI();
   ServiceReviewsListingModel service_reviews;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ServiceReviewsListingModel(response.data);
	return data;

  
  }












  

