import 'package:flutter/material.dart';
import 'package:flutter_news_provider/src/pages/tabs_page.dart';
import 'package:flutter_news_provider/src/services/news_service.dart';
import 'package:flutter_news_provider/src/theme/tema.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new NewsService(),)
      ],
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Material App',
        home: new TabsPage(),
      ),
    );
  }
}