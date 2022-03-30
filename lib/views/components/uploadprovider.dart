
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
//import 'package:projectscoid/models/image_fields.dart';
import 'package:projectscoid/models/file_fields.dart';
import 'package:projectscoid/models/photo.dart';
import 'package:projectscoid/core/components/utility/http/HttpException.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/core/components/utility/log/DioLogger.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:path_provider/path_provider.dart';

class DIOProvider {
  static const String TAG = 'DIOProvider';
  final String _BASE_URL =  Env.value!.baseUrl! ;
  final String _BASE_URL1= Env.value!.uploadUrl!;

  static const String  _TEST_LOAD_IMAGE_URL1 = "/files/upload.php?id=image5ca2dcbf60fa9&img=1&mw=1024&mh=1024&tw=200&th=250&ct=1&is=1&ts=1";
  static const String  _TEST_LOAD_IMAGE_URL = "/files/upload.php?id=image5fcee16d9fd17&img=1&mw=320&mh=320&tw=115&th=115&ct=1&is=1&ts=1";

  static const String  _TEST_LOAD_FILE_URL = "/files/upload.php?id=upload5ca2dcbf6111c";
  static const String  _TEST_CAPTCHA = '/public/program/captcha';
  static const String  _SECURE_CODE = '/public/program/new_secure_code';
  static const String  _UPLOAD_FINALIZE = '/files/finalize.php';
 // https://upload.projects.co.id/files/finalize.php?files=202012215fe0b4405669e.jpg&folder=usr581611;

  Dio? _dio;
  String? appDoc;
  var cj;
  DIOProvider(this.appDoc){
    BaseOptions dioOptions =  BaseOptions()//(contentType: ContentType.json, responseType: ResponseType.plain)
      ..baseUrl =  _BASE_URL; //APIProvider._baseUrl;


    _dio = Dio(dioOptions);
    //getApplicationDocumentsDirectory().then((value) {
      //var path = value.path;
    cj = PersistCookieJar(storage: FileStorage('$appDoc/.cookies/'), ignoreExpires: true);
    _dio!.interceptors.add(
        CookieManager( cj));
      if (EnvType.DEVELOPMENT == Env.value!.environmentType ||
          EnvType.STAGING == Env.value!.environmentType) {
        //   _dio!.interceptors.add(CookieManager(CookieJar()));

        _dio!.interceptors.add(InterceptorsWrapper(
            onRequest:(options,  handler){
              DioLogger.onSend(TAG, options);
              return handler.next(options);
            },
            onResponse: (response, handler){
              DioLogger.onSuccess(TAG, response);
              return handler.next(response);
            },
            onError: (DioError e, handler){
              DioLogger.onError(TAG, e);
              return handler.next(e);
            }
        ));
      }
   // });
  }


  Future<String> getCaptcha(String datacapcha) async{
    String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept':'application/json'
    };
    _dio!.options.responseType = ResponseType.json;
   // _dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    _dio!.options.baseUrl = _BASE_URL;
    Response response = await _dio!.post( _TEST_CAPTCHA+ '?$datacapcha');
    throwIfNoSuccess(response);
    projectsResponse = jsonEncode(response.data);
    //  print('reponse ====' + response.data);
    // projectsResponse = response.data;

