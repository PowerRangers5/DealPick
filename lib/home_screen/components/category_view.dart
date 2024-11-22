import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  final String category; // 카테고리 필드 선언

  const CategoryView({super.key, required this.category});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool isSelected = false; // 선택 상태를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected; // 선택 상태를 토글
          });
        },
        child: Container(
          height: 43,
          decoration: BoxDecoration(
            color: isSelected
                ? Color(0xff34BD8C)
                : Colors.grey[200], // 선택 상태에 따라 색상 변경
            borderRadius: BorderRadius.circular(43 / 2),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Text(
              widget.category,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black, // 텍스트 색상도 변경
              ),
            ),
          ),
        ),
      ),
    );
  }
}
