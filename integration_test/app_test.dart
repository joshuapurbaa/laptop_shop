import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:laptop_shop/main.dart' as app;
import 'package:laptop_shop/models/products.dart';

void main() {
  group('Testing full app flow', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Add product and remove using icon button', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final productList = Product().productList;
      final keys = productList;

      for (var key in keys) {
        await tester.tap(find.byKey(Key(key)));
      }

      await tester.tap(find.byKey(const Key('cart_screen_button')));

      final listFinder = find.byType(GridView);
      final firstProduct = find.text('Laptop Asus');

      await tester.scrollUntilVisible(listFinder, 5000);
      expect(firstProduct, findsOneWidget);
    });
  });
}
