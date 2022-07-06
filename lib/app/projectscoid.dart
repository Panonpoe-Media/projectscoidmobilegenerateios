import 'dart:convert';
import 'dart:io';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/api/api.dart';
import 'package:projectscoid/core/components/utility/db/DatabaseHelper.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/app/signin.dart';
import 'package:projectscoid/app/securecodescan.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_permissions/notification_permissions.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/views/Pages/page_view.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/core/components/utility/tool/speed_dial_varian.dart';
import 'package:projectscoid/core/components/utility/tool/speed_dial_child.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';
import 'package:recase/recase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeago/timeago.dart' as timeago;
//import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/app/setting.dart';
import 'package:projectscoid/views/Chat/pages/thread_screen.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_html/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:html/parser.dart' show parse;
import 'package:firebase_core/firebase_core.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:flutter/scheduler.dart' as SC;
import 'package:package_info_plus/package_info_plus.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:koukicons_jw/addApp.dart';
import 'package:koukicons_jw/moneyTransfer.dart';
import 'package:koukicons_jw/camcorderPro.dart';
import 'package:koukicons_jw/databaseNetwork.dart';
import 'package:koukicons_jw/liveNews.dart';
import 'package:koukicons_jw/electronics.dart';
import 'package:koukicons_jw/galleryX.dart';
import 'package:koukicons_jw/multipleDevices.dart';
import 'package:koukicons_jw/pic2.dart';
import 'package:koukicons_jw/phoneApps.dart';
import 'package:koukicons_jw/Network2.dart';
import 'package:koukicons_jw/bullish.dart';
import 'package:koukicons_jw/Newspaper.dart';
import 'package:koukicons_jw/notebook.dart';
import 'package:koukicons_jw/readingEbook.dart';
import 'package:koukicons_jw/editDoc.dart';
import 'package:koukicons_jw/photoReel.dart';
import 'package:koukicons_jw/news.dart';
import 'package:koukicons_jw/briefcase.dart';
import 'package:share_plus/share_plus.dart';

/////////////////////////////
//        ____         ___ //
// |   | |    | |\ /| |___ //
// |___| |    | | | | |    //
// |   | |____| |   | |___ //
//                         //
/////////////////////////////

class homeView extends StatefulWidget {
  static const String PATH = '/public/home';
  ValueChanged<bool?>? scrollUp;
  ValueChanged<bool?>? activeFab;
  bool? hasID;
  bool? isDark;
  BuildContext? ctx;

  ChatBloc? notif;
  homeView(
      {Key? key,
      this.hasID,
      this.isDark,
      this.ctx,
      this.scrollUp,
      this.activeFab,
      this.notif})
      : super(key: key);
  @override
  homeViewState createState() => homeViewState();
}

class homeViewState extends State<homeView> with RestorationMixin {
  String getPath = Env.value!.baseUrl! + '/public/home';

  SubModelController? Home;
  final formKey = GlobalKey<FormState>();
  var controller = ScrollController();
  var controller1 = ScrollController();
  var controller2 = ScrollController();
  var controller3 = ScrollController();
  var controller4 = ScrollController();
  var controller5 = ScrollController();
  var viewHome;
  var isLoading = true;
  String idHash = '';
  double lastScroll = 0;
  final List<Widget> _cua = [];
  String tempCua = '';
  final List<Widget> _cuat = [];
 // List<String> _cuaString = [];
  final List<String> _cuatString = [];
  String oldCua = '';
  List<String?>? dataActivities = [];
  List<String?>? ListActivities = [];
  final List<ProjectItemModel?>? _cp = [];
  final List<ProjectItemModel?>? _cpt = [];
  String oldCp = '';
  final List<ProductItemModel?>? _cpd = [];
  final List<ProductItemModel?>? _cpdt = [];
  String oldCpd = '';
  final List<ServiceItemModel?>? _cs = [];
  final List<ServiceItemModel?>? _cst = [];
  String oldCs = '';
  final List<TestimonialItemModel?>? _cte = [];
  final List<TestimonialItemModel?>? _ctet = [];
  String oldCte = '';

  void scrollup(bool? su) {
    widget.scrollUp!(su!);
  }

  void activefab(bool? fab) {
    widget.activeFab!(fab!);
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'HomeView';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  initState() {
    controller.addListener(_onScroll);
    activefab(false);
    Home = SubModelController(
        AppProvider.getApplication(widget.ctx!), getPath, null);

    fetchData(Home);
    super.initState();
  }

  Future<void> fetchData(SubModelController? Home) async {
    // if (!mounted) {

    //   return Future.value(null);

    // }
    if (viewHome == null) {
      //print('disini saja $getPath');
      final future = Home!.getDataHome();
      future.then((value) {
        if (!mounted) {
        //  print('disini saja hebat');
          viewHome = null;
        } else {
       //   print('disini saja');
          viewHome = value;
          setState(() {
            isLoading = false;
          });
          final hash = Home.getHash();
          hash.then((value1) {
            if (value1 != null) {
              setState(() {
                widget.hasID = true;
              });
            }
          });
        }
      }).catchError((Error) {
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(widget.ctx!).showSnackBar(
            const SnackBar(
              content: Text(
                  'Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
        });
      });
    } else {
      //  print('disini saja 123456');
      final future = Home!.getDataHome();
      future.then((value) {
        if (!mounted) {
          viewHome = null;
        } else {
          viewHome = value;
          setState(() {
            isLoading = false;
          });
          final hash = Home.getHash();
          hash.then((value1) {
            if (value1 != null) {
              setState(() {
                widget.hasID = true;
              });
            }
          });
        }
      }).catchError((Error) {
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(widget.ctx!).showSnackBar(
            const SnackBar(
              content: Text(
                  'Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
        });
      });
    }
  }

  Widget categoryProjectsIcon(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '28_3d-modeling-and-animation',
                        title: '3D Modeling & Animation',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsAddApp(height: 25, width: 25),
            title: '3D Modeling\nAnimation',
            type: 'Projects',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '24_accounting-and-consultancy',
                        title: 'Accounting & Consultancy',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsMoneyTransfer(height: 25, width: 25),
            //icon: Icons.account_balance,
            title: 'Accounting\nConsultancy',
            type: 'Projects',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '16_audio-video-and-photography',
                        title: 'Audio Video & Photography',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsCamcorderPro(height: 25, width: 25),
            //  icon: Icons.camera,
            title: 'Audio Video\nPhotography',
            type: 'Projects',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '29_data-entry-and-data-mining',
                        title: 'Data Entry & Data Mining',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsDatabaseNetwork(height: 25, width: 25),
            //icon: Icons.cloud,
            title: 'Data Entry\nData Mining',
            type: 'Projects',
          ),
          //KoukiconsLiveNews(),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '2_desktop-programming',
                        title: 'Desktop Programming',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsLiveNews(height: 25, width: 25),
            // icon: Icons.desktop_mac,
            title: 'Desktop\nProgramming',
            type: 'Projects',
          ),
          //KoukiconsElectronics(),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '31_electronis-and-robotics',
                        title: 'Electronis & Robotics',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsElectronics(height: 25, width: 25),
            //  icon: Icons.wb_incandescent,
            title: 'Electronis\nRobotics',
            type: 'Projects',
          ),
          //KoukiconsGalleryX(),

          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '8_game-programming',
                        title: 'Game Programming',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsGalleryX(height: 25, width: 25),
            // icon: Icons.videogame_asset,
            title: 'Game\nProgramming',
            type: 'Projects',
          ),
          //import 'package:koukicons_jw/phoneProfile.dart';
          // KoukiconsPhoneProfile(),
          // phoneUp
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '18_internet-marketing-and-social-media',
                        title: 'Internet marketing & Social Media',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsMultipleDevices(height: 25, width: 25),
            //icon: Icons.shop,
            title: 'Marketing\nSocial Media',
            type: 'Projects',
          ),

          //import 'package:koukicons_jw/pic2.dart';
          // KoukiconsPic2(),
          // picture
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '10_layout-logo-and-graphic-design',
                        title: 'Layout Logo & Graphic Design',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsPic2(height: 25, width: 25),
            //  icon: Icons.border_all,
            title: 'Logo\nGraphic Design',
          ),
          //import 'package:koukicons_jw/phoneApps.dart';
          // KoukiconsPhoneApps(),
          // phoneChat
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '4_mobile-programming',
                        title: 'Mobile Programming',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsPhoneApps(height: 25, width: 25),
            // icon: Icons.android,
            title: 'Mobile\nProgramming',
            type: 'Projects',
          ),
          //import 'package:koukicons_jw/network2.dart';
          // KoukiconsNetwork2(),
          // neutralDecision
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '26_network-and-system-administration',
                        title: 'Network & System Administration',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsNetwork2(height: 25, width: 25),
            // icon: Icons.network_check,
            title: 'Network\nSystem Admin',
            type: 'Projects',
          ),
          //import 'package:koukicons_jw/bullish.dart';
          // KoukiconsBullish(),
          // business
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '14_seo-and-website-maintenance',
                        title: 'SEO & Website Maintenance',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsBullish(height: 25, width: 25),
            //  icon: Icons.web,
            title: 'SEO\nWeb Admin',
            type: 'Projects',
          ),
          //import 'package:koukicons_jw/  spaper.dart';
          //import 'package:koukicons_jw/notebook.dart';
          //import 'package:koukicons_jw/business.dart';

          // KoukiconsNewspaper(),
          // next
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '6_website-development',
                        title: 'Website Development',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsNewspaper(height: 25, width: 25),
            //icon: Icons.web_asset,
            title: 'Website\nDevelopment',
            type: 'Projects',
          ),

          // KoukiconsNotebook(),
          // notebook1
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '12_writing-and-translation',
                        title: 'Writing & Translation',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsNotebook(height: 25, width: 25),
            //icon: Icons.translate,
            title: 'Writing\nTranslation',
            type: 'Projects',
          ),
          // KoukiconsBusiness(),
          // businessContact
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProjectsListing(
                        id: '22_others', title: 'Others', cb: widget.notif)),
              );
            },
            icon: KoukiconsBriefcase(height: 25, width: 25),
            //icon: Icons.work,
            title: 'Other',
            type: 'Projects',
          ),
        ]);
  }

  Widget categoryServicesIcon(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '28_3d-modeling-and-animation',
                        title: '3D Modeling & Animation',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsAddApp(height: 25, width: 25),
            // icon: Icons.dashboard,
            title: '3D Modeling\nAnimation',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '24_accounting-and-consultancy',
                        title: 'Accounting & Consultancy',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsMoneyTransfer(height: 25, width: 25),
            //icon: Icons.account_balance,
            title: 'Accounting\nConsultancy',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '16_audio-video-and-photography',
                        title: 'Audio Video & Photography',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsCamcorderPro(height: 25, width: 25),
            //  icon: Icons.camera,
            title: 'Audio Video\nPhotography',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '29_data-entry-and-data-mining',
                        title: 'Data Entry & Data Mining',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsDatabaseNetwork(height: 25, width: 25),
            // icon: Icons.cloud,
            title: 'Data Entry\nData Mining',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '2_desktop-programming',
                        title: 'Desktop Programming',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsLiveNews(height: 25, width: 25),
            //icon: Icons.desktop_mac,
            title: 'Desktop\nProgramming',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '31_electronis-and-robotics',
                        title: 'Electronis & Robotics',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsElectronics(height: 25, width: 25),
            //  icon: Icons.wb_incandescent,
            title: 'Electronis\nRobotics',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '8_game-programming',
                        title: 'Game Programming',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsGalleryX(height: 25, width: 25),
            // icon: Icons.videogame_asset,
            title: 'Game\nProgramming',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '18_internet-marketing-and-social-media',
                        title: 'Internet Marketing & Social Media',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsMultipleDevices(height: 25, width: 25),
            // icon: Icons.shop,
            title: 'Marketing\nSocial Media',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '10_layout-logo-and-graphic-design',
                        title: 'Layout logo & Graphic Design',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsPic2(height: 25, width: 25),
            // icon: Icons.border_all,
            title: 'Logo\nGraphic Design',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '4_mobile-programming',
                        title: 'Mobile Programming',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsPhoneApps(height: 25, width: 25),
            // icon: Icons.android,
            title: 'Mobile\nProgramming',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '26_network-and-system-administration',
                        title: 'Network & System Administration',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsNetwork2(height: 25, width: 25),
            //icon: Icons.network_check,
            title: 'Network\nSystem Admin',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '14_seo-and-website-maintenance',
                        title: 'SEO & Website Maintenance',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsBullish(height: 25, width: 25),
            //icon: Icons.web,
            title: 'SEO\nWeb Admin',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '6_website-development',
                        title: 'Website Development',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsNewspaper(height: 25, width: 25),
            //icon: Icons.web_asset,
            title: 'Website\nDevelopment',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '12_writing-and-translation',
                        title: 'Writing & Translation',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsNotebook(height: 25, width: 25),
            //icon: Icons.translate,
            title: 'Writing\nTranslation',
            type: 'Services',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseServicesListing1(
                        id: '22_others', title: 'Others', cb: widget.notif)),
              );
            },
            icon: KoukiconsBriefcase(height: 25, width: 25),
            //icon: Icons.work,
            title: 'Other',
            type: 'Services',
          ),
        ]);
  }

  Widget categoryProductsIcon(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '28_3d-modeling-and-animation',
                        title: '3D Modeling & Animation',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsAddApp(height: 25, width: 25),
            // icon: Icons.dashboard,
            title: '3D Modeling\nAnimation',
            type: 'Products',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '20_articles',
                        title: 'Articles',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsNotebook(height: 25, width: 25),
            // icon: Icons.book,
            title: 'Articles',
            type: 'Products',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '10_audio-and-video',
                        title: 'Audio & Video',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsCamcorderPro(height: 25, width: 25),
            //icon: Icons.videocam,
            title: 'Audio\nVideo',
            type: 'Products',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '8_desktop-programs',
                        title: 'Desktop Programs',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsLiveNews(height: 25, width: 25),
            // icon: Icons.developer_mode,
            title: 'Desktop\nPrograms',
            type: 'Products',
          ),
          //import 'package:koukicons_jw/readingEbook.dart';
          // KoukiconsReadingEbook(),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '2_e-books', title: 'E Books', cb: widget.notif)),
              );
            },
            icon: KoukiconsReadingEbook(height: 25, width: 25),
            // icon: Icons.bookmark_border,
            title: 'E-Books',
            type: 'Products',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '12_games', title: 'Games', cb: widget.notif)),
              );
            },
            icon: KoukiconsGalleryX(height: 25, width: 25),
            //  icon: Icons.games,
            title: 'Games',
            type: 'Products',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '23_logo-and-design',
                        title: 'Logo & Design',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsPic2(height: 25, width: 25),
            // icon: Icons.picture_in_picture,
            title: 'Logo\nDesign',
            type: 'Products',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '14_mobile-apps',
                        title: 'Mobile Apps',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsPhoneApps(height: 25, width: 25),
            // icon: Icons.phone_iphone,
            title: 'Mobile\nApps',
            type: 'Products',
          ),
          //import 'package:koukicons_jw/readingEbook.dart';
          //import 'package:koukicons_jw/editDoc.dart';
          //  import 'package:koukicons_jw/photoReel.dart';
// KoukiconsEditDoc(),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '16_membership-and-voucher',
                        title: 'Membership & Voucher',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsEditDoc(height: 25, width: 25),
            // icon: Icons.card_membership,
            title: 'Membership\nVoucher',
            type: 'Products',
          ),
          //  import 'package:koukicons_jw/photoReel.dart';

          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '18_stock-photos-and-illustrations',
                        title: 'Stock Photos & Illustrations',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsPhotoReel(height: 25, width: 25),
            // icon: Icons.photo,
            title: 'Stock Photos\nIllustrations',
            type: 'Products',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '6_website-scripts',
                        title: 'Website Scripts',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsNewspaper(height: 25, width: 25),
            // icon: Icons.description!,
            title: 'Website\nScripts',
            type: 'Products',
          ),
          //import 'package:koukicons_jw/readingEbook.dart';
          //import 'package:koukicons_jw/editDoc.dart';
          //  import 'package:koukicons_jw/photoReel.dart';
          //import 'package:koukicons_jw/  s.dart';
          // KoukiconsNews(),
          //   spaper
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '4_website-templates',
                        title: 'Website Templates',
                        cb: widget.notif)),
              );
            },
            icon: KoukiconsNews(height: 25, width: 25),
            //icon: Icons.web_asset,
            title: 'Website\nTemplates',
            type: 'Products',
          ),
          CtgWidgetValue(
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchBrowseProductsListing(
                        id: '22_others', title: 'Others', cb: widget.notif)),
              );
            },
            icon: KoukiconsBriefcase(height: 25, width: 25),
            //  icon: Icons.work,
            title: 'Other',
            type: 'Products',
          ),
        ]);
  }

  //return prefs.getStringList("activities");

  List<String>? GetList() {
    SharedPreferences? prefs;
    if (prefs!.containsKey('activities')) {
      var data = prefs.getStringList("activities");
      // prefs.remove('activities');

      return data;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    final themeManager = Provider.of<ThemeManager>(context);
    var darkMode;
    //_authenticationBloc = BlocProvider.of<AuthenticationController>(context);
    themeManager.themeMode == ThemeMode.dark
        ? darkMode = true
        : darkMode = false;
    var now = DateTime.now();
    var formatter = DateFormat('yyyy');
    String formattedDate = formatter.format(now);

    if (_cua.isEmpty && !isLoading) {
      _cuat.clear();
      _cuatString.clear();
      tempCua = viewHome!.activities.items[0];
      _cuatString.add(viewHome!.activities.items[0].replaceAll('\/', '/'));
      _cuatString.add(viewHome!.activities.items[1].replaceAll('\/', '/'));
      _cuatString.add(viewHome!.activities.items[2].replaceAll('\/', '/'));
      _cuatString.add(viewHome!.activities.items[3].replaceAll('\/', '/'));
      _cuatString.add(viewHome!.activities.items[4].replaceAll('\/', '/'));
      _cuatString.add(viewHome!.activities.items[5].replaceAll('\/', '/'));
      _cuatString.add(viewHome!.activities.items[6].replaceAll('\/', '/'));
      _cuatString.add(viewHome!.activities.items[7].replaceAll('\/', '/'));
      _cuatString.add(viewHome!.activities.items[8].replaceAll('\/', '/'));
      _cuatString.add(viewHome!.activities.items[9].replaceAll('\/', '/'));

      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[0], cb: widget.notif));
      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[1], cb: widget.notif));
      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[2], cb: widget.notif));
      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[3], cb: widget.notif));
      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[4], cb: widget.notif));
      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[5], cb: widget.notif));
      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[6], cb: widget.notif));
      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[7], cb: widget.notif));
      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[8], cb: widget.notif));
      _cuat.add(ActivitiesFixItem(
          model: viewHome!.activities.items[9], cb: widget.notif));
    }
    if (_cp!.isEmpty && !isLoading) {
      _cpt!.addAll(viewHome!.projects!.items);
    }
    if (_cpd!.isEmpty && !isLoading) {
      _cpdt!.addAll(viewHome!.products!.items);
    }
    if (_cs!.isEmpty && !isLoading) {
      _cst!.addAll(viewHome!.services!.items);
    }
    if (_cte!.isEmpty && !isLoading) {
      _ctet!.addAll(viewHome!.testimonials!.items);
    }

    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ))
          : Form(
              key: formKey,
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: widget.isDark!
                        ? Colors.black45
                        : CurrentTheme.HomeColor,
                  ),
                ),
                SingleChildScrollView(
                    controller: controller,
                    physics: const AlwaysScrollableScrollPhysics(),
                    reverse: false,
                    child: StreamBuilder(
                        //
                        stream: widget.notif!.onMessage,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            if ((jsonDecode(snapshot.data!)['type'] ==
                                'activity')) {
                              if (_cua.isEmpty) {
                                tempCua = jsonDecode(snapshot.data)['message']
                                    .replaceAll('\"', '"');
                                _cua.add(ActivitiesFix1Item(
                                    model: snapshot.data, cb: widget.notif));
                                // _cuaString.add(snapshot!.data);
                                if (viewHome!.activities.items[0] ==
                                    jsonDecode(snapshot.data)['message']
                                        .replaceAll('\"', '"')) {
                                  _cuat.removeAt(0);
                                } else {
                                  var document =
                                      parse(viewHome!.activities.items[0]);
                                  var userLink =
                                      document.getElementsByClassName('more');
                                  var document1 = parse(
                                      jsonDecode(snapshot.data)['message']);
                                  var userLink1 =
                                      document1.getElementsByClassName('more');
                                  if (userLink.length == 1) {
                                    if (userLink[0].attributes['href'] ==
                                        userLink1[0].attributes['href']) {
                                      _cuat.removeAt(0);
                                    } else {
                                      _cuat.removeAt(9);
                                    }
                                  } else {
                                    if (userLink1.length == 1) {
                                      _cuat.removeAt(9);
                                    } else {
                                      if ((userLink[0].attributes['href'] ==
                                              userLink1[0]
                                                  .attributes['href']) &&
                                          (userLink[1].attributes['href'] ==
                                              userLink1[1]
                                                  .attributes['href'])) {
                                        _cuat.removeAt(0);
                                      } else {
                                        _cuat.removeAt(9);
                                      }
                                    }
                                  }
                                  // print('UserLink ${userLink[0].attributes['href']}');

                                }
                                _cua.addAll(_cuat);
                              } else {
                                if (_cua.length == 10) {
                                  if (tempCua !=
                                      jsonDecode(snapshot.data)['message']
                                          .replaceAll('\"', '"')) {
                                    tempCua =
                                        jsonDecode(snapshot.data)['message']
                                            .replaceAll('\"', '"');
                                    _cua.removeAt(9);
                                    _cua.insert(
                                        0,
                                        ActivitiesFix1Item(
                                            model: snapshot.data,
                                            cb: widget.notif));
                                  }

                                  // _cuaString.insert(0,snapshot!.data);
                                } else {
                                }
                              }
                            }

                            if ((jsonDecode(snapshot.data)['type'] ==
                                'project')) {
                              if (oldCp !=
                                  jsonDecode(snapshot.data)['title']) {
                                _cp!.clear();
                                _cp!.add(ProjectItemModel.fromJson({
                                  "avatar":
                                      "${jsonDecode(snapshot.data)['avatar']}",
                                  "url":
                                      "${jsonDecode(snapshot.data)['link']}",
                                  "title":
                                      "${jsonDecode(snapshot.data)['title']}",
                                  "budget":
                                      "${jsonDecode(snapshot.data)['budget']}",
                                  "owner":
                                      "${jsonDecode(snapshot.data)['owner']}",
                                  "deadline":
                                      "${jsonDecode(snapshot.data)['deadline'].toString()} days"
                                }));
                                _cpt!.removeAt(9);
                                _cp!.addAll(_cpt!);
                                _cpt!.clear();
                                _cpt!.addAll(_cp!);
                                oldCp = jsonDecode(snapshot.data)['title'];
                              }
                            }

                            if ((jsonDecode(snapshot.data)['type'] ==
                                'product')) {
                              if (oldCpd !=
                                  jsonDecode(snapshot.data)['title']) {
                                _cpd!.clear();
                                _cpd!.add(ProductItemModel.fromJson({
                                  "logo":
                                      "${jsonDecode(snapshot.data)['avatar']}",
                                  "url":
                                      "${jsonDecode(snapshot.data)['link']}",
                                  "title":
                                      "${jsonDecode(snapshot.data)['title']}",
                                  "price":
                                      "${jsonDecode(snapshot.data)['price']}",
                                  "seller":
                                      "${jsonDecode(snapshot.data)['seller']}",
                                  "delivery": "instant delivery"
                                }));
                                _cpdt!.removeAt(9);
                                _cpd!.addAll(_cpdt!);
                                _cpdt!.clear();
                                _cpdt!.addAll(_cpd!);
                                oldCpd = jsonDecode(snapshot.data)['title'];
                              }
                            }

                            if ((jsonDecode(snapshot.data)['type'] ==
                                'service')) {
                              if (oldCs !=
                                  jsonDecode(snapshot.data)['title']) {
                                _cs!.clear();
                                _cs!.add(ServiceItemModel.fromJson({
                                  "logo":
                                      "${jsonDecode(snapshot.data)['avatar']}",
                                  "url":
                                      "${jsonDecode(snapshot.data)['link']}",
                                  "title":
                                      "${jsonDecode(snapshot.data)['title']}",
                                  "price":
                                      "${jsonDecode(snapshot.data)['price']}",
                                  "seller":
                                      "${jsonDecode(snapshot.data)['seller']}",
                                  "delivery":
                                      "${jsonDecode(snapshot.data)['deadline'].toString()} days"
                                }));
                                _cst!.removeAt(9);
                                _cs!.addAll(_cst!);
                                _cst!.clear();
                                _cst!.addAll(_cs!);
                                oldCs = jsonDecode(snapshot.data)['title'];
                              }
                            }
                            if ((jsonDecode(snapshot.data)['type'] ==
                                'testimony')) {
                              if (oldCte !=
                                  jsonDecode(snapshot.data)['ptitle']) {
                                _cte!.clear();
                                _cte!.add(TestimonialItemModel.fromJson({
                                  "content":
                                      "${jsonDecode(snapshot.data)['feedback']}",
                                  "avatar":
                                      "${jsonDecode(snapshot.data)['avatar']}",
                                  "user_url":
                                      "${jsonDecode(snapshot.data)['link']}",
                                  "user_name":
                                      "${jsonDecode(snapshot.data)['user']}",
                                  "date":
                                      "${jsonDecode(snapshot.data)['pdate']}",
                                  "project_url":
                                      "${jsonDecode(snapshot.data)['plink']}",
                                  "project_title":
                                      "${jsonDecode(snapshot.data)['ptitle']}"
                                }));
                                _ctet!.removeAt(3);
                                _cte!.addAll(_ctet!);
                                _ctet!.clear();
                                _ctet!.addAll(_cte!);
                                oldCte = jsonDecode(snapshot.data)['ptitle'];
                              }
                            }
                          }

                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //Text(snapshot!.hasData ? '${snapshot!.data}' : ''),
                                SizedBox(
                                  height: 160.0,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                          bottom: 0.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Image.network(
                                            viewHome!.banner_background,
                                            fit: BoxFit.cover,
                                          )),
                                      Positioned.fill(
                                          child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                splashColor:
                                                    Colors.lightGreenAccent,
                                                onTap: () {},
                                              ))),
                                      Positioned.fill(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        top: 0.0,
                                        child: viewHome!.banner.indexOf(
                                                    'banner-telegram.png') !=
                                                -1
                                            ? InkWell(
                                                onTap: () async {
                                                  await _launchTelegram();
                                                },
                                                child: Image.network(
                                                  viewHome!.banner,
                                                  fit: BoxFit.fitHeight,
                                                ))
                                            : Image.network(
                                                viewHome!.banner,
                                                fit: BoxFit.fitHeight,
                                              ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                    decoration: widget.isDark!
                                        ? const BoxDecoration(
                                            color: Colors.black12,
                                          )
                                        : const BoxDecoration(
                                            color: CurrentTheme.BackgroundColor,
                                            image: DecorationImage(
                                              image: ExactAssetImage(
                                                  'assets/img/elegant-white.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 8.0, 8.0, 10.0),
                                              child: InkWell(
                                                  onTap: () {},
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: const <Widget>[
                                                        Text(
                                                          'Projects',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ]))),
                                          categoryProjectsIcon(context),
                                        ])),

                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 8.0, 8.0, 0.0),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PublicBrowseProjectsListing(
                                                        id: '12',
                                                        cb: widget.notif)),
                                          );
                                        },
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                viewHome!.projects.title!,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const Icon(Icons.arrow_forward,
                                                  size: 18.0)
                                            ]))),

                                Container(
                                    height: 214.0,
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),

                                    /// To set FlashSale Scrolling horizontal
                                    child: _cp!.isEmpty
                                        ? ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return index>=
                                                      viewHome!
                                                          .projects
                                                          .items
                                                          .length
                                                  ? ProjectsBottomLoader()
                                                  : ProjectItem(
                                                      model: viewHome!
                                                          .projects
                                                          .items[index],
                                                      cb: widget.notif);
                                              //    : BrowseProjectsFrontCard(destination: state.browse_projects!.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: viewHome!
                                                        .projects
                                                        .items
                                                        .length ==
                                                    10
                                                ? viewHome!
                                                    .projects
                                                    .items
                                                    .length
                                                : viewHome!
                                                        .projects
                                                        .items
                                                        .length +
                                                    1,
                                            controller: controller2,
                                          )
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return index>= _cp!.length
                                                  ? ProjectsBottomLoader()
                                                  : ProjectItem(
                                                      model: _cp![index],
                                                      cb: widget.notif);
                                              //    : BrowseProjectsFrontCard(destination: state.browse_projects!.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: _cp!.length == 10
                                                ? _cp!.length
                                                : _cp!.length + 1,
                                            controller: controller2,
                                          )),

                                Container(
                                    decoration: widget.isDark!
                                        ? const BoxDecoration(
                                            color: Colors.black12,
                                          )
                                        : const BoxDecoration(
                                            color: CurrentTheme.BackgroundColor,
                                            image: DecorationImage(
                                              image: ExactAssetImage(
                                                  'assets/img/elegant-white.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 8.0, 8.0, 10.0),
                                              child: InkWell(
                                                  onTap: () {},
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        const Text(
                                                          'Services',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ]))),
                                          categoryServicesIcon(context),
                                        ])),

                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 8.0, 10.0),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PublicBrowseServicesListing(
                                                          id: '12',
                                                          cb: widget.notif)),
                                            );
                                            /*
                                            AppProvider.getRouter(context)! .navigateTo(
                                                context, urlToRoute(this.viewHome!.services.url + '/listing/12'));

                                             */
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  viewHome!
                                                      .services
                                                      .title!,
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const Icon(Icons.arrow_forward,
                                                    size: 18.0)
                                              ]))),
                                ),

                                Container(
                                    height: 210.0,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),

                                    /// To set FlashSale Scrolling horizontal
                                    child: _cs!.isEmpty
                                        ? ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return index>=
                                                      viewHome!
                                                          .services
                                                          .items
                                                          .length
                                                  ? ProjectsBottomLoader()
                                                  : ServiceItem(
                                                      model: viewHome!
                                                          .services
                                                          .items[index],
                                                      cb: widget.notif);
                                              //    : BrowseProjectsFrontCard(destination: state.browse_projects!.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: viewHome!
                                                        .services
                                                        .items
                                                        .length ==
                                                    10
                                                ? viewHome!
                                                    .services
                                                    .items
                                                    .length
                                                : viewHome!
                                                        .services
                                                        .items
                                                        .length +
                                                    1,
                                            controller: controller1,
                                          )
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return index>= _cs!.length
                                                  ? ProjectsBottomLoader()
                                                  : ServiceItem(
                                                      model: _cs![index],
                                                      cb: widget.notif);
                                              //    : BrowseProjectsFrontCard(destination: state.browse_projects!.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: _cs!.length == 10
                                                ? _cs!.length
                                                : _cs!.length + 1,
                                            controller: controller1,
                                          )),

                                Container(
                                    decoration: widget.isDark!
                                        ? const BoxDecoration(
                                            color: Colors.black12,
                                          )
                                        : const BoxDecoration(
                                            color: CurrentTheme.BackgroundColor,
                                            image: DecorationImage(
                                              image: ExactAssetImage(
                                                  'assets/img/elegant-white.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 8.0, 8.0, 10.0),
                                              child: InkWell(
                                                  onTap: () {},
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        const Text(
                                                          'Products',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ]))),
                                          categoryProductsIcon(context),
                                        ])),

                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 8.0, 1.0),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PublicBrowseProductsListing(
                                                        id: '12',
                                                        cb: widget.notif)),
                                          );
                                          /*
                                          AppProvider.getRouter(context)! .navigateTo(
                                              context, urlToRoute(this.viewHome!.products.url + '/listing/12'));

                                           */
                                        },
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                viewHome!.products.title!,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const Icon(Icons.arrow_forward,
                                                  size: 18.0)
                                            ]))),

                                Container(
                                    height: 210.0,
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
                                    /*  decoration: BoxDecoration(
                              /// To set Gradient in flashSale background
                              gradient: LinearGradient(colors: [
                                Color(0xFF7F7FD5).withOpacity(0.1),
                                Color(0xFF86A8E7).withOpacity(0.5),
                                Color(0xFF91EAE4).withOpacity(0.7)
                              ]),
                            ),*/

                                    /// To set FlashSale Scrolling horizontal
                                    child: _cpd!.isEmpty
                                        ? ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return index>=
                                                      viewHome!
                                                          .products
                                                          .items
                                                          .length
                                                  ? ProjectsBottomLoader()
                                                  : ProductItem(
                                                      model: viewHome!
                                                          .products
                                                          .items[index],
                                                      cb: widget.notif);
                                              //    : BrowseProjectsFrontCard(destination: state.browse_projects!.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: viewHome!
                                                        .products
                                                        .items
                                                        .length ==
                                                    10
                                                ? viewHome!
                                                    .products
                                                    .items
                                                    .length
                                                : viewHome!
                                                        .products
                                                        .items
                                                        .length +
                                                    1,
                                            controller: controller3,
                                          )
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return index>= _cpd!.length
                                                  ? ProjectsBottomLoader()
                                                  : ProductItem(
                                                      model: _cpd![index],
                                                      cb: widget.notif);
                                              //    : BrowseProjectsFrontCard(destination: state.browse_projects!.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: _cpd!.length == 10
                                                ? _cpd!.length
                                                : _cpd!.length + 1,
                                            controller: controller3,
                                          )),

                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),

                                Container(
                                    decoration: widget.isDark!
                                        ? const BoxDecoration(
                                            color: Colors.black12,
                                          )
                                        : const BoxDecoration(
                                            color: CurrentTheme.BackgroundColor,
                                            image: DecorationImage(
                                              image: ExactAssetImage(
                                                  'assets/img/elegant-white.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20.0, 10.0, 8.0, 10.0),
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          PageRouteBuilder(
                                                              pageBuilder: (_,
                                                                      __,
                                                                      ___) =>
                                                                  PublicPageView(
                                                                      title:
                                                                          'all_rankings',
                                                                      id: 6,
                                                                      isDark: widget
                                                                          .isDark,
                                                                      cb: widget
                                                                          .notif),
                                                              transitionDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          600),
                                                              transitionsBuilder: (_,
                                                                  Animation<
                                                                          double>
                                                                      animation,
                                                                  __,
                                                                  Widget
                                                                      child) {
                                                                return Opacity(
                                                                  opacity:
                                                                      animation
                                                                          .value,
                                                                  child: child,
                                                                );
                                                              }),
                                                          (Route<dynamic>
                                                                  route) =>
                                                              true);
                                                  /*
                                                  AppProvider.getRouter(context)! .navigateTo(
                                                      context,
                                                      urlToRoute('public/browse_users/listing/12'));

                                                   */
                                                },
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        viewHome!
                                                            .workers
                                                            .title!,
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      const Icon(Icons.arrow_forward,
                                                          size: 18.0)
                                                    ]))),
                                        Container(
                                          height: 220.0,
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          /*  decoration: BoxDecoration(
                              /// To set Gradient in flashSale background
                              gradient: LinearGradient(colors: [
                                Color(0xFF7F7FD5).withOpacity(0.1),
                                Color(0xFF86A8E7).withOpacity(0.5),
                                Color(0xFF91EAE4).withOpacity(0.7)
                              ]),
                            ),*/

                                          /// To set FlashSale Scrolling horizontal
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return index>=
                                                      viewHome!
                                                          .workers
                                                          .items
                                                          .length
                                                  ? ProjectsBottomLoader()
                                                  : WorkerItem(
                                                      model: viewHome!
                                                          .workers
                                                          .items[index],
                                                      cb: widget.notif);
                                              //    : BrowseProjectsFrontCard(destination: state.browse_projects!.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: viewHome!
                                                        .workers
                                                        .items
                                                        .length ==
                                                    10
                                                ? viewHome!
                                                    .workers
                                                    .items
                                                    .length
                                                : viewHome!
                                                        .workers
                                                        .items
                                                        .length +
                                                    1,
                                            controller: controller4,
                                          ),
                                        ),
                                      ],
                                    )),

                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),
                                Container(
                                    /*  decoration:    BoxDecoration(
                                color: CurrentTheme.BackgroundColor,
                                image: DecorationImage( image:    ExactAssetImage('assets/img/elegant-white.jpg'),
                                  fit: BoxFit.cover,),
                              ),

                             */
                                    child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20.0, 10.0, 8.0, 10.0),
                                        child: InkWell(
                                            onTap: () {
                                              //AppProvider.getRouter(context)! .navigateTo(
                                              //    context,
                                              //   urlToRoute('public/browse_users/listing/12'));
                                            },
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    viewHome!
                                                        .activities
                                                        .title!,
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  // Icon(Icons.arrow_forward, size: 18.0)
                                                ]))),
                                    Container(
                                        // height: 250.0,
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: _cua.isNotEmpty
                                            ? Column(children: _cua)
                                            : Column(
                                                children: <Widget>[
                                                  const Divider(
                                                    thickness: 1.0,
                                                    color: Colors.white,
                                                  ),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[0],
                                                      cb: widget.notif),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[1],
                                                      cb: widget.notif),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[2],
                                                      cb: widget.notif),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[3],
                                                      cb: widget.notif),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[4],
                                                      cb: widget.notif),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[5],
                                                      cb: widget.notif),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[6],
                                                      cb: widget.notif),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[7],
                                                      cb: widget.notif),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[8],
                                                      cb: widget.notif),
                                                  ActivitiesFixItem(
                                                      model: viewHome!
                                                          .activities
                                                          .items[9],
                                                      cb: widget.notif),
                                                ],
                                              )),
                                  ],
                                )),

                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),

                                Container(
                                    decoration: widget.isDark!
                                        ? const BoxDecoration(
                                            color: Colors.black12,
                                          )
                                        : const BoxDecoration(
                                            color: CurrentTheme.BackgroundColor,
                                            image: DecorationImage(
                                              image: ExactAssetImage(
                                                  'assets/img/elegant-white.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20.0, 10.0, 8.0, 10.0),
                                            child: InkWell(
                                                onTap: () {
                                                  AppProvider.getRouter(
                                                          context)!
                                                      .navigateTo(
                                                          context,
                                                          urlToRoute(viewHome!
                                                                  .testimonials
                                                                  .url +
                                                              '/listing/12'));
                                                },
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      // Text(this.viewHome!.testimonials.title!,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                                                      const Text(
                                                        'Happy Users',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      const Icon(Icons.arrow_forward,
                                                          size: 18.0)
                                                    ]))),
                                        Container(
                                            height: 340.0, //375
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 0.0, 0.0, 0.0),
                                            /*  decoration: BoxDecoration(
                              /// To set Gradient in flashSale background
                              gradient: LinearGradient(colors: [
                                Color(0xFF7F7FD5).withOpacity(0.1),
                                Color(0xFF86A8E7).withOpacity(0.5),
                                Color(0xFF91EAE4).withOpacity(0.7)
                              ]),
                            ),*/

                                            /// To set FlashSale Scrolling horizontal
                                            ///
                                            child: _cte!.isEmpty
                                                ? ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return index>=
                                                              viewHome!
                                                                  .testimonials
                                                                  .items
                                                                  .length
                                                          ? ProjectsBottomLoader()
                                                          : TestimonialItem1(
                                                              model: viewHome!
                                                                  .testimonials
                                                                  .items[index],
                                                              isDark:
                                                                  widget.isDark,
                                                              index: index + 1);
                                                      //    : BrowseProjectsFrontCard(destination : state.browse_projects!.items.items[index], shape: shape);
                                                      //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                                    },
                                                    itemCount: viewHome!
                                                                .testimonials
                                                                .items
                                                                .length ==
                                                            4
                                                        ? viewHome!
                                                            .testimonials
                                                            .items
                                                            .length
                                                        : viewHome!
                                                                .testimonials
                                                                .items
                                                                .length +
                                                            1,
                                                    controller: controller4,
                                                  )
                                                : ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return index>=
                                                              _cte!.length
                                                          ? ProjectsBottomLoader()
                                                          : TestimonialItem1(
                                                              model:
                                                                  _cte![index],
                                                              isDark:
                                                                  widget.isDark,
                                                              index: index + 1);
                                                      //    : BrowseProjectsFrontCard(destination : state.browse_projects!.items.items[index], shape: shape);
                                                      //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                                    },
                                                    itemCount: _cte!.length == 4
                                                        ? _cte!.length
                                                        : _cte!.length + 1,
                                                    controller: controller4,
                                                  )

                                            /*
                                          child:
                                            _cte!.length == 0?
                                            TestimonialItem1(model: this.viewHome!.testimonials.items[0] ,isDark: widget.isDark):
                                            TestimonialItem1(model: _cte[0] ,isDark: widget.isDark),

                                           */
                                            /*
                                          child: _cte!.length == 0 ?    ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index) {
                                              return index! >= this.viewHome!.testimonials.items.length
                                                  ? ProjectsBottomLoader()
                                                  :TestimonialItem(model: this.viewHome!.testimonials.items[index] ,isDark: widget.isDark,);
                                              //    : BrowseProjectsFrontCard(destination : state.browse_projects!.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: this.viewHome!.testimonials.items.length == 4
                                                ? this.viewHome!.testimonials.items.length
                                                : this.viewHome!.testimonials.items.length + 1,
                                            controller: controller4,
                                          ):
                                             ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index) {
                                              return index! >= _cte!.length
                                                  ? ProjectsBottomLoader()
                                                  :TestimonialItem(model: _cte[index] ,isDark: widget.isDark,);
                                              //    : BrowseProjectsFrontCard(destination : state.browse_projects!.items.items[index], shape: shape);
                                              //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                                            },
                                            itemCount: _cte!.length == 4
                                                ? _cte!.length
                                                : _cte!.length + 1,
                                            controller: controller4,
                                          )

                                             */

                                            ),
                                      ],
                                    )),

                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),
                                Container(
                                    /*  decoration:    BoxDecoration(
                                color: CurrentTheme.BackgroundColor,
                                image: DecorationImage( image:    ExactAssetImage('assets/img/elegant-white.jpg'),
                                  fit: BoxFit.cover,),
                              ),

                             */
                                    child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20.0, 10.0, 8.0, 10.0),
                                        child: InkWell(
                                            onTap: () {
                                              AppProvider.getRouter(context)!
                                                  .navigateTo(
                                                      context,
                                                      urlToRoute(
                                                          'public/tips/listing/12'));
                                            },
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    width: 150,
                                                    child: Html(
                                                        data: viewHome!
                                                            .tips
                                                            .title!,
                                                        //   defaultTextStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),
                                                        style: {
                                                          "html": Style(
                                                              fontSize:
                                                                  const FontSize(
                                                                      17.0),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        }),
                                                  ),
                                                  const Icon(Icons.arrow_forward,
                                                      size: 18.0)
                                                ]))),
                                    Container(
                                        // height: 250.0,
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          children: <Widget>[
                                            TipsFixItem(
                                                model: viewHome!
                                                    .tips
                                                    .items[0]),
                                            TipsFixItem(
                                                model: viewHome!
                                                    .tips
                                                    .items[1]),
                                            TipsFixItem(
                                                model: viewHome!
                                                    .tips
                                                    .items[2]),
                                            TipsFixItem(
                                                model: viewHome!
                                                    .tips
                                                    .items[3]),
                                          ],
                                        )

                                        /// To set FlashSale Scrolling horizontal
                                        ),
                                  ],
                                )),
