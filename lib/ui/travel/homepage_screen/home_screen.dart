import 'package:flutter/material.dart';
import 'package:flutter_app/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

List<T> map<T>(List list, Function handler){
  List<T> result = [];
  for (var i = 0; i < list.length; i++){
    result.add(handler(i, list[i]));
  }
  return result;
}

final List child = map<Widget>(
  imgList,
  (index, i){
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
         Image.network(i, fit: BoxFit.cover, width: 1000.0,),
           Positioned(
             bottom: 0.0,
             right: 0.0,
             left: 0.0,
             child: Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                   begin: Alignment.bottomCenter,
                   end: Alignment.topCenter,
                 ),
               ),
               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
               child: Text(
                 'No.$index image',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold
                 ),
               ),
             ),
           )
        ]),
      ),
    );
  }
).toList();

class CarouselWithIndicator extends StatefulWidget{
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator>{
  int _current = 0;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        CarouselSlider(
          items: child,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          onPageChanged: (index){
            setState(() {
              _current = index;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            imgList,
            (index, url){
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
            },
          ),
        )
      ],
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {

    final CarouselSlider manualCarouselDemo = CarouselSlider(
      items: child,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );

    final CarouselSlider autoPlayDemo = CarouselSlider(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
          (url){
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
            );
          }
      ).toList(),
    );

    Widget buttonDemo(){
      final basicSlider = CarouselSlider(
        items: child,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        initialPage: 2,
      );

      return Column(
        children:[
          basicSlider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: RaisedButton(
                  onPressed: () => basicSlider.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  child: Text('←'),
                ),
              ),
              Flexible(
                child: RaisedButton(
                  onPressed: () => basicSlider.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear
                  ),
                  child:  Text('→'),
                ),
              ),
              ...Iterable<int>.generate(imgList.length).map(
                  (int pageIndex) => Flexible(
                    child: RaisedButton(
                      onPressed: ()=> basicSlider.animateToPage(pageIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear),
                      child: Text('$pageIndex'),
                    ),
                  )
              )
            ],
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appBar(),
            Expanded(
              child: Center(
                child: Text("hello"),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget appBar(){
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'HOME',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkerText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                    BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.view_agenda
                  ),
                  onTap: (){

                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}