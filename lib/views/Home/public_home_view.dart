import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter/rendering.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';


class  PublicHomeView extends StatefulWidget {

  static const String PATH = '/public/home';
   PublicHomeView({Key? key}) : super(key: key);
  @override
   PublicHomeViewState createState() =>  PublicHomeViewState();
}

class  PublicHomeViewState extends State< PublicHomeView> with RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/public/home';

   SubModelController? Home;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var viewHome;
  var isLoading = true;

final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'PublicHome  ';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  fetchData(SubModelController? Home, BuildContext context)async {
    if (this.viewHome == null) {

      final future = Home!.getData();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
        this.viewHome = PublicHomeModel.fromJson(value);

      }).catchError((Error){
		 _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		});
    }
  }



  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;
    Home = new  SubModelController(AppProvider.getApplication(context),
        getPath,
        null);

      fetchData(Home, context);
      return Scaffold(
          appBar: AppBar(

            title: Text('Home'),
          ),
          body: isLoading?Center( 
           child:CircularProgressIndicator(
           valueColor: new AlwaysStoppedAnimation<Color>(
            Colors.green),
          ))
              : Form(
              key: formKey,
              child: SingleChildScrollView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //header
                        new Padding(
                          padding: const EdgeInsets.fromLTRB(
                              8.0, 14.0, 8.0, 2.0),
                          child: Html(data: this.viewHome.status),
                        ),

                      ]
                  )

              )


          ),

		);


  }


  @override
  void dispose() {
    super.dispose();
  }


}