/*
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),

                                Container(
                                    decoration: widget.isDark!
                                        ? const BoxDecoration(
                                            color: Colors.black12,
                                          )
                                        : const BoxDecoration(
                                            color: CurrentTheme.BackgroundColor,
                                            image: DecorationImage(
                                              image: ExactAssetImage(
                                                  'assets/img/elegant-white.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20.0, 10.0, 8.0, 10.0),
                                            child: InkWell(
                                                onTap: () {
                                                  AppProvider.getRouter(
                                                          context)!
                                                      .navigateTo(
                                                          context,
                                                          urlToRoute(viewHome!
                                                                  .sukses
                                                                  .url +
                                                              '/listing/12'));
                                                },
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        viewHome!
                                                            .sukses
                                                            .title!,
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      const Icon(Icons.arrow_forward,
                                                          size: 18.0)
                                                    ]))),
                                        Container(
                                          height: 440.0,
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          /*  decoration: BoxDecoration(
                              /// To set Gradient in flashSale background
                              gradient: LinearGradient(colors: [
                                Color(0xFF7F7FD5).withOpacity(0.1),
                                Color(0xFF86A8E7).withOpacity(0.5),
                                Color(0xFF91EAE4).withOpacity(0.7)
                              ]),
                            ),*/

                                          /// To set FlashSale Scrolling horizontal
                                          child: SuksesItem(
                                            model:
                                                viewHome!.sukses.items[0],
                                            isDark: widget.isDark,
                                          ),
                                        ),
                                      ],
                                    )),

                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),

 */

                                Container(
                                    /*  decoration:    BoxDecoration(
                                color: CurrentTheme.BackgroundColor,
                                image: DecorationImage( image:    ExactAssetImage('assets/img/elegant-white.jpg'),
                                  fit: BoxFit.cover,),
                              ),

                             */
                                    child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20.0, 10.0, 8.0, 10.0),
                                        child: InkWell(
                                            onTap: () {
                                              AppProvider.getRouter(context)!
                                                  .navigateTo(
                                                      context,
                                                      urlToRoute(
                                                          'public/blog/listing/12'));
                                            },
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    width: 100,
                                                    child: Html(
                                                      data: viewHome!
                                                          .blogs
                                                          .title!,
                                                      style: {
                                                        "html": Style(
                                                            fontSize:
                                                                const FontSize(17.0),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      },
                                                    ),
                                                  ),
                                                  const Icon(Icons.arrow_forward,
                                                      size: 18.0)
                                                ]))),
                                    Container(
                                        // height: 300.0,
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          children: <Widget>[
                                            BlogsFixItem(
                                                model: viewHome!
                                                    .blogs
                                                    .items[0]),
                                            BlogsFixItem(
                                                model: viewHome!
                                                    .blogs
                                                    .items[1]),
                                            BlogsFixItem(
                                                model: viewHome!
                                                    .blogs
                                                    .items[2]),
                                            BlogsFixItem(
                                                model: viewHome!
                                                    .blogs
                                                    .items[3]),
                                          ],
                                        )

                                        /// To set FlashSale Scrolling horizontal
                                        ),
                                  ],
                                )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                      height: 20.0,
                                    )),

                                Container(
                                    color: Colors.black,
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 5.0, top: 15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                          'Knowledgebase'
                                                              .toUpperCase(),
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 10),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'pengenalan', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                // => launch("tel://085692287785"),
                                                                child: const Text(
                                                                  'Pengenalan',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'cara_kerja', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Cara Kerja',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'keunggulan', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Keunggulan',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'aturan_main', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Aturan Main',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'menjadi_owner', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Menjadi Owner',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'menjadi_worker', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Menjadi Worker',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'menjadi_seller', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Menjadi Seller',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'menjadi_affiliate', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Menjadi Affiliate',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 20),
                                                        child: Text(
                                                            'Customer Support'
                                                                .toUpperCase(),
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 10),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  await _launchWhatsApp();
                                                                },
                                                                // => launch("tel://085692287785"),62 813 1222 9959
                                                                child: const Text(
                                                                  'WhatsApp:  +62 858 9105 5785 ',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => launch(
                                                                    "tel://02287882588"),
                                                                child: const Text(
                                                                  'Telkom: (022) 8788 2588',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            /*
                                                         Padding(
                                                           padding: EdgeInsets.only(bottom: 7.0),
                                                           child:
                                                              GestureDetector(
                                                             onTap:() => launch("tel://088809443072"),
                                                             child: Text('Smartfren: 0888 0944 3072', style: TextStyle(fontSize: 10, color : Colors.white, fontWeight: FontWeight.w100  ),),
                                                           ),
                                                         ),

                                                          */
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => launch(
                                                                    "tel://082216769885"),
                                                                child: const Text(
                                                                  'Telkomsel: 0822 1676 9885',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            /*
                                                         Padding(
                                                           padding: EdgeInsets.only(bottom: 7.0),
                                                           child:
                                                              GestureDetector(
                                                             onTap:() => launch("tel://089625779278"),
                                                             child: Text('Three: 0896 2577 9278', style: TextStyle(fontSize: 10, color : Colors.white, fontWeight: FontWeight.w100  ),),
                                                           ),
                                                         ),
                                                         Padding(
                                                           padding: EdgeInsets.only(bottom: 7.0),
                                                           child:
                                                              GestureDetector(
                                                             onTap:() => launch("tel://085794416774"),
                                                             child: Text('Indosat: 0857 9441 6774', style: TextStyle(fontSize: 10, color : Colors.white, fontWeight: FontWeight.w100  ),),
                                                           ),
                                                         ),

                                                          */
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 5.0, top: 15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                          'Tentang Kami'
                                                              .toUpperCase(),
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.start),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 10),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'tentang_kami', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                // => launch("tel://085692287785"),
                                                                child: const Text(
                                                                  'Perusahaan Kami',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'pengelola', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Pengelola',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'syarat_layanan', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Syarat Layanan',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  //await _launchWhatsApp();
                                                                  Navigator.of(context).pushAndRemoveUntil(
                                                                      PageRouteBuilder(
                                                                          pageBuilder: (_, __, ___) => PublicPageView(title: 'kebijakan_privasi', id: 0),
                                                                          transitionDuration: const Duration(milliseconds: 600),
                                                                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                                                                            return Opacity(
                                                                              opacity: animation.value,
                                                                              child: child,
                                                                            );
                                                                          }),
                                                                      (Route<dynamic> route) => true);
                                                                },
                                                                child: const Text(
                                                                  'Kebijakan Privasi',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  AppProvider.getRouter(
                                                                          context)!
                                                                      .navigateTo(
                                                                    context,
                                                                    '/public/support/contact_form/1/contact_form',
                                                                  );
                                                                },
                                                                child: const Text(
                                                                  'Kontak',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 20.0),
                                                        child: Text(
                                                            'PT Panonpoe Media'
                                                                .toUpperCase(),
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 10),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  await _launchWhatsApp();
                                                                },
                                                                // => launch("tel://085692287785"),
                                                                child: const Text(
                                                                  'Buana Hilltop View Residence C2-6',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => launch(
                                                                    "tel://02287882588"),
                                                                child: const Text(
                                                                  'Bandung 40618 - Indonesia',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => launch(
                                                                    "tel://088809443072"),
                                                                child: const Text(
                                                                  'Telp./Fax. (022) 8788 2588',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          7.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => launch(
                                                                    "tel://082216769885"),
                                                                child: const Text(
                                                                  'PO BOX 1027 - Bandung 40010',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 20,
                                                                bottom: 10),
                                                        child: Text(
                                                            'Payment Methods'
                                                                .toUpperCase(),
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                      Container(
                                                        width: 180,
                                                        child: Image.asset(
                                                            'assets/img/bank.png',
                                                            fit: BoxFit.fill),
                                                      ),
                                                    ],
                                                  )),
                                            ]),
                                      ],
                                    )),

                                Container(
                                    color: Colors.black,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Html(
                                          data: //'''<div class="col-md-9 col-sm-9 padding-top-10">''' +
                                              '''<a href="https://projects.co.id/public/pages/kebijakan_privasi">Privacy Policy</a> | <a href="https://projects.co.id/public/pages/syarat_layanan">Terms of Service</a> | <a href="https://projects.co.id/public/pages/status">Servers Status</a> <br>''' +
                                                  '''Projects.co.id adalah website untuk mencari jasa freelancer dan transaksi produk digital dengan sistem kerja remote. Kami dapat membantu mulai dari jasa pembuatan website, pembuatan aplikasi mobile, SEO, desain logo dan lainnya. Cepat, mudah dan aman.''',
                                          // '''Copyright ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â© 2013-2020, PT Panonpoe Media. All rights reserved.<br> ''' +
                                          // '''</div> ''' ,
                                          style: {
                                            "html": Style(
                                              fontSize: FontSize.small,
                                              color: Colors.white,
                                              padding: const EdgeInsets.only(
                                                  top: 20.0,
                                                  left: 20.0,
                                                  right: 20.0,
                                                  bottom: 0.0),
                                            ),
                                          },

                                          onLinkTap: (url, _, __, ___) async {
                                            if (await canLaunch(url!)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                        ),
                                        Html(
                                          data:
                                              // '''<a href="https://projects.co.id/public/pages/kebijakan_privasi">Privacy Policy</a> | <a href="https://projects.co.id/public/pages/syarat_layanan">Terms of Service</a> | <a href="https://projects.co.id/public/pages/status">Servers Status</a> <br>''' +
                                              // '''Projects.co.id adalah website untuk mencari jasa freelancer dan transaksi produk digital dengan sistem kerja remote. Kami dapat membantu mulai dari jasa pembuatan website, pembuatan aplikasi mobile, SEO, desain logo dan lainnya. Cepat, mudah dan aman. <br>''' +
                                              '''Copyright © 2013-$formattedDate, PT Panonpoe Media. All rights reserved.<br> ''',
                                          //  '''</div> ''' ,
                                          style: {
                                            "html": Style(
                                              fontSize: FontSize.small,
                                              color: Colors.white,
                                              padding: const EdgeInsets.only(
                                                  top: 20.0,
                                                  left: 20.0,
                                                  right: 20.0,
                                                  bottom: 0.0),
                                            ),
                                          },

                                          onLinkTap: (url, _, __, ___) async {
                                            if (await canLaunch(url!)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                        ),
                                      ],
                                    )),

                                Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      height: 50.0,
                                      color: Colors.black,
                                    )),

                                //header
                                /*    Padding(
                            padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                            child: Html(data: this.viewHome!.status),
                          ), */
                              ]);
                        })),
              ])),
      floatingActionButton: SpeedDialVarian(
        marginRight: 35,
        marginBottom: 35,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22.0),
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        visible: true,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: CurrentTheme.MainAccentColor,
        overlayOpacity: 0.5,
        onOpen: () {
          //  setState((){
          activefab(true);
          // });
        },
        onClose: () {
          activefab(false);
        },
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: darkMode ? Colors.white : CurrentTheme.SecondaryColor,
        foregroundColor: darkMode ? Colors.black : Colors.white,
        elevation: 8.0,
        shape: const CircleBorder(),
        children: <SpeedDialVarianChild>[
          SpeedDialVarianChild(
              child: const Icon(Icons.add),
              // backgroundColor: Colors.green,
              backgroundColor:
                  darkMode ? Colors.white : CurrentTheme.SecondaryColor,
              foregroundColor: darkMode ? Colors.black : Colors.white,
              labelBackgroundColor: darkMode ? Colors.black : Colors.white,
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: darkMode ? Colors.white : Colors.black),
              label: 'Update Profile',
              //  labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                if (widget.hasID!) {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, "/user/my_profile/view");
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, "/login/1");
                }
              }),
          SpeedDialVarianChild(
              child: const Icon(Icons.search),
              backgroundColor:
                  darkMode ? Colors.white : CurrentTheme.SecondaryColor,
              foregroundColor: darkMode ? Colors.black : Colors.white,
              labelBackgroundColor: darkMode ? Colors.black : Colors.white,
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: darkMode ? Colors.white : Colors.black),
              label: 'Browse Projects',
              //  labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PublicBrowseProjectsListing(
                          id: '12', cb: widget.notif)),
                );
                /*
                      AppProvider.getRouter(context)! .navigateTo(
                          context,
                          "/public/browse_projects/listing/12");

                       */
              }),
          SpeedDialVarianChild(
              child: const Icon(Icons.add),
              backgroundColor:
                  darkMode ? Colors.white : CurrentTheme.SecondaryColor,
              foregroundColor: darkMode ? Colors.black : Colors.white,
              labelBackgroundColor: darkMode ? Colors.black : Colors.white,
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: darkMode ? Colors.white : Colors.black),
              label: 'Add Product',
              //     labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
              onTap: () {
                if (widget.hasID!) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context, "/user/my_products/add_new_product//");
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, "/login/1");
                }
              }),
          SpeedDialVarianChild(
              child: const Icon(Icons.add),
              backgroundColor:
                  darkMode ? Colors.white : CurrentTheme.SecondaryColor,
              foregroundColor: darkMode ? Colors.black : Colors.white,
              labelBackgroundColor: darkMode ? Colors.black : Colors.white,
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: darkMode ? Colors.white : Colors.black),
              label: 'Add Service',
              // labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
              onTap: () {
                if (widget.hasID!) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context, "/user/my_services/add_new_service//");
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, "/login/1");
                }
              }),
          SpeedDialVarianChild(
              child: const Icon(Icons.search),
              elevation: 1.5,
              backgroundColor:
                  darkMode ? Colors.white : CurrentTheme.SecondaryColor,
              foregroundColor: darkMode ? Colors.black : Colors.white,
              labelBackgroundColor: darkMode ? Colors.black : Colors.white,
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: darkMode ? Colors.white : Colors.black),
              label: 'Browse Products',
              //  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PublicBrowseProductsListing(
                          id: '12', cb: widget.notif)),
                );
                /*
                                AppProvider.getRouter(context)! .navigateTo(
                                    context,
                                    "/public/browse_products/listing/12");

                                 */
              }),
          SpeedDialVarianChild(
              child: const Icon(Icons.search),
              backgroundColor:
                  darkMode ? Colors.white : CurrentTheme.SecondaryColor,
              foregroundColor: darkMode ? Colors.black : Colors.white,
              labelBackgroundColor: darkMode ? Colors.black : Colors.white,
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: darkMode ? Colors.white : Colors.black),
              elevation: 1.5,
              label: 'Browse Services',
              // labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PublicBrowseServicesListing(
                          id: '12', cb: widget.notif)),
                );
                /*
                                AppProvider.getRouter(context)! .navigateTo(
                                    context,
                                    "/public/browse_services/listing/12");

                                 */
              }),
          SpeedDialVarianChild(
              child: const Icon(Icons.search),
              backgroundColor:
                  darkMode ? Colors.white : CurrentTheme.SecondaryColor,
              foregroundColor: darkMode ? Colors.black : Colors.white,
              labelBackgroundColor: darkMode ? Colors.black : Colors.white,
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: darkMode ? Colors.white : Colors.black),
              label: 'Browse Users',
              // labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PublicBrowseUsersListing(id: '12', cb: widget.notif)),
                );
                /*
                                AppProvider.getRouter(context)! .navigateTo(
                                    context,
                                    "/public/browse_users/listing/12");

                                 */
              }),
          SpeedDialVarianChild(
              child: const Icon(Icons.add),
              backgroundColor:
                  darkMode ? Colors.white : CurrentTheme.SecondaryColor,
              foregroundColor: darkMode ? Colors.black : Colors.white,
              labelBackgroundColor: darkMode ? Colors.black : Colors.white,
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: darkMode ? Colors.white : Colors.black),
              elevation: 1.5,
              label: 'Create Project',
              onTap: () {
                if (widget.hasID!) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context, "/user/my_projects/create_project//");
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, "/login/1");
                }
              }),
        ],
      ),

      /*
         SafeArea(
          child:    Stack(
              children: <Widget>[
                                   MenuTabBar(
                  background: CurrentTheme.PrimaryDarkColor,
                  backgroundMenuIconDefault:  Colors.black87,
                  colorMenuIconDefault: CurrentTheme.PrimaryDarkColor,
                  iconButtons: [
                       IconButton(color: Colors.transparent, icon:    Icon(Icons.home, size: 30), onPressed: (){}),
                       IconButton(color: Colors.transparent, icon:    Icon(Icons.search, size: 30), onPressed: (){}),
                  ],
                  child:    Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        //print('widget === ${widget.hasID!.toString()}');
                        if(widget.hasID!){
                          AppProvider.getRouter(context)! .navigateTo(
                              context,
                              "/user/my_projects/create_project//");
                        }else
                        {
                          AppProvider.getRouter(context)! .navigateTo(
                              context,
                              "/login/1");

                        }
                      },
                      child:                       Container(child:    Text("Create Project", style: TextStyle(color: Colors.white, fontSize: 20)), margin: EdgeInsets.all(10)),

                   ),
                    GestureDetector(
                      onTap: (){
                        //print('widget === ${widget.hasID!.toString()}');
                        AppProvider.getRouter(context)! .navigateTo(
                            context,
                            "/public/browse_services/listing/12");
                      },
                      child:      Container(child:    Text("Browse Services", style: TextStyle(color: Colors.white, fontSize: 20)), margin: EdgeInsets.all(10)),

                    ),   GestureDetector(
                      onTap: (){
                        //print('widget === ${widget.hasID!.toString()}');
                        AppProvider.getRouter(context)! .navigateTo(
                            context,
                            "/public/browse_products/listing/12");
                      },
                      child:      Container(child:    Text("Browse Products", style: TextStyle(color: Colors.white, fontSize: 20)), margin: EdgeInsets.all(10)),

                    ),
                    GestureDetector(
                      onTap: (){
                        //print('widget === ${widget.hasID!.toString()}');
                        AppProvider.getRouter(context)! .navigateTo(
                            context,
                            "/public/browse_users/listing/12");
                      },
                      child:    Container(child:    Text("Browse Users", style: TextStyle(color: Colors.white, fontSize: 20)), margin: EdgeInsets.all(10)),

                    ),
                    GestureDetector(
                      onTap: (){
                        //print('widget === ${widget.hasID!.toString()}');
                        AppProvider.getRouter(context)! .navigateTo(
                            context,
                            "/public/browse_projects/listing/12");
                      },
                      child:    Container(child:    Text("Browse Projects", style: TextStyle(color: Colors.white, fontSize: 20)), margin: EdgeInsets.all(10)),

                    ),

                    GestureDetector(
                      onTap: (){
                        //print('widget === ${widget.hasID!.toString()}');
                        if(widget.hasID!){
                          AppProvider.getRouter(context)! .navigateTo(
                              context,
                              "/user/my_services/add_  _service//");
                        }else
                        {
                          AppProvider.getRouter(context)! .navigateTo(
                              context,
                              "/login/1");

                        }
                      },
                      child:
                         Container(child:    Text("Add Service", style: TextStyle(color: Colors.white, fontSize: 20)), margin: EdgeInsets.all(10)),

                    ),
                    GestureDetector(
                      onTap: (){
                        //print('widget === ${widget.hasID!.toString()}');
                        if(widget.hasID!){
                          AppProvider.getRouter(context)! .navigateTo(
                              context,
                              "/user/my_products/add_  _product//");
                        }else
                        {
                          AppProvider.getRouter(context)! .navigateTo(
                              context,
                              "/login/1");

                        }
                      },
                      child:
                         Container(child:    Text("Add Product", style: TextStyle(color: Colors.white, fontSize: 20)), margin: EdgeInsets.all(10)),

                    ),
                    GestureDetector(
                      onTap: (){
                        //print('widget === ${widget.hasID!.toString()}');
                        if(widget.hasID!){
                          AppProvider.getRouter(context)! .navigateTo(
                              context,
                              "/user/my_profile/view");
                        }else
                        {
                          AppProvider.getRouter(context)! .navigateTo(
                              context,
                              "/login/1");

                        }
                      },
                      child:
                         Container(child:    Text("Update Profile", style: TextStyle(color: Colors.white, fontSize: 20)), margin: EdgeInsets.all(10))

                    ),
                  ]),
                ),
                                   Align(alignment: Alignment.bottomCenter,
                                  child:
                                  Container(
                                    width: size.width,
                                    height: 35.0,
                                    color: Colors.black87,
                                    child:    RawMaterialButton(
                                      shape:    CircleBorder(),
                                      child:const Text('Bikin Project Sekarang!', style: TextStyle(color: Colors.white, fontSize: 14),),
                                      onPressed: () {
                                        //print('widget === ${widget.hasID!.toString()}');
                                        if(widget.hasID!){
                                          AppProvider.getRouter(context)! .navigateTo(
                                              context,
                                              "/user/my_projects/create_project//");
                                        }else
                                        {
                                          AppProvider.getRouter(context)! .navigateTo(
                                              context,
                                              "/login/1");

                                        }
                                      },
                                    ),
                                  ),
                                ),


                            ]
          )
      ),

       */
      /*
      Container(
        width: size.width,
        height: 35.0,
        color: Colors.black87,
        child:    RawMaterialButton(
          shape:    CircleBorder(),
          child:const Text('Bikin Project Sekarang!', style: TextStyle(color: Colors.white, fontSize: 14),),
          onPressed: () {
           print('widget === ${widget.hasID!.toString()}');
            if(widget.hasID!){
              AppProvider.getRouter(context)! .navigateTo(
                  context,
                  "/user/my_projects/create_project//");
            }else
            {
              AppProvider.getRouter(context)! .navigateTo(
                  context,
                  "/login/1");

            }
          },
        ),
      ),

           */
