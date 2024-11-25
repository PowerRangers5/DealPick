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
      body: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.grey,
        ),
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