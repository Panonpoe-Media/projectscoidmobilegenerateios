import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/models/model.dart';
//  final Function onSelect;
//List<int> _selectedItemsIndex;
//List<String> _selectedItems;
//final String message;
//Int typeUser;

class ListThread extends StatefulWidget {
  final VoidCallback? onSelect;
  List<int?>? selectedItemsIndex;
  List<String?>? selectedItems;
  final String? message;
  int? userType;
  int?idx;
  bool? darkMode;
  DateTime? postdate;

  ListThread(
      {Key? key,
        this.onSelect,
        this.selectedItemsIndex,
        this.selectedItems,
        this.message,
        this.userType,
        this.idx,
        this.darkMode,
        this.postdate})
      : super(key: key);

  @override
  _ListThreadState createState() => _ListThreadState();
}



class _ListThreadState extends State<ListThread>  {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var formatter1 = new DateFormat('HH : mm');
    return Container(
     color: (widget.selectedItemsIndex!.contains(widget.idx)) ? Colors.blue.withOpacity(0.5) : Colors.transparent,
     child: widget.userType == 1?
     // Container()
       GestureDetector(
         onTap: (){
           if(widget.selectedItemsIndex!.contains(widget.idx)){
             setState(() {
               widget.selectedItemsIndex!.removeWhere((val) => val == widget.idx);
               widget.selectedItems!.removeWhere((val) => val == widget.message);
             });
             widget.onSelect!();
           }
         },
         onLongPress: (){
           if(! widget.selectedItemsIndex!.contains(widget.idx)){
             setState(() {
               widget.selectedItems!.add(widget.message);
               widget.selectedItemsIndex!.add(widget.idx);
             });
             widget.onSelect!();
           }
         },
         child:
         Bubble(
             margin: BubbleEdges.only(top: 5),
             nip: BubbleNip.leftTop,
             color: widget.darkMode! ? Colors.black : Colors.white,
             child:
             Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: <Widget>[
                 widget.message!.contains('<')|| widget.message!.contains('://') ?
                 HtmlWidget(widget.message!,
                   textStyle: TextStyle(fontSize: 15),
                   onTapUrl: (url) async {
                     if (url.contains('projects.co.id')) {
                       if (url.contains(new RegExp(r'[0-9]'))) {
                         if (url.contains('show_conversation')) {
                           AppProvider.getRouter(context)!.navigateTo(
                               context,
                               urlToRoute(url + '/'));
                         } else {
                           AppProvider.getRouter(context)!.navigateTo(
                               context,
                               urlToRoute(url)).catchError((
                               onError) {
                             AppProvider.getRouter(context)!.pop(
                                 context);
                           });
                         }
                       } else {
                         AppProvider.getRouter(context)!.navigateTo(
                             context,
                             urlToRoute(url + '/listing/'));
                       }
                     } else {
                       if (await canLaunch(url)) {
                         await launch(url);
                       } else {
                         throw 'Could not launch $url';
                       }
                     }
                     throw('');
                   },
                   onTapImage: (src) =>
                       Navigator.push(context,
                         MaterialPageRoute(builder: (context) =>
                             ShowItemScreenshots1(image: '$src')),),
                 ) :
                 Text(widget.message!, style: const TextStyle(fontSize:14, color: Colors.black) ,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     Text(formatter1.format(widget.postdate!),
                         style: const TextStyle(fontSize: 10)),
                   ],
                 ),
               ],

             )

         ),
       )
      : widget.userType == 2?
     GestureDetector(
       onTap: (){
         if(widget.selectedItemsIndex!.contains(widget.idx)){
           setState(() {
             widget.selectedItemsIndex!.removeWhere((val) => val == widget.idx);
             widget.selectedItems!.removeWhere((val) => val == widget.message);
           });
           widget.onSelect!();
         }
       },
       onLongPress: (){
         if(! widget.selectedItemsIndex!.contains(widget.idx)){
           setState(() {
             widget.selectedItems!.add(widget.message);
             widget.selectedItemsIndex!.add(widget.idx);
           });
           widget.onSelect!();
         }
       },
       child: 
          Bubble(
              margin: BubbleEdges.only(top: 5),
              nip: BubbleNip.no,
              color: widget.darkMode! ? Colors.black12 : Colors.orange[100],
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  widget.message!.contains('<')|| widget.message!.contains('://') ?
                  HtmlWidget(widget.message!,
                    textStyle: TextStyle(fontSize: 15),
                    onTapUrl: (url) async {
                      if (url.contains('projects.co.id')) {
                        if (url.contains(new RegExp(r'[0-9]'))) {
                          if (url.contains('show_conversation')) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url + '/'));
                          } else {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url)).catchError((
                                onError) {
                              AppProvider.getRouter(context)!.pop(
                                  context);
                            });
                          }
                        } else {
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(url + '/listing/'));
                        }
                      } else {
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                      throw 'Could not launch ';
                    },
                    onTapImage: (src) =>
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              ShowItemScreenshots1(image: '$src')),),
                  ) :
                  Text(widget.message!, style: const TextStyle(fontSize:14, color: Colors.black) ,),
                  Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(formatter1.format(widget.postdate!),
                              style: TextStyle(fontSize: 10)),
                        ],
                      ),
                  ]
              )
          ),
                  
                   
     )
      :widget.userType == 3? GestureDetector(
         onTap: (){
           if(widget.selectedItemsIndex!.contains(widget.idx)){
             setState(() {
               widget.selectedItemsIndex!.removeWhere((val) => val == widget.idx);
               widget.selectedItems!.removeWhere((val) => val == widget.message);
             });
             widget.onSelect!();
           }
         },
         onLongPress: (){
           if(! widget.selectedItemsIndex!.contains(widget.idx)){
             setState(() {
               widget.selectedItems!.add(widget.message);
               widget.selectedItemsIndex!.add(widget.idx);
             });
             widget.onSelect!();
           }
         },
       child: 
                  Bubble(
                      margin: BubbleEdges.only(top: 5),
                      color: widget.darkMode! ? Colors.black45 : Color.fromARGB(
                          255, 225, 255, 199),
                      nip: BubbleNip.rightTop,
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          widget.message!.contains('<')|| widget.message!.contains('://') ?
                          HtmlWidget(widget.message!,
                            textStyle: TextStyle(fontSize: 15),
                            onTapUrl: (url) async {
                              if (url.contains('projects.co.id')) {
                                if (url.contains(new RegExp(r'[0-9]'))) {
                                  if (url.contains('show_conversation')) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/'));
                                  } else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url)).catchError((
                                        onError) {
                                      AppProvider.getRouter(context)!.pop(
                                          context);
                                    });
                                  }
                                } else {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(url + '/listing/'));
                                }
                              } else {
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }
                              throw 'Could not launch ';
                            },
                            onTapImage: (src) =>
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      ShowItemScreenshots1(image: '$src')),),
                          ) :
                          Text(widget.message!, style: const TextStyle(fontSize:14, color: Colors.black) ,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(formatter1.format(widget.postdate!),
                                  style: TextStyle(
                                      fontSize: 10)),
                            ],
                          ),

                        ],

                      )
                  ),
                  
                   
    )
     :widget.userType == 4 ? GestureDetector(
         onTap: (){
           if(widget.selectedItemsIndex!.contains(widget.idx)){
             setState(() {
               widget.selectedItemsIndex!.removeWhere((val) => val == widget.idx);
               widget.selectedItems!.removeWhere((val) => val == widget.message);
             });
             widget.onSelect!();
           }
         },
         onLongPress: (){
           if(! widget.selectedItemsIndex!.contains(widget.idx)){
             setState(() {
               widget.selectedItems!.add(widget.message);
               widget.selectedItemsIndex!.add(widget.idx);
             });
             widget.onSelect!();
           }
         },
  
        child: Bubble(
            margin: BubbleEdges.only(top: 5),
            nip: BubbleNip.no,
            color: widget.darkMode! ? Colors.black : Colors.white,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                widget.message!.contains('<')|| widget.message!.contains('://') ?
                HtmlWidget(widget.message!,
                  textStyle: const TextStyle(fontSize: 15),
                  onTapUrl: (url) async {
                    if (url.contains('projects.co.id')) {
                      if (url.contains(new RegExp(r'[0-9]'))) {
                        if (url.contains('show_conversation')) {
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(url + '/'));
                        } else {
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(url)).catchError((
                              onError) {
                            AppProvider.getRouter(context)!.pop(
                                context);
                          });
                        }
                      } else {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(url + '/listing/'));
                      }
                    } else {
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                    throw 'Could not launch';
                  },
                  onTapImage: (src) =>
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            ShowItemScreenshots1(image: '$src')),),
                ) :
                Text(widget.message!, style: const TextStyle(fontSize:14, color: Colors.black) ,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(formatter1.format(widget.postdate!),
                        style: TextStyle(fontSize: 10)),
                  ],
                ),
              ],

            )

        ),
     )
     :   GestureDetector(
         onTap: (){
           if(widget.selectedItemsIndex!.contains(widget.idx)){
             setState(() {
               widget.selectedItemsIndex!.removeWhere((val) => val == widget.idx);
               widget.selectedItems!.removeWhere((val) => val == widget.message);
             });
             widget.onSelect!();
           }
         },
         onLongPress: (){
           if(! widget.selectedItemsIndex!.contains(widget.idx)){
             setState(() {
               widget.selectedItems!.add(widget.message);
               widget.selectedItemsIndex!.add(widget.idx);
             });
             widget.onSelect!();
           }
         },

         child:  Bubble(
             margin: const BubbleEdges.only(top: 5),
             color: widget.darkMode! ? Colors.black45 : Color.fromARGB(
                 255, 225, 255, 199),
             nip: BubbleNip.no,
             child:
             Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: <Widget>[
                 widget.message!.contains('<')|| widget.message!.contains('://') ?
                 HtmlWidget(widget.message!,
                   textStyle: TextStyle(fontSize: 15),
                   onTapUrl: (url) async {
                     if (url.contains('projects.co.id')) {
                       if (url.contains(new RegExp(r'[0-9]'))) {
                         if (url.contains('show_conversation')) {
                           AppProvider.getRouter(context)!.navigateTo(
                               context,
                               urlToRoute(url + '/'));
                         } else {
                           AppProvider.getRouter(context)!.navigateTo(
                               context,
                               urlToRoute(url)).catchError((
                               onError) {
                             AppProvider.getRouter(context)!.pop(
                                 context);
                           });
                         }
                       } else {
                         AppProvider.getRouter(context)!.navigateTo(
                             context,
                             urlToRoute(url + '/listing/'));
                       }
                     } else {
                       if (await canLaunch(url)) {
                         await launch(url);
                       } else {
                         throw 'Could not launch $url';
                       }
                     }
                     throw 'Could not launch ';
                   },
                   onTapImage: (src) =>
                       Navigator.push(context,
                         MaterialPageRoute(builder: (context) =>
                             ShowItemScreenshots1(image: '$src')),),
                 ) :
                 Text(widget.message!, style: const TextStyle(fontSize:14, color: Colors.black) ,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     Text(formatter1.format(widget.postdate!),
                         style: TextStyle(
                             fontSize: 10)),
                   ],
                 ),

               ],

             )
         ),
     )
     
    );
  }

}