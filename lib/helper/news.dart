import 'dart:convert';

import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=ad9c6380f98a417f88f994ef4d49a9c8";

    var response = await http.get(url); 

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element['content']
          );

           news.add(articleModel);

        }
      });
    }
  }
}

class CategoryNews{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url = "http://newsapi.org/v2/top-headlines?category=$category&country=id&category=business&apiKey=ad9c6380f98a417f88f994ef4d49a9c8";

    var response = await http.get(url); 

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element['content']
          );

           news.add(articleModel);

        }
      });
    }
  }
}