/*
      FloatingActionButton.extended(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        hoverColor: Colors.lightGreen[800],
        focusColor: Colors.lightGreen[800],
        isExtended : true,
        label: const Text('Bikin Project Sekarang!', style: TextStyle(color: Colors.white, fontSize: 14),),
        onPressed: () {
          if(widget.hasID!){
            AppProvider.getRouter(context)! .navigateTo(
                context,
                "/user/my_projects/create_project//");
          }else
          {
            AppProvider.getRouter(context)! .navigateTo(
                context,
                "/login/1");

          }
        },
      ),

 */

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _launchWhatsApp() async {
    String phoneNumber = '  +6285891055785 ';
    String message = '';
    var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  _launchTelegram() async {
    var telegramUrl = "https://telegram.me/lowongankerjafreelance";
    if (await canLaunch(telegramUrl)) {
      await launch(telegramUrl);
    } else {
      throw 'Could not launch $telegramUrl';
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onScroll() {
    // final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.position.pixels;
    if (lastScroll > currentScroll) {
      scrollup(false);
    } else {
      scrollup(true);
    }
    lastScroll = currentScroll;
  }
}

class ProjectsBottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
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

class CtgWidgetValue extends StatelessWidget {
  String? title;
  String? type;
  Widget? icon;
  GestureTapCallback? tap;

  CtgWidgetValue({
    this.icon,
    this.tap,
    this.title,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color:  CurrentTheme.BackgroundColor,
      color: Colors.transparent,
      height: 47, // tambahkan property berikut
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Center(
        child: InkWell(
          onTap: tap,
          child: Column(
            children: <Widget>[
              icon!,
              /*  Icon(
                icon,
                size: 26.0,
                color: CurrentTheme.DarkAccentColor,
              ),

             */
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              Text(
                title!,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Sans",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CtgIconValue extends StatelessWidget {
  String? title;
  String? type;
  IconData? icon;
  GestureTapCallback? tap;

  CtgIconValue({
    this.icon,
    this.tap,
    this.title,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color:  CurrentTheme.BackgroundColor,
      color: Colors.transparent,
      height: 47, // tambahkan property berikut
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Center(
        child: InkWell(
          onTap: tap,
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                size: 26.0,
                color: CurrentTheme.DarkAccentColor,
              ),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              Text(
                title!,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Sans",
                  fontSize: 9.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CtgIconValue1 extends StatelessWidget {
  String? title;
  String? title1;
  String? type;
  IconData? icon;
  GestureTapCallback? tap;

  CtgIconValue1({
    this.icon,
    this.tap,
    this.title,
    this.title1,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CurrentTheme.BackgroundColor,
      height: 47, // tambahkan property berikut
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Center(
        child: InkWell(
          onTap: tap,
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                size: 26.0,
                color: CurrentTheme.DarkAccentColor,
              ),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Sans",
                  fontSize: 9.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                title1!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Sans",
                  fontSize: 8.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final ProjectItemModel? model;
  final ChatBloc? cb;
  ProjectItem({this.model, this.cb});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PublicBrowseProjectsView(
                          id: urlToRoute(model!.url!).split('/')[4],
                          title: urlToRoute(model!.url!).split('/')[5],
                          cb: cb)),
                );

                /*
                AppProvider.getRouter(context)! .navigateTo(
                    context, urlToRoute(model!.url!!));

                 */
                /*  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>    flashSale(),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 850))); */
              },
              child: Container(
                height: 202.0,
                width: model!.budget!.indexOf('-') == -1 ? 131.0 : 170,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: model!.budget!.indexOf('-') == -1 ? 90.0 : 96,
                      width: model!.budget!.indexOf('-') == -1 ? 110.0 : 155,
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            // In order to have the ink splash appear above the image, you
                            // must use Ink.image!. This allows the image to be painted as part
                            // of the Material and display ink effects above it. Using a
                            // standard Image will obscure the ink splash.
                            child: Center(
                              child: ShowAvatar(avatar: model!.avatar!),
                            )),
                      ]),
                    ),
                    Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 0.0, top: 15.0),
                          child: Text(
                              ReCase(model!.title!.replaceAll('&amp;', ''))
                                  .titleCase,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0,
                          top: model!.budget!.length < 25 ? 5.0 : 1,
                          right: 0.0),
                      child: model!.budget!.length < 21
                          ? Text(model!.budget!,
                              softWrap: false,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: CurrentTheme.PrimaryDarkColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Sans"))
                          : Text(model!.budget!,
                              softWrap: true,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: CurrentTheme.PrimaryDarkColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Sans")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0,
                          top: model!.budget!.length < 24 ? 5.0 : 4,
                          right: 0.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.timelapse,
                            size: model!.budget!.length < 21 ? 15.0 : 13.0,
                          ),
                          Text(
                            ' ' + model!.deadline!,
                            softWrap: false,
                            style: TextStyle(
                              fontSize:
                                  model!.budget!.length < 21 ? 15.0 : 13.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans",
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*  Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 0.0,right: 5.0),
                      child: Text(
                        model!.owner,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Sans",
                            color: Colors.black),
                      ),
                    ),

                    */
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class ServiceItem extends StatelessWidget {
  final ServiceItemModel? model;
  final ChatBloc? cb;

  ServiceItem({this.model, this.cb});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PublicBrowseServicesView(
                          id: urlToRoute(model!.url!).split('/')[4],
                          title: urlToRoute(model!.url!).split('/')[5],
                          cb: cb)),
                );

                /*

                AppProvider.getRouter(context)! .navigateTo(
                    context, urlToRoute(model!.url!!));

                 */
                /*  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>    flashSale(),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 850))); */
              },
              child: Container(
                height: 198.0,
                width: 131.0,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                      width: 110.0,
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                            bottom: 0.0,
                            left: 20.0,
                            right: 0.0,
                            // In order to have the ink splash appear above the image, you
                            // must use Ink.image!. This allows the image to be painted as part
                            // of the Material and display ink effects above it. Using a
                            // standard Image will obscure the ink splash.
                            child:
                                /*

                              ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child:
                                  Image.network(
                                    model!.logo,
                                    fit: BoxFit.contain,

                                  )
                              ),

                               */
                                ShowAvatar(avatar: model!.logo)),
                      ]),
                    ),
                    Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 0.0, top: 15.0),
                          child: Text(
                              ReCase(model!.title!.replaceAll('&amp;', ''))
                                  .titleCase,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600)),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 5.0, right: 0.0),
                      child: Text(model!.price!,
                          softWrap: false,
                          style: const TextStyle(
                              fontSize: 15.0,
                              color: CurrentTheme.PrimaryDarkColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 5.0, right: 0.0),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.timelapse,
                            size: 15.0,
                          ),
                          Text(
                            ' ' + model!.delivery!,
                            softWrap: false,
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans",
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 0.0,right: 10.0),
                      child: Text(
                        model!.seller,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Sans",
                            color: Colors.black),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 0.0,right: 10.0),
                      child: Container(
                        height: 5.0,
                        width: model!.seller.length.toDouble()*5,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFA500),
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    ) */
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductItemModel? model;
  ChatBloc? cb;
  ProductItem({this.model, this.cb});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PublicBrowseProductsView(
                          id: urlToRoute(model!.url!).split('/')[4],
                          title: urlToRoute(model!.url!).split('/')[5],
                          cb: cb)),
                );
                /*
                AppProvider.getRouter(context)! .navigateTo(
                    context, urlToRoute(model!.url!!));

                 */
                /*  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>    flashSale(),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 850))); */
              },
              child: Container(
                height: 190.0,
                width: 131.0,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                      width: 110.0,
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                            bottom: 0.0,
                            left: 20.0,
                            right: 0.0,
                            // In order to have the ink splash appear above the image, you
                            // must use Ink.image!. This allows the image to be painted as part
                            // of the Material and display ink effects above it. Using a
                            // standard Image will obscure the ink splash.
                            child: ShowAvatar(avatar: model!.logo)
                            /*
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child:
                                  Image.network(
                                    model!.logo,
                                    fit: BoxFit.contain,

                                  )
                              ),

                               */

                            ),
                      ]),
                    ),
                    Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 0.0, top: 15.0),
                          child: Text(
                              ReCase(model!.title!.replaceAll('&amp;', ''))
                                  .titleCase,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600)),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 5.0, right: 0.0),
                      child: Text(model!.price!,
                          softWrap: false,
                          style: const TextStyle(
                              fontSize: 15.0,
                              color: CurrentTheme.PrimaryDarkColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 5.0, right: 0.0),
                      child: Text(
                        model!.delivery!,
                        softWrap: false,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Sans",
                          // color: Colors.black38
                        ),
                      ),
                    ),

                    /*
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 0.0,right: 10.0),
                      child: Text(
                        model!.seller,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Sans",
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 0.0,right: 10.0),
                      child: Container(
                        height: 5.0,
                        width: model!.seller.length.toDouble()*5,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFA500),
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    )

                     */
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class WorkerItem extends StatelessWidget {
  final WorkerItemModel? model;
  ChatBloc? cb;
  WorkerItem({this.model, this.cb});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PublicBrowseUsersView(
                            id: urlToRoute(model!.url!).split('/')[4],
                            title: urlToRoute(model!.url!).split('/')[5],
                            cb: cb)),
                  );
                  /*
                AppProvider.getRouter(context)! .navigateTo(
                    context, urlToRoute(model!.url!!));

                 */
                  /*  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>    flashSale(),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 850))); */
                },
                child: ShowWorkerWithRating(
                  username: model!.user_name!,
                  avatar: model!.avatar,
                  rating: toRating(model!.rating!),
                  viewRating: model!.rating,
                  projects: model!.projects,
                ))
          ],
        )
      ],
    );
  }
}

class ActivitiesItem extends StatelessWidget {
  final String? model;

  ActivitiesItem({this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const Divider(
        thickness: 2.0,
        height: 2.0,
        color: Colors.white,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Text(getImageLink(this.model!)),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 12.0),
            child: ShowAvatar(avatar: getImageLink(model!), ishuge: false),
          ),

          // Expanded(),
          Container(
            height: 120,
            width: 250,
            child:
                //  Bubble(
                //  margin: getHtml(this.model!).indexOf('>page<') == -1 ?  BubbleEdges.only(top: 10, bottom: 7) : BubbleEdges.only(top: 15, bottom: 30),
                // nip: BubbleNip.leftTop,
                //  child:
                Html(
              data: getHtml(model!),
              style: {
                "html": Style(
                  fontSize: FontSize.small,
                  padding: getHtml(model!).indexOf('>page<') == -1
                      ? const EdgeInsets.only(top: 18, left: 5.0)
                      : const EdgeInsets.only(top: 30, left: 5.0),
                ),
              },
              onLinkTap: (url, _, __, ___) async {
                if (url!.contains('projects.co.id')) {
                  if (url.contains(RegExp(r'[0-9]'))) {
                    if (url.contains('show_conversation')) {
                      AppProvider.getRouter(context)!
                          .navigateTo(context, urlToRoute(url + '/'));
                    } else {
                      AppProvider.getRouter(context)!
                          .navigateTo(context, urlToRoute(url))
                          .catchError((onError) {
                        AppProvider.getRouter(context)!.pop(context);
                      });
                    }
                  } else {
                    AppProvider.getRouter(context)!
                        .navigateTo(context, urlToRoute(url + '/'));
                  }
                } else {
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }
              },
            ),
            //),
          ),
        ],
      ),
    ]);
  }
}

class ActivitiesFixItem extends StatelessWidget {
  final String? model;
  final ChatBloc? cb;
  ActivitiesFixItem({this.model, this.cb});

  @override
  Widget build(BuildContext context) {
    var document = parse(model!);
    var userLink = document.getElementsByClassName('more');
    //  print('linkku ${recentNews[0].attributes["href"]}');
    return Column(children: <Widget>[
      /*  Divider(
            thickness: 2.0,
            // height: 2.0,
            color: Colors.white,
          ),

         */
      // Card(
      //  elevation: 1,
      // child:
      ListTile(
        isThreeLine: false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        leading:
            /*
              Container(
                width: 72,
                height: 72,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: CircleAvatar(
                        // radius: 100,
                        minRadius: 80,
                        maxRadius: 80,
                        // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                        backgroundImage:     NetworkImage(jsonDecode(this.model!)['avatar']),
                      ),
                    ),

                  ],
                ),
              ),

               */

            GestureDetector(
          onTap: () {
            AppProvider.getRouter(context)!.navigateTo(
                context, urlToRoute(userLink[0].attributes["href"]!));
          },
          child: Container(
            width: 58,
            height: 70,
            decoration: ShapeDecoration(
              shadows: [
                const BoxShadow(color: Colors.grey, offset: Offset(0.6, 0.6)),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(width: 1, color: Colors.white),
              ),
              image: DecorationImage(
                image: NetworkImage(getImageLink(model!)),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HtmlWidget(
                getHtml(model!),
                // shrinkWrap: true,
                // bodyPadding: EdgeInsets.all(0),
                //  textStyle: TextStyle(fontSize: 11),
                customStylesBuilder: (element) {
                  if (element.classes.contains('more')) {
                    return {'color': 'red'};
                  }

                  return null;
                },
                //hyperlinkColor: Colors.red,
                /* style: {
                        "html": Style(
                          fontSize: FontSize.small,
                          // padding: getHtml(this.model!).indexOf('>page<') == -1 ? EdgeInsets.only(top: 0 , left: 0.0) : EdgeInsets.only(top: 0, left: 0.0) ,
                        ),

                      },

                      */
                onTapUrl: (url) async {
                  if (url.contains('projects.co.id')) {
                    if (url.contains(RegExp(r'[0-9]'))) {
                      if (url.contains('show_conversation')) {
                        AppProvider.getRouter(context)!
                            .navigateTo(context, urlToRoute(url + '/'));
                      } else {
                        if (url.contains('browse_projects')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PublicBrowseProjectsActView(
                                        id: urlToRoute(url).split('/')[4],
                                        title:
                                            urlToRoute(url).split('/')[5],
                                        cb: cb)),
                          );
                        } else if (url.contains('browse_services')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PublicBrowseServicesView(
                                    id: urlToRoute(url).split('/')[4],
                                    title: urlToRoute(url).split('/')[5],
                                    cb: cb)),
                          );
                        } else if (url.contains('browse_products')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PublicBrowseProductsView(
                                    id: urlToRoute(url).split('/')[4],
                                    title: urlToRoute(url).split('/')[5],
                                    cb: cb)),
                          );
                        } else if (url.contains('browse_users')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PublicBrowseUsersView(
                                    id: urlToRoute(url).split('/')[4],
                                    title: urlToRoute(url).split('/')[5],
                                    cb: cb)),
                          );
                        } else {
                          AppProvider.getRouter(context)!
                              .navigateTo(context, urlToRoute(url))
                              .catchError((onError) {
                            AppProvider.getRouter(context)!.pop(context);
                          });
                        }
                        /*
                              AppProvider.getRouter(context)! .navigateTo(
                                  context,
                                  urlToRoute(url )).catchError((onError){

                                AppProvider.getRouter(context)! .pop(context);
                              });

                               */
                      }
                    } else {
                      AppProvider.getRouter(context)!
                          .navigateTo(context, urlToRoute(url + '/'));
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
              ),

              /*
                    Padding(
                      padding: EdgeInsets.only(left : 0),
                      child:  Text(jsonDecode(this.model!)['date'], style: TextStyle(fontSize: 10),),

                    ),

                    */
            ]),

        /*
              subtitle:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[


                    Padding(
                      padding: EdgeInsets.only(left : 0),
                      child:  Text(jsonDecode(this.model!)['date'], style: TextStyle(fontSize: 11),),

                    ),
                  ]
              ),

              */
        /*
            Text(
              '${widget._jsonMessage['display']}',
              maxLines: 2,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),

                 */
      ),
      const Divider(
        thickness: 1.0,
        // height: 2.0,
        color: Colors.white,
      ),
      // );
    ]);
  }
}

class ActivitiesFix1Item extends StatelessWidget {
  final dynamic model;
  final ChatBloc? cb;

  ActivitiesFix1Item({this.model, this.cb});

  @override
  Widget build(BuildContext context) {
    var document = parse(jsonDecode(model!)['message']);
    var userLink = document.getElementsByClassName('more');
    // print('UserLink ${userLink[0].attributes['href']}');
    return Column(children: <Widget>[
      /*  Divider(
            thickness: 2.0,
            // height: 2.0,
            color: Colors.white,
          ),

         */
      // Card(
      //  elevation: 1,
      // child:
      ListTile(
        isThreeLine: false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        leading:
            /*
              Container(
                width: 72,
                height: 72,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: CircleAvatar(
                        // radius: 100,
                        minRadius: 80,
                        maxRadius: 80,
                        // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                        backgroundImage:     NetworkImage(jsonDecode(this.model!)['avatar']),
                      ),
                    ),

                  ],
                ),
              ),

               */
            //userLink[0].attributes['href']
            GestureDetector(
          onTap: () {
            AppProvider.getRouter(context)!.navigateTo(
                context, urlToRoute(userLink[0].attributes['href']!));
          },
          child: Container(
            width: 58,
            height: 70,
            decoration: ShapeDecoration(
              shadows: [
                const BoxShadow(color: Colors.grey, offset: Offset(0.6, 0.6)),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(width: 1, color: Colors.white),
              ),
              image: DecorationImage(
                image: NetworkImage(jsonDecode(model!)['avatar']),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HtmlWidget(
                getHtml(jsonDecode(model!)['message']),
                // shrinkWrap: true,
                //bodyPadding: EdgeInsets.all(0),
                //  textStyle: TextStyle(fontSize: 11),
                customStylesBuilder: (element) {
                  if (element.classes.contains('more')) {
                    return {'color': 'red'};
                  }

                  return null;
                },
                //hyperlinkColor: Colors.red,
                /* style: {
                        "html": Style(
                          fontSize: FontSize.small,
                          // padding: getHtml(this.model!).indexOf('>page<') == -1 ? EdgeInsets.only(top: 0 , left: 0.0) : EdgeInsets.only(top: 0, left: 0.0) ,
                        ),

                      },

                      */
                onTapUrl: (url) async {
                  if (url.contains('projects.co.id')) {
                    if (url.contains(RegExp(r'[0-9]'))) {
                      if (url.contains('show_conversation')) {
                        AppProvider.getRouter(context)!
                            .navigateTo(context, urlToRoute(url + '/'));
                      } else {
                        if (url.contains('browse_projects')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PublicBrowseProjectsActView(
                                        id: urlToRoute(url).split('/')[4],
                                        title:
                                            urlToRoute(url).split('/')[5],
                                        cb: cb)),
                          );
                        } else if (url.contains('browse_services')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PublicBrowseServicesView(
                                    id: urlToRoute(url).split('/')[4],
                                    title: urlToRoute(url).split('/')[5],
                                    cb: cb)),
                          );
                        } else if (url.contains('browse_products')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PublicBrowseProductsView(
                                    id: urlToRoute(url).split('/')[4],
                                    title: urlToRoute(url).split('/')[5],
                                    cb: cb)),
                          );
                        } else if (url.contains('browse_users')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PublicBrowseUsersView(
                                    id: urlToRoute(url).split('/')[4],
                                    title: urlToRoute(url).split('/')[5],
                                    cb: cb)),
                          );
                        } else {
                          AppProvider.getRouter(context)!
                              .navigateTo(context, urlToRoute(url))
                              .catchError((onError) {
                            AppProvider.getRouter(context)!.pop(context);
                          });
                        }
                        /*
                              AppProvider.getRouter(context)! .navigateTo(
                                  context,
                                  urlToRoute(url )).catchError((onError){

                                AppProvider.getRouter(context)! .pop(context);
                              });

                               */

                      }
                    } else {
                      AppProvider.getRouter(context)!
                          .navigateTo(context, urlToRoute(url + '/'));
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(
                  '${jsonDecode(model!)['date']} WIB',
                  style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ),
            ]),

        /*
              subtitle:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[


                    Padding(
                      padding: EdgeInsets.only(left : 0),
                      child:  Text(jsonDecode(this.model!)['date'], style: TextStyle(fontSize: 11),),

                    ),
                  ]
              ),

              */
        /*
            Text(
              '${widget._jsonMessage['display']}',
              maxLines: 2,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),

                 */
      ),
      const Divider(
        thickness: 1.0,
        // height: 2.0,
        color: Colors.white,
      ),
      // );
    ]);
  }
}

class TestimonialItem extends StatelessWidget {
  final TestimonialItemModel? model;
  final bool? isDark;

  TestimonialItem({this.model, this.isDark});

  @override
  Widget build(BuildContext context) {
   // var dateformat = DateFormat('dd/MM/yyyy');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                AppProvider.getRouter(context)!
                    .navigateTo(context, urlToRoute(model!.project_url!));
              },
              child: Container(
                height: 375.0,
                width: 200.0,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                      width: 110.0,
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                            bottom: 0.0,
                            left: 20.0,
                            right: 0.0,
                            // In order to have the ink splash appear above the image, you
                            // must use Ink.image!. This allows the image to be painted as part
                            // of the Material and display ink effects above it. Using a
                            // standard Image will obscure the ink splash.
                            child: ShowAvatar(avatar: model!.avatar!)),
                      ]),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
                      child: //Html(data:readText(model!.user_name!, 35),defaultTextStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500 ))
                          InkWell(
                        onTap: () {
                          AppProvider.getRouter(context)!.navigateTo(
                              context, urlToRoute(model!.user_url!));
                        },
                        child: Text(model!.user_name!,
                            softWrap: false,
                            style: const TextStyle(
                              fontSize: 12.0,
                              //color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              //fontFamily: "Sans"
                            )),
                      ),
                    ),

                    /*
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 5.0,right: 0.0),
                      child: Text(model!.points,
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans")),
                    ),
                    */
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 3.0, right: 3.0),
                      child: InkWell(
                        onTap: () {
                          AppProvider.getRouter(context)!.navigateTo(
                              context, urlToRoute(model!.project_url!));
                        },
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.work,
                              size: 11.0,
                            ),
                            Text(
                              ' ' +
                                  readText(
                                      ReCase(model!.project_title!).titleCase,
                                      25),
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Sans",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 3.0, left: 20.0, right: 10.0),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.calendar_today,
                            size: 11.0,
                          ),
                          Text(
                            ' ' + model!.date!,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, left: 10.0, right: 5.0),
                        child: Bubble(
                          margin: const BubbleEdges.only(top: 5),
                          nip: BubbleNip.rightTop,
                          color: isDark! ? Colors.black38 : Colors.white,
                          child: HtmlWidget(
                            readText(model!.content!, 135),
                            textStyle: TextStyle(
                              color: isDark! ? Colors.white : Colors.black38,
                            ),
                          ),
                        )
                        /*  Text( model!.content!,
                           // softWrap: true,
                            overflow: TextOverflow.clip,
                            maxLines: 8,
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Sans",
                                color: Colors.black54),
                          ), */

                        ),
                    /*
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 0.0,right: 10.0),
                      child: Container(
                        height: 5.0,
                        width: model!.seller.length.toDouble()*5,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFA500),
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    )

                     */
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class TipsItem extends StatelessWidget {
  final TipItemModel? model;

  TipsItem({this.model});

  DateTime convertDate(String dt) {
    String temp = dt.replaceAll(' WIB', '');
    var arr = temp.split(" ");
    var arr1 = arr[0].split("/");
    String temp1 = arr1[2] + '-' + arr1[1] + '-' + arr1[0];
    String temp2 = temp1 + ' ' + arr[1];
    return DateTime.parse(temp2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const Divider(
        thickness: 2.0,
        // height: 2.0,
        color: Colors.white,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(getImageLink(this.model!)),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 20.0, right: 12.0),
            child: ShowAvatar(avatar: model!.thumbnail, ishuge: false),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          AppProvider.getRouter(context)!
                              .navigateTo(context, urlToRoute(model!.url!));
                        },
                        child: Text(
                          readText(ReCase(model!.title!).titleCase, 25),
                          style: const TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                      const Text(
                        ' . ',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Text(
                        timeago.format(convertDate(model!.date!),
                            locale: 'en_short'),
                        style: const TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    height: 90,
                    width: 250,
                    child: Html(data: readText(model!.description!, 300)),
                  )
                ],
              ))
        ],
      ),
    ]);
  }
}

class TipsFixItem extends StatelessWidget {
  final TipItemModel? model;
  TipsFixItem({this.model});
  DateTime convertDate(String dt) {
    String temp = dt.replaceAll(' WIB', '');
    var arr = temp.split(" ");
    var arr1 = arr[0].split("/");
    String temp1 = arr1[2] + '-' + arr1[1] + '-' + arr1[0];
    String temp2 = temp1 + ' ' + arr[1];
    return DateTime.parse(temp2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const Divider(
        thickness: 2.0,
        // height: 2.0,
        color: Colors.white,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(getImageLink(this.model!)),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20.0, right: 12.0),
            child: ShowBoxAvatar(avatar: model!.thumbnail, ishuge: false),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            AppProvider.getRouter(context)!
                                .navigateTo(context, urlToRoute(model!.url!));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              height: 38,
                              width: 240,
                              child: Text(
                                model!.title!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          )),
                      /*

                          Text(
                            ' . ',
                            style: TextStyle( fontSize: 13),
                          ),

                          Text(timeago.format(convertDate(model!.date!),  locale: 'en_short')
                            ,
                            style: TextStyle(fontSize: 13),
                          ),

                           */
                    ],
                  ),
                  Container(
                    height: 63,
                    width: 250,
                    child: Html(
                      data: readText(model!.description!, 85),
                      style: {
                        "html": Style(
                          fontSize: const FontSize(16),
                        ),
                      },
                    ),
                  )
                ],
              ))
        ],
      ),
    ]);
  }
}

class SuksesItem extends StatelessWidget {
  final SuccessItemModel? model;
  final bool? isDark;
  SuksesItem({this.model, this.isDark});
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {
                AppProvider.getRouter(context)!
                    .navigateTo(context, urlToRoute(model!.url!));
              },
              child: Container(
                height: 424.0,
                width: mediaQueryData.size.width - 20.0,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 3.0, right: 3.0),
                      child: InkWell(
                        onTap: () {
                          AppProvider.getRouter(context)!
                              .navigateTo(context, urlToRoute(model!.url!));
                        },
                        child: HtmlWidget(
                          model!.title!,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160.0,
                      width: 150.0,
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            // In order to have the ink splash appear above the image, you
                            // must use Ink.image!. This allows the image to be painted as part
                            // of the Material and display ink effects above it. Using a
                            // standard Image will obscure the ink splash.
                            child: Container(
                              width: 150,
                              height: 160,
                              decoration: ShapeDecoration(
                                shadows: [
                                  const BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(1.0, 1.0)),
                                ],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  side:
                                      const BorderSide(width: 3, color: Colors.white),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(model!.image!),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        /*


                             */

                        Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Container(
                                width: mediaQueryData.size.width - 50.0,
                                child: Bubble(
                                  margin: const BubbleEdges.only(top: 5),
                                  //nip: BubbleNip.no,
                                  alignment: Alignment.center,
                                  nip: BubbleNip.no,
                                  color:
                                      isDark! ? Colors.black45 : Colors.white,
                                  child: Html(
                                    data: '" ' + model!.description! + ' "',
                                    style: {
                                      "html": Style(
                                        color: isDark!
                                            ? Colors.white
                                            : Colors.black45,
                                      ),
                                    },
                                  ),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class TestimonialItem1 extends StatelessWidget {
  final TestimonialItemModel? model;
  final bool? isDark;
  final int? index;
  TestimonialItem1({this.model, this.isDark, this.index});
  List<Widget> dots = [];
  double sizeDot = 8.0;
  Color colorDot = const Color(0x80000000);
  Color colorActiveDot = const Color(0xffffffff);

  List<Widget> renderListDots() {
    dots.clear();
    for (int i = 0; i < 4; i++) {
      Color currentColor;
      if (index! - 1 == i) {
        currentColor = colorActiveDot;
      } else {
        currentColor = colorDot;
      }
      dots.add(renderDot(sizeDot, currentColor));
    }
    return dots;
  }

  Widget renderDot(double radius, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius / 2)),
      width: radius,
      height: radius,
      margin: EdgeInsets.all(radius / 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {
                AppProvider.getRouter(context)!
                    .navigateTo(context, urlToRoute(model!.project_url!));
              },
              child: Container(
                  height: 340.0,
                  width: mediaQueryData.size.width,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Column(children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('❝	',
                                  style: TextStyle(
                                      fontSize: 55,
                                      color: Colors.grey[300],
                                      fontWeight: FontWeight.w300)),
                            ]),
                        model!.content!.length < 60
                            ? Container()
                            : model!.content!.length < 100
                                ? Container(height: 10)
                                : Container(height: 40),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('❞',
                                  style: TextStyle(
                                      fontSize: 55,
                                      color: Colors.grey[300],
                                      fontWeight: FontWeight.w300)),
                            ]),
                      ]),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /*


                             */

                          Padding(
                              padding: model!.content!.length > 150
                                  ? const EdgeInsets.only(top: 20.0)
                                  : const EdgeInsets.only(top: 25.0),
                              child: Center(
                                // width: mediaQueryData.size.width - 50.0 ,
                                child: Html(
                                  data: readText(
                                      model!.content!
                                          .replaceAll('<p></p>', '')
                                          .replaceAll('<div></div>', ''),
                                      250),
                                  style: {
                                    "html": Style(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        textAlign: TextAlign.center,
                                        color: isDark!
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: model!.content!.length > 150
                                            ? model!.content!.length > 200
                                                ? const FontSize(12.0)
                                                : const FontSize(17.0)
                                            : const FontSize(18.0),
                                        fontWeight: FontWeight.w100,
                                        fontStyle: FontStyle.italic),
                                  },
                                ),
                              )),
                        ],
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: model!.content!.length < 100
                                      ? const EdgeInsets.only(
                                          left: 20.0, top: 60.0, right: 3.0)
                                      : const EdgeInsets.only(
                                          left: 20.0, top: 50.0, right: 3.0),
                                  child: SizedBox(
                                    height: 60.0,
                                    width: 60.0,
                                    child: Stack(children: <Widget>[
                                      Positioned.fill(
                                          bottom: 0.0,
                                          left: 0.0,
                                          right: 0.0,
                                          // In order to have the ink splash appear above the image, you
                                          // must use Ink.image!. This allows the image to be painted as part
                                          // of the Material and display ink effects above it. Using a
                                          // standard Image will obscure the ink splash.
                                          child: GestureDetector(
                                              onTap: () {
                                                AppProvider.getRouter(context)!
                                                    .navigateTo(
                                                        context,
                                                        urlToRoute(
                                                            model!.user_url!));
                                              },
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: ShapeDecoration(
                                                  shadows: [
                                                    const BoxShadow(
                                                        color: Colors.grey,
                                                        offset:
                                                            Offset(1.0, 1.0)),
                                                  ],
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    side: const BorderSide(
                                                        width: 2,
                                                        color: Colors.black),
                                                  ),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        model!.avatar!),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ))),
                                    ]),
                                  ),
                                ),
                                Center(
                                  child: InkWell(
                                      onTap: () {
                                        AppProvider.getRouter(context)!
                                            .navigateTo(context,
                                                urlToRoute(model!.user_url!));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            top: 5,
                                            right: 5.0,
                                            bottom: 3),
                                        child: Text(
                                          model!.user_name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )),
                                ),
                                Center(
                                  child: InkWell(
                                      onTap: () {
                                        AppProvider.getRouter(context)!
                                            .navigateTo(
                                                context,
                                                urlToRoute(
                                                    model!.project_url!));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, bottom: 20),
                                        child: Text(
                                          model!.project_title!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: renderListDots(),
                                )
                              ])
                          /*
                           Text( '0${this.index.toString()}  ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¢  04' ,
                             style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500 ),
                           ),

                                */

                          ),
                    ],
                  )),
            )
          ],
        )
      ],
    );
  }
}

class BlogsItem extends StatelessWidget {
  final BlogItemModel? model;
  BlogsItem({this.model});
  DateTime convertDate(String dt) {
    String temp = dt.replaceAll(' WIB', '');
    var arr = temp.split(" ");
    var arr1 = arr[0].split("/");
    String temp1 = arr1[2] + '-' + arr1[1] + '-' + arr1[0];
    String temp2 = temp1 + ' ' + arr[1];
    return DateTime.parse(temp2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const Divider(
        thickness: 2.0,
        // height: 2.0,
        color: Colors.white,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(getImageLink(this.model!)),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20.0, right: 12.0),
            child: ShowAvatar(avatar: model!.tumbnail, ishuge: false),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          AppProvider.getRouter(context)!
                              .navigateTo(context, urlToRoute(model!.url!));
                        },
                        child: Text(
                          readText(model!.title!, 30),
                          style: const TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                      const Text(
                        ' . ',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Text(
                        timeago.format(convertDate(model!.date!),
                            locale: 'en_short'),
                        style: const TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    height: 63,
                    width: 250,
                    child: Html(data: readText(model!.description!, 85)),
                  )
                ],
              ))
        ],
      ),
    ]);
  }
}

