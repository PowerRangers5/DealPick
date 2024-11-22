import 'package:dealpick/SelectedDetails/Widget/selected_details_widget.dart';
import 'package:flutter/material.dart';

/** [제품 상세설명 페이지]
 * <제품 상세페이지 형식>
 * - AppBar
 *  - 뒤로가기버튼
 *  - title
 * - Column
 *  - 제품의 이미지
 *  - (Box)제품의 이름 및 가격, 설명
 *  - (Box)상품설명
 *  - Row
 *    - 장바구니 버튼
 *    - 구매하기 버튼
 * 
 * <이 파일에서 구현하는 것>
 * - AppBar
 * - Column, Row (안에 들어갈 위젯은 SelectedDetails/Widget/SelectedDetailsWidget.dart 에서 받기)
 * - 각 버튼별 기능 부여
 */

class selectedDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('상세페이지', style: TextStyle(fontSize: 24))),
      body: Column(
        children: [
          ImageBox(),
          Container(height: 22),
          DetailBox(),
          Container(height: 11),
          BottomRow(),
          Container(height: 37),
        ],
      ),
    );
  }
}