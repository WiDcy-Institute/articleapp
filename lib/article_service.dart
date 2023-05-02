import 'dart:convert';

import 'package:articleapp/article.dart';
import 'package:http/http.dart' as http;

class ArticleService {

  Future<List<Article>> readData() async{
    var url = Uri.http("ec2-18-142-180-73.ap-southeast-1.compute.amazonaws.com:8080","api/v1/article");
    var resp = await http.get(url);
    if(resp.statusCode == 200){
        Map<String,dynamic> data = jsonDecode(resp.body);
        if(data["code"] == 200){
           return List<Article>.from(data["data"].map((json) => Article.fromJson(json))).toList();
        }else{
          throw("${data["message"]}");
        }
    }else{
      throw("Internal Server Error");
    }
  }

  Future<Article> findById(int id) async{
    var url = Uri.http("ec2-18-142-180-73.ap-southeast-1.compute.amazonaws.com:8080","api/v1/article/$id");
    var resp = await http.get(url);
    if(resp.statusCode == 200){
        Map<String,dynamic> data = jsonDecode(resp.body);
        if(data["code"] == 200){
           return data["data"].map((json) => Article.fromJson(json));
        }else{
          throw("${data["message"]}");
        }
    }else{
      throw("Internal Server Error");
    }
  }

  Future<Article> save(String title, String body) async{
    var url = Uri.http("ec2-18-142-180-73.ap-southeast-1.compute.amazonaws.com:8080","api/v1/article");
    var bodyReq = {'title': title, 'content': body};
    var resp = await http.post(url, body: bodyReq);
    if(resp.statusCode == 200){
        Map<String,dynamic> data = jsonDecode(resp.body);
        if(data["code"] == 200){
           return data["data"].map((json) => Article.fromJson(json));
        }else{
          throw("${data["message"]}");
        }
    }else{
      throw("Internal Server Error");
    }     
  }

  Future<Article> update(int id, String title, String body) async{
     var url = Uri.http("ec2-18-142-180-73.ap-southeast-1.compute.amazonaws.com:8080","api/v1/article/$id");
    var bodyReq = {'title': title, 'content': body};
    var resp = await http.put(url, body: bodyReq);
    if(resp.statusCode == 200){
        Map<String,dynamic> data = jsonDecode(resp.body);
        if(data["code"] == 200){
           return data["data"].map((json) => Article.fromJson(json));
        }else{
          throw("${data["message"]}");
        }
    }else{
      throw("Internal Server Error");
    }     
  }

  Future<Article> delete(int id) async{
    var url = Uri.http("ec2-18-142-180-73.ap-southeast-1.compute.amazonaws.com:8080","api/v1/article/$id");
    var resp = await http.delete(url);
    if(resp.statusCode == 200){
        Map<String,dynamic> data = jsonDecode(resp.body);
        if(data["code"] == 200){
           return data["data"].map((json) => Article.fromJson(json));
        }else{
          throw("${data["message"]}");
        }
    }else{
      throw("Internal Server Error");
    }
  }
}