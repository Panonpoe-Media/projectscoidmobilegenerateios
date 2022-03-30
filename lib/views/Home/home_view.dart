import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
//import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter/rendering.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';


class  UserHomeView extends StatefulWidget {

  static const String PATH = '/user/home/view/:id/:title';
  final String? id ;
  final String? title;
   UserHomeView({Key? key, this.id, this.title}) : super(key: key);
  @override
   UserHomeViewState createState() =>  UserHomeViewState();
}

class  UserHomeViewState extends State< UserHomeView>  with RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/user/home/view/%s/%s';

   HomeController? home;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  var viewHome;

final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'UserHome';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  initState(){
    super.initState();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;
 /*   home =    HomeController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        widget.id,
        widget.title,
        null); */
    if(this.viewHome == null) {
     /* final future = home.editHome();
      future.then((value) {
        setState(() {
          this.viewHome = value;
        });
      }); */
      return   Center( 
           child:CircularProgressIndicator(
           valueColor:   AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
    }else {

      return Scaffold(
          appBar: AppBar(

            title: Text(widget.title!),
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
						
						
                          DisplayNameView(
                            value: this.viewHome.username,
                            caption: 'Username',
                        ),
                          ImageView(
                            value: this.viewHome.photo,
                            caption: 'Photo',
                        ), 
                          ArticleView(
                            value: this.viewHome.news,
                            caption: 'News',
                        ),
						 				
                          Padding(
                          padding: const EdgeInsets.fromLTRB(
                              8.0, 14.0, 8.0, 2.0),
                          child: Html(data: "<h3>footer</h3>"),
                        ),


                      ]
                  )

              )


          ),

            floatingActionButton: SpeedDial(
            // both default to 16
           childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            // this is ignored if animatedIcon is non null
            // child: Icon(Icons.add),
            visible: _dialVisible,
            // If true user is forced to close dial manually
            // by tapping main button and overlay is not rendered.
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: CurrentTheme.MainAccentColor,
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: CircleBorder(),
            children: [

				SpeedDialChild(
                  child: Icon(Icons.save),
                  backgroundColor: Colors.red,
                  label: 'Home',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: ()=>{ AppProvider.getRouter(context)!.navigateTo(context,
				           // Home
						  "/public/test/view/" + this.viewHome.id.toString() + "/" +this.viewHome.ttl)},
              ),

            ],
          ),


            );
          }

  }


  @override
  void dispose() {
    super.dispose();
  }


}

