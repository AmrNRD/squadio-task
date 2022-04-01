import "dart:async";
import "dart:convert";
import 'dart:io';

import 'package:http/http.dart' as http;

import '../env.dart';
import 'utils/app_exceptions.dart';
import 'utils/core.util.dart';



// ignore: avoid_classes_with_only_static_members
class APICaller {
  static  Map<String, String> get headers => {"Content-Type": "application/json", "Accept": "application/json"};

  static Future<Map<String, String>> authorizedHeaders() async {

    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": Env.token??"",
    };
  }

  static Future<dynamic> getData(String urlExtension, {bool authorizedHeader = false,bool outerAPI=false}) async {
    final Map<String, String> headers=authorizedHeader?await APICaller.authorizedHeaders():APICaller.headers;

      CoreUtility.safePrint('GET ${Env.baseUrl}$urlExtension');
      final res = await http.get(Uri.parse(outerAPI?urlExtension:(Env.baseUrl + urlExtension)), headers: headers).timeout(const Duration(seconds: 10), onTimeout: () {
        throw RequestTimeOutException("Poor internet or no internet connectivity");
      });
      CoreUtility.safePrint('Status Code: ${res.statusCode}');
      CoreUtility.safePrint(res.body.toString());
      final dataRetrived = returnResponse(res);
      return dataRetrived;

  }

  static Future<dynamic> postData(String urlExtension, {Map? body, bool authorizedHeader = false,bool outerAPI=false}) async {
    final Map<String, String> headers=authorizedHeader?await APICaller.authorizedHeaders():APICaller.headers;

    CoreUtility.safePrint('POST ${Env.baseUrl}$urlExtension');
    CoreUtility.safePrint('Body: $body');
    final res = await http.post(Uri.parse(outerAPI?urlExtension:Env.baseUrl + urlExtension), headers: headers, body: json.encode(body));
    CoreUtility.safePrint('Status Code: ${res.statusCode}');
    CoreUtility.safePrint(res.body.toString());
    final dataRetrived = returnResponse(res);
    return dataRetrived;
  }


  static Future<dynamic> multiPartData(String requestType,String urlExtension,Map<String,dynamic> files,{Map body=const {}, bool authorizedHeader = false,bool outerAPI=false,bool isVideo=false}) async {
    final Map<String, String> headers=authorizedHeader?await APICaller.authorizedHeaders():APICaller.headers;

    final request = http.MultipartRequest(requestType, Uri.parse(outerAPI?urlExtension:Env.baseUrl + urlExtension));

    for (final header in headers.entries) {
      request.headers[header.key]=header.value;
    }

    for (final bodyData in body.entries) {
      request.fields[bodyData.key.toString()]=bodyData.value.toString();
    }
    CoreUtility.safePrint(request.fields);

    for (final fileData in files.entries) {
       if(fileData.value is List<File>){
         for(int i=0;i<(fileData.value as List<File>).length;i++) {
           request.files.add(
               http.MultipartFile(
                 "${fileData.key}[${i+1}]",
                 (fileData.value as List<File>)[i].readAsBytes().asStream(),
                 (fileData.value as List<File>)[i].lengthSync(),
                 filename: (fileData.value as List<File>)[i].path.split("/").last,
               )
           );
         }
       }else if(fileData.value is File){
             request.files.add(
                 http.MultipartFile(
                   fileData.key,
                     (fileData.value as File).readAsBytes().asStream(),
                     (fileData.value as File).lengthSync(),
                   filename: (fileData.value as File).path.split("/").last,
                 )
             );
       }
    }
    final resStream = await request.send();
    final res=await http.Response.fromStream(resStream);
    CoreUtility.safePrint('$requestType ${Env.baseUrl}$urlExtension');
    CoreUtility.safePrint('Body: $body');
    CoreUtility.safePrint('Status Code: ${res.statusCode}');
    CoreUtility.safePrint(res.body.toString());
    final dataRetrived = returnResponse(res);
    return dataRetrived;
  }


  static Future<dynamic> putData(String urlExtension, {Map body= const {}, bool authorizedHeader = false}) async {
    final Map<String, String> headers=authorizedHeader?await APICaller.authorizedHeaders():APICaller.headers;

    CoreUtility.safePrint('PUT ${Env.baseUrl}$urlExtension');
    CoreUtility.safePrint('Body: $body');
    final res = await http.put(Uri.parse(Env.baseUrl + urlExtension), headers: headers, body: json.encode(body)).timeout(const Duration(seconds: 10), onTimeout: () {
      throw RequestTimeOutException("Poor internet or no internet connectivity, Please try again.");
    });
    CoreUtility.safePrint('Status Code: ${res.statusCode}');
    CoreUtility.safePrint(res.body.toString());
    final dataRetrived = returnResponse(res);
    return dataRetrived;
  }

  static Future<dynamic> deleteData(String urlExtension, {bool authorizedHeader = false}) async {
    final Map<String, String> headers=authorizedHeader?await APICaller.authorizedHeaders():APICaller.headers;

    CoreUtility.safePrint('DELETE ${Env.baseUrl}$urlExtension');
    final res = await http.delete(Uri.parse(Env.baseUrl + urlExtension), headers: headers).timeout(const Duration(seconds: 10), onTimeout: () {throw RequestTimeOutException("Poor internet or no internet connectivity, Please try again.");});
    CoreUtility.safePrint('Status Code: ${res.statusCode}');
    CoreUtility.safePrint(res.body.toString());
    final dataRetrived = returnResponse(res);
    return dataRetrived;
  }

  static dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      final  responseBody = json.decode(response.body);
      responseBody['statusCode']=response.statusCode;
      return responseBody;
      case 400:
        throw BadRequestException("Error please try again later.");
      case 401:
        final Map responseBody = json.decode(response.body) as Map;
        throw UnauthenticatedException(responseBody.containsKey("message") ? responseBody["message"] as String: "Unauthorized");
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw ServerErrorException("Internal server error, please try again later.",);
      case 409:
      case 422:
        final  responseBody = json.decode(response.body);
        throw UnprocessableEntityException((responseBody is Map && responseBody.containsKey("message"))?responseBody['message'].toString(): "Error happen while trying to submit.",errors: (responseBody is Map && responseBody.containsKey("errors"))?responseBody['errors'] as Map:null);
      case 500:
        CoreUtility.safePrint("Server error: ${response.body}");
        throw ServerErrorException("Server error, please try again later.");
      case 503:
        CoreUtility.safePrint("Server error: ${response.body}");
        throw ServerErrorException("Server error, please try again later.");
      default:
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
