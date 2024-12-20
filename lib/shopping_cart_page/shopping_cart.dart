import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  final List<String>? itemList;
  final int? index;
  
  const ShoppingCartPage({super.key, this.itemList, this.index});

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState(itemList: itemList, indexes: index);
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final List<String>? itemList;
  final int? indexes;
  int quantity = 1; //default quantity
  List<Map<String, dynamic>> cartItems = [];

  _ShoppingCartPageState({this.itemList, this.indexes});

  // 테스트용: 장바구니에 항목 추가
  void addItemToCart(String name, int price, String imagePath) {
    setState(() {
      cartItems.insert(0, {
        'name': name,
        'price': price,
        'quantity': 1,
        'imagePath': imagePath, // 이미지 경로 추가
      });
    });
  }

  // 상품 삭제
  void removeItemFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  // 총 가격 계산
  int getTotalPrice() {
    return cartItems.fold<int>(
        0, (sum, item) => (int.parse(item[4]) * quantity) + sum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? const Center(
                    child: Text('장바구니가 비어 있습니다.', style: TextStyle(fontSize: 16)),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      //final item = cartItems[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0
                        ),
                        height: 130, // 카드 높이
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // 이미지
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage('assets/img/lambo.jpg'),//item['imagePath']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // 상품 정보
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      itemList![2], //name of the car
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${itemList![4].replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',')}원', //car price
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (quantity > 1) {
                                                quantity--;
                                              }
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          quantity.toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            size: 20,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // 삭제버튼 추가
                            IconButton(
                              onPressed: () {
                                removeItemFromCart(index);
                              },
                              icon: const Icon(Icons.close, color: Colors.red),
                              tooltip: '삭제',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          // 구매하기 버튼
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('총가격',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      '${getTotalPrice().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',')}원',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 345,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('구매가 완료 되었습니다!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff34BD8C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      '구매하기',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}