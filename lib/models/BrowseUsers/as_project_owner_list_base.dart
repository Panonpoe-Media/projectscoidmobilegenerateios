
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
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
import 'package:flutter_html/style.dart';
import 'dart:convert';
import '../image_fields.dart';
import '../file_fields.dart';
import '../option_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import 'as_project_owner_list_item.dart';
import 'as_project_owner_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
part 'as_project_owner_list_base.g.dart';

/** AUTOGENERATE OFF **/
class AsProjectOwnerListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	AsProjectOwnerListingBase(this.json){
		items = AsProjectOwnerListingItems.fromJson(this.json);
		tools = AsProjectOwnerListingTools.fromJson(this.json);
	}
	
  Widget viewItem (ItemAsProjectOwnerModel item,String search, bool account, String id) {
	ShapeBorder? shape;
    double height = 0;
	double totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 4 ;
	totalHeight = totalHeight + 15 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item!.toJson())).contains(search)),
        child:  ItemAsProjectOwnerCard(destination :item, search : search, shape : shape, height: height)
    );


	}
	
  Widget viewItem1 (ItemAsProjectOwnerModel item,ItemAsProjectOwnerModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index) {
	ShapeBorder? shape;
    double height = 0;
	double totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item!.toJson())).contains(search)),
        child:  ItemAsProjectOwnerCard(destination :item, search : search, shape : shape, height: height)
    );


	}	   
	

	
   List<SpeedDialChild>	 listButton(BuildContext context, String id){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
      buttonChildren.add(ListButtonAsProjectOwnerWidget(tools.buttons[i],context));
    }

       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons(BuildContext context, bool visible, String id){
     return(
	 SpeedDial(

			 childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible,
				// If true user is forced to close dial manually
				// by tapping main button and overlay is not rendered.
				closeManually: false,
				curve: Curves.bounceIn,
				overlayColor: Colors.black,
				overlayOpacity: 0.5,
				onOpen: () => print('OPENING DIAL'),
				onClose: () => print('DIAL CLOSED'),
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.MainAccentColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton(context, id)
	    )
	 );
   } 
   
  Widget	 ButtonsX(BuildContext context, bool visible, String id, bool isShowEG){
     return(
	 SpeedDial(

			 childMargin : const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible,
				// If true user is forced to close dial manually
				// by tapping main button and overlay is not rendered.
				closeManually: false,
				curve: Curves.bounceIn,
				overlayColor: Colors.black,
				overlayOpacity: 0.5,
				onOpen: () => print('OPENING DIAL'),
				onClose: () => print('DIAL CLOSED'),
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.MainAccentColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton(context, id)
	    )
	 );
   } 
   
     Widget	 ButtonsXX(BuildContext context, bool visible, String id, bool isShowEG, String id1){
     return(
	 SpeedDial(

			  childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible,
				// If true user is forced to close dial manually
				// by tapping main button and overlay is not rendered.
				closeManually: false,
				curve: Curves.bounceIn,
				overlayColor: Colors.black,
				overlayOpacity: 0.5,
				onOpen: () => print('OPENING DIAL'),
				onClose: () => print('DIAL CLOSED'),
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.MainAccentColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton1(context, id, id1)
	    )
	 );
   } 
   
    List<SpeedDialChild>	 listButton1(BuildContext context, String id, String id1){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
      buttonChildren.add(ListButtonAsProjectOwnerWidget(tools.buttons[i],context));
    }

       return(
	        buttonChildren 
	   );
   } 
   
    SpeedDial	 Buttons1(BuildContext context, bool visible, String id, String id1){
     return(
	 SpeedDial(

			 childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible,
				// If true user is forced to close dial manually
				// by tapping main button and overlay is not rendered.
				closeManually: false,
				curve: Curves.bounceIn,
				overlayColor: Colors.black,
				overlayOpacity: 0.5,
				onOpen: () => print('OPENING DIAL'),
				onClose: () => print('DIAL CLOSED'),
				tooltip: 'Speed Dial',
				heroTag: 'speed-dial-hero-tag',
				backgroundColor: CurrentTheme.MainAccentColor,
				foregroundColor: Colors.white,
				elevation: 8.0,
				shape: CircleBorder(),
				children:listButton1(context, id, id1)
	    )
	 );
   }  
   
   
   
}





class AsProjectOwnerListingItems{
  List<ItemAsProjectOwnerModel?>? items;
  AsProjectOwnerListingItems(
      this.items,
      );

