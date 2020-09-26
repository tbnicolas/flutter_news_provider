import 'package:flutter/material.dart';
import 'package:flutter_news_provider/src/models/category_model.dart';
import 'package:flutter_news_provider/src/services/news_service.dart';
import 'package:flutter_news_provider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';
 

 
class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return new SafeArea(
      child: Scaffold(
          body: new Column(children: [
            _ListaCategorias(),
            new Expanded(
              child: new ListaNoticias(newsService.getArticulosCategoriaSeleccionada)
            )
          ],) ,
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    final selectedCategory = Provider.of<NewsService>(context).selectedCategory;
    return new  Container(
      width: double.infinity,
      height: 80,
      //color: Colors.red,
      child: new ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          final cName = categories[index].name;
          return new Padding(
            padding: EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                _CategoryButton(categoria: categories[index]),
                new SizedBox(height: 5,),
                new Text('${cName[0].toUpperCase()}${cName.substring(1)}', style: new TextStyle(
                  color: (selectedCategory == categories[index].name)
                       ? Colors.red
                       : Colors.white
                ),)
              ],
            ),
          );
        }
        ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
 
  final Category categoria;

  const _CategoryButton({@required this.categoria});

  @override
  Widget build(BuildContext context) {
   final newsService = Provider.of<NewsService>(context);
    return new GestureDetector(
      onTap: (){
        final newsService = Provider.of<NewsService>(context,listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: new Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: new Icon(
          categoria.icon,
          color: (newsService.selectedCategory == categoria.name)
                 ? Colors.red
                 : Colors.black54,
        ),
      ),
    );
  }
}