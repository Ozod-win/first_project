// import 'dart:io';
//
// bool isEven(int num) {
//   return num % 2 == 0;
// }
//
// void main() {
//   print("Sonni kiriting: ");
//   int num = int.parse(stdin.readLineSync()!);
//
//   if (isEven(num)) {
//     print('$num juft son');
//   } else {
//     print('$num toq son');
//   }
// }
//



// import 'dart:io';
//
// bool isPrime(int num) {
//   if (num <= 1) {
//     return false;
//   }
//
//   for (int i = 2; i * i <= num; i++) {
//     if (num % i == 0) {
//       return false;
//     }
//   }
//
//   return true;
// }
//
// void main() {
//   print("Sonni kriting: ");
//   int num = int.parse(stdin.readLineSync()!);
//
//   if (isPrime(num)) {
//     print('$num Tub son');
//   } else {
//     print('$num Tub emas');
//   }
// }


import 'dart:io';

void printNumbersUpTo(int n) {
  for (int i = 0; i <= n; i++) {
    print(i);
  }
}

void main() {
  print("Raqam kiriting: ");
  int num = int.parse(stdin.readLineSync()!);
  printNumbersUpTo(num);
}
