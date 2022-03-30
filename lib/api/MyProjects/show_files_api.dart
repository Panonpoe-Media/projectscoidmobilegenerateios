part of 'package:projectscoid/api/APIProvider.dart';
  Future getListShowFilesApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ShowFilesListingAPI();
   ShowFilesListingModel project_files;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ShowFilesListingModel(response.data);
	return data;

  
  }












  

