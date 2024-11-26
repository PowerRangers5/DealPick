import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const ShoppingCartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  // 장바구니에 데이터 추가 (중복 방지)
  void addToCart(Map<String, dynamic> newItem) {
    setState(() {
      // 중복 확인: id 기준
      if (!widget.cartItems.any((item) => item['item'] == newItem['item'])) {
        widget.cartItems.insert(0, newItem); // 최신 데이터는 맨 앞에 삽입
      }
    });
  }

  // 상품 삭제 (삭제 버튼으로만 삭제)
  void removeItemFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index); // 명시적으로 삭제
    });
  }

  // 총 가격 계산
  int getTotalPrice() {
    return widget.cartItems.fold<int>(
        0, (sum, item) => (item['price'] * item['quantity']) + sum);
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
            child: widget.cartItems.isEmpty
                ? const Center(
                    child: Text('장바구니가 비어 있습니다.', style: TextStyle(fontSize: 16)),
                  )
                : ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
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
                                  image: AssetImage(item['imagePath']),
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
                                      item['name'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${item['price'].toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',')}원',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (item['quantity'] > 1) {
                                                item['quantity']--;
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
                                          item['quantity'].toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              item['quantity']++;
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
                            // 삭제 버튼 추가
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