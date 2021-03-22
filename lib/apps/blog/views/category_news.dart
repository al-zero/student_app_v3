import 'package:flutter/material.dart';
import 'package:student_app_v3/apps/blog/helper/news.dart';
import 'package:student_app_v3/apps/blog/models/article_model.dart';

import '../blog_main.dart';


class CategoryView extends StatefulWidget {

  final String category;
  CategoryView({this.category});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  List<ArticleModel> articles= new List<ArticleModel>();
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    getCategoryNews();
  }


  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => BlogMain()));

          },

        ),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              'Flutter',
              style: TextStyle(color: Colors.black),
            ),
            new Text(
              'News',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:  _isLoading
          ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ))
          : SingleChildScrollView(
            child: Container(
        child: Column(
            children: [
              // BLOGS
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url ,
                      );
                    }),
              ),
            ],
        ),
      ),
          ),
    );
  }
}
