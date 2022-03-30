import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';
 import 'package:projectscoid/app/projectscoid.dart';



class  UserMyPurchasesIndex extends StatefulWidget {
  static const String PATH = '/user/my_purchases/index/:id';
    final String? id ;
   UserMyPurchasesIndex({Key? key, this.id}) : super(key: key);
  @override
   UserMyPurchasesIndexState createState() =>  UserMyPurchasesIndexState();
}

class  UserMyPurchasesIndexState extends State< UserMyPurchasesIndex> with RestorationMixin{
  String title = 'My Purchases'; 
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/user/my_purchases/index?page=%d';
  
  MyPurchasesController? my_purchases;
  TextEditingController searchBoxController = TextEditingController();
  ScrollController?  controller;

  bool selected = false;
  int page = 1;
  AccountController? accountController;
  bool account = true;
  String searchText = '';
   
   UserMyPurchasesListingState() {
   // scrollController.addListener(_onScroll);
  }

final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'MyPurchases';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MyPurchases');
  }

  @override
  Widget build(BuildContext context) {
        controller = ScrollController();

      if(widget.id!.contains('filter')|| widget.id!.contains('search'))
	  {
	      search = true;
	  }
      if(widget.id!.contains('filter')){
      var ids = widget.id!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/user/my_purchases/index?page=%d' + ids;
    }
	
	if(widget.id!.contains('search')){
      var ids = widget.id!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_purchases/index?page=%d&' + ids;
    }
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
			}

    });
	
	  
  //  my_purchases =  MyPurchasesController(AppProvider.getApplication(context),getPath, AppAction.indexing, '','','', search );
  //  my_purchases!.getTableMyPurchases(page);
    return WillPopScope(
         onWillPop:()async{
          //Navigator.pop(context);
		     Navigator.pushAndRemoveUntil(
								context,
								MaterialPageRoute(builder: (context) => Projectscoid(id : account ? listAccount[0]['user_hash'] : '')),
									(Route<dynamic> route) => false,
							  );
          return false;
        },
        child:

        Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: ()async{
                     Navigator.pop(context);
                  }
              ),
              //iconTheme: IconThemeData(
              //  color: Colors.white, //change your color here
              // ),
              actions: <Widget>[
                IconButton(
                    tooltip: 'Search',
                    icon: const Icon(Icons.search, color: Colors.white,),
                    onPressed: () async {
                      if (!selected) {
                        setState(() {
                          selected = true;
                        });
                      } else {
                        setState(() {
                          selected = false;
                        });
                      }
                    }
                )
              ],
              title: selected? buildSearchBar(title) : Text(title , style : TextStyle( color: Colors.white, ))  ,
            ),
            body: buildIndexBar(context)
        )
    );
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

Future _getTable(BuildContext context)async{
  my_purchases =  MyPurchasesController(AppProvider.getApplication(context),getPath, AppAction.indexing, '','','', search );
   return await my_purchases!.getTableMyPurchases(page);
}

  Widget buildSearchBar(String tiltle){
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
            style: new TextStyle(
                fontSize: 18.0,
                height: 0.2,
                color: Colors.black54
            ),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

           // hasFloatingPlaceholder: false,
            suffixIcon:
            IconButton(
              icon:Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ) ,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) , gapPadding: 20.0),
          ),
        )
    );
  }
  
 
  List<Widget> _getPages(dynamic pages){
    List<Widget> pagesList = [];
    for(int i=0; i< pages.tools.paging.total_pages; i++){
      pagesList.add(
           
                GestureDetector(
                  onTap:(){
                    setState((){
                      page = i + 1;
                    });
                  },
                  child: Text('|${(i+1).toString()}|', style: TextStyle(fontSize: 18)),
                )
              
          );
      
    }
    return pagesList;
  }

   // @override
  Widget buildIndexBar(BuildContext context){
     
		   return FutureBuilder<dynamic>(
                          future: _getTable(context), // a previously-obtained Future<String> or null
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            List<Widget> children;
                            if (snapshot.hasData) {
                              children = <Widget>[
                                
                                 Row(
                                   children:<Widget>[
                                     ..._getPages(snapshot.data),
                                   ] 
                                 ) ,
                                 
                                 
                                  snapshot.data.viewTable(context),
                                 
                              ];
                              return Scaffold(
                                   body : 
                                   SingleChildScrollView(
                                        controller: controller,
                                        physics: const AlwaysScrollableScrollPhysics(),
                                        reverse: false,

                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: children
                                        )
                                    ),
                                   
                                  //  body:  snapshot.data.viewTable(context)
                                        
                                    
                                    
                                    floatingActionButton: snapshot.data.Buttons(context, _dialVisible, account)

                              );

                            } else if (snapshot.hasError) {
                              children = <Widget>[
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text('Error: ${snapshot.error}'),
                                )
                              ];
                               return Scaffold(
                                    body:  DefaultTextStyle(
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .headline2!,
                                        textAlign: TextAlign.center,
                                        child: Column(
                                          children: children
                                        ) 
                                    
                                    )
                              );
                            } else {
                              children = <Widget>[
                               UserMyPurchasesBottomIndexLoader()
                              ];
                               return Scaffold(
                                    body:  DefaultTextStyle(
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .headline2!,
                                        textAlign: TextAlign.center,
                                        child: Column(
                                          children: children
                                        ) 
                                    
                                    ),
                                    
                              );
                            }
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: children,
                              ),
                            );
                          },
                        );
                      
							       // my_purchases.viewTable (context),
							
							
					//floatingActionButton: isLoading? null :  state.my_purchases.Buttons(context, _dialVisible, controller,my_purchases,  this, Env.value!.baseUrl!, '', title, account)		
                   
			 
  }

  @override
  void dispose() {
    super.dispose();
  }

  
}

class  UserMyPurchasesBottomIndexLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}



