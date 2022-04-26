import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Setting extends StatefulWidget {
  static const String PATH = '/setting';
  const Setting({Key? key, this.id}) : super(key: key);
  final String? id;
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting>{

  RegisterController? registerController;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  IntroController? introController;
  bool? intro;
  ThemeMode? _groupValue;
  ThemeManager? _themeManager;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    _themeManager = Provider.of<ThemeManager>(context, listen: false);
    _groupValue = _themeManager!.themeMode;
    controller = ScrollController();
    _initPackageInfo();
  }

  void _updateTheme(ThemeMode? themeMode) {
    _themeManager!.themeMode = themeMode;
  }

  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    var darkMode;
    //_authenticationBloc = BlocProvider.of<AuthenticationController>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;

    {
      introController = IntroController(AppProvider.getApplication(context),
          false,
          AppAction.listing
      );
      if(intro == null) {
        final future = introController!.getIntroSetting();
        future.then((value) {
          if(value) {
            setState(() {
              intro = true;
            });
          } else{
            setState(() {
              intro = false;
            });

          }
        });
        return const SizedBox(width: 0.0, height: 0.0);
      }else {
      return Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white,),
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Projectscoid(id :  widget.id!)),
                        (Route<dynamic> route) => false,
                  );
                },
              ),

            title: Text('Setting', style: const TextStyle(color: Colors.white)),
          ),
          body:
          Form(
              key: formKey,
              child: SingleChildScrollView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        BooleanWidget(
                          value: intro,
                          caption: 'Hide Intro',
                          hint: 'Isi dengan Boolean Anda',
                          required:false,
                          getValue: (bool val) async{
                            setState(() {
                              intro = val;
                            });
                            introController = IntroController(AppProvider.getApplication(context),
                                val,
                                AppAction.listing
                            );
                            await introController!.setIntroSetting();
                          },
                        ),

                        ItemListWidget(
                            tooltip: 'Send message',
                            onPressed: (){
                            },
                            lines:
                            'Delete Local Database',
                            lines1:
                            '',
                            isdivided: false,
                            wgt:
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 2.0),
                                child:
                                Container(
                                  // padding: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                                    alignment: Alignment.center,
                                    // height: widget.filename == '' || widget.filename == null ? 140.0 : 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(color: CurrentTheme.ShadeColor),
                                      //color: CurrentTheme.ShadeColor,
                                    ),
                                    child :
                                    GestureDetector(
                                      onTap: ()async{

                                        introController = IntroController(AppProvider.getApplication(context),
                                            true,
                                            AppAction.listing
                                        );
                                        await introController!.deleteAll();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10,),
                                        child: Text('Delete Local Database', style: TextStyle(fontSize: 18.0),),

                                      )
                                    )
                                )
                            )

                        ),
                        ItemListWidget(
                            tooltip: 'Send message',
                            onPressed: (){
                            },
                            lines:
                            'Select Theme',
                            lines1:
                            '',
                            isdivided: false,
                            wgt:
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 2.0),
                                child:
                                      Container(
                                        // padding: const EdgeInsets.all(8.0),
                                          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                                          alignment: Alignment.center,
                                         // height: widget.filename == '' || widget.filename == null ? 140.0 : 180,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.0),
                                            border: Border.all(color: CurrentTheme.ShadeColor),
                                            //color: CurrentTheme.ShadeColor,
                                          ),
                                          child :
                                          Row(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Radio(
                                                    onChanged: (val) => setState(() {
                                                      _groupValue = val as ThemeMode?;
                                                      _updateTheme(val);
                                                    }),
                                                    value: ThemeMode.light,
                                                    groupValue: _groupValue,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () => setState(() {
                                                      var val = ThemeMode.light;
                                                      _groupValue = val;
                                                      _updateTheme(val);
                                                    }),
                                                    child: const Text(
                                                      "Light",
                                                      style: TextStyle(fontSize: 18.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Radio(
                                                    onChanged: (val) => setState(() {
                                                      _groupValue = val as ThemeMode?;
                                                      _updateTheme(val);
                                                    }),
                                                    value: ThemeMode.dark,
                                                    groupValue: _groupValue,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () => setState(() {
                                                      var val = ThemeMode.dark;
                                                      _groupValue = val;
                                                      _updateTheme(val);
                                                    }),
                                                    child: const Text(
                                                      "Dark",
                                                      style: TextStyle(fontSize: 18.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],

                                          )
                                      )
                            )

                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child:
                          Text('Version ${_packageInfo.version}+${_packageInfo.buildNumber}', style: TextStyle(color: Colors.grey, fontSize: 15),),

                        )


                      ]


                  )


               )
           )
      );

      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

}

