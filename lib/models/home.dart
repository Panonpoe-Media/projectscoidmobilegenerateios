import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'dart:io';
import 'package:timeago/timeago.dart' as timeago;
import 'package:projectscoid/models/home_base.dart';
import 'package:projectscoid/models/home_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/style.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/models/model.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';



/** AUTOGENERATE OFF **/
class HomeListingModel extends HomeListingBase{
  Map<String, dynamic> json;
  HomeListingModel(Map<String, dynamic> this.json):super(json);

  @override
  Widget viewItemIndex (ItemHomeModel item,String search, int index) {
    ShapeBorder?shape;
    double height = 220;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item!.toJson())).contains(search)),
        child:  ItemHomeCard1(destination :item, search : search, shape : shape, height : height, index : index)
    );
  }


  //@override
  Widget viewItemcb (ItemHomeModel item,String search, ChatBloc cb,  HomeController HomeC) {
    ShapeBorder?shape;
    double height = 220;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item!.toJson())).contains(search)),
        child:  ItemHomeCard2(destination :item, search : search, shape : shape, height : height, cb : cb, hcb : HomeC )
    );
  }
  //@override
  Widget viewItem2 (ItemHomeModel item,ItemHomeModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index, ChatBloc notif, HomeController HomeC , Function fc) {
    HomeController home;
    bool isDifDate = false;
    bool isFirst = false;
    var formatter =  DateFormat('dd MMMM yyyy');
    var formatter1 =  DateFormat('HH : mm');
    var formatter2 =  DateFormat('dd MMMM yyyy');
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    TimelineTile _buildTimelineTile({
      _IconIndicator? indicator,
      String? hour,
      String? weather,
      String? temperature,
      String? phrase,
      bool? isLast = false,
    }) {

      return TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.17,
       // beforeLineStyle: LineStyle(color: Colors.black),
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0.3,
          drawGap: true,
          width: 18,
          height: 18,
          indicator: indicator,
        ),
        isLast: isLast!,
        startChild: Center(
          child: Text(
            hour!,
            style: const TextStyle(
              fontSize: 12,
             // color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        endChild: Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 10, top: 0, bottom: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                weather!,
                style: const TextStyle(
                  fontSize: 16,
                 // color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Html(data: phrase ,

                  // useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 ),
                  style: {
                    "html": Style(
                      fontSize: FontSize.large,

                    ),
                    "a": Style(
                      color: Colors.red,
                    ),

                  },
                  onLinkTap: (url, _, __, ___) async{
                    HomeC.listing!.add(HomeListingRefresh());
                    fc(true);
                    if(url!.contains('projects.co.id')){

                      if(url!.contains('user/my_purchases/download/')){
                       /*
                        home =   HomeController(AppProvider.getApplication(context),
                            Env.value!.baseUrl!+ urlToRoute(url),
                            AppAction.post,
                            '',
                            'projectscoiddownloadFile',
                            null,
                            false);
                        final future = home.downloadFile();

                        */

                        SubModelController my_purchases;
                        my_purchases =   SubModelController(AppProvider.getApplication(context),
                            Env.value!.baseUrl!+ urlToRoute(url),
                            null);
                        final future = my_purchases.getPurchaseDownload();
                        future.then((value) {
                          var val = value.queryParameters.values.last ;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ShowMediaFile(file: value.toString(),fz: '', basename: val,)));
                          // state.setState(() {
                          // post{{controller_ucase}}Result = value;
                          //AppProvider.getRouter(context)!.pop(context);
                          // });
                        }).catchError((Error){
                          AppProvider.getRouter(context)!.pop(context);
                        });

                          /*

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowMediaFile(file: url,fz: '', basename: url!.split('/')[7].replaceAll('-', ' '),)));

                           */

                      }else{
                        if(url!.contains( RegExp(r'[0-9]'))){
                          //*8*usr611711ccc202012015fc5cc5eb24aa.jpg*l
                          if(url!.contains('show_conversation')){
                            //  var = item.item!.user_photo.sp;
                            if(url!.contains('my_projects')){
                              url = '$url*${item.item!.user_name}*${item.item!.user_name}*${item.item!.user_photo!.split('?')[0].replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}*l';
                            //  print('urlku === $url');
                             bool res = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowConversationMyProjects(id : '${url!.split('/')[6]}', title : '${url!.split('/')[7]}', id1: '${url!.split('/')[8]}', cb: notif)),
                              );
                             if(!res){
                               HomeC.listing!.add(HomeListingRefresh());
                               fc(true);
                             }

                            }else{
                              url = '$url/*${item.item!.user_name}*${item.item!.user_name}*${item.item!.user_photo!.split('?')[0].replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}*l';
                              bool res = await  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowConversationMyBids(id : '${url!.split('/')[6]}', title : '${url!.split('/')[7]}', id1: '${url!.split('/')[8]}', cb: notif)),
                              );
                              if(!res){
                                HomeC.listing!.add(HomeListingRefresh());
                                fc(true);
                              }


                            }


                            //print('haloooooooooooo === $url');



                            // AppProvider.getRouter(context)!.navigateTo(
                            //     context,
                            //     url);


                            //  print('haloooooooooooo');

                            /*
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url));

                             */
                          }else{

                            if(url!.contains('show_thread')){

                              url.indexOf(url!.split('/')[6]);
                              // url.substring(0, url.indexOf(url!.split('/')[6]));
                              url = '${url.substring(0, url.indexOf(url!.split('/')[7]))}${item.item!.user_name}*20*${item.item!.user_photo!.split('?')[0].replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}*l';

                              /*
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          url);

                                       */


                            // print('haloooooooooooo st ${url!.split('/')[6]}');

                              bool res = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${url!.split('/')[6]}', title : '${item.item!.user_name}*20*${item.item!.user_photo!.split('?')[0].replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}*l', cb: notif)),
                              );

                              if(!res){
                                HomeC.listing!.add(HomeListingRefresh());
                              }
                             /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(url));

                              */

                            }else if(url!.contains('my_projects/view')){

                              SubModelController check;
                              String delPath = url.replaceAll('https://projects.co.id', Env.value!.baseUrl!) ;
                              check =   SubModelController(AppProvider.getApplication(context),
                                  delPath,
                                  null);
                              var data = await check.getData();
                              if(jsonEncode(data).contains('admin_note')){
                               // print('horeeeee lagi gun');
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url)).catchError((onError) {
                                  AppProvider.getRouter(context)!.pop(context);
                                });
                              }else{
                                //https://projects.co.id/public/browse_projects/view/3cd918/slicing-figma-to-wordpress
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute('https://projects.co.id/public/browse_projects/view/${url!.split('\/')[6]}/service-order-from-martabakbangka-artikrl-kesehatan')).catchError((onError) {
                                  AppProvider.getRouter(context)!.pop(context);
                                });
                              }
                             // print(data);
                            }else {

                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(url)).catchError((onError) {
                                AppProvider.getRouter(context)!.pop(context);
                              });
                            }
                          }

                        }else{
                          if(url!.contains('mediakit')){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowMediaFile(file: url!,fz: '1.347 KB', basename: url!.split('/')[5],)));
                          }else{
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url + '/listing/'));
                          }
                        }
                      }

                    }else
                    {

                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }


                    }




                  }),


            ],
          ),
        ),
      );
    }
    final date1 = item1.item?.date;
    final date2 = item.item!.date!;
    final difference = date2?.difference(date1!).inDays;
    if(difference != 0){
      isDifDate = true;
    }
    if(index == 0){
      isDifDate = true;
      isFirst = true;
    }
    if(isDifDate){
      if(isFirst){
        return Column(
          children:<Widget>[
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.17,
              isFirst: true,
              indicatorStyle: IndicatorStyle(
                drawGap: true,
                indicatorXY: 0.5,
                width: 18,
                height: 18,
                indicator: _Sun(),
              ),
             // beforeLineStyle: LineStyle(color: Colors.black),
              endChild: _ContainerHeader(),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.17,
              isFirst: false,

              indicatorStyle: const IndicatorStyle(
                indicatorXY: 0.5,
                drawGap: true,
                width: 18,
                height: 18,
                indicator: _IconIndicator1(
                  iconData: Icons.circle,
                  size: 13,
                ),
              ),
             // beforeLineStyle: LineStyle(color: Colors.black),
              endChild: _ContainerHeader1(item: item),
            ),
            _buildTimelineTile(
              indicator: const _IconIndicator(
                iconData: Icons.circle,
                size: 13,
              ),
              hour: formatter1.format(item.item!.date!!),
              weather: item.item!.user_name ,
              temperature: '26°C',
              phrase: item.item!.message,
            ),
          ]
        );
      }else{
        return Column(
            children:<Widget>[

              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.17,
                isFirst: false,

                indicatorStyle: IndicatorStyle(
                  indicatorXY: 0.5,
                  drawGap: true,
                  width: 18,
                  height: 18,
                  indicator: const _IconIndicator1(
                    iconData: Icons.circle,
                    size: 13,
                  ),
                ),
               // beforeLineStyle: LineStyle(color: Colors.black),
                endChild:
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 0,
                    maxHeight: 30,
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 16, right: 10, top: 0, bottom: 0),
                    child:    Text(
                      formatter2.format(item.item!.date!!),
                      style: TextStyle(
                        fontSize: 20,
                        // color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                /*
                Padding(
                  padding:
                  const EdgeInsets.only(left: 16, right: 10, top: 0, bottom: 0),
                  child:    Text(
                    formatter.format(item.item!.date!),
                    style: TextStyle(
                      fontSize: 20,
                      // color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                 */
                //_ContainerHeader1(item: item),
              ),
              _buildTimelineTile(
                indicator: const _IconIndicator(
                  iconData: Icons.circle,
                  size: 13,
                ),
                hour: formatter1.format(item.item!.date!),
                weather: item.item!.user_name ,
                temperature: '26°C',
                phrase: item.item!.message,
              ),
            ]
        );
      }
    }else{
    return  _buildTimelineTile(
        indicator: const _IconIndicator(
          iconData: Icons.circle,
          size: 16,
        ),
      hour: formatter1.format(item.item!.date!),
      weather: item.item!.user_name ,
        temperature: '26°C',
        phrase:  item.item!.message,
      );

    }


  }

}


