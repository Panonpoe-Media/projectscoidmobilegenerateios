part of 'package:projectscoid/api/APIProvider.dart';
  Future getListAsProjectOwnerApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = AsProjectOwnerListingAPI();
   AsProjectOwnerListingModel user_projects_owner;
    Response response = await dio.get(sprintf(url, [page]));

	final data = AsProjectOwnerListingModel(response.data);
	return data;

  
  }












  

