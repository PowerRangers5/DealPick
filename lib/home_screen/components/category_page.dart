import 'package:flutter/material.dart';
import 'package:flutter_dealpick/db_list.dart';
import 'package:flutter_dealpick/shopping_cart/shopping_cart_page.dart';

class CategoryPage extends StatelessWidget {
  final int selectedCategory;

  const CategoryPage({Key? key, required this.selectedCategory})
      : super(key: key);

  String formatCurrency(String price) {
    int number = int.tryParse(price) ?? 0;
    if (number >= 100000000) {
      int billions = number ~/ 100000000;
      int millions = (number % 100000000) ~/ 10000;
      return '${billions}억 ${millions}만원';
    } else {
      return '$number원';
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<int, List<String>> selectedDb;
    switch (selectedCategory) {
      case 0:
        selectedDb = db_large;
        break;
      case 1:
        selectedDb = db_suv;
        break;
      case 2:
        selectedDb = db_small;
        break;
      default:
        selectedDb = {};
    }

    List<List<String>> displayData = selectedDb.values.toList();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: displayData.length,
          itemBuilder: (context, index) {
            final item = displayData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  // 아이템을 클릭하면 장바구니 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCartPage(
                        cartItems: [
                          {
                            'name': item[2],
                            'price': int.parse(item[4]),
                            'quantity': 1,
                            'imagePath': 'assets/img/lambo.jpg', // 예시 이미지 경로
                          }
                        ],
                      ),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/img/lambo.jpg',  // 예시 이미지
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item[0]}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            item[2],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            formatCurrency(item[4]),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}   