import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthSignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _isLogged = false.obs;
  final _userEmail = "".obs;

  bool get isLogged => _isLogged.value;

  String get userEmail => _userEmail.value;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      _userEmail.value = googleUser.email;
      _isLogged.value = true;
    }
  }

  void signOut() {
    _googleSignIn.signOut();
    _isLogged.value = false;
    _userEmail.value = "";
  }
}
  // Future<void> signInWithGoogle() async {
  //   try {
  //     final googleProvider = GoogleAuthProvider();

  //     await FirebaseAuth.instance.signInWithPopup(googleProvider);
  //     Get.offNamed(RealPurchasePage.routeName);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

