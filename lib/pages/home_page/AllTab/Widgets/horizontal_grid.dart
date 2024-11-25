import 'package:flutter/material.dart';

class HorizontalScrollGrid extends StatelessWidget {
  final List<String> cardTitles;
  final String title;
  final IconData icon;

  HorizontalScrollGrid({required this.cardTitles, required this.title,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8,0, 0, 0),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardTitles.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.all(8),
                    width: 120,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            icon,
                            color: Colors.white.withOpacity(0.2),
                            size: 100,
                          ),
                          Text(
                            cardTitles[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
