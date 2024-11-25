import 'package:flutter/material.dart';

class CategorySelectionPage extends StatelessWidget {
  const CategorySelectionPage({super.key});

  final List<String> categories = const [
    '경차',
    '소형차',
    '중형 세단',
    '대형 세단',
    '소형 SUV',
    '중형 SUV',
    '대형 SUV',
    '스포츠카',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카테고리'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
<<<<<<< HEAD
<<<<<<< HEAD
      body: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.grey,
        ),
=======
      body: ListView.builder(
        itemCount: categories.length,
>>>>>>> 4287929 (카테고리 선택 기능 추가)
=======
      body: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.grey,
        ),
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              Navigator.pop(context, categories[index]);
            },
          );
        },
      ),
    );
  }
} 