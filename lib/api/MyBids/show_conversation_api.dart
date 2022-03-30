part of 'package:projectscoid/api/APIProvider.dart';
  Future getListShowConversationApi(String url, int page, Dio dio) async{
  dio.options.connectTimeout = 15000;
  dio.options.headers = {
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/json'
    };
	//
  // final future = ShowConversationListingAPI();
   ShowConversationListingModel bid_conversation_for_worker;
    Response response = await dio.get(sprintf(url, [page]));

	final data = ShowConversationListingModel(response.data);
	return data;

  
  }












  

