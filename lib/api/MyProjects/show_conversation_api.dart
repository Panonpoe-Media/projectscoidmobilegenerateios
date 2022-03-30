part of 'package:projectscoid/api/APIProvider.dart';
/** AUTOGENERATE OFF **/
  Future getListMyProjectsShowConversationApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ShowConversationListingAPI();
   ShowConversationListingModel bid_conversation;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ShowConversationListingModel(response.data);
	return data;

  
  }












  

