part of 'package:projectscoid/api/APIProvider.dart';
  Future getListPointsAffiliateApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = PointsAffiliateListingAPI();
   PointsAffiliateListingModel points_affiliate;
    Response response = await dio.get(sprintf(url, [page]));

	final data = PointsAffiliateListingModel(response.data);
	return data;

  
  }












  

