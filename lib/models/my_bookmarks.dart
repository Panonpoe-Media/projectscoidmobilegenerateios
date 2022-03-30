import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'image_fields.dart';
import 'file_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'credit.dart';
import 'payment.dart';
import 'selection.dart';
import 'my_bookmarks_item.dart';
import 'my_bookmarks_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'my_bookmarks_item_base.dart';
import 'package:projectscoid/models/my_bookmarks_base.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

/** AUTOGENERATE OFF **/


class MyBookmarksModel extends MyBookmarksBase{
  Map<String, dynamic> json;
  MyBookmarksModel(Map<String, dynamic> this.json):super(json); 	

  
}
 




///////////////////////////////////////////////////


class MyBookmarksListingModel extends MyBookmarksListingBase{
  Map<String, dynamic> json;
  MyBookmarksListingModel(Map<String, dynamic> this.json):super(json);
  
  @override
  Widget viewItemState (ItemMyBookmarksModel item,String? search, int? index, BuildContext context, bool? account, State st,  VoidCallback onrefresh) {
    ShapeBorder? shape;
    double? height = 100;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemMyBookmarksCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  Slidable(
          /*
            startActionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,

          secondaryActions: <Widget>[
            IconSlideAction(
              key: Key(index.toString()),
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: ()async {
                SubModelController del;
                String delPath = Env.value.baseUrl + item.item.buttons[0].url;
                del =  SubModelController(AppProvider.getApplication(context),
                    delPath,
                    null);
                await AppProvider.getApplication(context).projectsDBRepository.deleteAllMyBookmarksList();
                await del.getData();
               onrefresh();


               // st.setState(()async {

                  // item.item.removeAt(index);

                // });

                ///
                /// SnackBar show if cart delete
                ///
               // Scaffold.of(context)
                //    .showSnackBar(SnackBar(content: Text('cartDeleted'),duration: Duration(seconds: 2),backgroundColor: Colors.redAccent,));
              },
            ),
          ],
          
           */
            key: Key(index.toString()),

            // The start action pane is the one at the left or the top side.
            startActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              dismissible: DismissiblePane(onDismissed: () {}),

              // All actions are defined in the children parameter.
              children:  [

                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (BuildContext? context)async{
                    SubModelController del;
                    String delPath = Env.value!.baseUrl! + item.item.buttons[0].url;
                    del =  SubModelController(AppProvider.getApplication(context!),
                        delPath,
                        null);
                    await AppProvider.getApplication(context).projectsDBRepository!.deleteAllMyBookmarksList();
                    await del.getData();
                    onrefresh();
                  },
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),

              ],
            ),

            // The end action pane is the one at the right or the bottom side.

          child: //Container(width: 200.0, height: 10.0, color: Colors.blue),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only( left: 0.0, right: 0.0),
                /// Background Constructor for card
                child: Container(
                  height: height,
                  padding: const EdgeInsets.only( left: 0.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding : EdgeInsets.only(top : 10, left: 10.0, right: 10.0),
                            child:  Container(
                              width: 60,
                              height: 65,
                              decoration: ShapeDecoration(
                                shadows:[
                                  BoxShadow(color: Colors.grey, offset: Offset(0.6, 0.6)),
                                ],

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      width: 2,
                                      color: Colors.white
                                  ),
                                ),


                                image: DecorationImage(
                                  image: NetworkImage(item.item.logo),
                                  fit: BoxFit.none,

                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.0, left: 10.0, right: 5.0),
                              child: Column(

                                /// Text Information Item
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                  // Padding(padding: EdgeInsets.only(top: 10.0)),
                                  HtmlWidget(
                                    '<a href="${item.item.url}">${item.item.title}</a>',
                                    //readText(item.item.title, 250),
                                    //bodyPadding: EdgeInsets.only(top: 0.0, left: 0.0,right: 5.0),
                                    textStyle: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                    ),
                                    onTapUrl: (url) async{
                                      if(url.contains('projects.co.id')){


                                        if(url.contains(RegExp(r'[0-9]'))){
                                          if(url.contains('show_conversation')){
                                            AppProvider.getRouter(context)!.navigateTo(
                                                context,
                                                urlToRoute(url+ '/' ));
                                          }else{
                                            AppProvider.getRouter(context)!.navigateTo(
                                                context,
                                                urlToRoute(url )).catchError((onError){

                                              AppProvider.getRouter(context)!.pop(context);
                                            });
                                          }

                                        }else{
                                          AppProvider.getRouter(context)!.navigateTo(
                                              context,
                                              urlToRoute(url + '/'));
                                        }


                                      }else
                                      {

                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }


                                      }


                                      throw 'Could not launch ';

                                    },
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 5.0)),
                                  Text('${item.item.url}', style: TextStyle(fontSize: 12),),


                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),


                    ],
                  ),
                ),
              ),

            ],
          )



        ),
    );
  }


}

void doNothing(BuildContext context) {

}

//class ItemMyBookmarks extends class ItemMyBookmarksBase{
//
//}



////////////////////////////
