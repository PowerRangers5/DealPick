import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp();)
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
  // 장바구니 데이터 (최근 등록된 항목이 맨 앞에 추가됨)
  List<map<String, dynamic>> cartItems = [];

  // 테스트용임.. 장바구니에 항목 추가 (최근 등록된 순서 유지)
  void addItemToCart(Staring name, int price) {
    setState(() {
      cartItems.insert(0, {'name': name, 'price': price, 'quantity': 1, 'addedAt': DateTime.now()});
    });
  }

  // 총 가격 계산
  int getTotalPrice() {
    return cartItems.fold(0, (sum, itme) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children [
          Expanded(
            child: cartItems.isEmpty
            ? const Center(
              child: Text('장바구니가 비어 있습니다.', style: TextStryle(fontSize: 16)),
            )
            : ListView.builder(
              itemCount: cartItem.length,
              itemBulider: (context, index) {
                final item = cartItem[index];
                return ListTile(
                  leading: Image.asset('assets/car_image.png', width: 60, height: 60),
                  titie: Text(item['name'], style: const TextStryle(fontSize: 16, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    '${item['price'].toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',')}원',
                    style: const TextStryle(fontSize: 14),
                  ),
                  
                )
              }
            )
          )
        ]
      )
    )
  }
}