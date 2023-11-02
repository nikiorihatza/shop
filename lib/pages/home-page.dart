import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/pages/category-page.dart';
import 'package:pos_4ahif_shop/widgets/recommended-products-widget.dart';

class HomePage extends StatelessWidget {
  String title = "HOME";
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Categories',
                  textAlign: TextAlign.left
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                const SizedBox(width: 15),
                Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 230)
                      )
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CategoryPage(title:"Smartphones", categorynum: 2))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent
                    ),
                    child: Image.asset('lib/assets/custom-icons/smartphone-category.png'),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 230)
                      )
                  ),
                  child: ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                    ),
                    child: Image.asset('lib/assets/custom-icons/tv-category.png'),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 230)
                      )
                  ),
                  child: ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                    ),
                    child: Image.asset('lib/assets/custom-icons/notebook-category.png'),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 230)
                      )
                  ),
                  child: ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                    ),
                    child: Image.asset('lib/assets/custom-icons/pc-category.png'),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 230)
                      )
                  ),
                  child: ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                    ),
                    child: Image.asset('lib/assets/custom-icons/gaming-category.png'),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 230)
                      )
                  ),
                  child: ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                    ),
                    child: Image.asset('lib/assets/custom-icons/sound-category.png'),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 230)
                      )
                  ),
                  child: ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                    ),
                    child: Image.asset('lib/assets/custom-icons/accessoirs-category.png'),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Divider(
              indent: 20,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                    'Recommended Products',
                    textAlign: TextAlign.left
                ),
              ),
            ),
          ),
          RecommendedProductWidget(),
          RecommendedProductWidget()
        ],
      ),
    );
  }
}