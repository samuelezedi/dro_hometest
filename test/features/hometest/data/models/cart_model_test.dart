import 'dart:convert';

import 'package:dro_hometest/features/hometest/data/models/cart_model.dart';
import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String js = """
    {
    "cart_id": "1",
    "item_id": 1,
    "quantity": 2
}
""";

  const tCartModel = CartModel(cartId: '1', itemId: 1, quantity: 2);

  var tCart = Cart(cartId: '1', itemId: 1, quantity: 2);

  group('test 1', () {
    test('shuold be a subclass of cart entity', () async {
      //assert
      final result = tCartModel.toEntity();
      expect(result, equals(tCart));
    });
  });

  group('test 2', () {
    test('should return valid model from json', () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(js);
      print(jsonMap);

      //act
      final result = CartModel.fromJson(jsonMap);

      print(result.runtimeType);
      print(tCartModel.runtimeType);

      //assert
      expect(result, equals(tCartModel));
    });
  });

  group('test 3 ', () {
    test('should return a json map containing proper data', () async {
      //act
      final result = tCartModel.toJson();

      //assert
      final expectedJsonMap = {'cart_id': '1', 'item_id': 1, 'quantity': 2};
      expect(result, equals(expectedJsonMap));
    });
  });
}
