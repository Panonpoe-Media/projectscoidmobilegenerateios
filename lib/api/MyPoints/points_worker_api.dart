part of 'package:projectscoid/api/APIProvider.dart';
  Future getListPointsWorkerApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = PointsWorkerListingAPI();
   PointsWorkerListingModel points_worker;
    Response response = await dio.get(sprintf(url, [page]));

	final data = PointsWorkerListingModel(response.data);
	return data;

  
  }












  

