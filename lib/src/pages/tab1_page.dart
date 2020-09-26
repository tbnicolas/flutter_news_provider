import 'package:flutter/material.dart';
import 'package:flutter_news_provider/src/services/news_service.dart';
import 'package:flutter_news_provider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';
 
 
class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final headlines = Provider.of<NewsService>(context).headLines;

    //new ListaNoticias(headlines)
  
    return Scaffold(
      body:(headlines.length ==0)
          ? new Center(child: new CircularProgressIndicator(),)
          : new ListaNoticias(headlines) ,
    );
  }

  @override
  bool get wantKeepAlive => true;
}