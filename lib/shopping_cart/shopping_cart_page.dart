import 'package:flutter/material.dart';
import 'package:flutter_dealpick/shopping_cart/shopping_cart_logic.dart';
import 'package:flutter_dealpick/shopping_cart/widgets/cart_item_widget.dart';
import 'package:flutter_dealpick/shopping_cart/widgets/total_price_widget.dart';

class ShoppingCartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const ShoppingCartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // 장바구니 아이템 리스트
          Expanded(
            child: widget.cartItems.isEmpty
                ? const Center(
                    child: Text('장바구니가 비어 있습니다.', style: TextStyle(fontSize: 16)),
                  )
                : ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        item: widget.cartItems[index],
                        onRemove: () {
                          setState(() {
                            ShoppingCartLogic.removeItem(
                                widget.cartItems, index);
                          });
                        },
                        onQuantityChange: (quantity) {
                          setState(() {
                            widget.cartItems[index]['quantity'] = quantity;
                          });
                        },
                      );
                    },
                  ),
          ),
          // 총 가격 및 구매 버튼
          TotalPriceWidget(
            totalPrice: ShoppingCartLogic.calculateTotalPrice(widget.cartItems),
            onPurchase: () {
              setState(() {
                widget.cartItems.clear();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('구매가 완료 되었습니다!')),
              );
            },
          ),
        ],
      ),
    );
  }
}