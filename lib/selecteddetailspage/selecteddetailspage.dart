import 'package:flutter/material.dart';
import 'package:flutter_dealpick/selecteddetailspage/widget/selecteddetailspagewidget.dart';

/// [제품 상세설명 페이지]
/// <제품 상세페이지 형식>
/// - AppBar
///  - 뒤로가기버튼
///  - title
/// - Column
///  - 제품의 이미지
///  - (Box)제품의 이름 및 가격, 설명
///  - (Box)상품설명
///  - Row
///    - 장바구니 버튼
///    - 구매하기 버튼
/// 
/// <이 파일에서 구현하는 것>
/// - AppBar
/// - Column, Row (안에 들어갈 위젯은 SelectedDetails/Widget/SelectedDetailsWidget.dart 에서 받기)
/// - 각 버튼별 기능 부여

// ignore: camel_case_types
class selectedDetailsPage extends StatelessWidget {
  const selectedDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          '상세페이지',
          style: TextStyle(fontSize: 24),
        ),
      ),

      body: Column(
        children: [
          
            ImageBox(), //나중에 여기에 이미지들 pass시켜야 해오
            Container(height: 22),
            DetailBox(), //디테일 들어가는 박스
            Container(height: 11),
            const BottomRow(), //장바구니, 구매하기 버튼 
            Container(height: 37),
          
        ],
      ),
    );
  }
}