class _Sun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(

        shape: BoxShape.circle,
        color: Colors.black54,
      ),
    );
  }
}


class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    Key? key,
    this.iconData,
    this.size,
  }) : super(key: key);

  final IconData? iconData;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black54,
          ),
        ),

      ],
    );
  }
}

class _IconIndicator1 extends StatelessWidget {
  const _IconIndicator1({
    Key? key,
    this.iconData,
    this.size,
  }) : super(key: key);

  final IconData? iconData;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black54,
          ),
        ),

      ],
    );
  }
}


class _ContainerHeader extends StatelessWidget {
  final now = DateTime.now();
  var formatter =  DateFormat('yyyy');
  var formatter1 =  DateFormat('HH : mm');
  var formatter2 =  DateFormat('dd MMM');
  var formatter3 =  DateFormat('EEEE');
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Now - ${formatter1.format(now)}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              formatter.format(now),
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text(
                    formatter3.format(now),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF4A448F).withOpacity(0.8),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  formatter2.format(now),
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF4A448F).withOpacity(0.8),
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


class _ContainerHeader1 extends StatelessWidget {
  const _ContainerHeader1({
    Key? key,
    this.item,
  }) : super(key: key);

  final ItemHomeModel? item;
   @override
  Widget build(BuildContext context) {
     var formatter =  DateFormat('dd MMMM yyyy');

     return

       Padding(
         padding:
         const EdgeInsets.only(left: 16, right: 10, top: 40, bottom: 0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[

             Text(
               formatter.format(item!.item!.date!),
               style: const TextStyle(
                 fontSize: 20,
                // color: Colors.black,
                 fontWeight: FontWeight.w800,
               ),
             ),
           ],
         ),
       );

       /*

       Container(
      constraints: const BoxConstraints(minHeight: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(
              formatter.format(item.item!.date!),
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),

          ],
        ),
      ),
    );

        */
  }
}




