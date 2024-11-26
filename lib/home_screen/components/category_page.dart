import 'package:flutter/material.dart';
import 'package:flutter_dealpick/db_list.dart';

class CategoryPage extends StatelessWidget {
  final int selectedCategory;

  const CategoryPage({Key? key, required this.selectedCategory})
      : super(key: key);

  /// 숫자를 한국어 금액 표기로 변환하는 함수
  String formatCurrency(String price) {
    int number = int.tryParse(price) ?? 0; // 문자열을 정수로 변환
    if (number >= 100000000) {
      int billions = number ~/ 100000000; // 억 단위
      int millions = (number % 100000000) ~/ 10000; // 천만 단위
      return '${billions}억 ${millions}만원';
    } else {
      return '$number원'; // 만원 이하의 금액
    }
  }

  @override
  Widget build(BuildContext context) {
    // 선택된 카테고리에 따라 데이터베이스를 동적으로 선택
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

    // 선택된 데이터베이스의 값을 리스트로 변환
    List<List<String>> displayData = selectedDb.values.toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: displayData.length,
          itemBuilder: (context, index) {
            final item = displayData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 이미지 부분 (고정 경로 사용)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/img/lambo.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // 텍스트 및 가격 정보
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item[0]}', // 판매자 정보
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          item[2], // 차량 모델명
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          formatCurrency(item[4]), // 가격 정보 (포맷 적용)
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
            );
          },
        ),
      ),
    );
  }
}
