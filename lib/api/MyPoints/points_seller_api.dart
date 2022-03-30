part of 'package:projectscoid/api/APIProvider.dart';
  Future getListPointsSellerApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = PointsSellerListingAPI();
   PointsSellerListingModel points_seller;
    Response response = await dio.get(sprintf(url, [page]));

	final data = PointsSellerListingModel(response.data);
	return data;

  
  }












  

