import 'package:flutter/material.dart';
import 'package:flutter_dealpick/shopping_cart_page/shopping_cart.dart';

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
  final List<String> item;
  final int index;

  const ImageBox({super.key, required this.item, required this.index});
  

  @override
  Widget build(BuildContext context) {
    List<String> pagelist = [
      //pass in the directory
      "assets/img/lambo.jpg",
      "assets/img/lambo.jpg"
      //'directory2',
      //'directory3',
      ];
    return _imageWidget(pagelist);
  }

  //read the data 
  SizedBox _imageWidget(List<String> pages){
    return SizedBox( 
      height: 260,
      width: 393,
      child: PageView(
        children: [
          Screens(pages[0]),
          Screens(pages[1]),
        ],
      ),
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
  
  final List<String> item;
  final int index;

  const DetailBox({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    //String condition = item[5];
    return SizedBox(
      child: Column(

        children: [
          //Box contains Name(w Company), price
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item[0],
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        item[2],
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  "${item[4]} 원",
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Color(0xffD9D9D9)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: Align(
                alignment: FractionalOffset(0, 1),
                child: Text(
                  item[5],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 235,
            width: double.infinity,
            //where the text comes for details
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
        ],
      ),

    );
  }
}

//row of cart button with resized buy button
class BottomRow extends StatelessWidget {
  final List<String> item;
  final int index;

  const BottomRow({super.key, required this.item, required this.index});

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShoppingCartPage(itemList: item, index: index,)),
        );
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShoppingCartPage(itemList: item, index: index,),
          ),
        );
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