class BlogsFixItem extends StatelessWidget {
  final BlogItemModel? model;
  BlogsFixItem({this.model});
  DateTime convertDate(String dt) {
    String temp = dt.replaceAll(' WIB', '');
    var arr = temp.split(" ");
    var arr1 = arr[0].split("/");
    String temp1 = arr1[2] + '-' + arr1[1] + '-' + arr1[0];
    String temp2 = temp1 + ' ' + arr[1];
    return DateTime.parse(temp2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const Divider(
        thickness: 2.0,
        //  height: 2.0,
        color: Colors.white,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(getImageLink(this.model!)),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20.0, right: 12.0),
            child: ShowBoxAvatar(avatar: model!.tumbnail, ishuge: false),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            AppProvider.getRouter(context)!
                                .navigateTo(context, urlToRoute(model!.url!));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              height: 38,
                              width: 240,
                              child: Text(
                                model!.title!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          )),
                      /*

                          Text(
                            ' . ',
                            style: TextStyle(fontSize: 13),
                          ),

                          Text(timeago.format(convertDate(model!.date!),  locale: 'en_short')
                            ,
                            style: TextStyle( fontSize: 13),
                          ),

                           */
                    ],
                  ),
                  Container(
                    height: 63,
                    width: 250,
                    child:
                        Html(data: readText(model!.description!, 85), style: {
                      "html": Style(
                        fontSize: const FontSize(16),
                        //              color: Colors.white,
                      ),
                    }),
                  )
                ],
              ))
        ],
      ),
    ]);
  }
}

////////////////////////////

//notification

////////////////////////////

class notification extends StatefulWidget {
  final String? title;
  ValueChanged<bool?>? scrollUp;
  ValueChanged<bool?>? zeroNotif;
  ChatBloc? notif;
  int? user;
  String? username;
  String? forlgn;
  BuildContext? ctx;
  notification(
      {Key? key,
      this.title,
      this.scrollUp,
      this.zeroNotif,
      this.ctx,
      this.notif,
      this.user,
      this.username,
      this.forlgn})
      : super(key: key);
  @override
  notificationState createState() => notificationState();
}

class notificationState extends State<notification> with RestorationMixin {
  String getPathServices = Env.value!.baseUrl! + '/user/home?page=%d';
  // String getPathTest = 'https://projects.co.id/public/test/json?page=%d';
  ScrollController? scrollController;
  ShapeBorder? shape;

  final _scrollThreshold = 200.0;
  HomeController? _homeController;
  double lastScroll = 0;
  void scrollup(bool? su) {
    widget.scrollUp!(su!);
  }

  void zeroNT(bool? zn) {
    widget.zeroNotif!(zn!);
  }

  //notificationState(){

  // }

  @override
  initState() {
    super.initState();
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'notification';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'notification');
  }

  Future<void> _onRefresh() {
    Completer<void> completer = Completer<void>();

    _homeController!.listing!.add(HomeListingRefresh());
    Timer timer = Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    cs.value = currentScroll;
    if (lastScroll > currentScroll) {
      scrollup(false);
    } else {
      scrollup(true);
    }
    lastScroll = currentScroll;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _homeController!.listing!.add(HomeList());
    }
  }

  @override
  Widget build(BuildContext context) {
    _homeController = HomeController(AppProvider.getApplication(context),
        getPathServices, AppAction.listing, '', '', '', false);
    _homeController!.listing!.add(HomeList());
    scrollController = ScrollController();
    scrollController!.addListener(_onScroll);

    // return(Text('haloooo'));
/*
    return BlocBuilder<HomeListing, HomeState>(
      bloc: _homeController!.listing,
      //  cubit: _homeController!.listing,
      builder: ( BuildContext context,
          HomeState state,) {
        if (state is HomeListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return    Center(
              child:CircularProgressIndicator(
                valueColor:    AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
        if (state is HomeListingError) {


          if(widget.user == 0){
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Text('Silahkan Login terlebih dahulu.'),// Text('failed to ' + widget.title!),
                      GestureDetector(
                        onTap:(){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login(application: context,isLogin: true,)),
                                (Route<dynamic> route) => true,
                          );
                        },
                        child: Text('Login', style: TextStyle(color: Colors.blue)),
                      ),
                    ]
                )

            );
          }else{

            getApplicationDocumentsDirectory().then((value){
              APIProvider projectsAPIProvider = APIProvider(value!.path);
              final future = projectsAPIProvider.getData(
                  Env.value!.baseUrl!+ '/user/program/ping');
              future.then((value) {

                try {
                  jsonDecode(value);

                  final ftr =  projectsAPIProvider.userLogin(widget.username!,widget.forlgn!  );
                  ftr.then((value) {

                    try {
                      var js = jsonDecode(value);


                      _homeController!.listing!.add(HomeList());
                    } catch (e) {


                    }


                  });
                } catch (e) {
                  final ftr =  projectsAPIProvider.userLogin(widget.username!,widget.forlgn!  );
                  ftr.then((value) {

                    try {
                      jsonDecode(value);


                      _homeController!.listing!.add(HomeList());
                    } catch (e) {


                    }


                  });

                }


              });



            });

          }

          return    Center(
              child:CircularProgressIndicator(
                valueColor:    AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));

        }
        if (state is HomeListingLoaded) {
          if (state.home!.items.items.isEmpty) {
            return Center(
              child: Text('no ' + widget.title!),
            );
          }

          return
            Container(
              /*decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              // Color(0xFFDB84B1),
                              Color(0xFFffc046),
                              Color(0xFF004f04)
                            ],
                          ),
                        ),

                         */
                child:
                RefreshIndicator(
                  child:    ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return index! >= state.home!.items.items.length
                          ? ProjectsBottomLoader()
                      //    : TravelDestinationItem(destination: state.home[index], shape: shape);
                      //   : HomeWidget(home: state.home!.items.items[index]);
                          :state.home!.viewItem2 (state.home!.items.items[index] , state.home!.items.items[index] , '' ,context, true, widget.title!,  state.hasReachedMax!, state.home!.items.items.length, index, widget.notif!, _homeController!, zeroNT);
                      //    :state.home!.viewItem (state.home!.items.items[index] ,'' );
                    },
                    itemCount: state.hasReachedMax!
                        ? state.home!.items.items.length
                        : state.home!.items.items.length + 1,
                    controller: scrollController,
                  ),
                  onRefresh: _onRefresh,
                )
            );
        }
        return    Center(
            child:CircularProgressIndicator(
              valueColor:    AlwaysStoppedAnimation<Color>(
                  Colors.green),
            ));
      },
    );

 */

    return StreamBuilder(
        //
        stream: widget.notif!.onMessage,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData &&
              (jsonDecode(snapshot.data)['type'] == 'notify')) {
            _homeController!.listing!.add(HomeList());
            return BlocBuilder<HomeListing, HomeState>(
              bloc: _homeController!.listing,
              builder: (context, state) {
                if (state is HomeListingUninitialized) {
                  // return Center(
                  //   child: CircularProgressIndicator(),
                  // );
                  return const Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ));
                }
                if (state is HomeListingError) {
                  if (widget.user == 0) {
                    return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          const Text(
                              'Silahkan Login terlebih dahulu.'), // Text('failed to ' + widget.title!),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login(
                                          application: context,
                                          isLogin: true,
                                        )),
                                (Route<dynamic> route) => true,
                              );
                            },
                            child: const Text('Login',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ]));
                  } else {
                    getApplicationDocumentsDirectory().then((value) {
                      APIProvider projectsAPIProvider =
                          APIProvider(value.path);
                      final future = projectsAPIProvider
                          .getData(Env.value!.baseUrl! + '/user/program/ping');
                      future.then((value) {
                        try {
                          jsonDecode(value);

                          final ftr = projectsAPIProvider.userLogin(
                              widget.username!, widget.forlgn!);
                          ftr.then((value) {
                            try {
                              var js = jsonDecode(value);

                              _homeController!.listing!.add(HomeList());
                            } catch (e) {}
                          });
                        } catch (e) {
                          final ftr = projectsAPIProvider.userLogin(
                              widget.username!, widget.forlgn!);
                          ftr.then((value) {
                            try {
                              jsonDecode(value);

                              _homeController!.listing!.add(HomeList());
                            } catch (e) {}
                          });
                        }
                      });
                    });
                  }

                  return const Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ));
                }
                if (state is HomeListingLoaded) {
                  if (state.home!.items.items.isEmpty) {
                    return Center(
                      child: Text('no ' + widget.title!),
                    );
                  }

                  return RefreshIndicator(
                    child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index>= state.home!.items.items.length
                        ? ProjectsBottomLoader()
                        //    : TravelDestinationItem(destination: state.home[index], shape: shape);
                        //   : HomeWidget(home: state.home!.items.items[index]);
                        : state.home!.viewItem2(
                            state.home!.items.items[index],
                            state.home!.items.items[index],
                            '',
                            context,
                            true,
                            widget.title!,
                            state.hasReachedMax!,
                            state.home!.items.items.length,
                            index,
                            widget.notif!,
                            _homeController!,
                            zeroNT);
                    //    :state.home!.viewItem (state.home!.items.items[index] ,'' );
                  },
                  itemCount: state.hasReachedMax!
                      ? state.home!.items.items.length
                      : state.home!.items.items.length + 1,
                  controller: scrollController,
                    ),
                    onRefresh: _onRefresh,
                  );
                }
                return const Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ));
              },
            );
          } else {
            return BlocBuilder<HomeListing, HomeState>(
              bloc: _homeController!.listing,
              // cubit: _homeController!.listing,
              builder: (BuildContext context, HomeState state) {
                if (state is HomeListingUninitialized) {
                  // return Center(
                  //   child: CircularProgressIndicator(),
                  // );
                  return const Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ));
                }
                if (state is HomeListingError) {
                  if (widget.user == 0) {
                    return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          const Text(
                              'Silahkan Login terlebih dahulu.'), // Text('failed to ' + widget.title!),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login(
                                          application: context,
                                          isLogin: true,
                                        )),
                                (Route<dynamic> route) => true,
                              );
                            },
                            child: const Text('Login',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ]));
                  } else {}
                }
                if (state is HomeListingLoaded) {
                  if (state.home!.items.items.isEmpty) {
                    return Center(
                      child: Text('no ' + widget.title!),
                    );
                  }
                  return Container(
                      /*
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              // Color(0xFFDB84B1),
                              Color(0xFFffc046),
                              Color(0xFF004f04)
                            ],
                          ),
                        ),

                       */
                      child: RefreshIndicator(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return index>= state.home!.items.items.length
                            ? ProjectsBottomLoader()
                            //    : TravelDestinationItem(destination: state.home[index], shape: shape);
                            //   : HomeWidget(home: state.home!.items.items[index]);
                            : index == 0
                                ? state.home!.viewItem2(
                                    state.home!.items.items[index],
                                    state.home!.items.items[index],
                                    '',
                                    context,
                                    true,
                                    widget.title!,
                                    state.hasReachedMax!,
                                    state.home!.items.items.length,
                                    index,
                                    widget.notif!,
                                    _homeController!,
                                    zeroNT)
                                : state.home!.viewItem2(
                                    state.home!.items.items[index],
                                    state.home!.items.items[index - 1],
                                    '',
                                    context,
                                    true,
                                    widget.title!,
                                    state.hasReachedMax!,
                                    state.home!.items.items.length,
                                    index,
                                    widget.notif!,
                                    _homeController!,
                                    zeroNT);

                        //    :state.home!.viewItem (state.home!.items.items[index] ,'' );
                      },
                      itemCount: state.hasReachedMax!
                          ? state.home!.items.items.length
                          : state.home!.items.items.length + 1,
                      controller: scrollController,
                    ),
                    onRefresh: _onRefresh,
                  ));
                }
                return const Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ));
              },
            );
          }
        });
  }

  @override
  void dispose() {
    _homeController!.listing!.dispose();
    super.dispose();
  }
}

////////////////////////////

class projectsView extends StatefulWidget {
  final String? title;
  ValueChanged<bool?>? scrollUp;
  bool? account;
  projectsView({Key? key, this.title, this.scrollUp, this.account})
      : super(key: key);
  @override
  projectsViewState createState() => projectsViewState();
}

class projectsViewState extends State<projectsView> {
  final bool _dialVisible = true;
  String getPathProjects =
      Env.value!.baseUrl! + '/public/browse_projects/listing?page=%d';
  ScrollController? scrollController;
  ShapeBorder? shape;
  String searchText = '';
  double lastScroll = 0;
  final _scrollThreshold = 200.0;
  BrowseProjectsController? _browseProjectsController;

  void scrollup(bool? su) {
    widget.scrollUp!(su!);
  }

  projectsViewState() {}

  Future<void> _onRefresh() {
    Completer<void> completer = Completer<void>();

    _browseProjectsController!.listing!.add(BrowseProjectsListingRefresh());

    return completer.future;

    /* Timer timer =    Timer(   Duration(seconds: 3), () {
      completer.complete();
    }); */
  }

  void _onScroll() {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    if (lastScroll > currentScroll) {
      scrollup(false);
    } else {
      scrollup(true);
    }
    lastScroll = currentScroll;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _browseProjectsController!.listing!.add(BrowseProjectsList());
    }
  }

  @override
  Widget build(BuildContext context) {
    _browseProjectsController = BrowseProjectsController(
        AppProvider.getApplication(context),
        getPathProjects,
        AppAction.listing,
        '',
        '',
        '',
        false);
    _browseProjectsController!.listing!.add(BrowseProjectsList());
    scrollController = ScrollController();
    scrollController!.addListener(_onScroll);

    return BlocBuilder<BrowseProjectsListing, BrowseProjectsState>(
      // cubit: _browseProjectsController.listing,
      builder: (BuildContext context, BrowseProjectsState state) {
        if (state is BrowseProjectsListingUninitialized) {
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is BrowseProjectsListingError) {
          return Center(
            child: Text('failed to ' + widget.title!),
          );
        }
        if (state is BrowseProjectsListingLoaded) {
          if (state.browse_projects!.items.items.isEmpty) {
            return Center(
              child: Text('no ' + widget.title!),
            );
          }

          return Scaffold(
              body: RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index>= state.browse_projects!.items.items.length
                        ? ProjectsBottomLoader()
                        : state.browse_projects!.viewItemIndex(
                            state.browse_projects!.items.items[index],
                            searchText,
                            index,
                            widget.account);
                    //    : BrowseProjectsFrontCard(destination: state.browse_projects!.items.items[index], shape: shape);
                    //  : ProjectsWidget(project: state.browse_projects[0].items.items[index]);
                  },
                  itemCount: state.hasReachedMax!
                      ? state.browse_projects!.items.items.length
                      : state.browse_projects!.items.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),
              floatingActionButton: state.browse_projects!
                  .Buttons(context, _dialVisible, widget.account!));
        }
        return const Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  @override
  void dispose() {
    _browseProjectsController!.listing!.dispose();
    super.dispose();
  }
}

class servicesView extends StatefulWidget {
  final String? title;
  ValueChanged<bool?>? scrollUp;
  bool? account;
  servicesView({Key? key, this.title, this.scrollUp, this.account})
      : super(key: key);
  @override
  servicesViewState createState() => servicesViewState();
}

class servicesViewState extends State<servicesView> {
  String getPathServices =
      Env.value!.baseUrl! + '/public/browse_services/listing?page=%d';
  // String getPathTest = 'https://projects.co.id/public/test/listing?page=%d';
  var scrollController = ScrollController();
  ShapeBorder? shape;
  final bool _dialVisible = true;
  String searchText = '';
  final _scrollThreshold = 200.0;
  BrowseServicesController? _browseServicesController;
  double lastScroll = 0;
  void scrollup(bool? su) {
    widget.scrollUp!(su!);
  }

  servicesViewState() {
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    _browseServicesController = BrowseServicesController(
        AppProvider.getApplication(context),
        getPathServices,
        AppAction.listing,
        '',
        '',
        '',
        false);
    _browseServicesController!.listing!.add(BrowseServicesList());

    return BlocBuilder<BrowseServicesListing, BrowseServicesState>(
      // cubit: _browseServicesController.listing,
      builder: (BuildContext context, BrowseServicesState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseServicesListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is BrowseServicesListingError) {
          return Center(
            child: Text('failed to ' + widget.title!),
          );
        }
        if (state is BrowseServicesListingLoaded) {
          if (state.browse_services!.items.items.isEmpty) {
            return Center(
              child: Text('no ' + widget.title!),
            );
          }
          return Scaffold(
              body: RefreshIndicator(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.hasReachedMax!
                      ? state.browse_services!.items.items.length
                      : state.browse_services!.items.items.length + 1,
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  // padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 10,
                    // crossAxisSpacing: 10,
                    // childAspectRatio: 0.9,
                    childAspectRatio: mediaQueryData.size.width /
                        (mediaQueryData.size.height / 1.9),
                  ),
                  itemBuilder: (context, index) {
                    return index>= state.browse_services!.items.items.length
                        ? ProjectsBottomLoader()
                        : state.browse_services!.viewItem(
                            state.browse_services!.items.items[index],
                            searchText,
                            widget.account);
                  },
                ),
                onRefresh: _onRefresh,
              ),
              floatingActionButton: state.browse_services!
                  .Buttons(context, _dialVisible, widget.account!));
        }
        return const Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  @override
  void dispose() {
    _browseServicesController!.listing!.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    Completer<void> completer = Completer<void>();

    _browseServicesController!.listing!.add(BrowseServicesListingRefresh());

    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (lastScroll > currentScroll) {
      scrollup(false);
    } else {
      scrollup(true);
    }
    lastScroll = currentScroll;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _browseServicesController!.listing!.add(BrowseServicesList());
    }
  }
}

class productsView extends StatefulWidget {
  final String? title;
  ValueChanged<bool?>? scrollUp;
  bool? account;
  productsView({Key? key, this.title, this.scrollUp, this.account})
      : super(key: key);
  @override
  productsViewState createState() => productsViewState();
}

class productsViewState extends State<productsView> {
  String getPathProducts =
      Env.value!.baseUrl! + '/public/browse_products/listing?page=%d';
  // String getPathTest = 'https://projects.co.id/public/test/listing?page=%d';
  var scrollController = ScrollController();
  ShapeBorder? shape;
  String searchText = '';
  final bool _dialVisible = true;
  final _scrollThreshold = 200.0;
  BrowseProductsController? _browseProductsController;
  double lastScroll = 0;
  void scrollup(bool? su) {
    widget.scrollUp!(su!);
  }

  productsViewState() {
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    _browseProductsController = BrowseProductsController(
        AppProvider.getApplication(context),
        getPathProducts,
        AppAction.listing,
        '',
        '',
        '',
        false);
    _browseProductsController!.listing!.add(BrowseProductsList());
    // final mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<BrowseProductsListing, BrowseProductsState>(
      // cubit: _browseProductsController.listing,
      builder: (BuildContext context, BrowseProductsState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseProductsListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is BrowseProductsListingError) {
          return Center(
            child: Text('failed to ' + widget.title!),
          );
        }
        if (state is BrowseProductsListingLoaded) {
          if (state.browse_products!.items.items.isEmpty) {
            return Center(
              child: Text('no ' + widget.title!),
            );
          }
          return Scaffold(
              //  backgroundColor: CurrentTheme.HomeColor,
              body: RefreshIndicator(
                child:

                    /*     ListView.builder(

                        itemBuilder: (BuildContext context, int index) {
                          return index! >= state.browse_products!.items.items.length
                              ? ProjectsBottomLoader()
                              :state.browse_products!.viewItem (state.browse_products!.items.items[index] , searchText );
                        },
                        itemCount: state.hasReachedMax!
                            ? state.browse_products!.items.items.length
                            : state.browse_products!.items.items.length + 1,
                        controller: scrollController,
                      ), */

                    GridView.builder(
                  // shrinkWrap: true,

                  itemCount: state.hasReachedMax!
                      ? state.browse_products!.items.items.length
                      : state.browse_products!.items.items.length + 1,
                  controller: scrollController,
                  // physics: BouncingScrollPhysics(),
                  // padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //  mainAxisSpacing: 1,
                    // crossAxisSpacing: 1,
                    childAspectRatio: mediaQueryData.size.width /
                        (mediaQueryData.size.height / 1.9),
                  ),
                  itemBuilder: (context, index) {
                    return index>= state.browse_products!.items.items.length
                        ? ProjectsBottomLoader()
                        : state.browse_products!.viewItem(
                            state.browse_products!.items.items[index],
                            searchText,
                            widget.account);
                  },
                ),
                onRefresh: _onRefresh,
              ),
              floatingActionButton: state.browse_products!
                  .Buttons(context, _dialVisible, widget.account!));
        }
        return const Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  @override
  void dispose() {
    _browseProductsController!.listing!.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    Completer<void> completer = Completer<void>();

    _browseProductsController!.listing!.add(BrowseProductsListingRefresh());

    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (lastScroll > currentScroll) {
      scrollup(false);
    } else {
      scrollup(true);
    }
    lastScroll = currentScroll;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _browseProductsController!.listing!.add(BrowseProductsList());
    }
  }
}

class CartView extends StatefulWidget {
  final String? title;
  ValueChanged<bool?>? scrollUp;
  bool? account;
  int? user;
  String? username;
  String? forlgn;
  CartView(
      {Key? key,
      this.title,
      this.scrollUp,
      this.account,
      this.user,
      this.username,
      this.forlgn})
      : super(key: key);
  @override
  CartViewState createState() => CartViewState();
}

class CartViewState extends State<CartView> with RestorationMixin {
  String getPath = Env.value!.baseUrl! + '/user/cart/view/%s/%s';
  var scrollController = ScrollController();
  // CartController cart;
  // final formKey = GlobalKey<FormState>();
  // ScrollController controller;
  var isLoading = true;
  String idHash = '';

  // var viewCart;
  var model;
  late BehaviorSubject<dynamic> _cartController;
  // final _cartController = BehaviorSubject();
  // var viewCart;
  Stream<dynamic> get onMessage => _cartController.stream;

