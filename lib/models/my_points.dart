import 'my_points_item_base.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/models/my_profile_base.dart';
import 'package:projectscoid/core/components/utility/tool/expand_space_bar.dart';
import 'dart:async';
import 'meta.dart';
import 'photo.dart';
import 'button.dart';
import 'dart:io';
import 'package:photo_view/photo_view.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'package:path/path.dart' as p;
//import 'package:image/image.dart' as img;
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/models/my_points_base.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';

/** AUTOGENERATE OFF **/


class MyPointsModel extends MyPointsBase{
  Map<String, dynamic> json;
  MyPointsModel(Map<String, dynamic> this.json):super(json); 	

  
}
 


class MyPointsViewModel  extends MyPointsViewBase{
  Map<String, dynamic> json;
  bool progresscircular = false;
  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  bool isLoading = true;
  String link = '';
  Photo? foto;
  DIOProvider? provider;
  final double _appBarHeight = 280.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  MyPointsViewModel(Map<String, dynamic> this.json):super(json){model = MyPointsViewSuperBase.fromJson(this.json);}
  @override
  Widget body(BuildContext context, ScrollController controller, bool?account, GlobalKey<ScaffoldState> ss, State state) {
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    var dateformat = DateFormat('dd/MM/yyyy');
    return(

        DefaultTabController(

            length: 7,
            child: NestedScrollView(
              controller: controller,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                 //   title: Text('My Points', style: TextStyle(color: CurrentTheme.DisableTextColor),),

                 //   centerTitle: true,
                    elevation: 4.0,
                    backgroundColor:darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                    expandedHeight: _appBarHeight,
                    forceElevated : true,
                    pinned: true,
                    leading: IconButton(
                      icon: Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Projectscoid(id :  model.model.user_id)),
                              (Route<dynamic> route) => false,
                        );
                      },
                    ),
                    //pinned: _appBarBehavior == AppBarBehavior.pinned,
                    floating: _appBarBehavior == AppBarBehavior.floating ||
                        _appBarBehavior == AppBarBehavior.snapping,
                    snap: _appBarBehavior == AppBarBehavior.snapping,
                    flexibleSpace:
                    ExpandSpaceBar(
                      title: InkWell(
                          onTap : (){
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(model.buttons[0].url));
                          },
                          child : Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('My Points', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.black87)),
                              ])
                      ),
                      titlePadding: EdgeInsets.only(bottom: 65, left: 50),
                      collapseMode: CollapseBarMode.parallax,
                     // centerTitle: true,
                      background: Stack(
                        fit: StackFit.passthrough,
                        children: <Widget>[
                          InkWell(
                            //  onTap: () {_createProfilePhoto(context, model.model.user_id);},

                            child: Image.asset(
                              'assets/img/no1.png',
                              fit: BoxFit.cover,
                              // height: 100,
                              // width: 100,
                            ),

                          ),
                          // This gradient ensures that the toolbar icons are distinct
                          // against the background image.
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.0, -1.0),
                                end: Alignment(0.0, -0.4),
                                colors: <Color>[
                                  Color(0x60000000),
                                  Color(0x00000000)
                                ],
                              ),
                            ),
                          ),

                          // This gradient ensures that the toolbar icons are distinct
                          // against the background image.
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.0, -1.0),
                                end: Alignment(0.0, -0.4),
                                colors: <Color>[
                                  Color(0x60000000),
                                  Color(0x00000000)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ), centerTitle: null,

                    ),
                    bottom:
                    TabBar(
                      labelColor: CurrentTheme.PrimaryDarkColor,
                      unselectedLabelColor: CurrentTheme.DisableTextColor,
                      indicatorColor : CurrentTheme.PrimaryDarkColor,
                      indicatorWeight: 3.0,
                      isScrollable: true,
                      indicatorPadding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
                      indicatorSize : TabBarIndicatorSize.label,

                      tabs: [
                        Tab(text: "Point Info",),
                        Tab(text: "Pesta Points"),
                        Tab( text: "Worker Points"),
                        Tab(text: "Owner Points"),
                        Tab(text: "Seller Points"),
                        Tab(text: "Buyer Points"),
                        Tab(text: "Affiliate Points"),
                      ],
                    ),


                  ),

                ];
              },
              body: TabBarView(
                children: [

                  Container(
                    color:  darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                    child:
                    SingleChildScrollView(
                      // controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      reverse: false,
                      child: Column(
                          children: <Widget>[
                            Card(
                              elevation: 1.0,
                              color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                              margin: EdgeInsets.all(10.0),
                              child :CategoryWidget(
                                isDark: darkMode,
                                title: 'Point',
                                subtitle : 'Setiap Anda menyelesaikan pekerjaan di Projects.co.id, Anda akan mendapatkan poin reputasi, poin reputasi ini merupakan investasi yang sangat berharga bagi Anda, karena dengan poin tersebut Anda akan semakin mudah mendapatkan project-project selanjutnya.',
                                children: <Widget>[

                                  ItemListString(
                                      icon: Icons.arrow_forward_ios,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      isdivided: false,
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PublicBrowseUsersView(id : model.model.user_id, title: 'zzz', )),
                                        );
                                      },
                                      lines: <String>[
                                        'User',
                                        model.meta.title,
                                      ]
                                  ),


                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),


                  PointsPestaList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_points/points_pesta_index/'+ model.model!.user_id! +'/' + 'points_pesta' + '?'),
                  PointsWorkerList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_points/points_worker_index/'+ model.model!.user_id! +'/' + 'points_worker' + '?'),
                  PointsOwnerList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_points/points_owner_index/'+ model.model!.user_id! +'/' + 'points_owner' + '?'),
                  PointsSellerList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_points/points_seller_index/'+ model.model!.user_id! +'/' + 'points_seller' + '?'),
                  PointsBuyerList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_points/points_buyer_index/'+ model.model!.user_id! +'/' + 'points_buyer' + '?'),
                  PointsAffiliateList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_points/points_affiliate_index/'+ model.model!.user_id! +'/' + 'points_affiliate' + '?'),
                ],

              ),
            )
        )
    );

  }


}


///////////////////////////////////////////////////


class MyPointsListingModel extends MyPointsListingBase{
  Map<String, dynamic> json;
 MyPointsListingModel(Map<String, dynamic> this.json):super(json);


}

//class ItemMyPoints extends class ItemMyPointsBase{
//
//}



////////////////////////////
