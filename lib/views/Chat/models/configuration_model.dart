class ConfigurationModel {
  String? urlApi;
  String? token;
  String? avatarImage;
  String? wsUrl;

  static ConfigurationModel? _instance;

  factory ConfigurationModel(
      {String urlApi = 'https://develop.carespace.ai/api/admin',
      String token = '',
      String avatarImage = 'assets/images/profile-amanda.jpg',
        //wss://push.projects.co.id/
        String wsUrl = 'wss://push.projects.co.id'}) {
    //  String wsUrl = 'wss://develop.carespace.ai/api/bot/web'}) {
    _instance ??=
        ConfigurationModel._internal(urlApi, token, avatarImage, wsUrl);
    return _instance!;
  }

  ConfigurationModel.fromJson(Map<String, dynamic> json) {
    urlApi = json != null && json['urlApi'] != null ? json['urlApi'] : null;
    token = json != null && json['token'] != null ? json['token'] : null;
    avatarImage = json != null && json['avatarImage'] != null
        ? json['avatarImage']
        : null;
    wsUrl = json != null && json['wsUrl'] != null ? json['wsUrl'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urlApi'] = this.urlApi;
    data['token'] = this.token;
    data['avatarImage'] = this.avatarImage;
    data['wsUrl'] = this.wsUrl;
    return data;
  }

  ConfigurationModel._internal(
      this.urlApi, this.token, this.avatarImage, this.wsUrl) {
    print(
        'A instance of ConfigurationModel pointing to ${this.urlApi} was created');
  }
}
