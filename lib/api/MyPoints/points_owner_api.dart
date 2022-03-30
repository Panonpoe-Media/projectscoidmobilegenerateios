part of 'package:projectscoid/api/APIProvider.dart';
  Future getListPointsOwnerApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = PointsOwnerListingAPI();
   PointsOwnerListingModel points_owner;
    Response response = await dio.get(sprintf(url, [page]));

	final data = PointsOwnerListingModel(response.data);
	return data;

  
  }












  

