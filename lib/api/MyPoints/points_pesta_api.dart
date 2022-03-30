part of 'package:projectscoid/api/APIProvider.dart';
  Future getListPointsPestaApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = PointsPestaListingAPI();
   PointsPestaListingModel points_pesta;
    Response response = await dio.get(sprintf(url, [page]));

	final data = PointsPestaListingModel(response.data);
	return data;

  
  }












  

