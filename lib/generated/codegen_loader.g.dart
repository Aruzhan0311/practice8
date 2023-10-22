// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart



import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "Hello": "Hi",
    "name": "Enter your name",
    "phone": "Enter your phonenumber",
    "email": "Enter your email",
    "life": "Tell about you",
    "password": "Enter password",
    "secondpass": "Enter password again",
    "add": "Add a new account",
  };
  static const Map<String, dynamic> kk = {
    "Hello": "Сәлем",
    "name": "Атыңызды енгізіңіз",
    "phone": "Телефон нөміріңізді енгізіңіз",
    "email": "Электрондық пошта мекенжайын енгізіңіз",
    "life": "Өзіңіз туралы айтыңыз",
    "password": "Құпия сөзді енгізіңіз",
    "secondpass": "Құпия сөзді қайтадан енгізіңіз",
    "add": "Жаңа аккаунт енгізу",
  };
  static const Map<String, dynamic> ru = {
    "Hello": "Привет",
    "name": "Введите имя",
    "phone": "Введите номер телефона",
    "email": "Введите почту",
    "life": "Расскажите о себе",
    "password": "Введите пароль",
    "secondpass": "Введите пароль снова",
    "add": "Добавить новый аккаунт",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "kk": kk,
    "ru": ru
  };
}
