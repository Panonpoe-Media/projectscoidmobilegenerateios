import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
//import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';

class PublicKelurahanAdd extends StatefulWidget {
  static const String PATH = '/public/kelurahan/add/:id/:title';
  PublicKelurahanAdd({Key? key}) : super(key: key);
  @override
  PublicKelurahanAddState createState() => PublicKelurahanAddState();
}

class PublicKelurahanAddState extends State<PublicKelurahanAdd>{
  String getPath = Env.value!.baseUrl! + '/public/kelurahan/add';
 // String sendPath = Env.value!.baseUrl! + '/public/kelurahan/add';
  String sendPath = Env.value!.baseUrl! + '/public/kelurahan/add';

  KelurahanController? kelurahan;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
 // var modelKelurahan;
 var model;
  var formData;
  var postKelurahanResult;
    var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
	];

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }


 fetchData(KelurahanController? kelurahan)async {
    if (this.model == null) {
      final future = kelurahan!.editKelurahan();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
          this.model = value;

        });
      }
    }


  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;
    kelurahan = new  KelurahanController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        '',
        '',
        null,
		false);

      fetchData(kelurahan);
      return Scaffold(
          appBar: AppBar(

            title: Text('Kelurahan'),
          ),
          body:isLoading?
             // Center(
             //   child: CircularProgressIndicator(),
             // )
              Container(width: 0.0, height: 0.0)
             :Form(
              key: formKey,
              child: SingleChildScrollView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
					  children: isLoading? [] : [
							  Padding(
								padding: const EdgeInsets.fromLTRB(
									8.0, 14.0, 8.0, 2.0),
								child: Html(data: "<h3>Header</h3>"),
							  ),
							   this.model.editProvinsi(this),  
							   this.model.editKabupaten(this),  
							   this.model.editKecamatan(this),  
							   this.model.editNamaKelurahan(this),  
							   this.model.editKodePos(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                    
                  )

              )
          ),

            floatingActionButton: isLoading? [] : this.model.Buttons(context, _dialVisible, formKey, controller,kelurahan, postKelurahanResult, this, sendPath, '', '')


      );

  }


  @override
  void dispose() {
    super.dispose();
  }
  
 

}

