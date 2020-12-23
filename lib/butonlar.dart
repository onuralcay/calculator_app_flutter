import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Butonlar extends StatelessWidget {
  final String yazi;
  final int yaziRengi;
  final int fillColor;
  final double yaziBoyutu;
  final Function callback;

  const Butonlar(
      {Key key, 
      this.yazi, 
      this.fillColor, 
      this.yaziRengi = 0xFFFFFFFF,
      this.yaziBoyutu= 24,
      this.callback,})
      
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            yazi,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: yaziBoyutu,
              ),
            ),
          ),
          onPressed: () {
            callback(yazi);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(yaziRengi),
        ),
      ),
    );
  }
}