class ItemHomeCard1 extends StatelessWidget {
  const ItemHomeCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemHomeModel? destination;
  final String? search;
  final ShapeBorder?shape;
  final int? index;



  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
          child: Column(
            children: <Widget>[
              // const SectionTitle(title: ''),

              SizedBox(
                height:index == 0 ?  400 : height,
                /*   child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                margin: EdgeInsets.all(0.0),
                borderOnForeground : false, */
                child: index == 0 ? ItemHomeContent2(destination: destination!) :ItemHomeContent1(destination: destination!),
                //   ),
              ),

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
                height: 2.0,
                decoration:  BoxDecoration(
                  //color: Colors.lightBlue[100],
                  color:CurrentTheme.ListColor,
                ),
              )
            ],
          )
      ),
    );
  }
}


class ItemHomeCard2 extends StatelessWidget {
  const ItemHomeCard2({ Key? key, @required this.destination, this.search, this.shape, this.height, this.cb, this.hcb})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemHomeModel? destination;
  final String? search;
  final ShapeBorder?shape;
  final ChatBloc? cb;
  final HomeController? hcb;



  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    /*
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child: Column(
          children: <Widget>[
            // const SectionTitle(title: ''),
            Container(
             // height: height,
              // child: Card(
              // This ensures that the Card's children are clipped correctly.
              //   clipBehavior: Clip.antiAlias,
              //   shape: shape,
              //  margin: EdgeInsets.all(0.0),
              child: ItemHomeContent2(destination: destination, cb: cb),
            ),
            // ),
            Container(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              alignment: Alignment.center,
              height: 2.0,
              decoration:  BoxDecoration(
                //color: Colors.lightBlue[100],
                color:CurrentTheme.ListColor,
              ),
            )

          ],
        ),
      ),
    );

     */

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child:
        Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          //  shadowColor: CurrentTheme.ListColor,