  double lastScroll = 0;
  void scrollup(bool? su) {
    widget.scrollUp!(su!);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'CartView';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'CartView');
  }

  @override
  initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    _cartController = BehaviorSubject<dynamic>.seeded([]);
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  fetchData(CartController cart, BuildContext context) async {
    if (widget.user == 0) {
      idHash = '';
      setState(() {
        isLoading = false;
      });
    } else {
      if (model == null) {
        final hash = cart.getHash();
        hash.then((value) {
          //  setState(() {
          // this.idHash = value;
          //  });
          //print('value  =====   $value');
          idHash = value;
          if (value != null) {
            final future = cart.viewCart();
            future.then((value1) {
              model = value1;
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
              //  setState(() {

              //  });
            });
          } else {
            if (mounted) {
              setState(() {
                //  this.idHash = null;
              });
            }
          }
        }).catchError((Error) {
          getApplicationDocumentsDirectory().then((value) {
            APIProvider projectsAPIProvider = APIProvider(value.path);
            final future = projectsAPIProvider
                .getData(Env.value!.baseUrl! + '/user/program/ping');
            future.then((value) {
              try {
                jsonDecode(value);

                projectsAPIProvider.userLogin(widget.username!, widget.forlgn!);
                setState(() {
                  isLoading = false;
                });
              } catch (e) {
                if (value!.length > 0) {
                  projectsAPIProvider.userLogin(
                      widget.username!, widget.forlgn!);
                  // print('saya disini$value v');
                } else {
                  _onWidgetDidBuild(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
                  // print('saya disini cccc');
                }
                setState(() {
                  isLoading = false;
                });
              }
            });
          });
        });
      }
    }
  }

  fetchData1(SubModelController? cart, BuildContext context) async {
    final c = cart!.getData();
    c.then((value) {
      _cartController.add(value);

      //this.idHash = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // bool _hasSubModel = false;
    int modelCount = 0;
    // String getSubPath = '';
    // bool _dialVisible = true;
    TextStyle _statLabelTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      //  color: Colors.black87,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
    TextStyle _totalStyle = const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
    );
    TextStyle _totalSadeStyle = const TextStyle(
      fontFamily: 'Roboto',
      color: CurrentTheme.ShadeColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w900,
    );
    final size = MediaQuery.of(context).size;
    final width = size.width;
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;

    SubModelController? _cart;
    String cartPath = Env.value!.baseUrl! + '/user/cart/view';
    _cart =
        SubModelController(AppProvider.getApplication(context), cartPath, null);

    fetchData1(_cart, context);
    //   print('aku lho');

    return Scaffold(
      body: widget.user == 0
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  const Text(
                      'Silahkan Login terlebih dahulu.'), // Text('failed to ' + widget.title!),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  application: context,
                                  isLogin: true,
                                )),
                        (Route<dynamic> route) => true,
                      );
                    },
                    child: const Text('Login', style: TextStyle(color: Colors.blue)),
                  ),
                ]))
          : StreamBuilder<dynamic>(
              //
              stream: onMessage,
              initialData: [],
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  // return Text('${jsonEncode(snapshot!.data['model'])}');

                  return (SingleChildScrollView(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      reverse: false,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                              child: Html(
                                data: snapshot.data['meta']['title'],
                                style: {
                                  "html": Style(
                                    fontSize: FontSize.medium,
                                  ),
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                              child: Html(
                                data: snapshot.data['meta']['warning']
                                    ['message'],
                                style: {
                                  "html": Style(
                                      fontSize: FontSize.small,
                                      padding: const EdgeInsets.fromLTRB(
                                          10.0, 10.0, 10.0, 2.0),
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      backgroundColor:
                                          CurrentTheme.WarningColor),
                                },
                              ),
                            ),
                            Stack(children: <Widget>[
                              SafeArea(
                                  child: Column(children: <Widget>[
                                Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Row(
                                      children: <Widget>[
                                        /*
          Expanded(
            child: InkWell(
              onTap: (){

              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "VOUCHER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),

           */
                                        // SizedBox(width: 10.0),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                             Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DepositBalanceMyFinance(
                                                            id: snapshot.data[
                                                                    'model']
                                                                ['user_id'],
                                                            title: '')),
                                              ).then((value)async{
                                                 setState(() {

                                                   });
                                             });
                                            },
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text(
                                                    "Deposit Fund",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              AppProvider.getRouter(context)!
                                                  .navigateTo(context,
                                                      "/public/browse_products/listing/12");
                                            },
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                color: const Color(0xFF404A5C),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Continue Shopping",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    height: snapshot.data['model']['cart_items']
                                                ['items']
                                            .length *
                                        240.0,
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data['model']['cart_items']['items']
                                          .length,
                                      itemBuilder: (context, position) {
                                        ///
                                        /// Widget for list view slide delete
                                        ///
                                        ///
                                        ///

                                        SubModelController? inc;
                                        String delPath = Env.value!.baseUrl! +
                                            '/user/cart/cart_items_increase/${snapshot.data['model']['user_id']}/123/${snapshot.data['model']['cart_items']['items'][position]['cart_id'].toString()}/${snapshot.data['model']['cart_items']['items'][position]['total_price'].round().toString()}';
                                        inc = SubModelController(
                                            AppProvider.getApplication(context),
                                            delPath,
                                            null);
                                        SubModelController? dec;
                                        String del1Path = Env.value!.baseUrl! +
                                            '/user/cart/cart_items_decrease/${snapshot.data['model']['user_id']}/123/${snapshot.data['model']['cart_items']['items'][position]['cart_id'].toString()}/${snapshot.data['model']['cart_items']['items'][position]['total_price'].round().toString()}';
                                        dec = SubModelController(
                                            AppProvider.getApplication(context),
                                            del1Path,
                                            null);
                                        SubModelController? del;

                                        String del2Path = Env.value!.baseUrl! +
                                            '/user/cart/cart_items_remove/${snapshot.data['model']['user_id']}/123/${snapshot.data['model']['cart_items']['items'][position]['cart_id'].toString()}/${snapshot.data['model']['cart_items']['items'][position]['total_price'].round().toString()}';
                                        del = SubModelController(
                                            AppProvider.getApplication(context),
                                            del2Path,
                                            null);

                                        return Slidable(
                                          key: Key(snapshot.data['model']
                                                  ['cart_items']['items']
                                                  [position]['id']
                                              .toString()),

                                          // The start action pane is the one at the left or the top side.
                                          startActionPane: ActionPane(
                                            // A motion is a widget used to control how the pane animates.
                                            motion: const ScrollMotion(),

                                            // A pane can dismiss the Slidable.
                                            dismissible: DismissiblePane(
                                                onDismissed: () {}),

                                            // All actions are defined in the children parameter.
                                            children: [
                                              // A SlidableAction can have an icon and/or a label.
                                              SlidableAction(
                                                onPressed: (BuildContext?
                                                    context) async {
                                                  SubModelController? del;
                                                  String delPath = Env
                                                          .value!.baseUrl! +
                                                      '/user/cart/cart_items_remove/${snapshot.data['model']['user_id']}/123/${snapshot.data['model']['cart_items']['items'][position]['cart_id'].toString()}/${snapshot.data['model']['cart_items']['items'][position]['total_price'].round().toString()}';
                                                  del = SubModelController(
                                                      AppProvider
                                                          .getApplication(
                                                              context!),
                                                      delPath,
                                                      null);

                                                  // del.getData();
                                                  // fetchData1(_cart, context);
                                                  final ic = del.getData1();
                                                  ic.then((value) {
                                                    _cartController.add(value);
                                                  });

                                                  /*  state.setState(() {
                                                snapshot!.data['model']['cart_items']['items'].removeAt(position);

                                              }); */

                                                  ///
                                                  /// SnackBar show if cart delete
                                                  ///
                                                  Scaffold.of(context)
                                                      .showSnackBar(const SnackBar(
                                                    content:
                                                        Text('cartDeleted'),
                                                    duration:
                                                        Duration(seconds: 2),
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                  ));
                                                },
                                                backgroundColor:
                                                    const Color(0xFFFE4A49),
                                                foregroundColor: Colors.white,
                                                icon: Icons.delete,
                                                label: 'Delete',
                                              ),
                                            ],
                                          ),
/*
                                                // The end action pane is the one at the right or the bottom side.
                                                actionPane: SlidableDrawerActionPane(),
                                                actionExtentRatio: 0.25,

                                                secondaryActions: <Widget>[
                                                     IconSlideAction(
                                                    key: Key(snapshot!.data['model']['cart_items']['items'][position]['id'].toString()),
                                                    caption: 'Delete',
                                                    color: Colors.red,
                                                    icon: Icons.delete,
                                                    onTap: (){
                                                      SubModelController? del;
                                                      String delPath = Env.value!.baseUrl! + '/user/cart/cart_items_remove/${snapshot!.data['model']['user_id']}/123/${snapshot!.data['model']['cart_items']['items'][position]['cart_id'].toString()}/${snapshot!.data['model']['cart_items']['items'][position]['total_price'].round().toString()}' ;
                                                      del =     SubModelController(AppProvider.getApplication(context),
                                                          delPath,
                                                          null);

                                                     // del.getData();
                                                     // fetchData1(_cart, context);
                                                      final ic = del.getData1();
                                                      ic.then((value) {
                                                        _cartController.add(value);

                                                      });

                                                      /*  state.setState(() {
                                                snapshot!.data['model']['cart_items']['items'].removeAt(position);

                                              }); */

                                                      ///
                                                      /// SnackBar show if cart delete
                                                      ///
                                                      Scaffold.of(context)
                                                          .showSnackBar(SnackBar(content: Text('cartDeleted'),duration: Duration(seconds: 2),backgroundColor: Colors.redAccent,));
                                                    },
                                                  ),
                                                ],
                                                
 */

                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0.0,
                                                left: 0.0,
                                                right: 0.0),

                                            /// Background Constructor for card
                                            child: Container(
                                              height: 300.0,
                                              padding: const EdgeInsets.all(0.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  const Divider(
                                                    height: 1,
                                                    thickness: 1.0,
                                                    color: CurrentTheme
                                                        .DisableTextColor,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 10.0),

                                                          /// Image item
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white
                                                                      .withOpacity(
                                                                          0.1),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .black12
                                                                            .withOpacity(
                                                                                0.1),
                                                                        blurRadius:
                                                                            0.5,
                                                                        spreadRadius:
                                                                            0.1)
                                                                  ]),
                                                              child: snapshot.data['model']['cart_items']['items']
                                                                          [position]
                                                                          ['title']
                                                                      .contains('browse_products')
                                                                  ? const Icon(
                                                                      Icons
                                                                          .cloud_download,
                                                                      size:
                                                                          70.0,
                                                                      color: CurrentTheme
                                                                          .SecondaryAccentColor,
                                                                    )
                                                                  : snapshot.data['model']['cart_items']['items'][position]['title'].contains('browse_services')
                                                                      ? const Icon(
                                                                          Icons
                                                                              .work,
                                                                          size:
                                                                              70.0,
                                                                          color:
                                                                              CurrentTheme.SecondaryAccentColor,
                                                                        )
                                                                      : const Icon(
                                                                          Icons
                                                                              .business_center,
                                                                          size:
                                                                              70.0,
                                                                          color:
                                                                              CurrentTheme.SecondaryAccentColor,
                                                                        )
                                                              /*Image.asset('assets/img/projectscoid.png',
                                                              height: 100.0,
                                                              width: 100.0,
                                                              fit: BoxFit.cover,
                                                            ) */
                                                              )),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 0.0,
                                                                  left: 10.0,
                                                                  right: 5.0),
                                                          child: Column(
                                                            /// Text Information Item
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              // Padding(padding: EdgeInsets.only(top: 10.0)),
                                                              HtmlWidget(
                                                                readText(
                                                                    snapshot.data['model']['cart_items']['items']
                                                                            [
                                                                            position]
                                                                        [
                                                                        'title'],
                                                                    250),
                                                                // bodyPadding: EdgeInsets.only(top: 0.0, left: 0.0,right: 5.0, bottom: 0.0),
                                                                textStyle:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      15.0,
                                                                ),
                                                                onTapUrl:
                                                                    (url) async {
                                                                  if (url.contains(
                                                                      'projects.co.id')) {
                                                                    if (url.contains(
                                                                        RegExp(
                                                                            r'[0-9]'))) {
                                                                      if (url.contains(
                                                                          'show_conversation')) {
                                                                        AppProvider.getRouter(context)!.navigateTo(
                                                                            context,
                                                                            urlToRoute(url +
                                                                                '/'));
                                                                      } else {
                                                                        AppProvider.getRouter(context)!
                                                                            .navigateTo(context,
                                                                                urlToRoute(url))
                                                                            .catchError((onError) {
                                                                          AppProvider.getRouter(context)!
                                                                              .pop(context);
                                                                        });
                                                                      }
                                                                    } else {
                                                                      AppProvider.getRouter(context)!.navigateTo(
                                                                          context,
                                                                          urlToRoute(url +
                                                                              '/listing/'));
                                                                    }
                                                                  } else {
                                                                    if (await canLaunch(
                                                                        url)) {
                                                                      await launch(
                                                                          url);
                                                                    } else {
                                                                      throw 'Could not launch $url';
                                                                    }
                                                                  }
                                                                  throw 'Could not launch ';
                                                                },
                                                              ),
                                                              const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 5.0)),
                                                              Text(
                                                                '${snapshot.data['model']['cart_items']['items'][position]['item_price_str']}',
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  5.0),

                                                          /// Image item
                                                          child: Padding(
                                                              padding: const EdgeInsets
                                                                      .only(
                                                                  top: 0.0,
                                                                  left: 0.0,
                                                                  right: 5.0),
                                                              child: Column(

                                                                  /// Text Information Item
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top: 10.0,
                                                                              left: 0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                80.0,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.black12.withOpacity(0.1))),
                                                                            child:
                                                                                Column(
                                                                              //mainAxisAlignment: MainAxisAlignment
                                                                              //   .spaceAround,
                                                                              children: <Widget>[
                                                                                ButtonBarTheme(
                                                                                  data: const ButtonBarThemeData(alignment: MainAxisAlignment.start, buttonMinWidth: 18, buttonHeight: 18),
                                                                                  child: ButtonBar(alignment: MainAxisAlignment.start, buttonHeight: 18, buttonMinWidth: 18, children: <Widget>[
                                                                                    TextButton(
                                                                                        child: const Text('-'),
                                                                                        style: ButtonStyle(
                                                                                          // textStyle: Colors.white,
                                                                                          foregroundColor: MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                                                                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF037f51)),
                                                                                        ),
                                                                                        onPressed: () {
                                                                                          //print('helooooooooooo');
                                                                                          //dec.getData1();
                                                                                          // fetchData1(_cart, context);

                                                                                          final ic = dec!.getData1();
                                                                                          ic.then((value) {
                                                                                            _cartController.add(value);
                                                                                          });
                                                                                        }),
                                                                                    Padding(
                                                                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                                                        child: Center(
                                                                                          child: Text(
                                                                                            snapshot.data['model']['cart_items']['items'][position]['quantity'].toString(),
                                                                                            style: const TextStyle(fontSize: 11),
                                                                                          ),
                                                                                        )),
                                                                                    TextButton(
                                                                                        child: const Text('+'),
                                                                                        style: ButtonStyle(
                                                                                          // textStyle: Colors.white,
                                                                                          foregroundColor: MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                                                                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF037f51)),
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          //print('helooooooooooo');
                                                                                          final ic = inc!.getData1();
                                                                                          ic.then((value) {
                                                                                            _cartController.add(value);
                                                                                          });

                                                                                          // fetchData1(_cart, context);
                                                                                        }),
                                                                                    TextButton(
                                                                                        child: const Center(
                                                                                            child: Icon(
                                                                                          Icons.delete,
                                                                                          color: Colors.red,
                                                                                          size: 18,
                                                                                        )),
                                                                                        style: ButtonStyle(
                                                                                          foregroundColor: MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                                                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          //print('helooooooooooo');
                                                                                          final ic = del!.getData1();
                                                                                          ic.then((value) {
                                                                                            _cartController.add(value);
                                                                                          });
                                                                                          // del.getData();
                                                                                          // fetchData1(_cart, context);

                                                                                          // textStyle: Colors.white,
                                                                                        }),
                                                                                  ]),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              10.0,
                                                                          top:
                                                                              9.0,
                                                                          left:
                                                                              2.0,
                                                                          right:
                                                                              10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: <
                                                                            Widget>[
                                                                          /*   Padding(
                                                              padding: const EdgeInsets.only(left: 10.0),

                                                              /// Total price of item buy
                                                              child: Text(
                                                                'Total ',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 15.5,
                                                                    fontFamily: "Sans"),
                                                              ),
                                                            ), */
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 10.0),

                                                                            /// Total price of item buy
                                                                            child:
                                                                                Text(
                                                                              '${snapshot.data['model']['cart_items']['items'][position]['total_price_str']}',
                                                                              style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 15.5, fontFamily: "Sans"),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ])))
                                                    ],
                                                  ),
                                                  //  Padding(padding: EdgeInsets.only(top: 8.0)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      scrollDirection: Axis.vertical,
                                    )),
                                Column(children: <Widget>[
                                  const Divider(
                                    // color: Color(0xFFDBDBDB),
                                    thickness: 3,
                                    color: CurrentTheme.ShadeColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 16.0),
                                    child: Column(children: <Widget>[
                                      const Divider(
                                        // color: Color(0xFFDBDBDB),
                                        thickness: 1,
                                        color: CurrentTheme.ShadeColor,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "Voucher",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 40.0),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () async {
                                                SubModelController? del;
                                                String delPath = Env
                                                        .value!.baseUrl! +
                                                    '/user/cart/empty_cart/${snapshot.data['model']['user_id']}/123';
                                                del = SubModelController(
                                                    AppProvider.getApplication(
                                                        context),
                                                    delPath,
                                                    null);
                                                // await del.getData();
                                                // _onEmpty();
                                                final ic = del.getData1();
                                                ic.then((value) {
                                                  _cartController.add(value);
                                                });
                                              },
                                              child: Container(
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  color: const Color(0xFF404A5C),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "Empty Cart",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        // color: Color(0xFFDBDBDB),
                                        thickness: 1,
                                        color: CurrentTheme.ShadeColor,
                                      ),
                                    ]),
                                  )
                                ]),
                                Container(
                                  height: 220,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const Divider(
                                        // color: Color(0xFFDBDBDB),
                                        thickness: 3,
                                        color: CurrentTheme.ShadeColor,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0,
                                              left: 13.0,
                                              right: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Sub total',
                                                style: _statLabelTextStyle,
                                              ),
                                              Text(
                                                  snapshot.data['model']
                                                      ['total_harga_str'],
                                                  style: _statLabelTextStyle),
                                            ],
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              left: 13.0,
                                              right: 15.0,
                                              bottom: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Payable with balance',
                                                style: _statLabelTextStyle,
                                              ),
                                              Text(
                                                  snapshot.data['model'][
                                                      'payable_with_balance_str'],
                                                  style: _statLabelTextStyle),
                                            ],
                                          )),
                                      const Divider(
                                        // color: Color(0xFFDBDBDB),
                                        thickness: 3,
                                        color: CurrentTheme.ShadeColor,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0,
                                              left: 13.0,
                                              right: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Available balance',
                                                style: _statLabelTextStyle,
                                              ),
                                              Text(
                                                snapshot.data['model']
                                                    ['available_balance_str'],
                                                style: _statLabelTextStyle,
                                              ),
                                            ],
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              left: 13.0,
                                              right: 15.0,
                                              bottom: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('Total Tagihan',
                                                  style: _statLabelTextStyle),
                                              Text(
                                                  snapshot.data['model']
                                                      ['total_tagihan_str'],
                                                  style: _statLabelTextStyle),
                                            ],
                                          )),
                                      const Divider(
                                        // color: Color(0xFFDBDBDB),
                                        thickness: 3,
                                        color: CurrentTheme.ShadeColor,
                                      ),
                                      /*
             Padding(
                 padding: const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0 ),
                 child :

                   SizedBox(
                   width: mediaQueryData.size.width,
                   height:mediaQueryData.size.height * 1/7,
                   child:


                         Column(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: <Widget>[
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text('Available balance', style: _totalSadeStyle,),
                                 Text(mdl.model!.model!.available_balance_str, style: _totalSadeStyle,),
                               ]
                             ),
                             Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: <Widget>[
                                   Text('Total', style: _totalSadeStyle),
                                   Text(mdl.model!.model!.total_tagihan_str, style: _totalSadeStyle),

                                 ]
                             ),


                           ],
                         ),




                 ),



             ),

              */
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  child: ButtonBarTheme(
                                    data: ButtonBarThemeData(
                                      alignment: MainAxisAlignment.center,
                                      buttonMinWidth: 0.9 * width,
                                    ),
                                    child: ButtonBar(
                                        alignment: MainAxisAlignment.center,
                                        buttonMinWidth: 0.9 * width,
                                        children: <Widget>[
                                          RaisedButton(
                                              child: snapshot.data['model'][
                                                              'total_tagihan'] ==
                                                          0.0 &&
                                                      snapshot.data['model'][
                                                              'payable_with_balance'] >
                                                          0.0
                                                  ? Text('Pay with balance ' +
                                                      snapshot.data['model'][
                                                          'payable_with_balance_str'])
                                                  : Text('Pay ' +
                                                      snapshot.data['model'][
                                                          'total_tagihan_str']),
                                              textColor: Colors.white,
                                              splashColor: CurrentTheme.ShadeColor,
                                              color: const Color(0xFF037f51),
                                              onPressed: () async {
                                                if (snapshot.data['model']
                                                            ['total_tagihan'] ==
                                                        0.0 &&
                                                    snapshot.data['model'][
                                                            'payable_with_balance'] >
                                                        0.0) {
                                                  SubModelController?
                                                      paytransfer;
                                                  String delPath = Env
                                                          .value!.baseUrl! +
                                                      '/user/checkout/pay_with_available_balance/${snapshot.data['model']['user_id']}/123';
                                                  paytransfer =
                                                      SubModelController(
                                                          AppProvider
                                                              .getApplication(
                                                                  context),
                                                          delPath,
                                                          null);
                                                  var data = await paytransfer
                                                      .getData();

                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BalanceSent(
                                                              buyinstruction:
                                                                  data,
                                                            )),
                                                  );
                                                } else {
                                                  //  var res = await apiRepProvider!.getCookies( Env.value!.baseUrl! + '/user/cart/view/${this.model!.model!.user_id}/123/ ');
                                                  if (snapshot.data['model']
                                                          ['total_tagihan'] >
                                                      0.0) {
                                                    var res = await apiRepProvider!
                                                        .getCookies(Env.value!
                                                                .baseUrl! +
                                                            '/public/program/mobile_init'); //'/user/cart/view');
                                                    //var res;
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CartPayment(
                                                                  pay_method:
                                                                      CartViewModel(
                                                                          snapshot.data),
                                                                  cartCookies:
                                                                      res)),
                                                    );
                                                  }
                                                }
                                              })
                                        ]),
                                  ),
                                ),
                                const SizedBox(height: 50),
                              ]))
                            ])
                          ])));
                }
                if (snapshot.hasError) {
                  return const Text('error');
                }
                return Container();
              }),

      //  floatingActionButton: isLoading? null :  this.model!.Buttons(context, _dialVisible)
    );

    /*
    cart =     CartController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        '',
        widget.title!,

        null,
        false);

    fetchData(cart, context);

   // _hasSubModel	= true;
    modelCount = modelCount + 1;
   // String getSubPathCartItems = Env.value!.baseUrl! + '/user/cart/cart_items_index/''/'+widget.title! + '?';
    // model id user


    return Scaffold(
      body: widget.user == 0 ?
      Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Text('Silahkan Login terlebih dahulu.'),// Text('failed to ' + widget.title!),
                GestureDetector(
                  onTap:(){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login(application: context,isLogin: true,)),
                          (Route<dynamic> route) => true,
                    );
                  },
                  child: Text('Login', style: TextStyle(color: Colors.blue)),
                ),
              ]
          )

      )
          : isLoading ? this.idHash == null?  Container(width: 0.0, height: 0.0,) : this.idHash == ''?Container(width: 0.0, height: 0.0,):Container(width: 0.0, height: 0.0,)
          :Form(

          key: formKey,
          child:   this.model!.view1(context, scrollController, this)
      ),
      //  floatingActionButton: isLoading? null :  this.model!.Buttons(context, _dialVisible)
    );

     */
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onScroll() {
    //  final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    cs.value = currentScroll;
    if (lastScroll > currentScroll) {
      scrollup(false);
    } else {
      scrollup(true);
    }
    lastScroll = currentScroll;
  }
}

class usersView extends StatefulWidget {
  static const String PATH = '/public/browse_users/listing/:id';
  final bool? account;
  final String? title;
  usersView({Key? key, this.title, this.account}) : super(key: key);
  @override
  usersViewState createState() => usersViewState();
}

class usersViewState extends State<usersView> {
  String title = 'Browse Users';
  final bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d';
  final scrollController = ScrollController();
  BrowseUsersController? browse_users;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool? account = true;
  String searchText = '';

  usersViewState() {
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    /*  if(widget.id.contains('filter')|| widget.id.contains('search'))
    {
      search = true;
    }
    if(widget.id.contains('filter')){
      var ids = widget.id;
      int ind = ids.indexOf('&');
      ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d' + ids;
    }

    if(widget.id.contains('search')){
      var ids = widget.id;
      ids = ids.replaceAll('%28','(');
      ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d&' + ids;
    } */
    accountController =
        AccountController(AppProvider.getApplication(context), AppAction.view);
    List listAccount = [];
    final future = accountController!.getAccount();
    future.then((val) {
      listAccount.addAll(val);
    });

    if (listAccount.isEmpty) {
      account = false;
    } else {
      account = true;
    }

    browse_users = BrowseUsersController(AppProvider.getApplication(context),
        getPath, AppAction.listing, '', '', '', search);
    browse_users!.listing!.add(BrowseUsersList());
    return Scaffold(
        appBar: const MyCustomAppBar(height: 106, menu: 99, user: 1),
        body: buildListingBar());
  }

  // @override
  Widget buildListingBar() {
    return BlocBuilder<BrowseUsersListing, BrowseUsersState>(
      // cubit: browse_users!.listing,

      builder: (BuildContext context, BrowseUsersState state) {
        if (state is BrowseUsersListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is BrowseUsersListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is BrowseUsersListingLoaded) {
          if (state.browse_users!.items.items.isEmpty) {
            if (state.browse_users!.tools.buttons.length == 0) {
              return Scaffold(
                body: Center(
                  child: Text('no ' + title),
                ),
              );
            } else {
              return Scaffold(
                  body: Center(
                    child: Text('no ' + title),
                  ),
                  floatingActionButton: state.browse_users!
                      .Buttons(context, _dialVisible, account)
                  //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller,browse_users,  this, Env.value!.baseUrl!, '', title)
                  );
            }
          }
          if (state.browse_users!.tools.buttons.length == 0) {
            return Scaffold(
                body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index>= state.browse_users!.items.items.length
                      ? ProjectsBottomLoader()
                      : state.browse_users!.viewItem(
                          state.browse_users!.items.items[index],
                          searchText,
                          account);
                },
                itemCount: state.hasReachedMax!
                    ? state.browse_users!.items.items.length
                    : state.browse_users!.items.items.length + 1,
                controller: scrollController,
              ),
              onRefresh: _onRefresh,
            ));
          }
          return Scaffold(
              body: RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index>= state.browse_users!.items.items.length
                        ? ProjectsBottomLoader()
                        : state.browse_users!.viewItem(
                            state.browse_users!.items.items[index],
                            searchText,
                            account);
                  },
                  itemCount: state.hasReachedMax!
                      ? state.browse_users!.items.items.length
                      : state.browse_users!.items.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),
              floatingActionButton:
                  state.browse_users!.Buttons(context, _dialVisible, account)
              //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller,browse_users,  this, Env.value!.baseUrl!, '', title!, account)

              );
        }

        return const Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  @override
  void dispose() {
    browse_users!.listing!.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    Completer<void> completer = Completer<void>();
    browse_users!.listing!.add(BrowseUsersListingRefresh());

    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      browse_users!.listing!.add(BrowseUsersList());
    }
  }
}

//Guide

class Guide {
  final String? url;
  final String? name;
  final String? id;
  final String? img;
  final String? desc;

  const Guide({
    this.url,
    this.name,
    this.id,
    this.img,
    this.desc,
  });
}

List<Guide> guideData = [
  const Guide(
    url: "pengenalan",
    name: "Pengenalan",
    id: "1",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "cara_kerja",
    name: "Cara Kerja",
    id: "2",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "keunggulan",
    name: "Keunggulan",
    id: "3",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "aturan_main",
    name: "Aturan Main",
    id: "4",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "pricing",
    name: "Pricing",
    id: "5",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "faq_umum",
    name: "FAQ Umum",
    id: "6",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "all_rankings",
    name: "All Rankings",
    id: "7",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "create_project",
    name: "Create Project",
    id: "8",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "menjadi_worker",
    name: "Menjadi Worker",
    id: "14",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "faq_worker",
    name: "FAQ Worker",
    id: "15",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "menjadi_owner",
    name: "Menjadi Owner",
    id: "16",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "faq_owner",
    name: "FAQ Owner",
    id: "17",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "tentang_arbitrase",
    name: "Tentang Arbitrase",
    id: "18",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "sell_service",
    name: "Sell Service",
    id: "23",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "faq_service",
    name: "FAQ Service",
    id: "24",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "sell_product",
    name: "Sell Product",
    id: "29",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "menjadi_buyer",
    name: "Menjadi Buyer",
    id: "30",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "faq_buyer",
    name: "FAQ Buyer",
    id: "31",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "menjadi_seller",
    name: "Menjadi Seller",
    id: "32",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "faq_seller",
    name: "FAQ Seller",
    id: "33",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "menjadi_affiliate",
    name: "Menjadi Affiliate",
    id: "34",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "aturan_affiliate",
    name: "Aturan Affiliate",
    id: "35",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "faq_affiliate",
    name: "FAQ Affiliate",
    id: "36",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "media_kit",
    name: "Media Kit",
    id: "37",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "community",
    name: "Community",
    id: "38",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "overview",
    name: "Overview",
    id: "39",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  const Guide(
    url: "community",
    name: "Community",
    id: "39",
    img: "assets/img/banner.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
];

bool loadImage = true;

class guides extends StatefulWidget {
  ValueChanged<bool?>? scrollUp;
  bool? isDark;
  final String? title;
  final int? user;
  guides({Key? key, this.title, this.scrollUp, this.isDark, this.user})
      : super(key: key);
  @override
  _guidesState createState() => _guidesState();
}

class _guidesState extends State<guides> with RestorationMixin {
  var scrollController = ScrollController();
  // String getPath = Env.value!.baseUrl! + '/public/pages/';

  final formKey = GlobalKey<FormState>();
  //PagesController page;
  // final _scrollThreshold = 200.0;
  double lastScroll = 0;
  // var isLoading = true;
  // var viewPage;

  void scrollup(bool? su) {
    widget.scrollUp!(su!);
  }

  //_guidesState(){
  // scrollController!.addListener(_onScroll);
  // }
  // @override
  @override
  initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'guides';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'guides');
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  /*
  fetchData(PagesController page, BuildContext context)async {
    if (this.viewPage == null) {

      final future = page.viewPage();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
        this.viewPage = Page1.fromJson(value);

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

   */

  @override
  Widget build(BuildContext context) {
    /*
    page =     PagesController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        '',
        'pengenalan');
    fetchData(page, context);

     */
    /// Component appbar
    /* var _appbar = AppBar(
      backgroundColor: CurrentTheme.HomeColor,
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        child: Text(
          'Guides',
          style: TextStyle(
              fontFamily: "Gotik",
              fontSize: 20.0,
              color: Colors.black54,
              fontWeight: FontWeight.w700),
        ),
      ),

    );

    */

    return Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Scaffold(

            /// Calling variable appbar
            appBar: null,
            body:
                /*
          isLoading?Center(
              child:CircularProgressIndicator(
                valueColor:    AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ))
              :

               */
                Form(
              key: formKey,
              child: _imageLoaded(
                  context, scrollController, widget.isDark, widget.user),
            )
            //_imageLoaded(context, scrollController, widget.isDark),
            ));
  }

  void _onScroll() {
    final currentScroll = scrollController.position.pixels;
    cs.value = currentScroll;
    if (lastScroll > currentScroll) {
      scrollup(false);
    } else {
      scrollup(true);
    }
    lastScroll = currentScroll;
  }
}

Widget _imageLoaded(
    BuildContext context, ScrollController sc, bool? isDark, int? user) {
  return Container(
    child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return index== 0
            ? itemCard1(guideData[index], 'Cara Kerja', isDark, user)
            : index == 7
                ? itemCard1(guideData[index], 'Projects', isDark, user)
                : index == 13
                    ? itemCard1(guideData[index], 'Services', isDark, user)
                    : index == 15
                        ? itemCard1(guideData[index], 'Products', isDark, user)
                        : index == 20
                            ? itemCard1(
                                guideData[index], 'Affiliate', isDark, user)
                            : index == 26
                                ? itemCard2(guideData[index], index,
                                    'Community', isDark, user)
                                : itemCard(
                                    guideData[index], index, isDark, user);
      },
      itemCount: guideData.length,
      controller: sc,
    ),
  );
}

class itemCard extends StatefulWidget {
  /// Declaration and Get data from BrandDataList.dart
  final Guide guide;
  final int? index;
  final bool? isDark;
  final int? user;
  itemCard(this.guide, this.index, this.isDark, this.user);

  _itemCardState createState() => _itemCardState(guide);
}

class _itemCardState extends State<itemCard> {
  final Guide guide;
  _itemCardState(this.guide);
  @override
  Widget build(BuildContext context) {
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
      child: InkWell(
        onTap: () async {
          /*
          if (await canLaunch('https://projects.co.id' + '/public/pages/' + guide!.url!)) {
            await launch('https://projects.co.id' + '/public/pages/' + guide!.url!);
          } else {
            throw 'Could not launch https://projects.co.id' + '/public/pages/' + guide!.url;
          }
         */

          /*  AppProvider.getRouter(context)! .navigateTo(
              context,
              "/public/pages/" + "pengenalan");
           */
          var res = '';

          Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => PublicPageView(
                      title: guide.url,
                      id: widget.index,
                      isDark: widget.isDark,
                      cookies: res),
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }),
              (Route<dynamic> route) => true);
        },
        child: Container(
          // height: 60.0,
          width: 400.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),

            /// Background Constructor for card
            child: Container(
              //height: 80.0,
              padding: const EdgeInsets.all(0.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.only(left: 10.0),

                          /// Image item
                          child: Icon(
                            Icons.attach_file,
                            size: 30.0,
                            color: CurrentTheme.PrimaryLightColor,
                          )),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0.0, left: 10.0, right: 5.0),
                          child: Column(
                            /// Text Information Item
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                guide.name!,
                                style:
                                    const TextStyle(fontSize: 15, color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //  Padding(padding: EdgeInsets.only(top: 8.0)),
                ],
              ),
            ),
          ),
          /*
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Hero(
            tag: 'hero-tag-${guide!.id}',
            transitionOnUserGestures: true,
            child: Material(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: CurrentTheme.BackgroundColor,
                  // borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  boxShadow: [
                    BoxShadow(
                      color: CurrentTheme.ShadeColor.withOpacity(0.3),
                      // blurRadius: 1.0,
                      // spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: CurrentTheme.SecondaryColor,
                  ),
                  child: Center(
                    child: Text(
                      guide!.name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Berlin",
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

               */
        ),
      ),
    );
  }
}

class itemCard1 extends StatefulWidget {
  /// Declaration and Get data from BrandDataList.dart
  final Guide guide;
  final String header;
  final bool? isDark;
  final int? user;
  itemCard1(this.guide, this.header, this.isDark, this.user);

  _itemCard1State createState() => _itemCard1State(guide);
}

class _itemCard1State extends State<itemCard1> {
  final Guide guide;

  _itemCard1State(this.guide);
  @override
  Widget build(BuildContext context) {
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;

    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
      child: InkWell(
        onTap: () async {
          /* if (await canLaunch('https://projects.co.id' + '/public/pages/' + guide!.url!)) {
            await launch('https://projects.co.id' + '/public/pages/' + guide!.url!);
          } else {
            throw 'Could not launch https://projects.co.id' + '/public/pages/' + guide!.url;
          }

           */
          /* AppProvider.getRouter(context)! .navigateTo(
              context,
              "/public/pages/" + "pengenalan"); */
          var res = '';

          Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => PublicPageView(
                      title: guide.url,
                      id: 0,
                      isDark: widget.isDark,
                      cookies: res),
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }),
              (Route<dynamic> route) => true);
        },
        child: Container(
            // height: 60.0,
            width: 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    widget.header,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),

                  /// Background Constructor for card
                  child: Container(
                    //height: 80.0,
                    padding: const EdgeInsets.all(0.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(left: 10.0),

                                /// Image item
                                child: Icon(
                                  Icons.attach_file,
                                  size: 30.0,
                                  color: CurrentTheme.PrimaryLightColor,
                                )),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, left: 10.0, right: 5.0),
                                child: Column(
                                  /// Text Information Item
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      guide.name!,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //  Padding(padding: EdgeInsets.only(top: 8.0)),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class itemCard2 extends StatefulWidget {
  /// Declaration and Get data from BrandDataList.dart
  final Guide guide;
  final String header;
  final bool? isDark;
  final int? user;
  final int? index;
  itemCard2(this.guide, this.index, this.header, this.isDark, this.user);

  _itemCard2State createState() => _itemCard2State(guide);
}

class _itemCard2State extends State<itemCard2> {
  final Guide guide;

  _itemCard2State(this.guide);
  @override
  Widget build(BuildContext context) {
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;

    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
      child: InkWell(
        onTap: () async {
          /* if (await canLaunch('https://projects.co.id' + '/public/pages/' + guide!.url!)) {
            await launch('https://projects.co.id' + '/public/pages/' + guide!.url!);
          } else {
            throw 'Could not launch https://projects.co.id' + '/public/pages/' + guide!.url;
          }

           */
          /* AppProvider.getRouter(context)! .navigateTo(
              context,
              "/public/pages/" + "pengenalan"); */
          var res = '';
          if (widget.user == 1) {
            res = await apiRepProvider!
                .getCookies(Env.value!.baseUrl! + '/user/program/mobile_init');
          }

          Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => PublicPageView(
                      title: guide.url,
                      id: widget.index,
                      isDark: widget.isDark,
                      cookies: res),
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }),
              (Route<dynamic> route) => true);
        },
        child: Container(
            // height: 60.0,
            width: 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    widget.header,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),

                  /// Background Constructor for card
                  child: Container(
                    //height: 80.0,
                    padding: const EdgeInsets.all(0.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(left: 10.0),

                                /// Image item
                                child: Icon(
                                  Icons.attach_file,
                                  size: 30.0,
                                  color: CurrentTheme.PrimaryLightColor,
                                )),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, left: 10.0, right: 5.0),
                                child: Column(
                                  /// Text Information Item
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      guide.name!,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        //  Padding(padding: EdgeInsets.only(top: 8.0)),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

//////////////////////////////////////

class ListingBar extends StatefulWidget {
  static const String PATH = '/public/test/listing/:id';
  final String? title;
  ValueChanged<bool?>? scrollUp;
  bool? account;
  ListingBar({Key? key, this.title, this.scrollUp, this.account})
      : super(key: key);
  @override
  ListingBarState createState() => ListingBarState();
}

class ListingBarState extends State<ListingBar> {
  String title = 'Test';
  final bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/test/listing?page=%d';
  final scrollController = ScrollController();
  TestController? test;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  double lastScroll = 0;
  String searchText = '';

  void scrollup(bool? su) {
    widget.scrollUp!(su!);
  }

  ListingBarState() {
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    test = TestController(AppProvider.getApplication(context), getPath,
        AppAction.listing, '', '', '', search);
    test!.listing!.add(TestList());
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
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
                })
          ],
          title: selected ? buildSearchBar(title) : Text(title),
        ),
        body: buildListingBar());
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  Widget buildSearchBar(String tiltle) {
    return Container(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
          style: const TextStyle(fontSize: 14.0, height: 0.2, color: Colors.black),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

            // hasFloatingPlaceholder: false,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gapPadding: 20.0),
          ),
        ));
  }

  // @override
  Widget buildListingBar() {
    return BlocBuilder<TestListing, TestState>(
      //cubit: test.listing,

      builder: (BuildContext context, TestState state) {
        if (state is TestListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is TestListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is TestListingLoaded) {
          if (state.test!.items.items.isEmpty) {
            return Center(
              child: Text('no ' + title),
            );
          }
          if (state.test!.tools.buttons.length == 0) {
            return Scaffold(
                body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index>= state.test!.items.items.length
                      ? ProjectsBottomLoader()
                      : state.test!.viewItem(state.test!.items.items[index],
                          searchText, widget.account);
                },
                itemCount: state.hasReachedMax!
                    ? state.test!.items.items.length
                    : state.test!.items.items.length + 1,
                controller: scrollController,
              ),
              onRefresh: _onRefresh,
            ));
          }
          return Scaffold(
              body: RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index>= state.test!.items.items.length
                        ? ProjectsBottomLoader()
                        : state.test!.viewItem(state.test!.items.items[index],
                            searchText, widget.account);
                  },
                  itemCount: state.hasReachedMax!
                      ? state.test!.items.items.length
                      : state.test!.items.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),
              floatingActionButton:
                  state.test!.Buttons(context, _dialVisible, widget.account!));
        }

        return const Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  @override
  void dispose() {
    test!.listing!.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    Completer<void> completer = Completer<void>();
    test!.listing!.add(TestListingRefresh());

    // Timer timer =    Timer(   Duration(seconds: 3), () {
    //   completer.complete();
    // });
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (lastScroll > currentScroll) {
      scrollup(false);
    } else {
      scrollup(true);
    }
    lastScroll = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
      test!.listing!.add(TestList());
    }
  }
}
/*
class ProjectsBottomLoader extends StatelessWidget {
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

 */

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return Container(
      margin: const EdgeInsets.all(4.0),
      width: iconTheme.size! - 8.0,
      height: iconTheme.size! - 8.0,
      color: iconTheme.color,
    );
  }
}

class CustomInactiveIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return Container(
        margin: const EdgeInsets.all(4.0),
        width: iconTheme.size! - 8.0,
        height: iconTheme.size! - 8.0,
        decoration: BoxDecoration(
          border: Border.all(color: iconTheme.color!, width: 2.0),
        ));
  }
}

class NavigationIconView {
  String title = 'browse Projects';
  final BottomNavigationBarItem? item;
  final AnimationController? controller;
  Animation<double?>? animation;
  NavigationIconView({
    Widget? icon,
    Widget? activeIcon,
    String? title,
    Color? color,
    TickerProvider? vsync,
  })  : item = BottomNavigationBarItem(
          icon: icon!,
          activeIcon: activeIcon,
          label: title!,
          //  title: Text(title!, style: TextStyle(fontSize: 11),),
          backgroundColor: color,
        ),
        controller = AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync!,
        ) {
    animation = controller!.drive(CurveTween(
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));
  }
}

//Projectscoid Bottom Navigator
class MyCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double? height;
  final int? menu;
  final int? user;
  final String? forlgn;
  final String? username;
  final ChatBloc? chatBloc;

  const MyCustomAppBar(
      {Key? key,
      this.height,
      this.menu,
      this.user,
      this.chatBloc,
      this.forlgn,
      this.username})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  MyCustomAppBarState createState() => MyCustomAppBarState();
}

class MyCustomAppBarState extends State<MyCustomAppBar> {
  // bool viewImage = false;
  bool viewImage = true;
  bool? account = true;
  double opacity = 1.0;
  int nCount = 0;
  List<String> listData = [];
  bool loading = true;
  String title = '';
  MyCustomAppBarState() {}

  @override
  void initState() {
    super.initState();
    fectData();
    /* if(widget.menu == 0){
      viewImage = true;
    }
    if(widget.user == 0){
      account = false;
    }
    changeBar(); */
  }

