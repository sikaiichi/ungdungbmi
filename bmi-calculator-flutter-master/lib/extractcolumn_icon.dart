import 'package:flutter/material.dart';
class ExtractColumn extends StatelessWidget {
ExtractColumn({@required this.icons,this.texts});
final IconData icons ;
final String texts ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons
          ,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          texts,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98)
          ),
        )
      ],
    );
  }
}