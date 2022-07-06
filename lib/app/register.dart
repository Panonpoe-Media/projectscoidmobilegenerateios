import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';

class Register extends StatefulWidget {
  static const String PATH = '/register';
  const Register({Key? key}) : super(key: key);
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register>{
  String sendPath = Env.value!.baseUrl! + '/public/new_user/register';

  RegisterController? registerController;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<String?>? register = [];
  var formData;
  var testPostResult;

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    register!.add('');
  }

  @override
  Widget build(BuildContext context) {
   {

      return Scaffold(
          appBar: AppBar(

            title: const Text('Register'),
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
                        //header
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              8.0, 14.0, 8.0, 2.0),
                          child: Html(data: "<h3>header</h3>"),
                        ),
                        //input
                        UsernameWidget(
                            value: register![0],
                            caption: 'Username',
                            hint: 'Isi dengan Username Anda',
                            required: true,
                            getValue: (String? val) {
                              setState(() {
                                register![0] = val;
                              });
                            }
                        ),
                        EmailWidget(
                          value: register![1],
                          caption: 'Email',
                          hint: 'Isi dengan Email Anda',
                          required:true,
                          getValue: (String? val) {
                            setState(() {
                              register![1] = val;
                            });
                          },
                        ),

                        CaptchaWidget(
                          value: register![2],
                          caption: 'Captcha',
                          hint: '',
                          required: true,
                          getValue:(String val) {
                            setState(() {
                              register![2] = val;
                            });
                          },
                        ),

                        //footer
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              8.0, 14.0, 8.0, 2.0),
                          child: Html(data: "<h3>footer</h3>"),
                        ),

                        //toolbar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                  //  textStyle: MaterialStateProperty.all<TextStyle>( const TextStyle(color: Colors.white,)),
                                    overlayColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                    foregroundColor : MaterialStateProperty.all<Color>(CurrentTheme.MainAccentColor),
                                  ),
                               //   padding: const EdgeInsets.all(20),
                                //  color: CurrentTheme.MainAccentColor,
                                  child: const Text('    Save    ',
                                      semanticsLabel: 'FLAT BUTTON 1',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24)),
                                  onPressed: () async {
                                    controller?.animateTo(controller!.position.minScrollExtent,
                                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                                    if (formKey.currentState!.validate()) {
                                      // print('validation ==== ${validation[0]}');
                                     // Map<String, dynamic> res = register.toJson();
                                     // print('json result == $res');
                                      convertToFormData(register);
                                      registerController = RegisterController(AppProvider.getApplication(context),
                                          sendPath,
                                          AppAction.post,
                                          formData);
                                      final future = registerController?.Register();
                                      future?.then((value) {
                                        setState(() {
                                          this.testPostResult = value;
                                        });
                                      });

                                    } else {}
                                    // _save(this.register);
                                  },
                                )
                            )
                          ],
                        ),

                      ]
                  )

              )


          )


      );
    }

  }

  @override
  void dispose() {
    super.dispose();
  }

  void convertToFormData(var data){
    var formData = {
      "register[_trigger_]":"",
      "register[user_name]":"${data[0]}",
      "register[email]":"${data[1]}",
      "register[captcha]":"${data[2]}"
    };
    this.formData = formData;

  }



}

