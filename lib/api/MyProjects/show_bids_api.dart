part of 'package:projectscoid/api/APIProvider.dart';
  Future getListShowBidsApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ShowBidsListingAPI();
   ShowBidsListingModel project_bids;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ShowBidsListingModel(response.data);
	return data;

  
  }












  

