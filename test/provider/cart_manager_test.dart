import 'package:flutter_test/flutter_test.dart';
import 'package:laptop_shop/models/cart_manager.dart';

void main() {
  test('A new item should be added', () {
    // Arrange
    final cartManager = CartManager();
    const mockNewCartItem = 'Mock Laptop Asus';
    // Act
    cartManager.addToCart(mockNewCartItem);
    // Assert
    final result = cartManager.cartList.contains(mockNewCartItem);
    expect(result, true);
  });
}
