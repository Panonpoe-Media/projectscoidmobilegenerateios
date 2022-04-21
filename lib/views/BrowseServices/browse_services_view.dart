import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'screenshots_list.dart';
import 'service_reviews_list.dart';
import 'service_comments_list.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';

/** AUTOGENERATE OFF **/

class  PublicBrowseServicesView extends StatefulWidget {
    static const String PATH = '/public/browse_services/view/:id/:title';
    final String? id ;
    final String? title;
    ChatBloc? cb;
    PublicBrowseServicesView({Key? key, this.id, this.title, this.cb}) : super(key: key);
    @override
    PublicBrowseServicesViewState createState() =>  PublicBrowseServicesViewState();
}

class  PublicBrowseServicesViewState extends State< PublicBrowseServicesView>{
    String getPath = Env.value!.baseUrl! + '/public/browse_services/view/%s/%s';

    final double _appBarHeight = 230.0;
    AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    BrowseServicesController? browse_services;
    final formKey = GlobalKey<FormState>();
    var controller =  ScrollController() ;
    final _scrollThreshold = 200.0;
    double lastScroll = 0;
    bool scrollUp = false;
    var isLoading = true;
    String idHash = '';
    String  userid = '';
    // var viewBrowseServices;
    var model;
    AccountController? accountController;
    bool account = true;
    PublicBrowseServicesViewState(){
        controller.addListener(_onScroll);
    }

    @override
    initState(){
        super.initState();
        // controller = ScrollController();
    }
    void _onWidgetDidBuild(Function callback) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
            callback();
        });
        // next = false;
    }
    fetchData(BrowseServicesController? browse_services, BuildContext context)async {
        if (this.model == null) {
            final hash = browse_services!.getHash();
            hash.then((value) {
                this.idHash = value;
            });
            print('gagal');
            final future = browse_services!.viewBrowseServices();
            future.then((value) {
                print('berhasil');
                setState(() {
                    isLoading = false;
                });
                this.model = value;

            }).catchError((Error){
                _onWidgetDidBuild(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
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
        bool _hasSubModel = false;
        int modelCount = 0;
        String getSubPath = '';

        bool _dialVisible = true;
        browse_services = new  BrowseServicesController(AppProvider.getApplication(context),
            getPath,
            AppAction.view,
            widget.id!,
            widget.title!,
            null,
            false);
        print('PastProjectsViewModel45');
        fetchData(browse_services, context);
        accountController = new AccountController(AppProvider.getApplication(context),
            AppAction.view   );
        List listAccount = [];
        final future = accountController!.getAccount();
        future.then((val){

            listAccount.addAll(val);
            if(listAccount.length == 0){
                account = false;
            }else{
                account = true;
                userid = val.asMap()[0]['user_hash'];
            }

        });
        _hasSubModel	= true;
        modelCount = modelCount + 1;
        String getSubPathScreenshots = Env.value!.baseUrl! + '/public/browse_services/screenshots_list/'+widget.id!+'/'+widget.title! + '?';
        // model id service
        _hasSubModel	= true;
        modelCount = modelCount + 1;
        String getSubPathServiceReviews = Env.value!.baseUrl! + '/public/browse_services/service_reviews_list/'+widget.id!+'/'+widget.title! + '?';
        // model id service
        _hasSubModel	= true;
        modelCount = modelCount + 1;
        String getSubPathServiceComments = Env.value!.baseUrl! + '/public/browse_services/service_comments_list/'+widget.id!+'/'+widget.title! + '?';
        // model id service
        _hasSubModel	= false;
        if(_hasSubModel){



            return new DefaultTabController(
                length: modelCount + 1,
                child: Scaffold(
                    appBar: AppBar(
                        bottom: TabBar(
                            tabs: [
                                Tab(text: widget.title!),
                                Tab(text: 'Screenshots'),
                                Tab(text: 'ServiceReviews'),
                                Tab(text: 'ServiceComments'),
                            ],
                        ),
                        title: Text(widget.title!),
                    ),
                    body: isLoading?Center(
                        child:CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Colors.green),
                        ))
                        : TabBarView(
                        children: [
                            PublicBrowseServicesSubView(id : widget.id!, title : widget.title!, model:this.model),
                            ScreenshotsList(id : widget.id!, title : widget.title!, url : getSubPathScreenshots),
                            ServiceReviewsList(id : widget.id!, title : widget.title!, url : getSubPathServiceReviews),
                            ServiceCommentsList(id : widget.id!, title : widget.title!, url : getSubPathServiceComments),
                        ],
                    ),

                ),

            );

        }else{


            return Scaffold(
                /* appBar: AppBar(
			//title: Text(widget.title!.replaceAll('-', '  ')),
		  ),  */
                /*
		  appBar: isLoading?  AppBar(title: Text('', style : TextStyle( color: Colors.white, )), iconTheme: IconThemeData(
            color: Colors.white, //change your color here
            ),)
		  : scrollUp ? null : this.model.appBar(context, idHash),

           */

                body:isLoading?
                Center(
                    child:CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Colors.green),
                    ))
                    :Form(
                    key: formKey,
                    child: this.model.view1(context, controller, account, this, idHash, widget.cb)
                ),
                //floatingActionButton: isLoading? null :  this.model.Buttons(context, _dialVisible)
                // floatingActionButton: isLoading? null : this.model.model.buttons.length == 0? null: this.model.Buttons(context, _dialVisible, formKey, controller,browse_services,  this, Env.value!.baseUrl!, widget.id!, widget.title!, account)

            );

        }
    }

    void _onScroll() {
        final maxScroll = controller.position.maxScrollExtent;
        final currentScroll = controller.position.pixels;
        if(lastScroll > currentScroll){
            setState(() {
                scrollUp = false;
            });
        }else{
            setState(() {
                scrollUp = true;
            });
        }
        lastScroll = currentScroll;



    }

    @override
    void dispose() {
        super.dispose();
    }
}




class  PublicBrowseServicesSubView extends StatefulWidget {
    static const String PATH = '/public/browse_services/view/:id/:title';
    final String? id ;
    final String? title;
    var model;
    PublicBrowseServicesSubView({Key? key, this.id, this.title, this.model}) : super(key: key);
    @override
    PublicBrowseServicesSubViewState createState() =>  PublicBrowseServicesSubViewState();
}

class  PublicBrowseServicesSubViewState extends State< PublicBrowseServicesSubView>{

    BrowseServicesController? browse_services;
    final formKey = GlobalKey<FormState>();
    ScrollController? controller;
    var isLoading = true;
    // var viewBrowseServices;
    AccountController? accountController;
    bool account = true;

    @override
    initState(){
        super.initState();
        controller = ScrollController();
    }

    @override
    Widget build(BuildContext context) {

        bool _dialVisible = true;

        return Scaffold(
            appBar: null,
            body:Form(
                key: formKey,
                child: widget.model.view1(context, controller, account, this)
            ),
            floatingActionButton: isLoading? null :  widget.model.Buttons(context, _dialVisible, formKey, controller,browse_services,  this, Env.value!.baseUrl!, widget.id!, widget.title!, account)
        );


    }

    @override
    void dispose() {
        super.dispose();
    }
}


