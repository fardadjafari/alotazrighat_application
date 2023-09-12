import 'package:form_validator/form_validator.dart';

class Uservalidator {
  static final userNameValidator =
      ValidationBuilder(requiredMessage: "وارد کردن ضروری می باشد")
          .minLength(2, "طول نام وارد شده معتبر نمی باشد ")
          .maxLength(64, "طول نام وارد شده معتبر نمی باشد ")
          .regExp(RegExp("^[0-9ا-یآ_\s]+"), "از حروف انگلیسی استفاده نکنید")
          .build();

  static final userFamilyValidator =
      ValidationBuilder(requiredMessage: "وارد کردن ضروری می باشد")
          .minLength(3, "طول نام خانوادگی وارد شده معتبر نمی باشد")
          .maxLength(64, "طول نام خانوادگی وارد شده معتبر نمی باشد")
          .regExp(RegExp("^[0-9ا-یآ_\s]+"), "از حروف انگلیسی استفاده نکنید")
          .build();

  static final phoneNumberValidator =
      ValidationBuilder(requiredMessage: "شماره همراه وارد شده معتبر نمی باشد")
          .minLength(11, "شماره همراه وارد شده معتبر نمی باشد")
          .maxLength(11, "شماره همراه وارد شده معتبر نمی باشد")
          .regExp(RegExp("09([0]|[1]|[2]|[3]|[9])([0-3]|[5-9])([0-9]){7}"),
              "شماره همراه وارد شده معتبر نمی باشد")
          .build();

  static final pssswordValidator =
      ValidationBuilder(requiredMessage: "رمز وارد شده معتبر نمی باشد")
          .minLength(5, "رمز  وارد شده معتبر نمی باشد")
          .maxLength(5, "رمز  وارد شده معتبر نمی باشد")
          .build();

  static final ageUserValidator =
      ValidationBuilder(requiredMessage: "سال تولد وارد شده معتبر نمی باشد")
          .minLength(2, " سال تولد وارد شده معتبر نمی باشد")
          .maxLength(2, "سال تولد وارد شده معتبر نمی باشد")
          .regExp(RegExp("[0-9]"), "سال تولد وارد شده معتبر نمی باشد")
          .build();

  static final experineceUserValidator =
      ValidationBuilder(requiredMessage: "سابقه کاری وارد شده معتبر نمی باشد")
          .minLength(1, " سابقه کاری وارد شده معتبر نمی باشد")
          .maxLength(2, "سابقه کاری  وارد شده معتبر نمی باشد")
          .build();

  static final addressUserValidator =
      ValidationBuilder(requiredMessage: "محدوده آدرسی وارد شده معتبر نمی باشد")
          .minLength(3, " محدوده آدرسی وارد شده معتبر نمی باشد")
          .maxLength(34, "محدوده آدرسی وارد شده معتبر نمی باشد")
          .build();
}
