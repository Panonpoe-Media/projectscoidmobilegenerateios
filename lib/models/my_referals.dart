
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/core/components/utility/tool/expand_space_bar.dart';

import 'meta.dart';
import 'photo.dart';
import 'button.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';

import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/models/my_referals_base.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_referals.g.dart';
/** AUTOGENERATE OFF **/


class MyReferalsModel extends MyReferalsBase{
  Map<String, dynamic> json;
  MyReferalsModel(Map<String, dynamic> this.json):super(json); 	

  
}


@JsonSerializable()
class ViewModelMyReferalsRev {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  String? affiliate_id;
  String? affiliate_id_str;
  int? referal_this_month;
  String? referal_this_month_str;
  int? cookies_this_month;
  String? cookies_this_month_str;
  int? refered_users;
  String? refered_users_str;
  double? referal_earnings;
  String? referal_earnings_str;
  String? user_id;
  //Referals referals;

  //
  ViewModelMyReferalsRev(
      this.id,
      this.affiliate_id,
      this.referal_this_month,
      this.referal_this_month_str,
      this.cookies_this_month,
      this.cookies_this_month_str,
      this.refered_users,
      this.refered_users_str,
      this.referal_earnings,

      this.referal_earnings_str,
      this.user_id,

      );


  factory ViewModelMyReferalsRev.fromJson(Map<String, dynamic> json) => _$ViewModelMyReferalsRevFromJson(json);


}
/*
ViewModelMyReferalsRev _$ViewModelMyReferalsRevFromJson(Map<String, dynamic> json) {
  return ViewModelMyReferalsRev(
      json['id'] as String,
      json['affiliate_id'] as String,
      json['referal_this_month'] as int,
      json['referal_this_month_str'] as String,
      json['cookies_this_month'] as int,
      json['cookies_this_month_str'] as String,
      json['refered_users'] as int,
      json['refered_users_str'] as String,
      (json['referal_earnings'] as num)?.toDouble(),
      json['referal_earnings_str'] as String,
      json['user_id'] as String?
      )
    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String?
    ..pht = json['pht'] as String?
    ..sbttl = json['sbttl'] as String?
    ..affiliate_id_str = json['affiliate_id_str'] as String?;
}

 */

@JsonSerializable()
class MyReferalsViewSuperBaseRev {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyReferalsRev? model;
  MyReferalsViewSuperBaseRev(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );


  factory MyReferalsViewSuperBaseRev.fromJson(Map<String, dynamic> json) => _$MyReferalsViewSuperBaseRevFromJson(json);

}
/*
MyReferalsViewSuperBaseRev _$MyReferalsViewSuperBaseRevFromJson(
    Map<String, dynamic> json) {
  return MyReferalsViewSuperBaseRev(
      json['id'] as String,
      (json['buttons'] as List)
          ?.map((e) =>
      e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ViewModelMyReferalsRev.fromJson(
          json['model'] as Map<String, dynamic>));
}

 */



class MyReferalsViewModel  extends MyReferalsViewBase{
  Map<String, dynamic> json;
  bool progresscircular = false;
  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  bool isLoading = true;
  String? link = '';
  Photo? foto;
  DIOProvider? provider;
  final double _appBarHeight = 280.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
 // MyReferalsViewModel(Map<String, dynamic> this.json):super(json);
  MyReferalsViewModel(Map<String, dynamic> this.json):super(json){model = MyReferalsViewSuperBaseRev.fromJson(this.json);}
  @override
  Widget body (BuildContext context, ScrollController controller,  bool? account, GlobalKey<ScaffoldState> ss, State state) {
    var dateformat = DateFormat('dd/MM/yyyy');
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    return(

        DefaultTabController(

            length: 2,
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
                      icon: const Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
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
                                Text('My Referals', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.black87)),
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
                              'assets/img/no2.png',
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
                        Tab(text: "Referals Info",),
                        Tab(text: "Referals"),
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
                              color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                              elevation: 1.0,
                              margin: EdgeInsets.all(10.0),
                              child :CategoryWidget(
                                title: 'Referals',
                                isDark: darkMode,
                                subtitle : 'Program Affiliate Projects.co.id adalah program yang memungkinkan setiap user di Projects.co.id mendapatkan penghasilan “passive income” dengan cara mempromosikan website Projects.co.id kepada calon user lainnya. Apabila orang tersebut mendaftar ke Projects.co.id karena link yang Anda berikan maka orang tersebut menjadi referral Anda, dan ketika orang (referral) tersebut menghasilkan transaksi di Projects.co.id, maka secara otomatis Anda mendapat komisi.',
                                children: <Widget>[

                                  ItemListString(
                                      icon: Icons.arrow_forward_ios,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PublicBrowseUsersView(id : model.model.affiliate_id, title: 'zzz', )),
                                        );
                                      },
                                      lines: <String>[
                                        'User',
                                        model.meta.title,
                                      ]
                                  ),

                                  ItemListString(
                                    // icon: Icons.arrow_forward_ios,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){

                                      },
                                      lines: <String>[
                                        'Affiliate ID',
                                        model.model.affiliate_id,
                                      ]
                                  ),

                                  ItemListString(
                                    // icon: Icons.arrow_forward_ios,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){

                                      },
                                      lines: <String>[
                                        'Referals this month',
                                        model.model.referal_this_month.toString(),
                                      ]
                                  ),

                                  ItemListString(
                                    // icon: Icons.arrow_forward_ios,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){

                                      },
                                      lines: <String>[
                                        'Cookies this month',
                                        model.model.cookies_this_month.toString(),
                                      ]
                                  ),

                                  ItemListString(
                                    //  icon: Icons.arrow_forward_ios,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){

                                      },
                                      lines: <String>[
                                        'Refered User',
                                        model.model.refered_users.toString(),
                                      ]
                                  ),

                                  ItemListString(
                                    //  icon: Icons.arrow_forward_ios,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      isdivided: false,
                                      onPressed: (){

                                      },
                                      lines: <String>[
                                        'Referal Earnings',
                                        model.model.referal_earnings_str,
                                      ]
                                  ),


                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                  ReferalsList(id: model.model.affiliate_id, title:'', url: Env.value!.baseUrl! + '/user/my_referals/referals_index/'+ model.model.affiliate_id+'/' + 'referals' + '?'),
                ],

              ),
            )
        )
    );

  }
  
}


///////////////////////////////////////////////////


class MyReferalsListingModel extends MyReferalsListingBase{
  Map<String, dynamic> json;
  MyReferalsListingModel(Map<String, dynamic> this.json):super(json);  


}

//class ItemMyReferals extends class ItemMyReferalsBase{
//
//}



////////////////////////////