  factory AsProjectOwnerListingItems.fromJson(Map<String, dynamic> json) {
  	return AsProjectOwnerListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemAsProjectOwnerModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class AsProjectOwnerListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemAsProjectOwnerRev?>? items;
	AsProjectOwnerListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory AsProjectOwnerListingTools.fromJson(Map<String, dynamic> json) => _$AsProjectOwnerListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$AsProjectOwnerListingToolsToJson(this);

}




class ItemAsProjectOwnerCard extends StatelessWidget {
  const ItemAsProjectOwnerCard({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height;
  final ItemAsProjectOwnerModel? destination;
  final String? search;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: <Widget>[
            // const SectionTitle(title: ''),
            Container(
              //height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: ItemAsProjectOwnerContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemAsProjectOwnerContent extends StatelessWidget {
  const ItemAsProjectOwnerContent({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemAsProjectOwnerModel? destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> buttonChildren = <Widget>[
    ];
	if (destination!.item!.buttons != null) {
		for(var i = 0; i < destination!.item!.buttons.length; i++)
		{
		  buttonChildren.add(itemAsProjectOwnerButton(destination!,i , context));
		}
    }

    final List<Widget> children = [

    ];
	 /* children.add(Padding(
		padding: const EdgeInsets.fromLTRB(
			8.0, 14.0, 8.0, 2.0),
		child: Html(data: "<h3>Header</h3>"),
	  ));
	  */
	   children.add(destination!.viewArbitration(context)); 
	   children.add(destination!.viewProjectEnding(context)); 
	   children.add(destination!.viewOwnerRating(context)); 
	   children.add(destination!.viewOwnerFeedback(context)); 
	   children.add(destination!.viewAcceptedWorker(context)); 
	   children.add(destination!.viewFinishDate(context)); 
	   children.add(destination!.viewTitle(context)); 
        /*  children.add(Padding(
                            padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                            child: Html(data: "<h3>footer</h3>"),
                           )
     );
	 */


  if (destination!.item!.buttons != null) {
        if(buttonChildren.length > 4){
		if(buttonChildren.length == 5){
		children.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  ]
			),
		  ),
		);
		}
		if(buttonChildren.length == 6){
		children.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  buttonChildren[5],
			  ]
			),
		  ),
		);
		}
		if(buttonChildren.length == 7){
		children.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  buttonChildren[5],
			  buttonChildren[6],
			  ]
			),
		  ),
		);
		}
				if(buttonChildren.length == 8){
		children.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[0],
			  buttonChildren[1],
			  buttonChildren[2],
			  buttonChildren[3],
			  ]
			),
		  ),
		);
		children.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: <Widget>[
			  buttonChildren[4],
			  buttonChildren[5],
			  buttonChildren[6],
			  buttonChildren[7],
			  ]
			),
		  ),
		);
		}
		}else{
		children.add(
		  // share, explore buttons
		  ButtonTheme(
			child: ButtonBar(
			  alignment: MainAxisAlignment.end ,
			  children: buttonChildren
			),
		  ),
		);
      }
	}	
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

Widget itemAsProjectOwnerButton(ItemAsProjectOwnerModel destination, int index, BuildContext context){

  return(
    TextButton(
      child: Text(destination!.item!.buttons[index].text, semanticsLabel: 'Share ${destination!.item!.ttl}'),
			style: ButtonStyle(
				textStyle:
				MaterialStateProperty.all<TextStyle>(
						const TextStyle(color:  CurrentTheme.MainAccentColor)),
				backgroundColor:
				MaterialStateProperty.all<Color>(
						CurrentTheme.SecondaryAccentColor),
			),
      onPressed: () {
        print('${destination!.item!.buttons[index].url}');
        AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(destination!.item!.buttons[index].url));
      },
    )
  );
}



class ItemAsProjectOwnerWidget extends StatelessWidget {

	final ItemAsProjectOwnerModel? item;
	final String? search;
	const  ItemAsProjectOwnerWidget({Key? key, @required this.item, this.search}) : super(key: key);


	@override
	Widget build(BuildContext context) {
		return Visibility (
			// visible: (this.search == '' || this.browse_projects.item!.title.contains(this.search) || this.browse_projects.items.items.article.contains(this.search)),
			visible: (this.search == '' || allModelWords(jsonEncode(this.item!.item.toJson())).contains(this.search!)),
			child: ListTile(
				leading:  Container(
					height: 50.0,
					width : 50.0,
					child:

					ClipRRect(
						borderRadius: BorderRadius.circular(50),
						child: Image.network( this.item!.item.pht,
						),
					),

				),
				title: Text(this.item!.item.ttl),
				isThreeLine: true,
				subtitle: Html(
						data:item!.item!.sbttl! ,
						//style: TextStyle(fontSize: 16, color: CurrentTheme.ShadeColor),
						//defaultTextStyle: TextStyle(color: CurrentTheme.DisableTextColor)
						style: {
										"html": Style(
										 color: CurrentTheme.DisableTextColor
										),
							   }
				),
				dense: true,
				onTap: () =>
				{ AppProvider.getRouter(context)!.navigateTo(
						context,
						"/public/browse_projects/view/" + this.item!.item.id + "/" +
								// this.browse_projects.title.replaceAll(' ', '-'))},
								"title")},
			),
		);
	}
}


SpeedDialChild ListButtonAsProjectOwnerWidget(Button button, BuildContext context){
  
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.red,
                        label: button.text,
                        labelStyle: TextStyle(fontSize: 18.0,color: Colors.black),
                        onTap: ()=>{ showSearchSelectDialog(context: context,
                        caption:button.text,
                        initialitems: button.selections,
                        initvalue: button.selections![0])
                        //AppProvider.getRouter(context)!.navigateTo(context,
                        },
                      )

	);  
  }else{
	return(	SpeedDialChild(
		  child: Icon(Icons.save),
		  backgroundColor: Colors.red,
		  label: button.text,
		  labelStyle: TextStyle(fontSize: 18.0,  color: Colors.black),
		  onTap: ()=>
		  {AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url!)) }
	  ));
  }

}














  

