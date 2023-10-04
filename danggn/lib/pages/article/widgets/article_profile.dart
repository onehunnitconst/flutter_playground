import 'package:flutter/material.dart';

class ArticleProfile extends StatelessWidget {
  const ArticleProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/profile.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 50.0,
                height: 50.0,
              ),
              SizedBox(
                width: 7.5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "상수",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212025),
                    ),
                  ),
                  Text(
                    "우만2동",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF4F5259),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            "40°C",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF80CB76),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 5,
                            color: Color(0xFFeaebed),
                          ),
                          Container(
                              width: 25, height: 5, color: Color(0xFF80CB76)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 7.5,
                  ),
                  Icon(
                    Icons.emoji_emotions,
                    color: Color(0xFFf5de78),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "매너온도",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF878B96),
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
