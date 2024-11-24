import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_dealpick/db_list.dart';
=======
>>>>>>> b0e9d45 (카테고리 선택 기능 추가)

class CategoryPage extends StatelessWidget {
  final int selectedCategory;

<<<<<<< HEAD
  const CategoryPage({Key? key, required this.selectedCategory})
      : super(key: key);

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
                          '${item[4]}원', // 가격 정보
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
=======
  const CategoryPage({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final Map<int, List<String>> categoryItems = {
      // 대형세단 데이터
      0: ['대형 세단 1', '대형 세단 2', '대형 세단 3', '대형 세단 4', '대형 세단 5', '대형 세단 6'],
      // SUV 데이터
      1: ['SUV 1', 'SUV 2', 'SUV 3'],
      // 경차 데이터
      2: ['경차 1', '경차 2', '경차 3'],
    };

    final items = categoryItems[selectedCategory] ?? [];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/lambo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // 텍스트 영역
              Expanded(
                child: Text(
                  items[index],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
>>>>>>> b0e9d45 (카테고리 선택 기능 추가)
    );
  }
}
