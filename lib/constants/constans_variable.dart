class StaticVariable {
  static String baseUrl = "https://alotazrighat.com/api/";
  static String baseImageUrl = "https://alotazrighat.com/services/";
  static String userAvatar = "https://alotazrighat.com/UserAvatar/";
  static String nurseCard = "https://alotazrighat.com/NurseLicenceCardPhoto/";
  static String smsSendCode = "Auth/SendCode";
  static String loginUser = "Auth/login";
  static String registerUser = "Customer/Home/register";

  static String service = "Customer/Service/All";
  static String activeRequest = "Customer/NurseRequest/GetAllActive";
  static String rejectRequest = "Customer/NurseRequest/Reject";

  static String iconPath = "assets/icons/";
}

enum NavbarItem { home, request, activeRequest }
