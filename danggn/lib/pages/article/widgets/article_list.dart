import 'dart:math';

import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "상수님의 판매 상품",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212025),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Wrap(
            runAlignment: WrapAlignment.center,
            spacing: 20.0,
            runSpacing: 10.0,
            children: List.generate(
              20,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.black12,
                    ),
                    width: 170,
                    height: 120,
                  ),
                  Text(
                    "상품 ${String.fromCharCode(index + 65)}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF212025),
                    ),
                  ),
                  Text(
                    "10,000원",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212025),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
