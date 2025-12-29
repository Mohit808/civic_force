import 'dart:ui';

import 'package:get/get.dart';

import '../../../utils.dart';


class ControllerAppLanguage extends GetxController{

  List list = [
    {"t1": "English","t2":"English","t3":"Hi there how are you","t4":"a","code":"en_US"},
    {"t1": "Hindi","t2":"हिन्दी","t3":"नमस्ते, आप कैसे हैं?","t4":"अ","code":"hi_IN"},

    {"t1": "Spanish","t2":"Español","t3":"Hola, ¿cómo estás?","t4":"a","code":"es_ES"},
    {"t1": "French","t2":"Français","t3":"Salut, comment ça va?","t4":"a","code":"fr_FR"},
    {"t1": "German","t2":"Deutsch","t3":"Hallo, wie geht's dir?","t4":"a","code":"de_DE"},
    {"t1": "Chinese","t2":"中文","t3":"你好，你怎么样？","t4":"你","code":"zh_CN"},
    {"t1": "Japanese","t2":"日本語","t3":"こんにちは、お元気ですか？","t4":"こ","code":"ja_JP"},
    {"t1": "Korean","t2":"한국어","t3":"안녕하세요, 어떻게 지내세요?","t4":"아","code":"ko_KR"},
    {"t1": "Arabic","t2":"العربية","t3":"مرحبا، كيف حالك؟","t4":"م","code":"ar_SA"},
    {"t1": "Russian","t2":"Русский","t3":"Привет, как дела?","t4":"П","code":"ru_RU"},

    {"t1": "Portuguese","t2":"Português","t3":"Olá, tudo bem?","t4":"O","code":"pt_PT"},
    {"t1": "Italian","t2":"Italiano","t3":"Ciao, come stai?","t4":"C","code":"it_IT"},
    {"t1": "Turkish","t2":"Türkçe","t3":"Merhaba, nasılsın?","t4":"M","code":"tr_TR"},
    {"t1": "Bengali","t2":"বাংলা","t3":"হ্যালো, কেমন আছো?","t4":"হ","code":"bn_IN"},
    {"t1": "Tamil","t2":"தமிழ்","t3":"வணக்கம், எப்படி இருக்கிறீர்கள்?","t4":"வ","code":"ta_IN"},

    {"t1": "Telugu","t2":"తెలుగు","t3":"హలో, మీరు ఎలా ఉన్నారు?","t4":"హ","code":"te_IN"},
    {"t1": "Kannada","t2":"ಕನ್ನಡ","t3":"ಹಲೋ, ನೀವು ಹೇಗಿದ್ದೀರಿ?","t4":"ಹ","code":"kn_IN"},
    {"t1": "Gujarati","t2":"ગુજરાતી","t3":"હેલો, તમે કેમ છો?","t4":"હ","code":"gu_IN"},
    {"t1": "Marathi","t2":"मराठी","t3":"नमस्कार, तुम्ही कसे आहात?","t4":"न","code":"mr_IN"},
    {"t1": "Punjabi","t2":"ਪੰਜਾਬੀ","t3":"ਸਤ ਸ੍ਰੀ ਅਕਾਲ, ਤੁਸੀਂ ਕਿਵੇਂ ਹੋ?","t4":"ਸ","code":"pa_IN"},

    {"t1": "Urdu","t2":"اردو","t3":"ہیلو، آپ کیسے ہیں؟","t4":"ہ","code":"ur_PK"},
    {"t1": "Nepali","t2":"नेपाली","t3":"नमस्ते, तपाईंलाई कस्तो छ?","t4":"न","code":"ne_NP"},
    {"t1": "Sinhala","t2":"සිංහල","t3":"හෙලෝ, කොහොමද ඔබට?","t4":"හ","code":"si_LK"},
    {"t1": "Malayalam","t2":"മലയാളം","t3":"ഹലോ, നിങ്ങൾ എങ്ങനെയുണ്ട്?","t4":"ഹ","code":"ml_IN"},
  ];


  int selectedIndex = -1;

  @override
  void onInit() {
    super.onInit();
    String? savedLang = box.read('lang');
    if(savedLang!=null){
      selectedIndex=list.indexWhere((test)=>test['code']==savedLang);
    }
  }

  void changeLanguage(String fullCode) {
    // fullCode looks like "ne_NP"
    final parts = fullCode.split('_');

    if (parts.length == 2) {
      String langCode = parts[0];   // "ne"
      String countryCode = parts[1]; // "NP"

      var locale = Locale(langCode, countryCode);
      Get.updateLocale(locale);

      box.write('lang', fullCode);
    } else {
      print("Invalid locale code: $fullCode");
    }
  }

}