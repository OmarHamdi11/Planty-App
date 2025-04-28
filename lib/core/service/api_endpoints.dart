class ApiEndpoints {
  // Base URL for the API
  static const String baseURL = "http://planty.runasp.net";

  // Authentication Endpoints
  static const String register = "/api/Account/Register";
  static const String login = "/api/Account/Login";

  // User Endpoints
  static const String getUserProfile = "/user/profile";
  static const String updateUserProfile = "/user/update";

  // Plant Endpoints
  static const String getPlants = "/plants";
  static const String getPlantDetails = "/plants/details";
  static const String addPlant = "/plants/add";

  // Other Endpoints
  static const String fetchNotifications = "/notifications";
  static const String fetchSettings = "/settings";
}
