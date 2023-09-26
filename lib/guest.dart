import 'dart:math';
import 'dart:io';

enum DifficultyMode { easy, medium, hard, unknown }

void guessNumber() {
  int attempts = 5;
  bool isTerminated = false;

  while (!isTerminated) {
    late int chosenNumber;
    late DifficultyMode difficultyLevel;

    print("""
Qiyinchilik darajasini tanlang:
1. Oson (0 - 10)
2. O'rta (0 - 30)
3. Qiyin (0 - 100)
Ilovadan chiqish uchun "exit" so'zini kiriting!
          """);
    String? input = stdin.readLineSync();

    if (input != null) {
      if (input == "exit") {
        print("Ilovadan foydalanganingiz uchun rahmat!");
        isTerminated = true;
        break;
      }
      chosenNumber = int.tryParse(input) ?? -1;
      bool isOrderValid = validateOrder(chosenNumber);

      if (chosenNumber == -1) {
        print(
          "Siz noto'g'ri qiymat kiritingiz. Iltimos, yaroqli qiymat kiriting!",
        );
        continue;
      } else if (isOrderValid) {
        assert(isOrderValid, "Yaroqsiz buyruqni olib tashlash kerak");
        bool isGameTerminated = false;
        switch (chosenNumber) {
          case 1:
            difficultyLevel = DifficultyMode.easy;
            break;
          case 2:
            difficultyLevel = DifficultyMode.medium;
            break;
          case 3:
            difficultyLevel = DifficultyMode.hard;
            break;
          default:
            difficultyLevel = DifficultyMode.unknown;
        }

        int randomNumber = generateNewRandomNumber(difficultyLevel);
        while (!isGameTerminated) {
          attempts--;
          print("Iltimos, raqam kiriting:");
          String? input = stdin.readLineSync();

          int pickedNumber = int.tryParse(input!) ?? -1;

          if (pickedNumber == -1) {
            print("Siz kiritgan raqam yaroqli emas!");
          } else {
            if (randomNumber == pickedNumber) {
              print(
                  "Siz topdingiz! Topish uchun ${5 - attempts} marta harakat qilding!");
              attempts = 5;
              isGameTerminated = true;
              continue;
            } else {
              if (attempts > 0) {
                print(
                  "Topa olmadingiz. Sizda $attempts ta urinish qoldi!",
                );
              } else {
                isGameTerminated = true;
                attempts = 5;
                print(
                  "Siz yutqazdingiz. Raqam armon bo'lib qolmasin. U $randomNumber edi",
                );
                break;
              }
            }
          }
        }
      } else {
        print(
          "Siz noto'g'ri buyruq kiritdingiz! Iltimos, buyruqlarni tekshirib, qayta kiriting!",
        );
        continue;
      }
    }
  }
}

/// Bu funksiya menyu uchun yozilgan inputlarni validatsiya qiladi
/// Qiymatlar [1...3]
bool validateOrder(int value) {
  // TODO: Make it formatted

  if (value == 1) {
    return true;
  } else if (value == 2) {
    return true;
  } else if (value == 3) {
    return true;
  } else {
    return false;
  }
}

int generateNewRandomNumber(DifficultyMode value) {
  Random random = Random();
  if (value == DifficultyMode.easy) {
    return random.nextInt(10);
  } else if (value == DifficultyMode.medium) {
    return random.nextInt(30);
  } else if (value == DifficultyMode.hard) {
    return random.nextInt(100);
  } else {
    assert(false, "Kodni qayta tekshiring! Noto'g'ri qiymat kirib qolgan!");
    return -1;
  }
}
