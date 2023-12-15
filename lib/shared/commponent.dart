import 'package:flutter/material.dart';

Widget BuildItemOnboarding({required Map model}) => Column(
      children: [
        Spacer(),
        Container(
          width: 400,
          height: 400,
          child: Image(
            image: AssetImage(
              '${model['image']}',
            ),
          ),
        ),
        Text(
          '${model['title']}',
        //  style: GoogleFonts.acme(fontSize: 45),
        ),
        Spacer(),
        Text(
          '${model['description']}',
        //  style: GoogleFonts.acme(fontSize: 25),
        ),
        Spacer(flex: 3),
      ],
    );
