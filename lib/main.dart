import 'package:calculater/butonlar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  Anasayfa({Key key}) : super(key:key);
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String _history = '';
  String _expression = '';
  void numaraTik(String text){
    setState(() {
      _expression += text;
    });
  }
  void temizle(String text){
    setState(() {
      
      _expression = "";
    });
  }
  void tamaminiTemizle(String text){
    setState(() {
      _history = "";
      _expression = "";
    });
  }
  void sonuc(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right:12),
            child: Text(
              _history,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: 23,
                ),
                color: Color(0xFF545F61),
              ),
            ),
            alignment: Alignment(1, 1),
          ),
          Container(
          
            padding: EdgeInsets.all(12),
            child: Text(
              _expression,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: 48,
                ),
                color: Colors.white,
              ),
            ),
            alignment: Alignment(1, 1),
          ),
          SizedBox(height: 40,),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Butonlar(
                yazi: "AC",
                callback: tamaminiTemizle,
                fillColor: 0xFF6c807F,
                yaziBoyutu: 15,
              ),
              Butonlar(
                yazi: "C",
                callback: temizle,
                fillColor: 0xFF6c807F,
              ),
              Butonlar(
                yazi: "%",
                callback: numaraTik,
                fillColor: 0xFFFFFFFF,
                yaziRengi: 0xFF65BDAC,
              ),
              Butonlar(
                yazi: "/",
                callback: numaraTik,
                fillColor: 0xFFFFFFFF,
                yaziRengi: 0xFF65BDAC,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Butonlar(
                yazi: "1",
                callback: numaraTik,
              ),
              Butonlar(
                yazi: "2",
                callback: numaraTik,
              ),
              Butonlar(
                yazi: "3",
                callback: numaraTik,
              ),
              Butonlar(
                yazi: "*",
                callback: numaraTik,
                fillColor: 0xFFFFFFFF,
                yaziRengi: 0xFF65BDAC,
                yaziBoyutu: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Butonlar(
                yazi: "4",
                callback: numaraTik,
              ),
              Butonlar(
                yazi: "5",
                callback: numaraTik,
              ),
              Butonlar(
                yazi: "6",
                callback: numaraTik,
                yaziRengi: 0xFF65BDAC,
              ),
              Butonlar(
                yazi: "-",
                callback: numaraTik,
                fillColor: 0xFFFFFFFF,
                yaziRengi: 0xFF65BDAC,
                yaziBoyutu: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Butonlar(
                yazi: "7",
                callback: numaraTik,
              ),
              Butonlar(
                yazi: "8",
                callback: numaraTik,
              ),
              Butonlar(
                yazi: "9",
                callback: numaraTik,
                yaziRengi: 0xFF65BDAC,
              ),
              Butonlar(
                yazi: "+",
                callback: numaraTik,
                fillColor: 0xFFFFFFFF,
                yaziRengi: 0xFF65BDAC,
                yaziBoyutu: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Butonlar(
                yazi: ".",
                callback: numaraTik,
                yaziBoyutu: 30,
              ),
              Butonlar(
                yazi: "0",
                callback: numaraTik,
                yaziBoyutu: 30,
              ),
              Butonlar(
                yazi: "00",
                callback: numaraTik,
                yaziRengi: 0xFF65BDAC,
              ),
              Butonlar(
                yazi: "=",
                callback: sonuc,
                fillColor: 0xFFFFFFFF,
                yaziRengi: 0xFF65BDAC,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
