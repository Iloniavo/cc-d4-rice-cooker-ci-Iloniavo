import 'dart:io';

import 'package:rice_cooker/rice_cooker.dart';

void handleChoice(String option, RiceCooker riceCooker) {
  switch (option) {
    case '1':
      riceCooker.plug();
      break;
    case '2':
      print('Enter rice quantity:');
      String? newQuantityString = stdin.readLineSync();
      int? newQuantity = int.tryParse(newQuantityString ?? '');
      if (newQuantity != null) {
        riceCooker.setQuantity(newQuantity);
      }
      break;
    case '3':
      print('Enter new cook time:');
      String? newCookTimeString = stdin.readLineSync();
      int? newCookTime = int.tryParse(newCookTimeString ?? '');
      if (newCookTime != null) {
        riceCooker.setCookTime(newCookTime);
      }
      break;
    case '4':
      print('Enter new water amount:');
      String? newWaterAmountString = stdin.readLineSync();
      int? newWaterAmount = int.tryParse(newWaterAmountString ?? '');
      if (newWaterAmount != null) {
        riceCooker.setWaterAmount(newWaterAmount);
      }
      break;
    case '5':
      riceCooker.cookRice();
      break;
    case '6':
      print("Goodbye !!");
      exit(0);
    default:
      print('Invalid option');
  }
}


void main(List<String> arguments) {
  var riceCooker = RiceCooker();

  while (true) {
    print('1. Plug in/out');
    print('2. Set rice quantity');
    print('3. Set cook time');
    print('4. Set water amount');
    print('5. Cook rice');
    print('6. Exit');

    print('Choose an option:');
    String? option = stdin.readLineSync();
    if (option == '8') {
      break;
    }
    handleChoice(option!, riceCooker);
  }
}

