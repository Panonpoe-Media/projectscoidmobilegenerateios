import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'dart:async';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';

/** AUTOGENERATE OFF **/
class UserHomeListing extends StatefulWidget {
  static const String PATH = '/user/home/listing';
  final ChatBloc? cb;

  UserHomeListing({Key? key, this.cb}) : super(key: key);
  @override
  UserHomeListingState createState() => UserHomeListingState();
}

class UserHomeListingState extends State<UserHomeListing>  with RestorationMixin{
  String title = 'Home';
  // String getPath = Env.value.baseUrl + '/ user/home/json?page=%d';
  String getPath = Env.value!.baseUrl! + '/user/home?page=%d';
  final scrollController = ScrollController();
  HomeController? home;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';

  UserHomeListingState() {
    scrollController.addListener(_onScroll);
  }

final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'UserHomeListing';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'UserHomeListing');
  }


  @override
  Widget build(BuildContext context) {
    home = HomeController(AppProvider.getApplication(context), getPath,
        AppAction.listing, '', '', '', false);
      home!.listing!.add(HomeList());
    return Scaffold(
        appBar: AppBar(
          leading:   IconButton(
              icon:   Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () async {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            IconButton(
                tooltip: 'Search',
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
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
          title: selected
              ? buildSearchBar(title)
              : Text(title, style: TextStyle(color: Colors.white)),
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
          style:
                TextStyle(fontSize: 14.0, height: 0.2, color: Colors.black),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,
            //hasFloatingPlaceholder: false,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gapPadding: 20.0),
          ),
        ));
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  // @override
  Widget buildListingBar() {
    return BlocBuilder<HomeListing, HomeState>(
     // cubit:   home!.listing,
      builder: (BuildContext context, HomeState state){
        if (state is HomeListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return   const Center(
              child: CircularProgressIndicator(
            valueColor:   AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is HomeListingError) {
		_onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is HomeListingLoaded) {
          if (state.home!.items.items.isEmpty) {
            return Center(
              child: Text('no ' + title),
            );
          }
          return RefreshIndicator(
            child:   ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.home!.items.items.length
                    ? UserHomeBottomLoader()
                    //  :  UserHomeWidget(home : state.home!.items.items[index], search: searchText,);
                    : state.  home!.viewItemcb(state.home!.items.items[index], '', widget.cb!, home!);
              },
              itemCount: state.hasReachedMax!
                  ? state.home!.items.items.length
                  : state.home!.items.items.length + 1,
              controller: scrollController,
            ),
            onRefresh: _onRefresh,
          );
        }
        return Center(
          child: Text('no ' + title),
        );
      },
    );
  }

  @override
  void dispose() {
      home!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =   Completer<Null>();
      home!.listing!.add(HomeListingRefresh());

     Timer timer =   Timer(  Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    cs.value = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
        home!.listing!.add(HomeList());
    }
  }
}

class UserHomeBottomLoader extends StatelessWidget {
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

class UserHomeWidget extends StatelessWidget {
  final ItemHomeModel? home;
  final String? search;
  const UserHomeWidget({Key? key, @required this.home, this.search})
      : super(key: key);

  searchT(String words) => words.replaceAllMapped(
        RegExp(r',"(.*?)":', caseSensitive: false), (Match m) => ' ');

  String allModelWords(String words) {
    String text = searchT(words);
    text = text.replaceFirst('"age":', ' ');
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // visible: (this.search == '' || this.  home!.title.contains(this.search!) || this.  home!.article.contains(this.search!)),
      visible: (this.search == '' ||
          allModelWords(jsonEncode(this.  home!.item!.toJson()))
              .contains(this.search!)),
      child: ListTile(
        leading: Container(
          height: 50.0,
          width: 50.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              this.  home!.item!.pht!,
            ),
          ),
        ),
        title: Text(this.  home!.item!.ttl!),
        isThreeLine: true,
        subtitle: Html(data:   home!.item!.sbttl,
            //style: TextStyle(fontSize: 16, color: CurrentTheme.ShadeColor),
            // defaultTextStyle: TextStyle(color: CurrentTheme.DisableTextColor)
            style: {
              "html": Style(color: CurrentTheme.DisableTextColor),
            }),
        dense: true,
        onTap: () => {
          AppProvider.getRouter(context)!.navigateTo(
              context,
              "/user/home/view/" +
                  this.  home!.item!.id! +
                  "/" +
                  // this.  home!.title.replaceAll(' ', '-'))},
                  "title")
        },
      ),
    );
  }
}
