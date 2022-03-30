part of 'package:projectscoid/api/APIProvider.dart';
  Future getListPortofolioApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = PortofolioListingAPI();
   PortofolioListingModel user_portofolio;
    Response response = await dio.get(sprintf(url, [page]));

	final data = PortofolioListingModel(response.data);
	return data;

  
  }












  

