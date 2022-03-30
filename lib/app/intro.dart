
import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/tool/intro_slider.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';

class IntroScreen extends StatefulWidget {
  static const String PATH = '/intro';
  IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide>? slides = [];
  IntroController? introController ;
  AccountController? accountController;
  bool? isHide = false;

  @override
  void initState() {
    super.initState();

    slides?.add(
      Slide(
        title: "MUDAH",
        styleTitle: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 25, fontWeight: FontWeight.w800),
        description: "Akses ke ribuan tenaga profesional di bidangnya.",
        styleDescription: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),
        
pathImage: "assets/img/profesional.png",
        backgroundColor: CurrentTheme.BackgroundColor,
      ),
    );
    slides?.add(
      Slide(
        title: "FAIR",
        styleTitle: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 25, fontWeight: FontWeight.w800),
        description: "Projects.co.id mempunyai regulasi dan aturan main yang adil dan transparan demi kerjasama yang sehat dan saling menguntungkan.",
        styleDescription: const TextStyle(color: CurrentTheme.NormalTextColor,fontSize: 16),
		pathImage: "assets/img/rule.png",
        backgroundColor: CurrentTheme.BackgroundColor,
      ),
    );
    slides?.add(
      Slide(
        title: "TERPERCAYA",
        styleTitle: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 25, fontWeight: FontWeight.w800),
        description:
        "Semua informasi dan data transaksi yang masuk ke Projects.co.id dijamin kerahasiaannya dan dibackup secara berkala.",
        styleDescription: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),
        pathImage: "assets/img/security.png",
        backgroundColor: CurrentTheme.BackgroundColor,
      ),
    );
    slides?.add(
      Slide(
        title: "TERDEPAN",
        styleTitle: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 25, fontWeight: FontWeight.w800),
        description:
        "Mengawali setiap inovasi di dunia IT Indonesia.",
		styleDescription: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),
        pathImage: "assets/img/no1.png",
        backgroundColor: CurrentTheme.BackgroundColor,

      ),
    );
  }

  void onDonePress()async {
   /* AppProvider.getRouter(context).navigateTo(
        context,
        "/login"); */

    accountController = AccountController(AppProvider.getApplication(context),
        AppAction.view   );
    List listAccount = [];
    final future = accountController?.getAccount();
    future?.then((val){

      listAccount.addAll(val);

    });
  //  await accountController.getAccount();
    if(listAccount.isEmpty){
      Navigator.pushReplacementNamed(context, "/login/0");
    }else{
      Navigator.pushReplacementNamed(context, "/login/1");
    }


    // Do what you want
  }

  void onChangeCheckBox(bool value)async{
    introController = IntroController(AppProvider.getApplication(context),
      value,
      AppAction.listing
     );
    await introController?.setIntroSetting();

  }
  void onSkipPress() {
   /* AppProvider.getRouter(context).navigateTo(
        context,
        "/login"); */
    accountController = AccountController(AppProvider.getApplication(context),
        AppAction.view   );
    List listAccount = [];
    final future = accountController?.getAccount();
    future?.then((val){

      listAccount.addAll(val);

    });
    //  await accountController.getAccount();
    if(listAccount.isEmpty){
      Navigator.pushReplacementNamed(context, "/login/0");
    }else{
      Navigator.pushReplacementNamed(context, "/login/1");
    }
   // Navigator.pushReplacementNamed(context, "/login");
    // Do what you want
  }

  @override
  Widget build(BuildContext context) {

      return    IntroSlider(
          slides: slides,
            onChangeCheckBox : onChangeCheckBox,
            onDonePress: onDonePress,
            onSkipPress: onSkipPress,
            colorActiveDot:CurrentTheme.MainAccentColor ,
            styleNameDoneBtn: const TextStyle(color: CurrentTheme.NormalTextColor),
            styleNameSkipBtn: const TextStyle(color: CurrentTheme.NormalTextColor),
          );

  }
}