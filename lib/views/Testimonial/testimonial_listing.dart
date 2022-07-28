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
 /** AUTOGENERATE OFF **/
class  PublicTestimonialListing extends StatefulWidget {
  static const String PATH = '/public/testimonial/listing/:id';
    final String? id ;
   PublicTestimonialListing({Key? key, this.id}) : super(key: key);
  @override
   PublicTestimonialListingState createState() =>  PublicTestimonialListingState();
}

class  PublicTestimonialListingState extends State< PublicTestimonialListing>{
  String title = 'Happy Users';
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/testimonial/listing?page=%d';
  ScrollController?  scrollController;
  TestimonialController? testimonial;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  bool isopen = false;
  String searchText = '';
   double initscroll = 0.0;
   PublicTestimonialListingState() {
   // scrollController!.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
      if(widget.id!.contains('filter')|| widget.id!.contains('search'))
	  {
	      search = true;
	  }
      if(widget.id!.contains('filter')){
      var ids = widget.id!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/public/testimonial/listing?page=%d' + ids;
    }
	
	if(widget.id!.contains('search')){
      var ids = widget.id!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/public/testimonial/listing?page=%d&' + ids;
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
	
	   final prefs = SharedPreferences.getInstance();
      prefs.then((val){
        initscroll = val.getDouble("position")!;
        if(initscroll != 0.0 || initscroll != null ){
          scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
          scrollController!.addListener(_onScroll);
        } else {
          scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
          scrollController!.addListener(_onScroll);
        }
      });
	
    testimonial =  TestimonialController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    testimonial!.listing!.add(TestimonialList());
    return WillPopScope(
         onWillPop:()async{
          Navigator.pop(context);
          return false;
        },
        child:

        Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setDouble("position", 0.0);
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
              title: selected? buildSearchBar(title) : Text('', style : TextStyle( color: Colors.white, ))  ,
            ),
            body:
            Stack(
               children: [
                 /*


                  */
                 Container(
                     color: CurrentTheme.MainAccentColor,

                     width: MediaQuery.of(context).size.width,
                     /*
                     child:
                     Padding(
                       padding: EdgeInsets.only(left: 25, top: 20),
                       child: Text('What People say', style: TextStyle(fontSize: 20, color: Colors.white),),
                     )

                      */


                 ),

                 Positioned.fill(
                   //  bottom: 0.0,
                     left: 0.0,
                     right: 0.0,
                     top: 120.0,

                     // In order to have the ink splash appear above the image, you
                     // must use Ink.image. This allows the image to be painted as part
                     // of the Material and display ink effects above it. Using a
                     // standard Image will obscure the ink splash.
                     child:
                     Container( color: Colors.white,)
                 ),
                 Positioned.fill(

                     left: 0.0,
                     right: 0.0,
                     top: 0.0,

                     // In order to have the ink splash appear above the image, you
                     // must use Ink.image. This allows the image to be painted as part
                     // of the Material and display ink effects above it. Using a
                     // standard Image will obscure the ink splash.
                     child:
                     Padding(
                       padding: EdgeInsets.only(left: 25, top: 20),
                       child: Text('Happy Users', style: TextStyle(fontSize: 20, color: Colors.white),),
                     )

                 ),
                 Positioned.fill(
                   //  bottom: 0.0,
                     left: 0.0,
                     right: 0.0,
                     top: 75.0,

                     // In order to have the ink splash appear above the image, you
                     // must use Ink.image. This allows the image to be painted as part
                     // of the Material and display ink effects above it. Using a
                     // standard Image will obscure the ink splash.
                     child:
                     Container( child: buildListingBar(),)
                 ),



                // buildListingBar(),

               ],
            )



        )
    );
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
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

            //hasFloatingPlaceholder: false,
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

  void open(bool val){
    // setState(() {
    isopen = val;
    //});
  }
   // @override
  Widget buildListingBar(){
    return BlocBuilder<TestimonialListing, TestimonialState>(
      bloc: testimonial!.listing!,

      builder: (BuildContext context, TestimonialState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is TestimonialListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Center( 
           child:CircularProgressIndicator(
           valueColor: new AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is TestimonialListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is TestimonialListingLoaded) {
          if (state.testimonial!.items.items.isEmpty) {
		  if (state.testimonial!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title),
                  ),
                 floatingActionButton: state.testimonial!.Buttons(context, _dialVisible, account, open)
				//floatingActionButton: isLoading? null :  state.testimonial!.Buttons(context, _dialVisible, controller,testimonial,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
       /*

      if (state.testimonial!.tools.buttons.length == 0){
				return
				Scaffold(
					body:
							RefreshIndicator(
							child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								 	  return index >= state.testimonial!.items.items.length ? 
									  state.testimonial!.tools.paging.total_pages == state.testimonial!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicTestimonialBottomLoader()
									   : state.testimonial!.viewItemIndex(state.testimonial!.items.items[index] , searchText, index, account );
								},
								itemCount: state.hasReachedMax
									? state.testimonial!.items.items.length
									: state.testimonial!.items.items.length + 1,
								controller: scrollController,
							  ),

							  onRefresh: _onRefresh,
							)
				);					
			}
          return
		  Scaffold(
                    body:    
							RefreshIndicator(
							child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {
								 	  return index >= state.testimonial!.items.items.length ? 
									  state.testimonial!.tools.paging.total_pages == state.testimonial!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicTestimonialBottomLoader()
									 // viewItemIndex(ItemBlogModel item,String search, int index, bool account) 
									   : state.testimonial!.viewItemIndex (state.testimonial!.items.items[index] , searchText, index, account );
									
								},
								itemCount: state.hasReachedMax
									? state.testimonial!.items.items.length
									: state.testimonial!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.testimonial!.Buttons(context, _dialVisible, account)
					//floatingActionButton: isLoading? null :  state.testimonial!.Buttons(context, _dialVisible, controller,testimonial,  this, Env.value!.baseUrl!, '', title, account)		
                   
			 );

        */

          return   RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {

                return index >= state.testimonial!.items.items.length ?
                state.testimonial!.tools.paging.total_pages == state.testimonial!.tools.paging.current_page?
                Container(height: 0.0, width: 0.0,):
                PublicTestimonialBottomLoader()
                    : state.testimonial!.viewItemIndex(state.testimonial!.items.items[index] , searchText, index, account );
              },
              itemCount: state.hasReachedMax!
                  ? state.testimonial!.items.items.length
                  : state.testimonial!.items.items.length + 1,
              controller: scrollController,
            ),

            onRefresh: _onRefresh,
          );



        }




		
		return new Center( 
           child:CircularProgressIndicator(
           valueColor: new AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    testimonial!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
    testimonial!.listing!.add(TestimonialListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }
  void _onScroll()async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
	final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      testimonial!.listing!.add(TestimonialList());
    }

  }

}

class  PublicTestimonialBottomLoader extends StatelessWidget {
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


