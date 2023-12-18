import 'package:rice_cooker/rice_cooker.dart';
import 'package:test/test.dart';

void main() {
  group('RiceCooker', () {
    test('plug() should toggle pluggedIn status', () {
      RiceCooker riceCooker = RiceCooker();

      expect(riceCooker.pluggedIn, isFalse);

      riceCooker.plug();
      expect(riceCooker.pluggedIn, isTrue);

      riceCooker.plug();
      expect(riceCooker.pluggedIn, isFalse);
    });

    test('setQuantity() should update quantity within maxCapacity', () {
      RiceCooker riceCooker = RiceCooker();

      expect(riceCooker.quantity, equals(0));

      riceCooker.setQuantity(2000);
      expect(riceCooker.quantity, equals(2000));

      riceCooker.setQuantity(4000);
      expect(riceCooker.quantity, equals(0));
    });

    test('setCookTime() should update cookTime when positive', () {
      RiceCooker riceCooker = RiceCooker();

      expect(riceCooker.cookTime, equals(0));

      riceCooker.setCookTime(30);
      expect(riceCooker.cookTime, equals(30));

      riceCooker.setCookTime(-10);
      expect(riceCooker.cookTime, equals(30));
    });

    test('setWaterAmount() should update waterAmount when positive', () {
      RiceCooker riceCooker = RiceCooker();

      expect(riceCooker.waterAmount, equals(0));

      riceCooker.setWaterAmount(500);
      expect(riceCooker.waterAmount, equals(500));

      riceCooker.setWaterAmount(-50);
      expect(riceCooker.waterAmount, equals(500));
    });

    test('cookRice() should print appropriate messages', () {
      RiceCooker riceCooker = RiceCooker();

      riceCooker.cookRice();

      riceCooker.plug();
      riceCooker.cookRice();

      riceCooker.setQuantity(2000);
      riceCooker.cookRice();

      riceCooker.setWaterAmount(500);
      riceCooker.cookRice();
    });
  });
}
