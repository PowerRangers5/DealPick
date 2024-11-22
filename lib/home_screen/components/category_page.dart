import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final int selectedCategory;

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
    );
  }
}