          child: ItemHomeContent2(destination: destination!, cb: cb!, hcb : hcb!),

        ),

      ),
    );
  }
}

class ItemHomeContent1 extends StatelessWidget {
  const ItemHomeContent1({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemHomeModel? destination;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;


    final List<Widget> children = <Widget>[
      // Photo and title.
      SizedBox(
        height: 35.0,

        child: Stack(
          children: <Widget>[

            //  Positioned.fill(
            // In order to have the ink splash appear above the image, you
            // must use Ink.image. This allows the image to be painted as part
            // of the Material and display ink effects above it. Using a
            // standard Image will obscure the ink splash.

            //child: //Ink.image(
            // alignment: FractionalOffset.centerLeft,

            // image: AssetImage(destination!.UserName, package: destination!.assetPackage),
            //fit: BoxFit.cover,
            //height: 41.0,
            //width: 30.0,
            //   child:  Container()

            //  ),
            //  ),
            Positioned(
              bottom: 0.0,
              left: 16.0,
              right: 16.0,
              //top: 0.0,
              child:    Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // three line description
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                            destination!.item!.user_photo!,
                          fit: BoxFit.cover,
                          height: 22.0,
                          width: 22.0,

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                destination!.item!.user_name!,
                                style: descriptionStyle.copyWith(color: Colors.black87,fontSize: 20 ),
                              ),

                            ]

                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Photo and title.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              Padding(
                padding: const EdgeInsets.only(left: 3.0),

              ),
            ],
          ),
        ),
      ),
      SizedBox(
          height:  120.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  bottom: 2.0,
                  left: 16.0,
                  right: 16.0,
                  // In order to have the ink splash appear above the image, you
                  // must use Ink.image. This allows the image to be painted as part
                  // of the Material and display ink effects above it. Using a
                  // standard Image will obscure the ink splash.
                  child: Ink(
                      child:
                      Html(data: readText(destination!.item!.message! , 90) ,
                          style: {
                            "html": Style(
                                fontSize: FontSize.small,
                                color: Colors.black87,
                                backgroundColor: CurrentTheme.NormalTextColor
                            ),
                          },
                          onLinkTap: (url, _, __, ___) {
                            if(url!.contains( RegExp(r'[0-9]'))){
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(url ));
                            }else{
                              if(url!.contains('mediakit')){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ShowMediaFile(file: url,fz: '1.347 KB', basename: url!.split('/')[5],)));
                              }else{
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url + '/listing/'));
                              }
                            }


                          } )

                  )),

            ],
          ),
        ),

      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 2.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(

            children: <Widget>[
              // three line description
              Text(
                'Published . ',
                style: descriptionStyle.copyWith(color: Colors.black87),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(timeago.format(destination!.item!.date!)
                  ,
                  style: descriptionStyle.copyWith(color: Colors.black54),
                ),
              ),


            ],
          ),
        ),
      ),
    ];



    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

}



