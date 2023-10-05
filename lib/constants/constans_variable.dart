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
  static String finishedRequest = "Customer/NurseRequest/finish";
  static String getAllRequest = "Customer/NurseRequest/GetAll";
  static String discountApplaied =
      "Customer/Discount/IsDiscountAppliableOnRequest";
  static String addRequest = "Customer/NurseRequest/AddRequest";
  static String payUrl = "https://alotazrighat.com/api/Finance/Pay/";

  static String detailService = "Customer/Service/Detail/";
  static String allCities = "Area/AllCities";
  static String allArea = "Area/AllAreas/";

  static String iconPath = "assets/icons/";
}

enum NavbarItem { home, request, activeRequest }
