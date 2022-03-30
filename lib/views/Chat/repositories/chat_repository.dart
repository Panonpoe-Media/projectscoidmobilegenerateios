import 'package:dio/dio.dart';
import '../models/models.dart';
import '../repositories/repository_base.dart';

class ChatRepository {
  ChatRepository() {
    certificate();
  }

  Future<ChatHistortModel> getHistory(UserModel user) async {
    try {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['user'] = user.id;
      final Response response = await http.post('/webchat/history', data: data);
      return ChatHistortModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  dynamic getFavorites(UserModel user) async {
    try {
      final Response response =
          await http.get('/webchat/history/favorites/${user.id}');
      return response.data;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e);
    }
  }

  dynamic getPrograms(UserModel user) async {
    try {
      final Response response = await http.get('/programs');
      return response.data;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e);
    }
  }

  dynamic getQuickMenu() async {
    try {
      final Response response = await http.get('/settings/quick-menu');
      return response.data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  dynamic addOrRemoveFavoriteMessage(message, bool favorite) async {
    try {
      var messageId = message["_id"];
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['favorite'] = favorite.toString();
      final Response response =
          await http.put('/webchat/history/favorites/$messageId', data: data);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }



//ANALYTICS CALL
  void eventCounterReport(dynamic data) async {
    await http.post('/sessions-event-counter', data: data);
  }
}