  Future<int?> _getCountSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('np_count')) {
      return prefs.getInt('np_count');
    } else {
      return 0;
    }
  }

  Future<void> _setCountSharedPrefs(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('np_count', i);
  }

  Future<List<String>?> _getListSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('list_projects')) {
      return prefs.getStringList('list_projects');
    } else {
      return [];
    }
  }

  Future<void> _setListSharedPrefs(List<String> ls) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('list_projects', ls);
  }

  Future<void> fectData() async {
    final future = _getCountSharedPrefs();
    future.then((value) {
      nCount = value!;
      setState(() {
        loading = false;
      });
    });

    final future1 = _getListSharedPrefs();
    future1.then((value) {
      //listData.clear();
      listData.addAll(value!);
    });
  }

  void loggedIn() {
    // Login(application: context, isLogin: true);
    widget.chatBloc!.dispose();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => Login(
                application: context,
                isLogin: true,
              )),
      (Route<dynamic> route) => true,
    );

    /*
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login(application: context,isLogin: true,)),
    );

     */
    // Navigator.pop(context);
    // AppProvider.getRouter(context)! .navigateTo(
    //     context,
    //     "/login/1");
    // BlocProvider.of<AuthenticationController>(context).add(LoggedOut());
    /*AppProvider.getRouter(context)! .navigateTo(
        context,
        "/"); */

    /* AppProvider.getRouter(context)! .navigateTo(
        context,
        "/login/1"); */
    //  Login();
    //Navigator.pop(context); // Dismiss the drawer.
    /* _scaffoldKey.currentState.showSnackBar(const SnackBar(
        content: Text("The drawer's items don't do anything")
    )); */
  }

  changeOpacity() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (opacity != 0.0) {
        setState(() {
          opacity = opacity - 0.1;
        });
      }
      if (opacity >= 0.5) {
        setState(() {
          viewImage = false;
        });
      }
    });
  }

  changeBar() {
    /* for (int i = 0; i == 20 ; i ++ ){
      changeOpacity();
    } */

    Future.delayed(const Duration(seconds: 2), () {
      //  changeOpacity();
      setState(() {
        viewImage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    //  FocusScope.of(context).requestFocus(   FocusNode());
    // print('menu : ${this.menu.toString()}');

    return loading
        ? Column(
            children: [
              Container(
                // color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 7, 0),
                  child: Container(
                    child: Row(children: [
                      //Expanded(
                      // child:
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: mediaQueryData.size.width * 0.1),
                        //  color: Colors.white,
                        child: Image.asset('assets/img/projectscoid.png'),
                      ),
                      //),

                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            PopupMenuButton<int>(
                              //padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 12.0),
                              icon: const Icon(Icons.search),
                              onSelected: (int value) {
                                if (value == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchBrowseProjectsListing(
                                                id: '',
                                                title: '',
                                                cb: widget.chatBloc)),
                                  );
                                }
                                if (value == 2) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchBrowseServicesListing1(
                                                id: '',
                                                title: '',
                                                cb: widget.chatBloc)),
                                  );
                                }
                                if (value == 3) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchBrowseProductsListing(
                                                id: '',
                                                title: '',
                                                cb: widget.chatBloc)),
                                  );
                                }
                                if (value == 4) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchBrowseUsersListing1(
                                                id: '',
                                                title: '',
                                                cb: widget.chatBloc)),
                                  );
                                }

                                if (value == 5) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchPastProjectsListing1(
                                                id: '', title: '')),
                                  );
                                }
                                /*

                                  if(value == 6) {
                                     AppProvider.getRouter(context)! .navigateTo(
                                         context,
                                         urlToRoute("/public/test/listing/123"));
                                  }

                                   */
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuItem<int>>[
                                const PopupMenuItem<int>(
                                  value: 1,
                                  child: Text('Search Projects'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 2,
                                  child: Text('Search Services'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 3,
                                  child: Text('Search Products'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 4,
                                  child: Text('Search Users'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 5,
                                  child: Text('Search Past Projects'),
                                ),
                                /*
                                  const PopupMenuItem<int>(
                                    value: 6,
                                    child: Text('test field'),
                                  ),

                                   */
                              ],
                            ),
                            widget.menu == 99
                                ? Container(
                                    height: 0,
                                    width: 0,
                                  )
                                : (widget.user != 0)
                                    ? IconButton(
                                        icon: const Icon(Icons.menu, size: 20),
                                        onPressed: () {
                                          Scaffold.of(context).openEndDrawer();
                                          /*
                                  getApplicationDocumentsDirectory().then((value){
                                    APIProvider projectsAPIProvider = APIProvider(value!.path);
                                    final future = projectsAPIProvider.getData(
                                        Env.value!.baseUrl! + '/user/program/ping');
                                    future.then((value) {

                                      try {
                                        jsonDecode(value);

                                        projectsAPIProvider.userLogin(widget.username!,widget.forlgn!  );
                                      } catch (e) {
                                        if(value!.length > 0){
                                          projectsAPIProvider.userLogin(widget.username!,widget.forlgn!  );
                                          // print('saya disini$value v');
                                        }else{
                                          // print('saya disini cccc');
                                        }

                                      }


                                    });



                                  });
                                  */
                                        },
                                      )
                                    : Builder(
                                        builder: (context) => GestureDetector(
                                          onTap: () => {
                                            loggedIn(),
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                7.0, 7.0, 10.0, 12.0),
                                            child: Icon(
                                              Icons.account_circle_outlined,
                                              // color: Colors.black,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                          ]))
                    ]),
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Container(
                // color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 7, 0),
                  child: Container(
                    child: Row(children: [
                      //Expanded(
                      // child:
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0,
                            right: mediaQueryData.size.width * 0.08),
                        //  color: Colors.white,
                        child: Image.asset('assets/img/projectscoid.png'),
                      ),
                      //),

                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            StreamBuilder(
                                stream: widget.chatBloc!.onMessage,
                                // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                                initialData: [],
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasError) {
                                    return Container(height: 0.0, width: 0.0);
                                  }
                                  if (snapshot.hasData &&
                                      snapshot.data.length != 0) {
                                    if (jsonDecode(snapshot.data)['type'] ==
                                            'project' &&
                                        jsonDecode(snapshot.data)['title'] !=
                                            title) {
                                      title =
                                          jsonDecode(snapshot.data)['title'];
                                      // print('mantaaaaaaaaaaaaaaaapppppppppppp');
                                      listData.add(snapshot.data);
                                      _setCountSharedPrefs(nCount + 1);
                                      _setListSharedPrefs(listData);

                                      nCount++;
                                      return (GestureDetector(
                                          onTap: () async {
                                            if (nCount != 0) {
                                              await Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      PageRouteBuilder(
                                                          pageBuilder: (_, __,
                                                                  ___) =>
                                                              ListPage(
                                                                  data:
                                                                      listData,
                                                                  title: title),
                                                          transitionDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      600),
                                                          transitionsBuilder: (_,
                                                              Animation<double>
                                                                  animation,
                                                              __,
                                                              Widget child) {
                                                            return Opacity(
                                                              opacity: animation
                                                                  .value,
                                                              child: child,
                                                            );
                                                          }),
                                                      (Route<dynamic> route) =>
                                                          true);
                                              nCount = 0;
                                              listData.clear();
                                              _setCountSharedPrefs(0);
                                              _setListSharedPrefs([]);
                                            }
                                          },
                                          child: Container(
                                              width: 30,
                                              height: 23,
                                              child: Stack(children: <Widget>[
                                                const Positioned.fill(
                                                  child: Icon(
                                                      Icons.notifications,
                                                      size: 18.0,
                                                      color: CurrentTheme
                                                          .NormalTextColor),
                                                ),
                                                nCount == 0
                                                    ? Container()
                                                    : Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 14,
                                                          width: 14,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.red,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Text(
                                                            nCount.toString(),
                                                            style: const TextStyle(
                                                                fontSize: 8,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ))
                                              ]))));
                                    }
                                  }

                                  return (GestureDetector(
                                      onTap: () async {
                                        if (nCount != 0) {
                                          await Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  PageRouteBuilder(
                                                      pageBuilder: (_, __,
                                                              ___) =>
                                                          ListPage(
                                                              data: listData,
                                                              title: title),
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  600),
                                                      transitionsBuilder: (_,
                                                          Animation<double>
                                                              animation,
                                                          __,
                                                          Widget child) {
                                                        return Opacity(
                                                          opacity:
                                                              animation.value,
                                                          child: child,
                                                        );
                                                      }),
                                                  (Route<dynamic> route) =>
                                                      true);
                                          nCount = 0;
                                          listData.clear();
                                          _setCountSharedPrefs(0);
                                          _setListSharedPrefs([]);
                                        }
                                      },
                                      child: Container(
                                          width: 30,
                                          height: 23,
                                          child: Stack(children: <Widget>[
                                            const Positioned.fill(
                                              child: Icon(Icons.notifications,
                                                  size: 18.0,
                                                  color: CurrentTheme
                                                      .NormalTextColor),
                                            ),
                                            nCount == 0
                                                ? Container()
                                                : Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 14,
                                                      width: 14,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.red,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Text(
                                                        nCount.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 8,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                          ]))));
                                }),
                            PopupMenuButton<int>(
                              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              icon: const Icon(Icons.search, size: 17),
                              onSelected: (int value) {
                                if (value == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchBrowseProjectsListing(
                                                id: '',
                                                title: '',
                                                cb: widget.chatBloc)),
                                  );
                                }
                                if (value == 2) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchBrowseServicesListing1(
                                                id: '',
                                                title: '',
                                                cb: widget.chatBloc)),
                                  );
                                }
                                if (value == 3) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchBrowseProductsListing(
                                                id: '',
                                                title: '',
                                                cb: widget.chatBloc)),
                                  );
                                }
                                if (value == 4) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchBrowseUsersListing1(
                                                id: '',
                                                title: '',
                                                cb: widget.chatBloc)),
                                  );
                                }

                                if (value == 5) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchPastProjectsListing1(
                                                id: '', title: '')),
                                  );
                                }
                                /*

                                  if(value == 6) {
                                     AppProvider.getRouter(context)! .navigateTo(
                                         context,
                                         urlToRoute("/public/test/listing/123"));
                                  }

                                   */
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuItem<int>>[
                                const PopupMenuItem<int>(
                                  value: 1,
                                  child: Text('Search Projects'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 2,
                                  child: Text('Search Services'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 3,
                                  child: Text('Search Products'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 4,
                                  child: Text('Search Users'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 5,
                                  child: Text('Search Past Projects'),
                                ),
                                /*
                                  const PopupMenuItem<int>(
                                    value: 6,
                                    child: Text('test field'),
                                  ),

                                   */
                              ],
                            ),
                            widget.menu == 99
                                ? Container(
                                    height: 0,
                                    width: 0,
                                  )
                                : (widget.user != 0)
                                    ? IconButton(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        icon: const Icon(Icons.menu, size: 17),
                                        alignment: Alignment.centerLeft,
                                        onPressed: () {
                                          Scaffold.of(context).openEndDrawer();
                                          /*
                                  getApplicationDocumentsDirectory().then((value){
                                    APIProvider projectsAPIProvider = APIProvider(value!.path);
                                    final future = projectsAPIProvider.getData(
                                        Env.value!.baseUrl! + '/user/program/ping');
                                    future.then((value) {

                                      try {
                                        jsonDecode(value);

                                        projectsAPIProvider.userLogin(widget.username!,widget.forlgn!  );
                                      } catch (e) {
                                        if(value!.length > 0){
                                          projectsAPIProvider.userLogin(widget.username!,widget.forlgn!  );
                                          // print('saya disini$value v');
                                        }else{
                                          // print('saya disini cccc');
                                        }

                                      }


                                    });



                                  });
                                  */
                                        },
                                      )
                                    : Builder(
                                        builder: (context) => GestureDetector(
                                          onTap: () => {
                                            loggedIn(),
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                7.0, 7.0, 10.0, 12.0),
                                            child: Icon(
                                              Icons.account_circle_outlined,
                                              // color: Colors.black,
                                              size: 19.0,
                                            ),
                                          ),
                                        ),
                                      ),
                          ]))
                    ]),
                  ),
                ),
              ),
            ],
          );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key? key, this.title, this.data}) : super(key: key);

  final String? title;
  final List<String?>? data;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(dynamic data) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(data['avatar']),
            ),
          ),
          title: Text(
            data['title'],
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              const SizedBox(height: 10),
              Expanded(
                  flex: 2,
                  child: Container(
                      // tag: 'hero',
                      child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(data['owner'],
                        style: const TextStyle(color: Colors.white, fontSize: 11),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ))),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(data['budget'],
                        style: const TextStyle(color: Colors.white, fontSize: 10))),
              )
            ],
          ),
          trailing:
              const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => PublicBrowseProjectsView(
                        id: urlToRoute(data['link']).split('/')[4],
                        title: data['title'],
                        cb: null),
                    transitionDuration: const Duration(milliseconds: 600),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    }),
                (Route<dynamic> route) => true);
            /*
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(lesson: lesson)));

         */
          },
        );

    Card makeCard(dynamic data) => Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(data),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(jsonDecode(widget.data![index]!));
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      title: const Text('New Projects'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

final Map<String, Item> _items = <String, Item>{};

Item _itemForMessage(Map<String, dynamic> message) {
  final dynamic data = message['notification'] ?? message;
  final String itemId = data['body'];
  final Item item = _items.putIfAbsent(itemId, () => Item(itemId: itemId))
    ..status = data['title'];
  return item;
}

class Item {
  Item({this.itemId});
  final String? itemId;
  final StreamController<Item> _controller = StreamController<Item>.broadcast();
  Stream<Item> get onChanged => _controller.stream;
  String? _status;
  String? get status => _status;
  set status(String? value) {
    _status = value!;
    _controller.add(this);
  }

  static final Map<String, Route<void>> routes = <String, Route<void>>{};
  Route<void> get route {
    final String routeName = '/detail/$itemId';
    return routes.putIfAbsent(
      routeName,
      () => MaterialPageRoute<void>(
        settings: RouteSettings(name: routeName),
        builder: (BuildContext context) => Container(),
      ),
    );
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }
}

class GreenFrog extends StatelessWidget {
  final String info;
  const GreenFrog(this.info);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFF2DBD3A), child: Text(info));
  }
}

class PublicBrowseProjectsActView extends StatefulWidget {
  static const String PATH = '/public/browse_projects/view/:id/:title';
  final String? id;
  final String? title;
  ChatBloc? cb;
  PublicBrowseProjectsActView({Key? key, this.id, this.title, this.cb})
      : super(key: key);
  @override
  PublicBrowseProjectsActViewState createState() =>
      PublicBrowseProjectsActViewState();
}

class PublicBrowseProjectsActViewState
    extends State<PublicBrowseProjectsActView> {
  final double _appBarHeight = 230.0;
  final AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  BrowseProjectsController? browse_projects;
  final formKey = GlobalKey<FormState>();
  var controller = ScrollController();
  final _scrollThreshold = 200.0;
  double lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String? idHash = '';
  String? userid;
  // var viewBrowseProjects;
  BrowseProjectsViewModel? model;
  PastProjectsViewModel? model1;
  bool isPastProject = false;
  AccountController? accountController;
  bool? account = true;
  String strValue = '';
  PublicBrowseProjectsViewState() {
    controller.addListener(_onScroll);
  }

  @override
  initState() {
    super.initState();
    // controller = ScrollController();
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  fetchData2(SubModelController? browse_projects, BuildContext context) async {
    String getPath = Env.value!.baseUrl! +
        '/public/past_projects/view/${widget.id}/${widget.title!}';
    browse_projects =
        SubModelController(AppProvider.getApplication(context), getPath, null);
    if (model1 == null) {
      final hash = browse_projects.getHash();
      hash.then((value) {
        idHash = value;
      });
      final future = browse_projects.getData();

      future.then((value) {
        Map<String, dynamic> json = value;
        model1 = PastProjectsViewModel(json);

        setState(() {
          isLoading = false;
        });
        // this.model1 = value;
      }).catchError((Error) {

        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
        });
      });
    }
  }

  fetchData(SubModelController? browse_projects, BuildContext context) async {
    String getPath = Env.value!.baseUrl! +
        '/public/browse_projects/view/${widget.id}/${widget.title!}';
    browse_projects =
        SubModelController(AppProvider.getApplication(context), getPath, null);
    if (model == null) {
      final hash = browse_projects.getHash();
      hash.then((value) {
        idHash = value;
      });
      final future = browse_projects.getData();

      future.then((value) {
        //strValue = value;
        // Map<String, dynamic> json = value;

        model = BrowseProjectsViewModel(value);

        if (model!.model!.model!.project_status_id != 3) {
          Map<String, dynamic> json = value;
          model1 = PastProjectsViewModel(json);
          isPastProject = true;
          print('PastProjectsViewModel1');
        }

        setState(() {
          isLoading = false;
        });

        // this.model = BrowseProjectsViewModel(json);
        // this.model = value;
      }).catchError((Error) {
        isPastProject = true;

        fetchData2(browse_projects, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _hasSubModel = false;
    int modelCount = 0;
    String getSubPath = '';
    bool _dialVisible = true;
    SubModelController? projects;

    fetchData(projects, context);
    accountController =
        AccountController(AppProvider.getApplication(context), AppAction.view);
    List listAccount = [];
    final future = accountController!.getAccount();
    future.then((val) {
      listAccount.addAll(val);
      if (listAccount.isEmpty) {
        account = false;
      } else {
        account = true;
        userid = val.asMap()[0]['user_hash'];
      }
    });
    _hasSubModel = true;
    modelCount = modelCount + 1;
    String getSubPathUserBids = Env.value!.baseUrl! +
        '/public/browse_projects/user_bids_list/' +
        widget.id! +
        '/' +
        widget.title! +
        '?';
    // model id project
    _hasSubModel = false;
    if (_hasSubModel) {
      return DefaultTabController(
        length: modelCount + 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: widget.title!),
                const Tab(text: 'UserBids'),
              ],
            ),
            title: Text(widget.title!),
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ))
              : TabBarView(
                  children: [
                    PublicBrowseProjectsSubView(
                        id: widget.id,
                        title: widget.title!,
                        model: model!),
                    UserBidsList(
                        id: widget.id,
                        title: widget.title!,
                        url: getSubPathUserBids),
                  ],
                ),
        ),
      );
    } else {
      return Scaffold(
        /* appBar: AppBar(
			//title: Text(widget.title!.replaceAll('-', '  ')),
		  ),  */

        appBar: isLoading
            ? AppBar(
                title: const Text('',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                iconTheme: const IconThemeData(
                  color: Colors.white, //change your color here
                ),
              )
            : scrollUp
                ? AppBar(
                    iconTheme: const IconThemeData(
                      color: Colors.white, //change your color here
                    ),
                    title: const Text('',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  )
                : isPastProject
                    ? model1!.appBar(context, idHash)
                    : model!.appBar(context, idHash),

        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ))
            : Form(
                key: formKey,
                child: isPastProject
                    ? model1!.view(context, controller, account)
                    : model!.view1(context, controller, account!, this,
                        userid, widget.cb!)),
        //floatingActionButton: isLoading? null :  this.model!.Buttons(context, _dialVisible)
        // floatingActionButton: isLoading? null : this.model!.model!.buttons.length == 0? null: this.model!.Buttons(context, _dialVisible, formKey, controller,browse_projects,  this, Env.value!.baseUrl!, widget.id, widget.title!, account)
      );
    }
  }

  void _onScroll() {
    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.position.pixels;
    if (lastScroll > currentScroll) {
      setState(() {
        scrollUp = false;
      });
    } else {
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

class Projectscoid extends StatefulWidget {
  static const String PATH = '/projectscoid';
  final String? id;
  final bool? isChat;
  BuildContext? ctx;
  Projectscoid({this.id, this.isChat, this.ctx});
  // static const String PATH = '/';

  @override
  _ProjectscoidState createState() => _ProjectscoidState();
}

class _ProjectscoidState extends State<Projectscoid>
    with TickerProviderStateMixin, WidgetsBindingObserver, RestorationMixin {
  //final ProjectscoidApplication application;
  int _currentIndex = 0;
  //BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView?>? _navigationViews;
  final List<Widget> _children = [];
  bool? isLogin;
  var listAccount;
  String forlgn = '';
  String username = '';
  String userDisplayName = '';
  String userPhoto = '';
  String userID = '';
  bool? value;
  bool appBarHide = false;
  InitializationSettings? initializationSettings;
  //String channel = '';
  //PusherConnect pusherConnect;
  // Event lastEvent;
  String? lastConnectionState;
//  Channel channel;
  var isLoading = true;
  bool selected = false;
  bool? account = true;
  TextEditingController searchBoxController = TextEditingController();
  final String _homeScreenText = "Waiting for token...";
  final bool _topicButtonsDisabled = false;
  bool notifHome = true;
  Future<int?>? futureNotif;
  Future<String?>? permissionStatusFuture;
  bool hide = true;
  bool darkMode = false;
//  var _chatBloc;
  // SharedPreferences prefs;
  // SharedPreferences prefs ;
  List<String?>? ListActivities = [];
  bool activeFab = false;
  final _statusWSSController = BehaviorSubject.seeded([]);
  //final _statusWSSController =  BehaviorSubject();
  var permProvisional = "provisional";
  var permGranted = "granted";
  var permDenied = "denied";
  var permUnknown = "unknown";
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final TextEditingController _topicController =
      TextEditingController(text: 'topic');
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  /* static final Animatable<Offset> _drawerDetailsTween = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: Offset.zero,
  ).chain(CurveTween(
    curve: Curves.fastOutSlowIn,
  )); */

  // AnimationController _controller;
  // Animation<double> _drawerContentsOpacity;
  // Animation<Offset> _drawerDetailsPosition;
  // bool _showDrawerContents = true;
  //AuthenticationController _authenticationBloc;
  AccountController? accountController;
  final ScrollController? _scrollViewController = ScrollController();
  TabController? _tabController;
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult?>? _connectivitySubscription;
  Directory? _downloadsDirectory;
  Hash? hasher;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final BehaviorSubject<String> selectNotificationSubject =
      BehaviorSubject<String>();

  //StreamSubscription<FGBGType> subscription;
  bool isBackground = false;
  int unread = 0;
  int notifunread = 0;
  var msgpusher;
  int cartcount = 0;
  String _scanBarcode = '';
  SubModelController? logout;
  bool firstimeConnect = true;
  // TODO: Add _bannerAd
  // late BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  //bool _isBannerAdReady = false;

  Timer? _timer;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

/*
  Future<void> initPusher() async {
    try {
      await Pusher.init("67158789f041b66713cb", PusherOptions(cluster: "mt1"),
          enableLogging: true);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

 */

  Stream get onWSSMessage => _statusWSSController.stream;

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    RemoteNotification? notification = message.notification;
    var data = message.data['message'];

    AndroidNotification? android = message.notification?.android;
    final document = parse(data);
    final recentNews = document.getElementsByTagName('a');
    String peer = recentNews[0].text;

    final hrefs = document
        .getElementsByTagName('a')
        .where((e) => e.attributes.containsKey('href'))
        .map((e) => e.attributes['href'])
        .toList();
    //print(hrefs);
    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      /*AbdiBangsaIslami
        //url = '${url!.substring(0, url!.indexOf(url!.split('/')[7]))}${item.item.user_name}

         */
      // print('haloooooo boy');
      if (hrefs.last!.contains('show_conversation')) {
        String payload;

        if (hrefs.last!.contains('my_projects')) {
          payload = '${hrefs.last! + '*' + peer}***l';
        } else {
          payload = '${hrefs.last! + '/*' + peer}***l';
        }

        AppProvider.getRouter(context)!
            .navigateTo(context, urlToRoute(payload));
      } else if (hrefs.last!.contains('show_thread')) {
        var payload =
            '${hrefs.last!.substring(0, hrefs.last!.indexOf(hrefs.last!.split('/')[7])) + peer}*20**l';

        AppProvider.getRouter(context)!
            .navigateTo(context, urlToRoute(payload));
      } else {
        AppProvider.getRouter(context)!
            .navigateTo(context, urlToRoute(hrefs.last!));
      }
    }
  }

  Future<void> initMsg(BuildContext context) async {
    // print('haloooooo bandung 123');

    try {
      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      // print('haloooooo bandung merdeka');
      if (initialMessage == null) {
        //  print('haloooooo bandung merdeka 1');
        //  print('halo ${initialMessage!.notification.body}');
        const GreenFrog('oke sekali bro 11');
      } else {
        if (initialMessage.data['message'] == null) {
          //  print('haloooooo bandung merdeka 2');
          // GreenFrog('oke sekali bro 1');
          // print('halo ${initialMessage!.notification.body}');
        } else {
          // print('ok ya');
          // GreenFrog('oke sekali bro');
        }
      }
    } catch (_) {}
  }

  final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'Projectscoid';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    // TODO: Initialize _bannerAd
    /*
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
    */
    // _save[];
    // print('widget id = ${widget.id}');
    //_scrollViewController =    ScrollController();
    _scrollViewController!.addListener(_onScroll);
    widget.id == '' ? account = false : account = true;
    if (widget.id == '') {
      setState(() {
        unread = 0;
      });
    }

    //  print('id===${widget.id}');
    //   print('decode===${decode(widget.id).toString()}');
    //  print('encode=${encode(119)}');
    // _navigationViews[_currentIndex].controller.value = 1.0;

    _tabController =
        TabController(vsync: this, length: choices.length, initialIndex: 0);

    // if(widget.isChat)print('chat error......');
    // if(!widget.isChat)print('chat ok.....');

    /*_controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    ); */
    /* _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = _controller.drive(_drawerDetailsTween);

      */

    /*   pusherConnect =    PusherConnect(
      appKey: "67158789f041b66713cb",
      cluster: 'mt1',
      channel: widget.id ,
      event: "notif",
    );  */

    //initPusher();

    // initDownloadsDirectoryState();
    _initPackageInfo();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    permissionStatusFuture = getCheckNotificationPermStatus();
    _setNotif('');
    // With this, we will be able to check if the permission is granted or not
    // when returning to the application
    // WidgetsBinding.instance!.addObserver(context);
    /*
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _showItemDialog(message);
      },
       onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        //_navigateToItemDetail(message);
      },
    );

    */
    NotificationPermissions.requestNotificationPermissions();

    FirebaseMessaging.instance.getInitialMessage()
        .then((RemoteMessage? initialMessage) async {
      // print('haloooooo bandung 123');

      try {
        var data = initialMessage!.data['message'];
        // var  data1 = initialMessage!.data['type'];

        final document = parse(data + '</br>');
        final recentNews = document.getElementsByTagName('a');
        String peer = '';
        final hrefs = document
            .getElementsByTagName('a')
            .where((e) => e.attributes.containsKey('href'))
            .map((e) => e.attributes['href'])
            .toList();

        AndroidNotification? android = initialMessage.notification?.android;

        if (recentNews.isNotEmpty) {
          peer = recentNews[0].text;
        }

        //print(hrefs);
        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (notification != null && android != null) {
          /*AbdiBangsaIslami
        //url = '${url!.substring(0, url!.indexOf(url!.split('/')[7]))}${item.item.user_name}

         */
          // print('haloooooo boy');

          // if(data1.contains('message')){

          // }else {

          if (hrefs.isNotEmpty) {
            if (hrefs.last!.contains('show_conversation')) {
              String payload;

              if (hrefs.last!.contains('my_projects')) {
                payload = '${hrefs.last! + '*' + peer}***l';
              } else {
                payload = '${hrefs.last! + '/*' + peer}***l';
              }

/*
            AppProvider.getRouter(context)! .navigateTo(
                context,
                urlToRoute(payload));

 */
              if (hrefs.last!.contains('my_projects')) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowConversationMyProjects(
                          id: payload.split('/')[6],
                          title: payload.split('/')[7],
                          id1: payload.split('/')[8],
                          cb: AppProvider.getApplication(context).chat)),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowConversationMyBids(
                          id: payload.split('/')[6],
                          title: payload.split('/')[7],
                          id1: payload.split('/')[8],
                          cb: AppProvider.getApplication(context).chat)),
                );
              }
            } else if (hrefs.last!.contains('show_thread')) {
              var payload =
                  '${hrefs.last!.substring(0, hrefs.last!.indexOf(hrefs.last!.split('/')[7])) + peer}*20**l';
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowThreadMyProjects(
                        id: payload.split('/')[6],
                        title: '${payload.split('/')[7]}*20**l',
                        cb: AppProvider.getApplication(context).chat)),
              );

              /*
            AppProvider.getRouter(context)! .navigateTo(
                context,
                urlToRoute(payload));

             */

            } else {
              if (initialMessage.data['type'] == 'message') {
                AppProvider.getApplication(context).chat!.lg(widget.id);
                //  print('haloooooo boy1');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        user: {
                          "thread": "${initialMessage.data['thread']}",
                          "username": "",
                          "userid": "${initialMessage.data['sender']}",
                          "display": "",
                          "avatar": "",
                          "lastmessage": "",
                          "lasttime": "1234567890"
                        },
                        userID: widget.id,
                        chatBloc: AppProvider.getApplication(context).chat,
                        trans: true,
                        ctx: context,
                      ),
                    )).then((value) async {
                  // cb.dispose();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('chatlink', true);
                });
              } else {
                AppProvider.getRouter(context)!
                    .navigateTo(context, urlToRoute(hrefs.last!));
              }
              ;
            }
          } else {
            if (initialMessage.data['type'] == 'message') {
              AppProvider.getApplication(context).chat!.lg(widget.id!);
              //  print('haloooooo boy1');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      user: {
                        "thread": "${initialMessage.data['thread']}",
                        "username": "",
                        "userid": "${initialMessage.data['sender']}",
                        "display": "",
                        "avatar": "",
                        "lastmessage": "",
                        "lasttime": "1234567890"
                      },
                      userID: widget.id,
                      chatBloc: AppProvider.getApplication(context).chat,
                      trans: true,
                      ctx: context,
                    ),
                  )).then((value) async {
                // cb.dispose();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('chatlink', true);
              });
            } else {}
          }
        }
      } catch (_) {}
    });

    //  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler) ;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      var data = message.data['message'];

      AndroidNotification? android = message.notification?.android;
      //print('ini data $data');

      //final document = parse(data +'</br><a>halooo</a></br>');
      final document = parse(data + '</br>');
      final recentNews = document.getElementsByTagName('a');
      String peer = recentNews[0].text;
      final hrefs = document
          .getElementsByTagName('a')
          .where((e) => e.attributes.containsKey('href'))
          .map((e) => e.attributes['href'])
          .toList();
      //print(hrefs);
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      // print("message recieved");

      if (notification != null && android != null) {
        /*AbdiBangsaIslami
        //url = '${url!.substring(0, url!.indexOf(url!.split('/')[7]))}${item.item.user_name}

         */
        // print("message recieved");
        // print(message.notification.body);
        //  print('haloooooo boy');

        if (!mounted) return;
        setState(() {
          notifunread = notifunread + 1;
        });
        if (hrefs.last!.contains('show_conversation')) {
          if (hrefs.last!.contains('my_projects')) {
            print('ini notif1 $hrefs');
            _showNotificationPush(
                notification.body!,
                notification.title!,
                hrefs.last! + '*' + peer + '*' + '1234',
                AppProvider.getApplication(context).chat);
          } else {
            print('ini notif2 $hrefs');
            _showNotificationPush(
                notification.body!,
                notification.title!,
                hrefs.last! + '/*' + peer + '*' + '1234',
                AppProvider.getApplication(context).chat);
          }
        } else if (hrefs.last!.contains('show_thread')) {
          print('ini notif3 $hrefs');
          _showNotificationPush(
              notification.body!,
              notification.title!,
              hrefs.last!.substring(
                      0, hrefs.last!.indexOf(hrefs.last!.split('/')[7])) +
                  peer,
              AppProvider.getApplication(context).chat);
        } else {
          print('ini notif4 $hrefs');
          _showNotificationPush(
              notification.body!,
              notification.title!,
              hrefs.last! + '*' + '1234',
              AppProvider.getApplication(context).chat);
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      var data = message.data['message'];
      var data1 = message.data['type'];

      AndroidNotification? android = message.notification?.android;

      //print(hrefs);
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      /*AbdiBangsaIslami
        //url = '${url!.substring(0, url!.indexOf(url!.split('/')[7]))}${item.item.user_name}

         */
      print('haloooooo boy');
      if (notification != null && android != null) {
        /*AbdiBangsaIslami
        //url = '${url!.substring(0, url!.indexOf(url!.split('/')[7]))}${item.item.user_name}

         */

        //  String notif = _getNotif();

        if (data1.contains('message')) {
          print('haloooooo boy1');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(
                  user: {
                    "thread": "${message.data['thread']}",
                    "username": "",
                    "userid": "${message.data['sender']}",
                    "display": "",
                    "avatar": "",
                    "lastmessage": "",
                    "lasttime": "1234567890"
                  },
                  userID: message.data['sender'],
                  chatBloc: AppProvider.getApplication(context).chat,
                  trans: true,
                  ctx: context,
                ),
              )).then((value) async {
            // cb.dispose();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('chatlink', true);
          });
        } else {
          print('haloooooo boy2');
          final document = parse(data + '</br>');
          final recentNews = document.getElementsByTagName('a');
          String peer = recentNews[0].text;
          final hrefs = document
              .getElementsByTagName('a')
              .where((e) => e.attributes.containsKey('href'))
              .map((e) => e.attributes['href'])
              .toList();

          //  print('haloooooo boy');
          if (hrefs.last!.contains('show_conversation')) {
            String payload;

            if (hrefs.last!.contains('my_projects')) {
              payload = '${hrefs.last! + '*' + peer}***l';
            } else {
              payload = '${hrefs.last! + '/*' + peer}***l';
            }

            /*
            AppProvider.getRouter(context)! .navigateTo(
                context,
                urlToRoute(payload));

             */
            if (hrefs.last!.contains('my_projects')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowConversationMyProjects(
                        id: payload.split('/')[6],
                        title: payload.split('/')[7],
                        id1: payload.split('/')[8],
                        cb: AppProvider.getApplication(context).chat)),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowConversationMyBids(
                        id: payload.split('/')[6],
                        title: payload.split('/')[7],
                        id1: payload.split('/')[8],
                        cb: AppProvider.getApplication(context).chat)),
              );
            }
          } else if (hrefs.last!.contains('show_thread')) {
            var payload =
                '${hrefs.last!.substring(0, hrefs.last!.indexOf(hrefs.last!.split('/')[7])) + peer}*20**l';

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowThreadMyProjects(
                      id: payload.split('/')[6],
                      title: '${payload.split('/')[7]}*20**l',
                      cb: AppProvider.getApplication(context).chat)),
            );