class ItemHomeContent2 extends StatelessWidget {
  ItemHomeContent2({ Key? key, @required this.destination, this.cb, this.hcb })
      : assert(destination != null),
        super(key: key);

  final ItemHomeModel? destination;
  final ChatBloc? cb;
  final HomeController? hcb;


  @override
  Widget build(BuildContext context) {
    HomeController home;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    var dateformat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final List<Widget> children = <Widget>[




      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  destination!.item!.user_photo!,
                  fit: BoxFit.cover,
                  height: 35.0,
                  width: 35.0,

                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(destination!.item!.url! ));
                    },
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              destination!.item!.user_name!,
                              style: descriptionStyle.copyWith(fontSize: 15.75, fontWeight: FontWeight.w600 ),
                            ),

                          ]

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,bottom: 0.0),
                    child: Text('${dateformat.format(destination!.item!.date!)} WIB', style: TextStyle(fontSize: 14)),
                  ),
                ],
              )

            ],
          ),
        ),
      ),

      Container(
        // height:  120.0,
        padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
        child: Html(data: destination!.item!.message!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ,
          // useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 ),
          style: {
            "html": Style(
              display: Display.BLOCK,
              fontSize: FontSize.medium,
            ),
          },
            onLinkTap: (url, _, __, ___) async{
              if(url!.contains('projects.co.id')){


                if(url!.contains('user/my_purchases/download/')){
                 /*
                  home =   HomeController(AppProvider.getApplication(context),
                      Env.value!.baseUrl!+ urlToRoute(url),
                      AppAction.post,
                      '',
                      'projectscoiddownloadFile',
                      null,
                      false);
                  final future = home.downloadFile();
                  future.then((value) {
                    // state.setState(() {
                    // post{{controller_ucase}}Result = value;
                    //AppProvider.getRouter(context)!.pop(context);
                    // });
                  }).catchError((Error){
                    AppProvider.getRouter(context)!.pop(context);
                  });

                 */
                  SubModelController my_purchases;
                  my_purchases =   SubModelController(AppProvider.getApplication(context),
                      Env.value!.baseUrl!+ urlToRoute(url),
                      null);
                  final future = my_purchases.getPurchaseDownload();
                  future.then((value) {
                    var val = value.queryParameters.values.last ;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowMediaFile(file: value.toString(),fz: '', basename: val,)));
                    // state.setState(() {
                    // post{{controller_ucase}}Result = value;
                    //AppProvider.getRouter(context)!.pop(context);
                    // });
                  }).catchError((Error){
                    AppProvider.getRouter(context)!.pop(context);
                  });

                }else{
                  if(url!.contains( RegExp(r'[0-9]'))){

                    /*
                          if(url!.contains('show_conversation')){


                              url = '$url**${destination!.item!.user_photo!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}*${destination!.item!.user_photo!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}';

                              print('haloooooooooooo === $url');


                          //  print('haloooooooooooo');
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url));
                          }else{
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url )).catchError((onError){

                              AppProvider.getRouter(context)!.pop(context);
                            });
                          }

                           */
                    if(url!.contains('show_conversation')){
                      //  var = item.item!.user_photo.sp;
                      if(url!.contains('my_projects')){
                        url = '$url*${destination!.item!.user_name!}*${destination!.item!.user_name!}*${destination!.item!.user_photo!.split('?')[0].replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}*l';
                        bool res = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShowConversationMyProjects(id : '${url!.split('/')[6]}', title : '${url!.split('/')[7]}', id1: '${url!.split('/')[8]}', cb: cb!)),

                          // MaterialPageRoute(builder: (context) => ShowConversationMyProjects(id : '${url!.split('/')[3]}', title : '${url!.split('/')[4]}', id1: '${url!.split('/')[5]}', cb: cb!)),
                        );
                        if(!res){
                          hcb!.listing!.add(HomeListingRefresh());
                        }
                      }else{
                        url = '$url/*${destination!.item!.user_name!}*${destination!.item!.user_name!}*${destination!.item!.user_photo!.split('?')[0].replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}*l';
                        bool res = await  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShowConversationMyBids(id : '${url!.split('/')[6]}', title : '${url!.split('/')[7]}', id1: '${url!.split('/')[8]}', cb: cb!)),

                          // MaterialPageRoute(builder: (context) => ShowConversationMyBids(id : '${url!.split('/')[3]}', title : '${url!.split('/')[4]}', id1: '${url!.split('/')[5]}', cb: cb!)),
                        );
                        if(!res){
                          hcb!.listing!.add(HomeListingRefresh());
                        }

                      }

                      //  print('haloooooooooooo === $url');



                      // AppProvider.getRouter(context)!.navigateTo(
                      //     context,
                      //     url);


                      //  print('haloooooooooooo');

                      /*
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute(url));

                     */
                    }else{

                      if(url!.contains('show_thread')){

                        url.indexOf(url!.split('/')[6]);
                        // url.substring(0, url.indexOf(url!.split('/')[6]));
                        url = '${url.substring(0, url.indexOf(url!.split('/')[7]))}${destination!.item!.user_name!}*20*${destination!.item!.user_photo!.split('?')[0].replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}*l';

                        /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

                               */


                        //   print('haloooooooooooo st ${url!.split('/')[6]}');

                        bool res = await  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${url!.split('/')[6]}', title : '${destination!.item!.user_name!}*20*${destination!.item!.user_photo!.split('?')[0].replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '').replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar').replaceAll('\/', 'ccc')}*l', cb: cb!)),
                        );
                        if(!res){
                          hcb!.listing!.add(HomeListingRefresh());
                        }

                        /*
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(url));

                      */

                      }else if(url!.contains('my_projects/view')){

                        SubModelController check;
                        String delPath = url.replaceAll('https://projects.co.id', Env.value!.baseUrl!) ;url ;
                        check =   SubModelController(AppProvider.getApplication(context),
                            delPath,
                            null);
                        var data = await check.getData();
                        if(jsonEncode(data).contains('admin_note')){
                          // print('horeeeee lagi gun');
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(url)).catchError((onError) {
                            AppProvider.getRouter(context)!.pop(context);
                          });
                        }else{
                          //https://projects.co.id/public/browse_projects/view/3cd918/slicing-figma-to-wordpress
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute('https://projects.co.id/public/browse_projects/view/${url!.split('\/')[6]}/service-order-from-martabakbangka-artikrl-kesehatan')).catchError((onError) {
                            AppProvider.getRouter(context)!.pop(context);
                          });
                        }
                       // print(data);
                      }else {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(url)).catchError((onError) {
                          AppProvider.getRouter(context)!.pop(context);
                        });
                      }
                    }

                  }else{
                    if(url!.contains('mediakit')){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowMediaFile(file: url,fz: '1.347 KB', basename: url!.split('/')[5],)));
                    }else{
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(url + '/listing/'));
                    }

                  }
                }

              }else
              {

                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }


              }




            }
        )


      ),
      SizedBox(height: 30,)


    ];

    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

}




