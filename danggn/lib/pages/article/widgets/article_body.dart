import 'package:flutter/material.dart';

class ArticleBody extends StatelessWidget {
  const ArticleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "푸에르토리코 보드게임",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212025),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                "취미/게임/음반",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF878B94),
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                " · 2개월 전",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF878B94),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "보드게임 푸에르토리코입니다. \n\n"
            "3회 정도 플레이해보고 고이 모셔놨어요 \n\n"
            "오거나이저가 같이 있긴 한데 잘못 조립된 부분이 있어요 감안하고 사용하면 문제 없습니다! \n\n"
            "우만동에서 거래합니다!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF212025),
            ),
          ),
        ],
      ),
    );
  }
}