/*
            AppProvider.getRouter(context)! .navigateTo(
                context,
                urlToRoute(payload));

 */

          } else if (hrefs.last!.contains('my_projects/view')) {
            SubModelController? check;
            String delPath = hrefs.last!;
            check = SubModelController(
                AppProvider.getApplication(context), delPath, null);
            var data = await check.getData();
            if (jsonEncode(data).contains('admin_note')) {
              // print('horeeeee lagi gun');
              AppProvider.getRouter(context)!
                  .navigateTo(context, urlToRoute(hrefs.last!))
                  .catchError((onError) {
                AppProvider.getRouter(context)!.pop(context);
              });
            } else {
              //https://projects.co.id/public/browse_projects/view/3cd918/slicing-figma-to-wordpress
              AppProvider.getRouter(context)!
                  .navigateTo(
                      context,
                      urlToRoute(
                          'https://projects.co.id/public/browse_projects/view/${hrefs.last!.split('\/')[6]}/service-order-from-martabakbangka-artikrl-kesehatan'))
                  .catchError((onError) {
                AppProvider.getRouter(context)!.pop(context);
              });
            }
            // print(data);
          } else {
            // https://projects.co.id/public/chat/1234abc/567def
            if (data1.contains('message')) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      user: {
                        "thread": "${message.data['thread']}",
                        "username": "",
                        "userid": "${message.data['sender']}",
                        "display": "",
                        "avatar": "",
                        "lastmessage": "",
                        "lasttime": "${message.data['time']}"
                      },
                      userID: message.data['sender'],
                      chatBloc: AppProvider.getApplication(context).chat,
                      trans: true,
                      ctx: context,
                    ),
                  )).then((value) async {
                // cb.dispose();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('chatlink', true);
              });
              /*
              var peer;
              if(widget.id != hrefs.last!.split('/')[5]){
                peer = hrefs.last!.split('/')[5];
              }else{
                peer = hrefs.last!.split('/')[6];
              }

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      user: {

                        "thread":"${hrefs.last!.split('/')[5]}/${hrefs.last!.split('/')[6]}",
                        "username":"",
                        "userid":"$peer",
                        "display":"",
                        "avatar":"",
                        "lastmessage":"",
                        "lasttime":"1234567890"

                      },
                      userID : peer,
                      chatBloc : AppProvider.getApplication(context).chat,
                      trans : true,
                      ctx: context,
                    ),
                  )
              ).then((value)async{
                // cb.dispose();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('chatlink', true );
              });

               */
            } else {
              AppProvider.getRouter(context)!
                  .navigateTo(context, urlToRoute(hrefs.last!));
            }
          }
        }
      }
    });

    /*

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _homeScreenText = "Push Messaging token: $token";
      });
      print(_homeScreenText);
    });

     */
    //  if(widget.id != ''){print('ini encode id   == ${widget.id}');}

    if (widget.id != '') {
      messaging.subscribeToTopic(widget.id!);
      //print('halooooo 123 ${widget.id}');
    }
    // if(widget.id != ''){
    //         initMsg(context);
    getApplicationDocumentsDirectory().then((value) {
      APIProvider projectsAPIProvider = APIProvider(value.path);
      var future = projectsAPIProvider
          .getData(Env.value!.baseUrl! + '/public/program/mobile_init');

      future.then((value) {
        try {
          if (!mounted) return;
          // print('hanya satu kali 1');
          setState(() {
            if (widget.id != '') {
              notifunread = value['notif_count'];
            }
          });
        } catch (e) {
          if (!mounted) return;
          setState(() {
            notifunread = 0;
          });
        }
      });
    });
    // }
    if (widget.id != '') {
      getApplicationDocumentsDirectory().then((value) {
        APIProvider projectsAPIProvider = APIProvider(value.path);
        final future = projectsAPIProvider
            .getData(Env.value!.baseUrl! + '/user/program/ping');
        future.then((value) {
          try {
            jsonDecode(value);

            projectsAPIProvider.userLogin(username, forlgn);
          } catch (e) {
            if (value!.length > 0) {
              projectsAPIProvider.userLogin(username, forlgn);
              // print('saya disini$value v');
            } else {
              // print('saya disini cccc');
            }
          }
        });
      });
      _timer = Timer.periodic(const Duration(milliseconds: 300000), (timer) {
        getApplicationDocumentsDirectory().then((value) {
          APIProvider projectsAPIProvider = APIProvider(value.path);
          final future = projectsAPIProvider
              .getData(Env.value!.baseUrl! + '/user/program/ping');
          /*
          future.then((value) {

              try {
                jsonDecode(value);
                 projectsAPIProvider.userLogin(username,forlgn  ) ;
              } catch (e) {
                if(value!.length > 0){
                   projectsAPIProvider.userLogin(username,forlgn  ) ;
                 // print('saya disini$value v');
                }else{
                  //print('saya disini cccc');
                }

              }


          });

           */
        });
      });
    }

    // _firebaseMessaging
    //  .unsubscribeFromTopic('');

    // initNotifState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    /*
   // futureNotif = Future.value(0);
    if(AppProvider.getApplication(context).chat == null)  AppProvider.getApplication(context).chat =    ChatBloc();

   // if(widget.id == '')

   // AppProvider.getApplication(context).chat!.wsSetHandlers();
    //AppProvider.getApplication(context).chat!.lgn(widget.id);
    print('widget id1 === ${widget.id}');
    //AppProvider.getApplication(context).chat!.thread = [];

    if(widget.id != '') AppProvider.getApplication(context).chat!.lg(widget.id);
    */

    //  if(widget.id != '') _checkNotif();

    /*
    Home =     SubModelController(AppProvider.getApplication(context),
        Env.value!.baseUrl! + '/public/home',
        null);

     */
    ListActivities!.clear();
    // _tabController!.animateTo(3);

    if (widget.id != '') _checkCart();
    _tabController!.addListener(_handleTabSelection);
  }

  String toPicFile(String json) {
    if (json.contains('chat-file') || json.contains('chat-file')) {
      return 'ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â°ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã¢â‚¬Å“ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â½ Attachment';
    } else if (json.contains('chat-image') || json.contains('chat-image')) {
      return 'ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â°ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã¢â‚¬Å“ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â· Image';
    } else {
      return json;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        {
          print("Inactive");
          isBackground = false;
          /*
          getApplicationDocumentsDirectory().then((value){
            APIProvider projectsAPIProvider = APIProvider(value!.path);
            final future = projectsAPIProvider.getData(
                'https://api.projects.co.id/user/program/ping');
            future.then((value) {

              try {
                jsonDecode(value);

                  projectsAPIProvider.userLogin(username,forlgn  ) ;
              } catch (e) {
                if(value!.length > 0){
                    projectsAPIProvider.userLogin(username,forlgn  ) ;
                  // print('saya disini$value v');
                }else{
                  // print('saya disini cccc');
                }

              }


            });



          });

           */
        }
        break;
      case AppLifecycleState.paused:
        print("Paused");

        isBackground = true;

        getApplicationDocumentsDirectory().then((value) {
          APIProvider projectsAPIProvider = APIProvider(value.path);
          final future = projectsAPIProvider
              .getData(Env.value!.baseUrl! + '/user/program/ping');
          future.then((value) {
            try {
              jsonDecode(value);

              projectsAPIProvider.userLogin(username, forlgn);
            } catch (e) {
              if (value!.length > 0) {
                projectsAPIProvider.userLogin(username, forlgn);
                // print('saya disini$value v');
              } else {
                // print('saya disini cccc');
              }
            }
          });
        });
        break;
      case AppLifecycleState.resumed:
        {
          print("Resumed");

          isBackground = false;
          setState(() {
            permissionStatusFuture = getCheckNotificationPermStatus();
          });

          /*
          getApplicationDocumentsDirectory().then((value){
            APIProvider projectsAPIProvider = APIProvider(value!.path);
            final future = projectsAPIProvider.getData(
                'https://api.projects.co.id/user/program/ping');
            future.then((value) {

              try {
                jsonDecode(value);

                  projectsAPIProvider.userLogin(username,forlgn  ) ;
              } catch (e) {
                if(value!.length > 0){
                    projectsAPIProvider.userLogin(username,forlgn  ) ;
                  // print('saya disini$value v');
                }else{
                  // print('saya disini cccc');
                }

              }


            });



          });

           */

        }
        break;
      case AppLifecycleState.detached:
        {
          isBackground = false;

          print("Suspending");
          /*
          getApplicationDocumentsDirectory().then((value){
            APIProvider projectsAPIProvider = APIProvider(value!.path);
            final future = projectsAPIProvider.getData(
                'https://api.projects.co.id/user/program/ping');
            future.then((value) {

              try {
                jsonDecode(value);

                  projectsAPIProvider.userLogin(username,forlgn  ) ;
              } catch (e) {
                if(value!.length > 0){
                    projectsAPIProvider.userLogin(username,forlgn  ) ;
                  // print('saya disini$value v');
                }else{
                  // print('saya disini cccc');
                }

              }


            });



          });

           */
        }
        break;
      default:
        isBackground = false;
        break;
    }
  }

  Future<void> _showFullScreenNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'full screen channel id', 'full screen channel name',
                priority: Priority.high,
                importance: Importance.high,
                fullScreenIntent: true)),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);

    Navigator.pop(context);
  }

  Future<String> _getNotif() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('notification') ?? '';
  }

  _setNotif(String ntf) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('notification', ntf);
  }

  Future<void> _showNotificationPush(
      String msg, String title, var data, ChatBloc? cb) async {
    final List<String> lines = <String>[msg];
    var inboxStyleInformation = InboxStyleInformation(lines,
        htmlFormatLines: true,
        contentTitle: title,
        htmlFormatContentTitle: true,
        summaryText: title,
        htmlFormatSummaryText: true);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max,
        priority: Priority.max,
        ticker: 'ticker',
        styleInformation: inboxStyleInformation);
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    flutterLocalNotificationsPlugin.initialize(initializationSettings!,
        onSelectNotification: (String? payload) async {
      if (payload != null && !payload.isEmpty) {
        debugPrint('notification payload123: $payload');

        if (payload.contains('show_conversation')) {
          payload = '$payload***l';

          await _setNotif(payload);

          //  print('haloooooooooooo');

          /*

              AppProvider.getRouter(context)! .navigateTo(
                  context,
                  urlToRoute(payload));

               */

          if (payload.contains('my_projects')) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowConversationMyProjects(
                      id: payload!.split('/')[6],
                      title: payload.split('/')[7],
                      id1: payload.split('/')[8],
                      cb: cb)),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowConversationMyBids(
                      id: payload!.split('/')[6],
                      title: payload.split('/')[7],
                      id1: payload.split('/')[8],
                      cb: cb)),
            );
          }
        } else if ((payload.contains('chat'))) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(
                  user: {
                    "thread": "${jsonDecode(msgpusher)['thread']}",
                    "username": "${jsonDecode(msgpusher)['display']}",
                    "userid": "${jsonDecode(msgpusher)['sender']}",
                    "display": "${jsonDecode(msgpusher)['display']}",
                    "avatar": "",
                    "lastmessage": "",
                    "lastseen": jsonDecode(msgpusher)['time'],
                    "lasttime": jsonDecode(msgpusher)['time']
                  },
                  userID: widget.id,
                  chatBloc: cb,
                  trans: true,
                  ctx: context,
                ),
              ));
        } else if (payload.contains('show_thread')) {
          payload = '$payload*20**l';

          await _setNotif(payload);

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowThreadMyProjects(
                    id: payload!.split('/')[6],
                    title: '${payload.split('/')[7]}*20**l',
                    cb: cb)),
          );

          //  print('haloooooooooooo');
          /*
              AppProvider.getRouter(context)! .navigateTo(
                  context,
                  urlToRoute(payload));

               */
        } else {
          await _setNotif(payload);
          await AppProvider.getRouter(context)!
              .navigateTo(context, urlToRoute(payload));
        }
      }
      selectNotificationSubject.add(payload!);
    });
    /* await AppProvider..flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x'); */
    int id;
    switch (title) {
      case 'activity':
        {
          id = 0;
        }
        break;
      case 'notify':
        {
          id = 1;
        }
        break;
      case 'testimony':
        {
          id = 2;
        }
        break;
      case 'kick':
        {
          id = 3;
        }
        break;
      case 'message':
        {
          id = 4;
        }
        break;
      default:
        {
          id = 5;
        }
        break;
    }
    await flutterLocalNotificationsPlugin
        .show(id, title, msg, platformChannelSpecifics, payload: data);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      // print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result!);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() {
          _connectionStatus = 'wifi';
        });
        break;
      case ConnectivityResult.mobile:
        setState(() => _connectionStatus = 'mobile');
        break;
      case ConnectivityResult.none:
        setState(() {
          _connectionStatus = 'offline';
          hide = false;
        });
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
/*
  void _showItemDialog(Map<String, dynamic> message) {
    showDialog<bool>(
      context: context,
      builder: (_) => _buildDialog(context, _itemForMessage(message)),
    ).then((bool shouldNavigate) {
      if (shouldNavigate == true) {
        _navigateToItemDetail(message);
      }
    });
  }

 */

  Widget _buildDialog(BuildContext context, Item item) {
    return AlertDialog(
      content: Text("Message body: ${item.itemId}"),
      actions: <Widget>[
        FlatButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        FlatButton(
          child: const Text('SHOW'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }

  void _navigateToItemDetail(Map<String, dynamic> message) {
    final Item item = _itemForMessage(message);
    // Clear away dialogs
    Navigator.popUntil(context, (Route<dynamic> route) => route is PageRoute);
    if (!item.route.isCurrent) {
      Navigator.push(context, item.route);
    }
  }
/*
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        permissionStatusFuture = getCheckNotificationPermStatus();
      });
    }
  }

 */

  /// Checks the notification permission status
  Future<String> getCheckNotificationPermStatus() {
    return NotificationPermissions.getNotificationPermissionStatus()
        .then((status) {
      switch (status) {
        case PermissionStatus.provisional:
          return permProvisional;
        case PermissionStatus.denied:
          return permDenied;
        case PermissionStatus.granted:
          return permGranted;
        case PermissionStatus.unknown:
          return permUnknown;
      }
    });
  }

  Future<void> _checkCart() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    APIProvider projectsAPIProvider = APIProvider(appDocPath);
    // APIProvider apv;
    final cart = projectsAPIProvider.getViewDataCart(
        Env.value!.baseUrl! + '/user/cart/view/%s/%s', '', '1');
    cart.then((value) {
      try {
        if (value!.model!.model!.cart_items.items.isNotEmpty) {
          // print('okkkkkkkkkkkkkkkkkkkkkkkkk');
          setState(() {
            cartcount = value.model!.model!.cart_items.items.length;
          });
        } else {
          cartcount = 0;
          if (!mounted) return;
          setState(() {
            cartcount = 0;
          });

          //  print('nokkkkkkkkkkkkkkkkkkkkkkkkk');
        }
      } catch (e) {}

      //  print('hereeeeeeeeeeeeeee');
    });
  }

  Future<void> _checkNotif(BuildContext context) async {
    DatabaseHelper _db;
    //DBRepository projectsDBRepository = DBRepository(_db.database);
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    bool list = false;
    var templist = [];
    APIProvider projectsAPIProvider = APIProvider(appDocPath);
    final listnotif = apiRepProvider!.loadHomeList1('');
    listnotif.then((value) {
      if (value!.isNotEmpty) {
        //  print('okkkkkkkkkkkkkkkkkkkkkkkkk');
        templist = value;

        // setState(() {
        // notifunread = value.length;

        // });
      } else {
        //setState(() {
        list = true;
        //});

        //print('nokkkkkkkkkkkkkkkkkkkkkkkkk');
      }
      //  print('hereeeeeeeeeeeeeee');
    });
    int output = 0;
    // APIProvider apv;
    final notif = projectsAPIProvider.getListHome(
        Env.value!.baseUrl! + '/user/home?page=%s', 1);
    notif.then((value) {
      if (value!.items.items.isNotEmpty) {
        //
        if (templist.isNotEmpty) {
          int n = 0;
          // print('hemmmmm123 ${templist.length.toString()}');
          value.items.items.forEach((element) {
            templist.forEach((element1) {
              if (element1.item.notification_id ==
                  element.item.notification_id) {
                output++;
              }
            });

            //  n++;
          });
          //  setState(() {
          //  notifunread = value.items.items.length - output;
          //  print('hemmmmm ${output.toString()}');
          //  });
        } else {
          //   print('hemmmmm');
          //  setState(() {
          //  notifunread = value.items.items.length;

          //  });
        }
        //  print('okkkkkkkkkkkkkkkkkkkkkkkkk');

      } else {
        // setState(() {
        notifunread = 0;
        // });

        // print('nokkkkkkkkkkkkkkkkkkkkkkkkk');
      }
      //  print('hereeeeeeeeeeeeeee');
    });
  }

  Future<void> _handleTabSelection() async {
    if (widget.id != '') {
      await _checkCart();
      // await _checkNotif(context);
    }
    if (_tabController!.index== 1) {
      if (!mounted) return;
      setState(() {
        notifunread = 0;
      });
      //print('halo coy');
    }

    setState(() {});
  }

  @override
  void dispose() {
    _scrollViewController!.dispose();

    _tabController!.dispose();
    if (_navigationViews != null) {
      for (NavigationIconView? view in _navigationViews!)
        view!.controller!.dispose();
    }
    // subscription.cancel();
    _connectivitySubscription!.cancel();
    // AppProvider.getApplication(context).chat!.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    // TODO: Dispose a BannerAd object
    // _bannerAd.dispose();
    super.dispose();
  }

  Future<void> initNotifState(String msg) async {
    // print('ini message   ==   $msg');
    _showNotification(msg);
    /* pusherConnect.onRecievedEvents.listen((OnRecievedEvent event) {
      setState(() {
        /* if(event.data['type']=='activity') {
          print(event.data.toString());
          _showNotification(event.data['date'], event.data['message']);
        } */
        if(event.data['type']== null ) {
          print(event.data.toString());
          _showNotification(event.data['message']);
        }
      });
    }); */
  }

  Future<void> _showNotification(String msg) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    /* await AppProvider..flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x'); */
    await AppProvider.getApplication(context)
        .flutterLocalNotificationsPlugin!
        .show(0, 'Notify', msg, platformChannelSpecifics, payload: 'item x');
  }

  Future<void> onSelectNotification(String payload) async {
    if (payload != null) {
      // debugPrint('notification payload: ' + payload);

    }
    if (payload.indexOf('My Purchase :') == -1) {
      //await AppProvider.getRouter(context)! .navigateTo(context, '/projectscoid');

    }

    if (payload.contains('show_conversation')) {
      payload = '$payload***l';

      await _setNotif(payload);

      //  print('haloooooooooooo');

      /*

              AppProvider.getRouter(context)! .navigateTo(
                  context,
                  urlToRoute(payload));

               */

      if (payload.contains('my_projects')) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowConversationMyProjects(
                  id: payload.split('/')[6],
                  title: payload.split('/')[7],
                  id1: payload.split('/')[8],
                  cb: AppProvider.getApplication(context).chat)),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowConversationMyBids(
                  id: payload.split('/')[6],
                  title: payload.split('/')[7],
                  id1: payload.split('/')[8],
                  cb: AppProvider.getApplication(context).chat)),
        );
      }
    } else if (payload.contains('show_thread')) {
      payload = '$payload*20**l';

      await _setNotif(payload);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShowThreadMyProjects(
                id: payload.split('/')[6],
                title: '${payload.split('/')[7]}*20**l',
                cb: AppProvider.getApplication(context).chat)),
      );

      //  print('haloooooooooooo');
      /*
              AppProvider.getRouter(context)! .navigateTo(
                  context,
                  urlToRoute(payload));

               */
    } else if ((payload.contains('chat'))) {
      // debugPrint('notification payload2: $payload');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              user: {
                "thread": "${jsonDecode(msgpusher)['thread']}",
                "username": "${jsonDecode(msgpusher)['display']}",
                "userid": "${jsonDecode(msgpusher)['sender']}",
                "display": "${jsonDecode(msgpusher)['display']}",
                "avatar": "",
                "lastmessage": "",
                "lastseen": jsonDecode(msgpusher)['time'],
                "lasttime": jsonDecode(msgpusher)['time']
              },
              userID: widget.id,
              chatBloc: AppProvider.getApplication(context).chat,
              trans: true,
              ctx: context,
            ),
          ));
    } else {
      await _setNotif(payload);
      await AppProvider.getRouter(context)!
          .navigateTo(context, urlToRoute(payload));
    }

    /*  await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen(payload)),
    ); */
  }
/*
  Future<void> initDownloadsDirectoryState() async {
    Directory downloadsDirectory;
    List<Directory> dd;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
      // print( 'path ===== ${downloadsDirectory}');
    } on PlatformException {
     // print('Could not get the downloads directory');
    }

    /* if (Platform.isAndroid) {
     // downloadsDirectory  = await getDownloadsDirectory();
     // print( 'path ===== ${dd[0]}');
     // print( 'path ===== ${dd[1]}');
     // print( 'path ===== ${dd[3]}');
     // print( 'path ===== ${downloadsDirectory}');

    } else {
      downloadsDirectory  = (await getApplicationDocumentsDirectory());
    } */

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _downloadsDirectory = downloadsDirectory;
    });
  }

 */

  Future<void> onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title!),
        content: Text(body!),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              if (title.indexOf('My Purchase :') == -1) {
                Navigator.of(context, rootNavigator: true).pop();
                await AppProvider.getRouter(context)!
                    .navigateTo(context, '/Projectscoid');
              } else {}
            },
          )
        ],
      ),
    );
  }

/*  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _navigationViews)
      transitions.add(view.transition(_type, context));

    // We want to have the   ly animating (fading in) views on top.

    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

      return Stack(children: transitions);


  } */

  /*IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  } */

  Future<void> loggedOut(BuildContext context) async {
    // AppProvider.getApplication(context).chat!.socketClose();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Log Out',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: const Text('Ingin Log Out?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {

              //await messaging.unsubscribeFromTopic(widget.id!);
              AppProvider.getApplication(context).chat!.deleteThread();
              AppProvider.getApplication(context).chat!.dispose();
            //  print('halooooo ${widget.id}');
             // await messaging.unsubscribeFromTopic(widget.id!);
              _timer!.cancel();

              await logout!.getData();




              messaging.unsubscribeFromTopic(widget.id!);
              SC.SchedulerBinding.instance!.addPostFrameCallback((_) {
                BlocProvider.of<AuthenticationController>(context)
                    .add(LoggedOut());
              });




              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => Login(
                          application: context,
                          isLogin: false,
                        )),
                (Route<dynamic> route) => false,
              );
            },

            /*Navigator.of(context).pop(true)*/
            child: const Text('Ya'),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Tidak'),
          ),
        ],
      ),
    );

    // SC.SchedulerBinding.instance!.addPostFrameCallback((_) {
    /*
     Navigator.pushAndRemoveUntil(
       context,
       MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
           (Route<dynamic> route) => false,
     );

    */
    // });

    //  Navigator.pop(context);

    // AppProvider.getRouter(context)! .navigateTo(
    //     context,
    //      "/login/0");

    // _authenticationBloc.add(LoggedOut());
    /*  AppProvider.getRouter(context)! .navigateTo(
        context,
        "/"); */

    //  Login();
    //Navigator.pop(context); // Dismiss the drawer.
    /* _scaffoldKey.currentState.showSnackBar(const SnackBar(
        content: Text("The drawer's items don't do anything")
    )); */
  }

  void loggedIn() {
    // Login(application: context, isLogin: true);
    // Navigator.pop(context);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
    // );
    //AppProvider.getApplication(context).chat!.dispose();

    SC.SchedulerBinding.instance!.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Login(
                  application: context,
                  isLogin: true,
                )),
        (Route<dynamic> route) => true,
      );
    });

    // AppProvider.getRouter(context)! .navigateTo(
    //     context,
    //     "/login/1");
    // BlocProvider.of<AuthenticationController>(context).add(LoggedOut());
    /*AppProvider.getRouter(context)! .navigateTo(
        context,
        "/"); */

    /* AppProvider.getRouter(context)! .navigateTo(
        context,
        "/login/1"); */
    //  Login();
    //Navigator.pop(context); // Dismiss the drawer.
    /* _scaffoldKey.currentState.showSnackBar(const SnackBar(
        content: Text("The drawer's items don't do anything")
    )); */
  }

  void addController(String controllerID) {
    AppProvider.getRouter(context)!
        .navigateTo(context, controllerID + '/listing/$username');
  }

  void addController4(String controllerID) {
    AppProvider.getRouter(context)!
        .navigateTo(context, controllerID + '/index/$username');
  }

  void addController2(String controllerID) {
    AppProvider.getRouter(context)!
        .navigateTo(context, controllerID + '/listing');
  }

  void addController3(String controllerID) {
    AppProvider.getRouter(context)!
        .navigateTo(context, controllerID + '/view' + '//');
  }

  void addController1(String controllerID) {
    AppProvider.getRouter(context)!.navigateTo(context, controllerID + '/view');
  }

  void showSetting() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Setting(id: widget.id)),
    );
    //  AppProvider.getRouter(context)! .navigateTo(
    //     context,
    //    "/setting");
    // AppProvider.getRouter(context)! .pop(context);

    //  Login();
    // Navigator.pop(context); // Dismiss the drawer.
    /* _scaffoldKey.currentState.showSnackBar(const SnackBar(
        content: Text("The drawer's items don't do anything")
    )); */
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarHide = false;
    });
  }

  void _onScroll() {
    // final maxScroll = _scrollViewController!.position.maxScrollExtent;
    // final currentScroll = _scrollViewController!.position.pixels;
    appBarHide = true;
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  Future<void> setPref1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('chat_link', '');
  }

  fetchData(AccountController? accountController, BuildContext context,
      String? id) async {
    final ftr = _getChatSharedPrefs();
    ftr.then((value) {
      //   print('ini dari chat deep link 124 ====  $value   ');
      if (value!.contains('chat')) {
        // print('ini dari chat deep link ====  $value   ');
        _tabController!.animateTo(3);
      } else {
        if (value != "") {
          print('link aku $value');
          if (value.contains('/public/  _user/verify/')) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerifyNewUser(
                      id: value.split('/')[6], title: value.split('/')[7]),
                ));
          } else {
            AppProvider.getRouter(context)!
                .navigateTo(context, urlToRoute(value));
          }
          setPref1();
        }
        /*
        else{

          Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => PublicPageView(title : "account_activated", id : 200, isDark: false, cb : null),
                  transitionDuration: Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }),
                  (Route<dynamic> route) => true
          );


        }

         */
      }
    });

    final ct = _getChatPrefs();
    ct.then((value) {
      if (value!) {
        //  print('iam here1');
        AppProvider.getApplication(context)
            .chat!
            .wsSetHandlerssp(false)
            .then((value) async {
          //  print('iam here2');
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('chatlink', false);
          AppProvider.getApplication(context).chat!.lg(widget.id);
          AppProvider.getApplication(context).chat!.getFirstIndex(1);
        });
      }
    });

    // hasher = md5 ;
    //  var vlll = generateMd5('12345678910');
    //  print('MD5 === $vlll');
    if (listAccount == null) {
      listAccount = [];
      final future = accountController!.getAccount();
      future.then((val) {
        // print('val===='+ val.toString());
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }

        listAccount.addAll(val);

        var ntf = 0;
        for (var map in listAccount) {
          username = map['user_name'];
          userDisplayName = map['user_display'];
          userPhoto = map['user_photo'];
          userID = map['user_hash'];
          forlgn = map['password'];
          ntf = int.parse(map['notif_count']);
        }
        //  notifunread = ntf;
        AppProvider.getApplication(context).chat!.setUsername(username);
      }).catchError((Error) {
        /*
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
        });

         */
      });
    } else {
      for (var map in listAccount) {
        username = map['user_name'];
        userDisplayName = map['user_display'];
        userPhoto = map['user_photo'];
        userID = map['user_hash'];
        // ntf = int.parse(map['notif_count']);
      }

      if (firstimeConnect) {
        if (AppProvider.getApplication(context).chat!.socket == null) {
          //  AppProvider.getApplication(context).chat!.socket.connect();
          if (id != '') {
            AppProvider.getApplication(context).chat!.lg(userID);
            firstimeConnect = false;
          }
        } else {
          if (id != '') {
            AppProvider.getApplication(context).chat!.lg(id);
            // print('aku ada dsini');
            firstimeConnect = false;
          }
        }
      }

      /*
      AppProvider.getApplication(context).chat!.socket.connect();
      if(AppProvider.getApplication(context).chat!.socket == null){
        AppProvider.getApplication(context).chat!.socket.connect();
        if(id != '' ){
          AppProvider.getApplication(context).chat!.lg(userID);

        }

      }else{
        if(id != '' ){
          AppProvider.getApplication(context).chat!.lg(userID);

        }
      }



       */
      setState(() {
        isLoading = false;
      });
    }
    ;
    if (userPhoto != '') {
      await setAvaPref(userPhoto);
    }
  }
