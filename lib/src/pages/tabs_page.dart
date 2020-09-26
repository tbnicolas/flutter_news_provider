import 'package:flutter/material.dart';
import 'package:flutter_news_provider/src/pages/tab1_page.dart';
import 'package:flutter_news_provider/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';
 
 
class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ChangeNotifierProvider(
      create: (BuildContext context) => new _NavegacionModel(),
      child: new Scaffold(
          body: _Paginas(),
          bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  //EL context es un objeto que tiene la informacion
  //De toda la estructura de su arbol de widgets 
  @override
  Widget build(BuildContext context) {

    final navegcionModel = Provider.of<_NavegacionModel>(context);

    return new  BottomNavigationBar(
      currentIndex: navegcionModel.paginaActual,
      onTap: (i) => navegcionModel.paginaActual = i,
      items:[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.person_outline),
          title: new Text('Para ti')
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.public),
          title: new Text('Encabezados')
        )
      ]
    );
  }
}

class _Paginas extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final navegcionModel = Provider.of<_NavegacionModel>(context);
    return new PageView(
      controller:navegcionModel.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children:<Widget>[
        new Tab1Page(),
        new Tab2Page()
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier{
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor){
    this._paginaActual = valor;
    _pageController.animateToPage(
      valor, 
      duration: new Duration(milliseconds: 250) , 
      curve: Curves.easeOut
    );
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}