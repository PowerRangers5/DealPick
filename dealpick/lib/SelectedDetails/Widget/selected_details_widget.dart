import 'package:flutter/material.dart';

/// 해당 문서는 제품 상세페이지에 들어갈 위젯들을 모아둔 곳입니다.
/// [제품 상세페이지 위젯]
/// <제품 상세페이지 형식>
/// - AppBar
///  - 뒤로가기버튼
///  - title
/// - Column
///  - 제품의 이미지
///  - (Box)제품의 이름 및 가격
///  - (Box)상품설명
///  - Row
///    - 장바구니 버튼
///    - 구매하기 버튼
/// 
/// <이 파일에 존재하는 위젯>
/// - 제품의 이미지 (횡 스크롤)
/// - 이름 가격 들어가는 박스
/// - 구매하기버튼 (Resized)
/// 



// 제품의 이미지 (횡 스크롤) 위젯
class ImageBox extends StatelessWidget {
  const ImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return _imageWidget();
  }

  //final ScreenController _screenController = ScreenController();

  Widget _imageWidget(){
    return LayoutBuilder(
      builder: (context, constraints){
        return Row(
          children: [
            Screens("assets/image/gv70.png"),
            Screens("assets/image/revuelto.png")
            //Screens('directory2'),
            //Screens('directory3'),
          ],

        );
      },
    );
  }
  //get the image and place it inside a box
  // ignore: non_constant_identifier_names
  Widget Screens(String assetPath) {
    String assetName = assetPath;
    return SizedBox.expand(
      child: Container(
        //color: const Color(0xff5c786E),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetName), //add image assets here
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}
//double check implementations
// 이름, 가격 들어가는 Box 위젯
// ignore: must_be_immutable
class DetailBox extends StatelessWidget {
  int price = 100000000; //가격
  String carType = "Dream Car"; //팔고자 하는 차량
  String sellerID = "User 1";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //Box contains Name(w Company), price
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  sellerID,
                ),
                Text(
                  carType,
                ),
              ],
            ),
          ),
          
          Text(
            "$price 원"
          ),
        ],
      ),
    );
  }
}

//row of cart button with resized buy button
class BottomRow extends StatelessWidget {
  const BottomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CartButton(context),
        Container(
          width: 19,
        ),
        ResizedBuyButton(context),
      ],
    );
  }
  //cart button [UI]
  // ignore: non_constant_identifier_names
  Widget CartButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //send to cart page
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.shopping_cart, size: 30, color: Colors.black),
      ),
    );
  }

  //구매하기 버튼 [UI]
  // ignore: non_constant_identifier_names
  Widget ResizedBuyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //action to perform when pressed

      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(52, 189, 140, 100), // this is the code for #34BD8C color
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(284,50),
      ),
      child: const SizedBox(
        child: Text(
         "구매하기",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

}