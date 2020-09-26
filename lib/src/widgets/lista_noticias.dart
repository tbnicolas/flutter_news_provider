import 'package:flutter/material.dart';
import 'package:flutter_news_provider/src/models/news_models.dart';
import 'package:flutter_news_provider/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  ListaNoticias( this.noticias);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, i) {
        return new _Noticia(
          index: i,
          noticia: this.noticias[i],
        );
      },
    );
  }
}


class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  _Noticia({
    @required this.noticia, 
    @required this.index
  });

  @override
  Widget build(BuildContext context) {
    return new Column(children: [
      new _TarjetaTopBar(noticia: this.noticia ,index: index,),
      new _TarjetaTitulo(noticia: this.noticia),
      new _TarjetaImagen(noticia: this.noticia),
      new _TarjetaBody(noticia: this.noticia),
      new _TarjetaBotones(),
      new SizedBox(height: 10.0,),
      new Divider(),

    ],);
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        new RawMaterialButton(
          onPressed: (){},
          fillColor: miTema.accentColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
          child: new Icon(Icons.star_border),
        ),
        new SizedBox(width: 10.0,),
        new RawMaterialButton(
          onPressed: (){},
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
          child: new Icon(Icons.more),
        )
      ],),
    );
  }
}
class _TarjetaBody extends StatelessWidget {
 
   final Article noticia;  
   _TarjetaBody({@required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20) ,
      child: new Text((noticia.description != null)
                      ? noticia.description
                      :''
                    ),
    );
  }
}
class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

   _TarjetaImagen({@required this.noticia}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: new ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
        child: new Container(
          child: (noticia.urlToImage !=null) 
          ? new FadeInImage(
            placeholder: new AssetImage('assets/img/giphy.gif'), 
            image: new NetworkImage(noticia.urlToImage))
          : Image(image: new AssetImage('assets/img/no-image.png') ),
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

   _TarjetaTitulo({@required this.noticia}) ;
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: new Text(
        this.noticia.title,
        style: new TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700
        ) ,
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

   _TarjetaTopBar({
    @required this.noticia,
    @required this.index
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: new Row(children: [
        new Text('${index + 1}. ',style: new TextStyle(
          color: miTema.accentColor
        ),),
        new Text('${noticia.source.name}. '),
      ],),
    );
  }
}