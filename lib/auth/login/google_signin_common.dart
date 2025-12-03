import 'package:civic_force/dashboard_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../model/user_model.dart';
import '../../network_handling/network_manager.dart';
import '../../utils.dart';
import '../../utils/app_urls.dart';
import 'package:http/http.dart' as http;

class GoogleSignInCommon {
  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    try {
      await googleSignIn.initialize(
        // scopes: ['email', 'profile'],  // Specify scopes here if not using defaults
        // clientId: 'your-ios-or-web-client-id.googleusercontent.com',  // Optional: for iOS/Web
        // serverClientId: 'your-server-client-id.googleusercontent.com',  // Optional: for server-side verification
      );

      // Attempt lightweight authentication (silent sign-in if user is already signed in)
      // await googleSignIn.attemptLightweightAuthentication();
      final GoogleSignInAccount account = await googleSignIn.authenticate();
      final GoogleSignInAuthentication auth = account.authentication;
      final idToken = auth.idToken;
      // final accessToken = auth.accessToken;

      print("ID Token: $idToken");
      postGoogleSignIn(idToken: idToken);
      // print("Access Token: $accessToken");
      // Proceed with Firebase Auth or your backend (e.g., signInWithCredential using idToken)
    } catch (error) {
      print("Error signing in with Google: $error");
    }
  }

  postGoogleSignIn({idToken}) async {
    try{
      var res=await NetworkManager().post(AppUrls.googleLogin,data: {
        "idToken":idToken
      });
      print(res);

      UserModel userModel=UserModel.fromJson(res);
      if(userModel.status==200){
        token=userModel.data?.token??"";
        userInfo=userModel.data!.userInfo;

        box.write(Utils.userToken, userModel.data?.token);
        box.write(Utils.user, userModel.data?.userInfo?.toJson());
        box.write(Utils.intro, true);
        showToastSuccess(userModel.message!);
        // AwesomeNotificationController().updateFcmToken();
        Get.offAll(()=>DashboardScreen());
      }else{
        showToastError(userModel.message!);
        print(userModel.message);
      }
    }catch(e){
      print(e);
      showToastError("Something went wrong");
    }

  }
}