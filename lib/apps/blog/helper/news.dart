import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_app_v3/apps/blog/models/article_model.dart';

class News {

  List<ArticleModel> news = [];

  Future<void> getNews()async {

    String url = 'http://newsapi.org/v2/top-headlines?country=za&apiKey=46b778c817ac4abf9d6e74759c790cf7';

    var response= await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
         ArticleModel articleModel = ArticleModel(
              title: element['title'],
           author: element['author'],
           description: element['description'],
           url: element['url'],
           urlToImage: element['urlToImage'],

           content: element['context']
         );
         news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {

  List<ArticleModel> news = [];

  Future<void> getNews(String category)async {

    String url = 'http://newsapi.org/v2/top-headlines?country=za&category=$category&apiKey=46b778c817ac4abf9d6e74759c790cf7';


    var response= await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],

              content: element['context']
          );
          news.add(articleModel);
        }
      });
    }
  }
}