/*
  settingPusher()async{
    await Pusher.connect(onConnectionStateChange: (x) async {
      if (mounted)
        setState(() {
          lastConnectionState = x.currentState;
        });
    }, onError: (x) {
      debugPrint("Error: ${x.message}");
    });
   // await Pusher.unsubscribe('activity');
    channel =
    await Pusher.subscribe('activity');
    await channel.bind('notif', (x) {
      if (mounted)
        setState(() {
          lastEvent = x;
         // print('ini activity = ${x.data}');
          initNotifState(lastEvent.data);
        });
    });


  }


 */
  /*
  Widget  buildSearchBar(String title){
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
        //alignment: Alignment.topCenter,
        height: 80.0,
        child: TextField(
          controller: searchBoxController,
          style:    TextStyle(
              fontSize: 14.0,
              height: 0.2,
              color: Colors.black
          ),

          onTap:(){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagesWidget(),
                )
            );

          },

          decoration: const InputDecoration(
            fillColor: Color(0xFFffe4b2),

            filled: true,
            hintText: 'Search Projects',
            // hintStyle: TextStyle(color: Colors.grey[500]),
            hintStyle: TextStyle(fontSize: 15, color: Colors.black38),
            // border: InputBorder.none,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(3.0)) , gapPadding: 2.0),
          ),
        )
    );
  }

   */

  notifRoute(BuildContext context) async {
    String ntf = await _getNotif();
    // print('saya di sini ini notifnya === $ntf');
    if (ntf.isNotEmpty) {
      await _setNotif('');
      await AppProvider.getRouter(context)!
          .navigateTo(context, urlToRoute(ntf));
    }
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      //  print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeManager = Provider.of<ThemeManager>(context);
    //_authenticationBloc = BlocProvider.of<AuthenticationController>(context);
    accountController = AccountController(
        AppProvider.getApplication(context), AppAction.listing);
    // AppProvider.getApplication(context).flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //  onSelectNotification: onSelectNotification);
    logout = SubModelController(AppProvider.getApplication(context),
        Env.value!.baseUrl! + '/public/home/logout', null);
    // AppProvider.getApplication(context).chat =  AppProvider.getApplication(context).chat;

/*

    AppProvider.getApplication(context).chat =  AppProvider.getApplication(context).chat; //

    if(widget.id != '') AppProvider.getApplication(context).chat!.lg(widget.id);

   // if(widget.id != '') AppProvider.getApplication(context).chat!.getFX(1);
    if(widget.isChat != null){
      if(widget.isChat){ _tabController!.animateTo(3);}
    }

 */

    AppProvider.getApplication(context).chat!.onMessage.listen((pusher) async {
      String title = jsonDecode(pusher)['type'];
      //final SharedPreferences prefs = await _prefs;
      String msg;
      switch (title) {
        case 'message':
          {
            //  print('ajaib');
            if (isBackground) {
              print('ajaib1 ');

              if (jsonDecode(pusher)['sender'] != userID) {
                //  print('ajaib2');
                var dsp = jsonDecode(pusher)['sendername'];
                msgpusher = pusher;
                // msg = dsp  +' : '+ toPicFile(jsonDecode(pusher)['message']);
                msg = toPicFile(jsonDecode(pusher)['message']);

                _showNotificationPush(
                    msg,
                    'Message from ${jsonDecode(pusher)['sendername']}',
                    'chat',
                    AppProvider.getApplication(context).chat);
                // _showNotificationPush(  msg, title!, 'chat',  AppProvider.getApplication(context).chat);

              }
            } else {
              // print('ajaib3 $pusher}');
              // print('ajob');
              if (jsonDecode(pusher)['sender'] != userID) {
                //  var dsp = '${jsonDecode(pusher)['senderavatar']}';
                // msg = '${jsonDecode(pusher)['sendername']}'  +' : '+ toPicFile(jsonDecode(pusher)['message']);
                msg = toPicFile(jsonDecode(pusher)['message']);
                msgpusher = pusher;

                if (AppProvider.getApplication(context).chat!.currentThread !=
                    jsonDecode(pusher)['thread']) {
                  _showNotificationPush(
                      msg,
                      'Message from ${jsonDecode(pusher)['sendername']}',
                      'chat',
                      AppProvider.getApplication(context).chat);

                  // _showNotificationPush(  msg, title!, 'chat',  AppProvider.getApplication(context).chat);
                } else {}
                //  _showNotificationPush(  msg, title!, 'chat',  AppProvider.getApplication(context).chat);
                // print('ajob1');

              }
            }
            if (jsonDecode(pusher)['sender'] != userID) {
              AppProvider.getApplication(context).chat!.getFirstIndex(1);
              //  print('halooooooocoyyyyyyyyyyy');
              if (mounted) {
                setState(() {});
              }
            }
          }
          break;

        default:
          {
            // print('ajaib');
          }
          break;
      }
    });

    fetchData(accountController, context, widget.id);

    // print('iam here');
    if (widget.id != '') {
      // AppProvider.getApplication(context).chat!.lg(widget.id);
      //     AppProvider.getApplication(context).chat!.getBlacklist(widget.id, context);
      //  if(AppProvider.getApplication(context).chat!.socket.){

      // }
      notifRoute(context);
    }
    // _tabController!.addListener(_handleTabSelection(context));
    //  if(widget.id != '') _checkNotif(context);
    //  FocusScope.of(context).unfocus();
    // FocusScope.of(context).requestFocus(   FocusNode());
    // settingPusher();
    themeManager.themeMode == ThemeMode.dark
        ? darkMode = true
        : darkMode = false;

    // print('user name === $username');

    if (_children.length < 5) {
      // _children.add(Text('hello'));

      _children.add(homeView(
        hasID: username != '' ? true : false,
        isDark: darkMode,
        ctx: context,
        scrollUp: (su) => setState(() => appBarHide = su!),
        activeFab: (fab) {
          activeFab = fab!;
        },
        notif: AppProvider.getApplication(context).chat,
      ));
      //  username == ''?  _children.add(Container(height:0.0, width:0.0, child : Center(child: Text('Silahkan Login terlebih dahulu.'),)))
      //      :
      _children.add(notification(
          title: '1',
          scrollUp: (su) => setState(() => appBarHide = su!),
          zeroNotif: (zn) => setState(() => notifunread = 0),
          ctx: context,
          notif: AppProvider.getApplication(context).chat,
          user: widget.id == '' ? 0 : 1,
          username: username,
          forlgn: forlgn));

      //  username == ''? _children.add(Container(height:0.0, width:0.0, child : Center(child: Text('Silahkan Login terlebih dahulu.'),)))
      //      :
      _children.add(CartView(
          title: '1',
          scrollUp: (su) => setState(() => appBarHide = su!),
          user: widget.id == '' ? 0 : 1,
          username: username,
          forlgn: forlgn));
      // _children.add(projectsView(title: '1', scrollUp: (su)=>  setState(() => appBarHide=su),account : account));
      // _children.add(servicesView(title: '1', scrollUp: (su)=> setState(() => appBarHide=su),account : account,));
      // _children.add(productsView(title: '1', scrollUp: (su)=> setState(() => appBarHide=su),account : account));
      // _children.add( MessagesWidget());

      //_children.add(Text('hello'));

      widget.id != ''
          ? _children.add(ThreadScreen(
              user: widget.id,
              chatBloc: AppProvider.getApplication(context).chat,
              ctx: context,
            ))
          : _children.add(Container(
              height: 0.0,
              width: 0.0,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    const Text(
                        'Silahkan Login terlebih dahulu.'), // Text('failed to ' + widget.title!),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login(
                                    application: context,
                                    isLogin: true,
                                  )),
                          (Route<dynamic> route) => true,
                        );
                      },
                      child:
                          const Text('Login', style: TextStyle(color: Colors.blue)),
                    ),
                  ]))));

      _children.add(guides(
          title: '1',
          scrollUp: (su) => setState(() => appBarHide = su!),
          isDark: darkMode,
          user: widget.id == '' ? 0 : 1));
    }
    // SystemChannels.textInput.invokeMethod('TextInput.hide');

    return isLoading
        ? const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          )))
        : topBarNav(context, size, widget.isChat,
            AppProvider.getApplication(context).chat);
    /*
    FutureBuilder(
                future: futureNotif,
                builder: (context, snapshot) {
                   //  print('ini === ${snapshot!.data.toJson().toString()}');
                      return topBarNav(context, size);
                   }
    );

     */

    //topBarNav(context, size);
  }

  void showInSnackBar(String value, BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  void showConnectivity() {
    Fluttertoast.showToast(
      msg: "Anda offline.",
      toastLength: Toast.LENGTH_SHORT,
      webBgColor: "#e74c3c",
      timeInSecForIosWeb: 5,
    );
  }

  Future<bool> _onWillPop() async {
    if (_tabController!.index== 0 && !activeFab) {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Exit',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              content: const Text('Are you sure you want to close this application?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                FlatButton(
                  onPressed: () => exit(0),
                  /*Navigator.of(context).pop(true)*/
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    } else {
      _tabController!.animateTo(0);
      return Future.value(false);
    }
    _tabController!.animateTo(0);
    return Future.value(false);
  }

  Future<String?> _getChatSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('chat_link')) {
      return prefs.getString('chat_link');
    } else {
      return '';
    }
  }

  Future<bool?> _getChatPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('chatlink')) {
      return prefs.getBool('chatlink');
    } else {
      return false;
    }
  }

  Future<void> setPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('chat_link', '');
  }

  Future<void> setAvaPref(String avatar) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('myavatar', avatar);
  }

  Widget topBarNav(
      BuildContext context, Size size, bool? isChat, ChatBloc? cb) {
    if (isChat != null) {
      if (isChat) {
        // setPref();
      }
    }

    //  print('mantaaaap');

    // if (widget.id != ''){FocusScope.of(context).unfocus();};
    //SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (_connectionStatus == 'offline') {
      setState(() {
        showConnectivity();
      });
    } else {}

    return WillPopScope(
        onWillPop: _onWillPop,
        child: DefaultTabController(
          length: choices.length,
          child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: _connectionStatus == 'offline' && !hide
                  ? Container(
                      width: size.width,
                      height: 50.0,
                      color: Colors.black87,
                      child: RawMaterialButton(
                          shape: const CircleBorder(),
                          child: const Text(
                            'Anda offline',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          onPressed: () {
                            setState(() {
                              hide = true;
                            });
                          }),
                    )
                  : Container(
                      width: 0.0,
                      height: 0.0,
                    ),
              endDrawer: SizedBox(
                width: size.width * (3 / 4),
                child: Drawer(
                  child: Column(
                    children: <Widget>[
                      MediaQuery.removePadding(
                        context: context,
                        // DrawerHeader consumes top MediaQuery padding.
                        removeTop: false,
                        child: Expanded(
                          child: ListView(
                            dragStartBehavior: DragStartBehavior.down,
                            padding: const EdgeInsets.only(top: 2.0),
                            children: <Widget>[
                              username == ''
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        UserAccountsDrawerHeader(
                                          accountName: username == ''
                                              ? const Text('Guest')
                                              : Text(username),
                                          accountEmail: username == ''
                                              ? const Text('')
                                              : Text(userDisplayName),
                                          currentAccountPicture: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: username == ''
                                                ? Image.asset(
                                                    'assets/img/security.png')
                                                : Image.network(userPhoto),
                                          ),
                                          decoration: darkMode
                                              ? const BoxDecoration(
                                                  color: Colors.black87,
                                                )
                                              : const BoxDecoration(
                                                  color: Colors
                                                      .transparent, //CurrentTheme.SecondaryColor,
                                                ),
                                          margin: EdgeInsets.zero,
                                        ),

                                        const Divider(
                                          color: Colors.black,
                                          thickness: 0.5,
                                        ),
                                        ListTile(
                                          // leading: const Icon(Icons.settings),
                                          leading: Icon(
                                              LineAwesomeIcons.mobile_phone,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                          title: const Text('Setting'),
                                          onTap: () {
                                            showSetting();
                                          },
                                        ),

                                        ListTile(
                                          //  leading: const Icon(Icons.lock_open),
                                          leading: Icon(
                                              LineAwesomeIcons
                                                  .arrow_circle_right,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('Log in'),
                                          onTap: () {
                                            loggedIn();
                                          },
                                        ),
                                        ListTile(
                                          leading:
                                              const Icon(Icons.account_box),
                                          title: const Text('Register'),
                                          onTap: () async {
                                            if (await canLaunch(
                                                'https://projects.co.id/public/  _user/register')) {
                                              await launch(
                                                  'https://projects.co.id/public/  _user/register');
                                            } else {
                                              throw 'Could not launch https://projects.co.id/public/  _user/register';
                                            }
                                          },
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                          thickness: 0.5,
                                        )
//--------------------------------------------------------
                                      ],
                                    )
                                  : Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 40,
                                        ),
                                        ListTile(
                                          isThreeLine: true,
                                          dense: false,
                                          leading: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child:
                                                Image.network(userPhoto),
                                          ),
                                          title: Text(username),
                                          subtitle: Text(userDisplayName),
                                          onTap: () async {
                                            //https://projects.co.id/public/browse_users/view/1a7312/stevencomptia
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PublicBrowseUsersView(
                                                          id: widget.id,
                                                          title: '123',
                                                          cb: cb)),
                                            );

                                            /*
                                  AppProvider.getRouter(context)! .navigateTo(
                                      context,
                                     urlToRoute('public/browse_users/view/${widget.id}/ccc'));

                                   */
                                          },
                                        ),

                                        const Divider(
                                          color: Colors.black,
                                          thickness: 0.5,
                                        ),
                                        ListTile(
                                          leading: Icon(
                                              LineAwesomeIcons.user_shield,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                          title: const Text('Scan Secure Code'),
                                          onTap: () async {
                                            await scanQR();
                                            // print('haloo===$_scanBarcode');
                                            // if()
                                            _scanBarcode == '-1' ||
                                                    _scanBarcode == ''
                                                ? null
                                                : Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SecureCodeScan(
                                                                widget.id,
                                                                username,
                                                                _scanBarcode)),
                                                  );
                                          },
                                        ),

                                        ListTile(
                                          leading: Icon(
                                              LineAwesomeIcons.hourglass,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                          title: const Text('Overview'),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserHomeListing(cb: cb)),
                                            );
                                            // addController2('/user/home');
                                          },
                                        ),

                                        const Divider(
                                          color: Colors.black,
                                          thickness: 0.5,
                                        ),

                                        ListTile(
                                          leading: Icon(
                                              LineAwesomeIcons.briefcase,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                          title: const Text('My Projects'),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserMyProjectsListing(
                                                          id: username,
                                                          cb: cb)),
                                            );
                                            // addController('/user/my_projects');
                                          },
                                        ),

                                        ListTile(
                                          leading: Icon(
                                              LineAwesomeIcons.check_circle,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                          // leading: const Icon(Icons.monetization_on),
                                          title: const Text('My Bids'),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserMyBidsListing(
                                                          id: username,
                                                          cb: cb)),
                                            );
                                            //addController('/user/my_bids');
                                          },
                                        ),

                                        ListTile(
                                          //  leading: const Icon(Icons.local_grocery_store),
                                          leading: Icon(
                                              LineAwesomeIcons.barcode,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                          title: const Text('My Products'),
                                          onTap: () {
                                            addController('/user/my_products');
                                          },
                                        ),

                                        ListTile(
                                          // leading: const Icon(Icons.account_balance),
                                          leading: Icon(LineAwesomeIcons.truck,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                          title: const Text('My Services'),
                                          onTap: () {
                                            addController('/user/my_services');
                                          },
                                        ),

                                        const Divider(
                                          color: Colors.black,
                                          thickness: 0.5,
                                        ),

                                        ListTile(
                                          // leading: const Icon(Icons.store),
                                          leading: Icon(
                                              LineAwesomeIcons.certificate,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('My Sales'),
                                          onTap: () {
                                            addController4('/user/my_sales');
                                          },
                                        ),

                                        ListTile(
                                          // leading: const Icon(Icons.local_grocery_store),
                                          leading: Icon(
                                              LineAwesomeIcons.shopping_cart,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('My Orders'),
                                          onTap: () {
                                            addController4('/user/my_orders');
                                          },
                                        ),

                                        ListTile(
                                          // leading: const Icon(Icons.dvr),
                                          leading: Icon(
                                              LineAwesomeIcons.google_wallet,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('My Purchases'),
                                          onTap: () {
                                            addController4(
                                                '/user/my_purchases');
                                          },
                                        ),

                                        ListTile(
                                          leading: Icon(LineAwesomeIcons.users,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                          //   leading: const Icon(Icons.people_outline),
                                          title: const Text('My Referals'),
                                          onTap: () {
                                            addController1('/user/my_referals');
                                          },
                                        ),

                                        ListTile(
                                          //    leading: const Icon(Icons.monetization_on),
                                          leading: Icon(
                                              LineAwesomeIcons.money_bill,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('My Finance'),
                                          onTap: () {
                                            addController1('/user/my_finance');
                                          },
                                        ),

                                        ListTile(
                                          //  leading: const Icon(Icons.format_list_numbered),
                                          leading: Icon(LineAwesomeIcons.star,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('My Points'),
                                          onTap: () {
                                            addController1('/user/my_points');
                                          },
                                        ),

                                        const Divider(
                                          color: Colors.black,
                                          thickness: 0.5,
                                        ),

                                        ListTile(
                                          // leading: const Icon(Icons.person_outline),
                                          leading: Icon(LineAwesomeIcons.user,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('My Profile'),
                                          onTap: () {
                                            addController1('/user/my_profile');
                                          },
                                        ),

                                        ListTile(
                                          // leading: const Icon(Icons.bookmark),
                                          leading: Icon(
                                              LineAwesomeIcons.bookmark,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('My Bookmarks'),
                                          onTap: () {
                                            addController('/user/my_bookmarks');
                                          },
                                        ),

                                        ListTile(
                                          //leading: const Icon(Icons.settings),
                                          leading: Icon(
                                              LineAwesomeIcons.mobile_phone,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('Setting'),
                                          onTap: () {
                                            showSetting();
                                          },
                                        ),

                                        ListTile(
                                          //   leading: const Icon(Icons.lock_open),
                                          leading: Icon(
                                              LineAwesomeIcons
                                                  .arrow_circle_right,
                                              color: darkMode
                                                  ? Colors.white
                                                  : Colors.black),

                                          title: const Text('Log Out'),
                                          onTap: () {
                                            loggedOut(context);
                                          },
                                        ),

//--------------------------------------------------------
                                      ],
                                    ),
                              // SizedBox(height: 10),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, bottom: 20),
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (await canLaunch(
                                          'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                        await launch(
                                            'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                                      } else {
                                        throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                                      }
                                    },
                                    child: const Text(
                                      'Rate and review',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  )

                                  // Text('Version ${_packageInfo.version}+${_packageInfo.buildNumber}', style: TextStyle(color: Colors.grey, fontSize: 15),),

                                  ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, bottom: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Share.share(
                                          'Hire Freelancer: https://play.google.com/store/apps/details?id=id.co.projectscoid',
                                          subject: 'Projects.co.id Mobile App');
                                    },
                                    child: const Text(
                                      'Share',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  )
                                  //   Text('Version ${_packageInfo.version}+${_packageInfo.buildNumber}', style: TextStyle(color: Colors.grey, fontSize: 15),),

                                  ),

                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, bottom: 40),
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (await canLaunch(
                                          'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                        await launch(
                                            'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                                      } else {
                                        throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                                      }
                                    },
                                    child: Text(
                                      'Version ${_packageInfo.version}+${_packageInfo.buildNumber}',
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              appBar: isLoading
                  ? null
                  : appBarHide
                      ? null
                      : MyCustomAppBar(
                          height: 80,
                          menu: _currentIndex,
                          user: username == '' ? 0 : 1,
                          chatBloc: AppProvider.getApplication(context).chat,
                          forlgn: forlgn,
                          username: username),
              body: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        height: appBarHide ? 80.0 : 50.0,
                        padding: EdgeInsets.only(top: appBarHide ? 30.0 : 0.0),
                        constraints:
                            BoxConstraints(maxHeight: appBarHide ? 80.0 : 50.0),
                        child: Material(
                          color: darkMode
                              ? Colors.black38
                              : CurrentTheme.PrimaryColor,
                          child: TabBar(
                            isScrollable: false,
                            controller: _tabController,
                            indicatorColor: darkMode
                                ? CurrentTheme.PrimaryColor
                                : CurrentTheme.NormalTextColor,
                            labelColor: darkMode
                                ? CurrentTheme.PrimaryColor
                                : CurrentTheme.BackgroundColor,
                            labelPadding: const EdgeInsets.only(top: 0.0),
                            unselectedLabelColor: CurrentTheme.NormalTextColor,
                            tabs: choices.map<Widget>((Choice choice) {
                              return StreamBuilder(
                                  //
                                  stream: cb!.onMessage,
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      if (jsonDecode(snapshot.data).isEmpty) {
                                        return Tab(

                                            // text: choice!.title!,
                                            //  icon: Icon(choice!.icon, size: 17.0, color: _tabController!.index! == null? null :  _tabController!.index! == choices.indexOf(choice)? CurrentTheme.BackgroundColor : CurrentTheme.NormalTextColor ),
                                            child: Container(
                                                height: 50,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    choice.title! == 'Cart' &&
                                                            cartcount > 0
                                                        ? Container(
                                                            width: 38,
                                                            height: 18,
                                                            child: Stack(
                                                                children: <
                                                                    Widget>[
                                                                  Positioned
                                                                      .fill(
                                                                    child: Icon(
                                                                        choice.icon,
                                                                        size:
                                                                            18.0,
                                                                        color: _tabController!.index==
                                                                                 null
                                                                            ? null
                                                                            : _tabController!.index== choices.indexOf(choice)
                                                                                ? darkMode
                                                                                    ? CurrentTheme.PrimaryColor
                                                                                    : CurrentTheme.BackgroundColor
                                                                                : CurrentTheme.NormalTextColor),
                                                                  ),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            15,
                                                                        width:
                                                                            15,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color:
                                                                              Colors.red,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          cartcount.toString(),
                                                                          style: const TextStyle(
                                                                              fontSize: 8,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ))
                                                                ]))
                                                        : choice.title! ==
                                                                    'Chat' &&
                                                                unread > 0
                                                            ? Container(
                                                                width: 38,
                                                                height: 18,
                                                                child: Stack(
                                                                    children: <
                                                                        Widget>[
                                                                      Positioned
                                                                          .fill(
                                                                        child: Icon(
                                                                            choice.icon,
                                                                            size:
                                                                                18.0,
                                                                            color: _tabController!.index== null
                                                                                ? null
                                                                                : _tabController!.index== choices.indexOf(choice)
                                                                                    ? darkMode
                                                                                        ? CurrentTheme.PrimaryColor
                                                                                        : CurrentTheme.BackgroundColor
                                                                                    : CurrentTheme.NormalTextColor),
                                                                      ),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topRight,
                                                                          child:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height:
                                                                                15,
                                                                            width:
                                                                                15,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Colors.red,
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              unread.toString(),
                                                                              style: const TextStyle(fontSize: 8, color: Colors.white),
                                                                            ),
                                                                          ))
                                                                    ]))

                                                            //  : Icon(choice!.icon, size: 18.0, color: _tabController!.index! == null? null :  _tabController!.index! == choices.indexOf(choice)? darkMode? CurrentTheme.PrimaryColor :CurrentTheme.BackgroundColor : CurrentTheme.NormalTextColor )
                                                            : choice.title! ==
                                                                        'Notif' &&
                                                                    notifunread >
                                                                        0
                                                                ? Container(
                                                                    width: 38,
                                                                    height: 18,
                                                                    child: Stack(
                                                                        children: <
                                                                            Widget>[
                                                                          Positioned
                                                                              .fill(
                                                                            child: Icon(choice.icon,
                                                                                size: 18.0,
                                                                                color: _tabController!.index== null
                                                                                    ? null
                                                                                    : _tabController!.index== choices.indexOf(choice)
                                                                                        ? darkMode
                                                                                            ? CurrentTheme.PrimaryColor
                                                                                            : CurrentTheme.BackgroundColor
                                                                                        : CurrentTheme.NormalTextColor),
                                                                          ),
                                                                          Align(
                                                                              alignment: Alignment.topRight,
                                                                              child: Container(
                                                                                alignment: Alignment.center,
                                                                                height: 15,
                                                                                width: 15,
                                                                                decoration: const BoxDecoration(
                                                                                  color: Colors.red,
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Text(
                                                                                  notifunread.toString(),
                                                                                  style: const TextStyle(fontSize: 8, color: Colors.white),
                                                                                ),
                                                                              ))
                                                                        ]))
                                                                : Icon(
                                                                    choice.icon,
                                                                    size: 21.0,
                                                                    color: _tabController!.index==
                                                                            null
                                                                        ? null
                                                                        : _tabController!.index==
                                                                                choices.indexOf(choice)
                                                                            ? darkMode
                                                                                ? CurrentTheme.PrimaryColor
                                                                                : CurrentTheme.BackgroundColor
                                                                            : CurrentTheme.NormalTextColor),
                                                    Text(
                                                      choice.title!,
                                                      style: const TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                )));
                                      }

                                      if (jsonDecode(snapshot.data)['type'] ==
                                              'index' &&
                                          widget.id != '') {
                                        unread = 0;

                                        for (var obj in jsonDecode(
                                            snapshot.data)['list']) {
                                          //lastmesssage
                                          // if(obj['blocked'] != 1){
                                          // print('aku disini saja man');
                                          unread = ((unread+ obj['unread'])
                                              as int?)!;
                                          //  }
                                        }
                                      }

                                      if (jsonDecode(snapshot.data)['type'] ==
                                          'notify') {
                                        //  print('hanya satu kali');
                                        //  notifunread = notifunread + 1;
                                      }
                                      return Tab(

                                          // text: choice!.title!,
                                          //  icon: Icon(choice!.icon, size: 17.0, color: _tabController!.index! == null? null :  _tabController!.index! == choices.indexOf(choice)? CurrentTheme.BackgroundColor : CurrentTheme.NormalTextColor ),
                                          child: Container(
                                              height: 50,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  choice.title! == 'Cart' &&
                                                          cartcount > 0
                                                      ? Container(
                                                          width: 38,
                                                          height: 18,
                                                          child:
                                                              Stack(children: <
                                                                  Widget>[
                                                            Positioned.fill(
                                                              child: Icon(
                                                                  choice.icon,
                                                                  size: 18.0,
                                                                  color: _tabController!
                                                                              .index==
                                                                          null
                                                                      ? null
                                                                      : _tabController!.index==
                                                                              choices.indexOf(choice)
                                                                          ? darkMode
                                                                              ? CurrentTheme.PrimaryColor
                                                                              : CurrentTheme.BackgroundColor
                                                                          : CurrentTheme.NormalTextColor),
                                                            ),
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 15,
                                                                  width: 15,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Colors
                                                                        .red,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Text(
                                                                    cartcount.toString(),
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            8,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ))
                                                          ]))
                                                      : choice.title! ==
                                                                  'Chat' &&
                                                              unread > 0
                                                          ? Container(
                                                              width: 38,
                                                              height: 18,
                                                              child: Stack(
                                                                  children: <
                                                                      Widget>[
                                                                    Positioned
                                                                        .fill(
                                                                      child: Icon(
                                                                          choice.icon,
                                                                          size:
                                                                              18.0,
                                                                          color: _tabController!.index== null
                                                                              ? null
                                                                              : _tabController!.index== choices.indexOf(choice)
                                                                                  ? darkMode
                                                                                      ? CurrentTheme.PrimaryColor
                                                                                      : CurrentTheme.BackgroundColor
                                                                                  : CurrentTheme.NormalTextColor),
                                                                    ),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .topRight,
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          height:
                                                                              15,
                                                                          width:
                                                                              15,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Colors.red,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            unread.toString(),
                                                                            style:
                                                                                const TextStyle(fontSize: 8, color: Colors.white),
                                                                          ),
                                                                        ))
                                                                  ]))

                                                          //  : Icon(choice!.icon, size: 18.0, color: _tabController!.index! == null? null :  _tabController!.index! == choices.indexOf(choice)? darkMode? CurrentTheme.PrimaryColor :CurrentTheme.BackgroundColor : CurrentTheme.NormalTextColor )
                                                          : choice.title! ==
                                                                      'Notif' &&
                                                                  notifunread >
                                                                      0
                                                              ? Container(
                                                                  width: 38,
                                                                  height: 18,
                                                                  child: Stack(
                                                                      children: <
                                                                          Widget>[
                                                                        Positioned
                                                                            .fill(
                                                                          child: Icon(
                                                                              choice.icon,
                                                                              size: 18.0,
                                                                              color: _tabController!.index== null
                                                                                  ? null
                                                                                  : _tabController!.index== choices.indexOf(choice)
                                                                                      ? darkMode
                                                                                          ? CurrentTheme.PrimaryColor
                                                                                          : CurrentTheme.BackgroundColor
                                                                                      : CurrentTheme.NormalTextColor),
                                                                        ),
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.topRight,
                                                                            child: Container(
                                                                              alignment: Alignment.center,
                                                                              height: 15,
                                                                              width: 15,
                                                                              decoration: const BoxDecoration(
                                                                                color: Colors.red,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Text(
                                                                                notifunread.toString(),
                                                                                style: const TextStyle(fontSize: 8, color: Colors.white),
                                                                              ),
                                                                            ))
                                                                      ]))
                                                              : Icon(
                                                                  choice.icon,
                                                                  size: 21.0,
                                                                  color: _tabController!
                                                                              .index==
                                                                          null
                                                                      ? null
                                                                      : _tabController!.index==
                                                                              choices.indexOf(choice)
                                                                          ? darkMode
                                                                              ? CurrentTheme.PrimaryColor
                                                                              : CurrentTheme.BackgroundColor
                                                                          : CurrentTheme.NormalTextColor),
                                                  Text(
                                                    choice.title!,
                                                    style:
                                                        const TextStyle(fontSize: 10),
                                                  ),
                                                ],
                                              )));
                                    }
                                    return Tab(

                                        // text: choice!.title!,
                                        //  icon: Icon(choice!.icon, size: 17.0, color: _tabController!.index! == null? null :  _tabController!.index! == choices.indexOf(choice)? CurrentTheme.BackgroundColor : CurrentTheme.NormalTextColor ),
                                        child: Container(
                                            height: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                choice.title! == 'Cart' &&
                                                        cartcount > 0
                                                    ? Container(
                                                        width: 38,
                                                        height: 18,
                                                        child: Stack(
                                                            children: <Widget>[
                                                              Positioned.fill(
                                                                child: Icon(
                                                                    choice.icon,
                                                                    size: 18.0,
                                                                    color: _tabController!.index==
                                                                            null
                                                                        ? null
                                                                        : _tabController!.index==
                                                                                choices.indexOf(choice)
                                                                            ? darkMode
                                                                                ? CurrentTheme.PrimaryColor
                                                                                : CurrentTheme.BackgroundColor
                                                                            : CurrentTheme.NormalTextColor),
                                                              ),
                                                              Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 15,
                                                                    width: 15,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: Colors
                                                                          .red,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Text(
                                                                      cartcount.toString(),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              8,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ))
                                                            ]))
                                                    : choice.title! ==
                                                                'Chat' &&
                                                            unread > 0
                                                        ? Container(
                                                            width: 38,
                                                            height: 18,
                                                            child: Stack(
                                                                children: <
                                                                    Widget>[
                                                                  Positioned
                                                                      .fill(
                                                                    child: Icon(
                                                                        choice.icon,
                                                                        size:
                                                                            18.0,
                                                                        color: _tabController!.index==
                                                                                null
                                                                            ? null
                                                                            : _tabController!.index== choices.indexOf(choice)
                                                                                ? darkMode
                                                                                    ? CurrentTheme.PrimaryColor
                                                                                    : CurrentTheme.BackgroundColor
                                                                                : CurrentTheme.NormalTextColor),
                                                                  ),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            15,
                                                                        width:
                                                                            15,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color:
                                                                              Colors.red,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          unread.toString(),
                                                                          style: const TextStyle(
                                                                              fontSize: 8,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ))
                                                                ]))

                                                        //  : Icon(choice!.icon, size: 18.0, color: _tabController!.index! == null? null :  _tabController!.index! == choices.indexOf(choice)? darkMode? CurrentTheme.PrimaryColor :CurrentTheme.BackgroundColor : CurrentTheme.NormalTextColor )
                                                        : choice.title! ==
                                                                    'Notif' &&
                                                                notifunread > 0
                                                            ? Container(
                                                                width: 38,
                                                                height: 18,
                                                                child: Stack(
                                                                    children: <
                                                                        Widget>[
                                                                      Positioned
                                                                          .fill(
                                                                        child: Icon(
                                                                            choice.icon,
                                                                            size:
                                                                                18.0,
                                                                            color: _tabController!.index== null
                                                                                ? null
                                                                                : _tabController!.index== choices.indexOf(choice)
                                                                                    ? darkMode
                                                                                        ? CurrentTheme.PrimaryColor
                                                                                        : CurrentTheme.BackgroundColor
                                                                                    : CurrentTheme.NormalTextColor),
                                                                      ),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topRight,
                                                                          child:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height:
                                                                                15,
                                                                            width:
                                                                                15,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Colors.red,
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              notifunread.toString(),
                                                                              style: const TextStyle(fontSize: 8, color: Colors.white),
                                                                            ),
                                                                          ))
                                                                    ]))
                                                            : Icon(choice.icon,
                                                                size: 21.0,
                                                                color: _tabController!
                                                                            .index==
                                                                        null
                                                                    ? null
                                                                    : _tabController!.index==
                                                                            choices.indexOf(
                                                                                choice)
                                                                        ? darkMode
                                                                            ? CurrentTheme
                                                                                .PrimaryColor
                                                                            : CurrentTheme
                                                                                .BackgroundColor
                                                                        : CurrentTheme
                                                                            .NormalTextColor),
                                                Text(
                                                  choice.title!,
                                                  style:
                                                      const TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            )));
                                  });
                            }).toList(),
                          ),
                        ),
                      ),

                      Expanded(
                        child: TabBarView(
                            controller: _tabController, children: _children),
                      ),

                      // )
                    ],
                  ),
                ],
              )),
        ));
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String? title;
  final IconData? icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Home', icon: LineAwesomeIcons.home),
  Choice(title: 'Notif', icon: LineAwesomeIcons.bell),
  Choice(title: 'Cart', icon: LineAwesomeIcons.shopping_cart),
  Choice(title: 'Chat', icon: LineAwesomeIcons.comment_dots_1),
  Choice(title: 'Guides', icon: LineAwesomeIcons.book),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key? key, this.choice, this.index}) : super(key: key);
  final int? index;
  final Choice? choice;
  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice!.icon, size: 128.0, color: textStyle!.color),
            Text(choice!.title!, style: textStyle),
          ],
        ),
      ),
    );
  }
}
