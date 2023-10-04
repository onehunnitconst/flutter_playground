import 'package:flutter/material.dart';

class ArticleLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "거래 희망 장소",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212025),
                ),
              ),
              Text(
                "우만동",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF212025),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.black12,
            ),
            height: 100,
          ),
          Text(
            "500m 근처에서 거래할 수 있어요",
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
