import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Map<String, dynamic>> cartItems = [];

  // 테스트용: 장바구니에 항목 추가 (최근 등록된 순서 유지)
  void addItemToCart(String name, int price) {
    setState(() {
      cartItems.insert(0, {'name': name, 'price': price, 'quantity': 1, 'addedAt': DateTime.now()});
    });
  }

  // 총 가격 계산
  int getTotalPrice() {
    return cartItems.fold<int>(0, (sum, item) => (item['price'] * item['quantity']).toInt() + sum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 이전 화면으로 돌아가기
          },
        ),
        title: const Text(
          '장바구니',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
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
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset('assets/car_image.png', width: 60, height: 60),
                        title: Text(item['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          '${item['price'].toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',')}원',
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (item['quantity'] > 1) item['quantity']--;
                                });
                              },
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text(item['quantity'].toString(), style: const TextStyle(fontSize: 16)),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  item['quantity']++;
                                });
                              },
                              icon: const Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('총가격', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      '${getTotalPrice().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',')}원',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('구매가 완료되었습니다!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(52, 189, 140, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 모서리 라운드 추가
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 17), // 버튼높이 설정
                    ),
                    child: const Text('구매하기', style: TextStyle(fontSize: 16)),
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
