part of 'package:projectscoid/api/APIProvider.dart';
  Future getListAsProjectWorkerApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = AsProjectWorkerListingAPI();
   AsProjectWorkerListingModel user_projects_worker;
    Response response = await dio.get(sprintf(url, [page]));

	final data = AsProjectWorkerListingModel(response.data);
	return data;

  
  }












  

