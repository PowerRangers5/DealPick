import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChange;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onRemove,
    required this.onQuantityChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
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
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${item['price'].toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',')}원',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (item['quantity'] > 1) {
                            onQuantityChange(item['quantity'] - 1);
                          }
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
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          onQuantityChange(item['quantity'] + 1);
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
          // 삭제 버튼
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close, color: Colors.red),
            tooltip: '삭제',
          ),
        ],
      ),
    );
  }
}