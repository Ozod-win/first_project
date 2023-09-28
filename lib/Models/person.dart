import 'dart:io';

void main() {
  // Foydalanuvchilar ro'yxati uchun bo'sh map yaratamiz
  Map<String, String> foydalanuvchilar = {};
//salom
  while (true) {
    print('Iltimos amalni tanlang:');
    print('1 - Sing up');
    print('2 - Sing in');
    print('3 - exit');

    stdout.write('Tanlov: ');
    String amal = stdin.readLineSync()!;

    if (amal == '1') {
      // Ro'yxatdan o'tish
      stdout.write('Ismingizni kiriting: ');
      String ism = stdin.readLineSync()!;
      stdout.write('Parolingizni kiriting: ');
      String parol = stdin.readLineSync()!;
      foydalanuvchilar[ism] = parol;
      print('Siz muvaffaqiyatli ro\'yxatdan o\'tdingiz!\n');
    } else if (amal == '2') {
      // Kirish
      stdout.write('Ismingizni kiriting: ');
      String ism = stdin.readLineSync()!;
      stdout.write('Parolingizni kiriting: ');
      String parol = stdin.readLineSync()!;
      if (foydalanuvchilar.containsKey(ism) && foydalanuvchilar[ism] == parol) {
        print('Xush kelibsiz, $ism!\n');
      } else {
        print("Kiritilgan ma'lumotlar noto'g'ri. Kirish uchun ro'yxatdan o'ting yoki ma'lumotlarni tekshiring.\n");
      }
    } else if (amal == '3') {
      // Chiqish
      print('Dasturni tugatamiz. Xayr!');
      break;
    } else {
      print("Noto'g'ri amal tanlandi. Iltimos, qaytadan tanlang.\n");
    }
  }
}
