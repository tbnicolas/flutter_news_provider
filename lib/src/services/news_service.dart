import 'package:flutter/material.dart';
import 'package:flutter_news_provider/src/models/category_model.dart';
import 'package:flutter_news_provider/src/models/news_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
final _URL_NEWS = 'http://newsapi.org/v2';
final _APIKEY = 'fa64ceffdb0c4eb18cb18ca87abb50b6';
class NewsService with ChangeNotifier{
  
  List<Article> headLines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),

  ];

  Map<String,List<Article>> categoryArticles = {};


  NewsService(){
    this.getTopHeadLines();
    categories.forEach((item) {
      this.categoryArticles[item.name] = new List();
    });
  }

  get selectedCategory => this._selectedCategory;
  set selectedCategory (String valor){
    this._selectedCategory =valor;
    this.getArticlesByCategory(valor);
    notifyListeners();

  }
  get getArticulosCategoriaSeleccionada 
      =>this.categoryArticles[this.selectedCategory];


  getTopHeadLines() async{
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';
    final resp = await http.get(url);
    final newsRespone = newsModelResponseFromJson(resp.body);
    this.headLines .addAll(newsRespone.articles);
    notifyListeners();
 }

 getArticlesByCategory(String category) async{

   if(this.categoryArticles[category].length>0){
     return this.categoryArticles[category];
   }
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us&category=$category';
    final resp = await http.get(url);
    final newsRespone = newsModelResponseFromJson(resp.body);
    this.categoryArticles[category].addAll(newsRespone.articles);
    notifyListeners();
 }

}