    return projectsResponse;

  }



  Future<Object> getSecureCode(String link) async{
    Object  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept':'application/json'
    };
    _dio!.options.responseType = ResponseType.json;
    // _dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    _dio!.options.baseUrl = _BASE_URL;
    Response response = await _dio!.post( _SECURE_CODE + link);
    throwIfNoSuccess(response);
   // projectsResponse = jsonEncode(response.data);
    //  print('reponse ====' + response.data);
     projectsResponse = response.data;

    return projectsResponse;

  }

  Future<String> getCaptcha1() async{
    String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
    _dio!.options.responseType = ResponseType.bytes;

  //  _dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    _dio!.options.baseUrl = _BASE_URL;
    Response response = await _dio!.post( _TEST_CAPTCHA);
    throwIfNoSuccess(response);
    projectsResponse = base64.encode(response.data);
    //  print('reponse ====' + response.data);
    // projectsResponse = response.data;

    return projectsResponse;

  }

  Future<String> getUploadFolder(String file, String userPath, String name) async{
    String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
    _dio!.options.responseType = ResponseType.plain;

    //  _dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    _dio!.options.baseUrl = _BASE_URL1;
    Response response = await _dio!.get( '$_UPLOAD_FINALIZE?files=$file&folder=$userPath&name=$name');
    throwIfNoSuccess(response);
    projectsResponse = response.data;
    //  print('reponse ====' + response.data);
    // projectsResponse = response.data;

    return projectsResponse;

  }

  Future<String> getUploadFolder1(String file, String userPath) async{
    String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    };
    _dio!.options.responseType = ResponseType.plain;

    //  _dio!.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    _dio!.options.baseUrl = _BASE_URL1;
    Response response = await _dio!.get( '$_UPLOAD_FINALIZE?files=$file&folder=$userPath');
    throwIfNoSuccess(response);
    projectsResponse = response.data;
    //  print('reponse ====' + response.data);
    // projectsResponse = response.data;

    return projectsResponse;

  }



  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }



  Future<String> uploadImage(FormData formdata)async{
    String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'multipart/form-data;',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/octet-stream'
    };
    _dio!.options.baseUrl = _BASE_URL1;

    Response response = await _dio!.post(DIOProvider._TEST_LOAD_IMAGE_URL1,
      data : formdata,
      onSendProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        }
      },
    );
    throwIfNoSuccess(response);
    projectsResponse = jsonEncode(response.data);
    return projectsResponse;
    // return 'halooooo';

  }


  Future<Photo> uploadImage1(FormData formdata,ProgressULCallback progress)async{
    print('apakah masuk sini4');
    // String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'multipart/form-data;',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/octet-stream'
    };
    _dio!.options.baseUrl = _BASE_URL1;
    print('apakah masuk sini3');

    Response response = await _dio!.post(DIOProvider._TEST_LOAD_IMAGE_URL1,
      data : formdata,
      onSendProgress: progress,
      /* (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        }
      },*/
    );
    throwIfNoSuccess(response);
    print('apakah masuk sini2');
    //  projectsResponse = jsonEncode(response.data);
    return Photo.fromJson(jsonDecode(response.data));
    // return projectsResponse;

  }

  Future<Photo> uploadImage2(FormData formdata,ProgressCallback onProgress)async{

    // String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'multipart/form-data;',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/octet-stream'
    };
    _dio!.options.baseUrl = _BASE_URL1;


    Response response = await _dio!.post(DIOProvider._TEST_LOAD_IMAGE_URL,
      data : formdata,
      onSendProgress: onProgress,
      /* (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        }
      },*/
    );
    throwIfNoSuccess(response);

    //  projectsResponse = jsonEncode(response.data);
    return Photo.fromJson(jsonDecode(response.data));
    // return projectsResponse;

  }





  Future<String> uploadFile(FormData formdata)async{
    String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'multipart/form-data;',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/octet-stream'
    };
    _dio!.options.baseUrl = _BASE_URL1;

    Response response = await _dio!.post(DIOProvider._TEST_LOAD_FILE_URL,
      data : formdata,
      onSendProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        }
      },
    );
    throwIfNoSuccess(response);
    projectsResponse = jsonEncode(response.data);
    return projectsResponse;

  }

  Future<FileField> uploadFile1(FormData formdata, ProgressULCallback progress)async{
    String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'multipart/form-data;',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/octet-stream'
    };
    _dio!.options.baseUrl = _BASE_URL1;

    Response response = await _dio!.post(DIOProvider._TEST_LOAD_FILE_URL,
      data : formdata,
      onSendProgress: progress,
    );
    throwIfNoSuccess(response);
    //projectsResponse = jsonEncode(response.data);
    //return projectsResponse;
    return FileField.fromJson(jsonDecode(response.data));

  }

  Future<Photo> uploadFile3(FormData formdata, ProgressULCallback progress)async{
    String  projectsResponse = '';
    _dio!.options.headers = {
      'content-type': 'multipart/form-data;',
      'User-Agent': 'ProjectMobile/1.0',
      'Accept': 'application/octet-stream'
    };
    _dio!.options.baseUrl = _BASE_URL1;

    Response response = await _dio!.post(DIOProvider._TEST_LOAD_FILE_URL,
      data : formdata,
      onSendProgress: progress,
    );
    throwIfNoSuccess(response);
    //projectsResponse = jsonEncode(response.data);
    //return projectsResponse;
    return Photo.fromJson(jsonDecode(response.data));

  }
  void throwIfNoSuccess(Response response) {
    if(response.statusCode! < 200 || response.statusCode! > 299) {
      throw new HttpException(response);
    }
  }


  Future downloadFile(String savePath, String  downloadPath) async {
    _dio!.options.baseUrl = _BASE_URL1;
    var dp = downloadPath.replaceAll('https://upload.projects.co.id','');
    try {
      await _dio!.download(
        dp,
        savePath,
        onReceiveProgress: showDownloadProgress,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<int?> downloadFile1(String savePath, String  downloadPath, ProgressDlCallback progress) async {
    _dio!.options.baseUrl = _BASE_URL1;
    var dp = downloadPath.replaceAll('https://upload.projects.co.id','');

    Response response = await _dio!.download(
        dp,
        savePath,
        onReceiveProgress: progress,
      );
    throwIfNoSuccess(response);
    return response.statusCode;
   // return FileField.fromJson(jsonDecode(response.data));
  }


}