class ShowMediaFile extends StatefulWidget {
  final String? file;
  final String? fz;
  final String? basename;

  ShowMediaFile({this.file, this.fz, this.basename});

  @override
  ShowMediaFileState createState() => ShowMediaFileState();
}


class ShowMediaFileState extends State<ShowMediaFile> {
  String? _message = "";
  String? _path = "";
  String? _size = "";
  String ?_mimeType = "";
  File? _fileFile;
  int _progress = 0;
 // final String file1;
  List<File> _mulitpleFiles = [];
 // ShowMediaFileState({this.file1});
  @override
  void initState() {
    super.initState();


  }
  //String file;
//  ShowImage({this.file});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    print('wf ==== ${widget.file}');
    var fl = widget.file!.replaceAll('cdn.', 'upload.');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.0,

          title: Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: Text(
              'Download File',
              style: TextStyle(
                  fontFamily: "Gotik",
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        //resizeToAvoidBottomPadding: false,
        body:
        Center(
            child:  FileViewAttFix(
              st: this,
              getValue: (int? val){
                print('progress === $val');
                setState(() {
                  //progress = val;

                });
              },
              ctx : context,
              value: widget.basename,
              value1: fl,
              fz: widget.fz,
              caption: 'Sample',
            )
        )


    );

  }

}






  

