class ShoppingCartLogic {
  // 중복 방지: 장바구니에 새 아이템 추가
  static void addToCart(
      List<Map<String, dynamic>> cartItems, Map<String, dynamic> newItem) {
    if (!cartItems.any((item) => item['item'] == newItem['item'])) {
      cartItems.insert(0, newItem); // 최신 데이터는 맨 앞에 삽입
    }
  }

  // 장바구니에서 아이템 삭제
  static void removeItem(List<Map<String, dynamic>> cartItems, int index) {
    cartItems.removeAt(index); // 아이템 삭제
  }

  // 총 가격 계산
  static int calculateTotalPrice(List<Map<String, dynamic>> cartItems) {
    return cartItems.fold<int>(
        0, (sum, item) => (item['price'] * item['quantity']) + sum);
  }
}