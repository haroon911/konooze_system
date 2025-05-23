// for real phone setup
//first from computer we go to cmd and write ipconfig
// second we copy the ip and write it down here>>> then done :)
// const String serverLinkName = "http://10.0.2.2/hamour"; // for emulator
// const String serverLinkName = "http://192.168.1.5/hamour";
// const String serverLinkName = "http://127.0.0.1/hamour"; //for pc
// const String linkSignup = "$serverLinkName/auth/signup.php";
// const String linkLogin = "$serverLinkName/auth/login.php";
// //Note Crud Links
// const String linkAddNote = "$serverLinkName/notes/add.php";
// const String linkEditNote = "$serverLinkName/notes/edit.php";
// const String linkDeleteNote = "$serverLinkName/notes/delete.php";
// const String linkViewNote = "$serverLinkName/notes/view.php";
// const String linkImageRoot = "$serverLinkName/upload/";

class ApiLinks {
  //keep changin serverLinkName with your server link or in local write your ipconfig in cmd
  static const String _ipAddress = "127.0.0.1/dashboard"; //for emulator
  // static const String _ipAddress = "192.168.100.21/dashboard"; //for emulator
  // static const String _ipAddress = "localhost/dashboard";
  static const String server = "http://$_ipAddress/konooze";
  static const String imageLink = "$server/uploads/images";
  //auth
  static const String login = "$server/auth/login.php";
  //properties
  static const String propertyImageLink = "$imageLink/properties";
  // static const String propertiesLink = "$server/components/properties.php";
  static const String propertiesLink = "$server/components/properties/view.php";
  //units
  static const String viewPropertyUnitsLink =
      "$server/components/properties/units/view.php";
  static const String viewUnitsSalesLink =
      "$server/components/properties/units/unit_sales/view_unit_sales.php";
  //clients
  static const String clientsLink = "$server/components/clients";
  static const String clientImageLink = "$imageLink/clients";
  static const String veiwClientsLink = "$clientsLink/view.php";
  static const String addClientsLink = "$clientsLink/add.php";
  static const String editClientsLink = "$clientsLink/edit.php";

  //test
//   static const String test = "$server/test.php";
//   // ----------------- Auth Links
//   static const String signup = "$server/auth/signup.php";
//   static const String login = "$server/auth/login.php";
//   static const String signupVerification = "$server/auth/verification.php";
//   static const String resendVerification =
//       "$server/auth/resend_verification.php";
//   // ----------------- Forgot Password Links
//   static const String resetPassword =
//       "$server/forgot_password/reset_password.php";
//   static const String checkEmail = "$server/forgot_password/check_email.php";
//   static const String verificationReset =
//       "$server/forgot_password/verification.php";
//   //------------------ category
//   static const String categories = "$server/components/categories.php";
//   static const String home = "$server/home.php";
//   // ++++++++++++++ images importing
//   static const String categoryImages = "$_imageLink/categories";
//   static const String offerImages = "$_imageLink/offers";
//   static const String productImages = "$_imageLink/products";
//   // ----------------  Products
//   static const String products = "$server/components/products.php";
//   // ============ store_repositry
//   static const String addOnStore = "$server/components/store_repositry/add.php";
//   static const String removeFromStore =
//       "$server/components/store_repositry/remove.php";
//   static const String storeProducts =
//       "$server/components/store_repositry/view.php";

//   // 0-0-0-0-0-0-0-0-0- cart -0-0-0-0-0-0-0-0-0-0
//   static const String cartView = "$server/components/cart/view.php";
//   static const String cartAdd = "$server/components/cart/add.php";
//   static const String cartRemove = "$server/components/cart/remove.php";
//   static const String cartProdcutQuantity =
//       "$server/components/cart/product_quantity.php";
//   static const String searchProducts = "$server/search.php";
//   //~~~~~ ~~~ ~~~~~~~ Address
//   static const String addressAdd = "$server/components/address/add.php";
//   static const String addressView = "$server/components/address/view.php";
//   static const String addressUpdate = "$server/components/address/update.php";
//   static const String addressRemove = "$server/components/address/remove.php";
//   //~~~~~ ~~~ ~~~~~~~ Wallet
//   static const String walletAdd = "$server/components/wallet/add.php";
//   // --- ---- -------- Orders
//   static const String orderAdd = "$server/components/order/add.php";
//   static const String orderView = "$server/components/order/view.php";
}
