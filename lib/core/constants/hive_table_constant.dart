class HiveTableConstant {
  HiveTableConstant._();

  // Database Name
  static const String dbName = 'binbuddy_database';

  // Table Type IDs
  static const int userTypeId = 0;
  static const String userTable = 'user_table';

  static const int recyclingProgressTypeId = 1;
  static const String recyclingProgressTable = 'recycling_progress_table';

  // Recycling Categories
  static const String plasticCategory = "Plastic";
  static const String paperCategory = "Paper";
  static const String organicCategory = "Organic";
  static const String metalCategory = "Metal";
  static const String glassCategory = "Glass";
  static const String electronicsCategory = "Electronics";

  // Default User Role
  static const String customerRole = "Customer";
}
