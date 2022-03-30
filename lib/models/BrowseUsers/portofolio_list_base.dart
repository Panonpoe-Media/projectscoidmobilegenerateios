
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
import 'portofolio_list_item.dart';
import 'portofolio_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/views/MyProfile/portofolio_edit.dart';
import 'package:projectscoid/app/Env.dart';
part 'portofolio_list_base.g.dart';


/** AUTOGENERATE OFF **/
class PortofolioListingBase{
  var items;
  var tools;
	Map<String, dynamic> json;
	PortofolioListingBase(this.json){
		items = PortofolioListingItems.fromJson(this.json);
		tools = PortofolioListingTools.fromJson(this.json);
	}

	Widget viewItem ( ItemPortofolioModel item,String search, bool account, String id) {
		ShapeBorder? shape;
		double height = 0;
		double totalHeight = 0;
		totalHeight = totalHeight + 2 ;
		totalHeight = totalHeight + 8 ;
		totalHeight = totalHeight + 2 ;
		totalHeight = totalHeight + 2 ;
		height = totalHeight * 50;
		return Visibility (
				visible: (search == '' || allModelWords(jsonEncode(item.item!.toJson())).contains(search)),
				child:  ItemPortofolioCard(destination :item, search : search, shape : shape, height: height, state: null)
		);


	}


  Widget viewItem2 ( ItemPortofolioModel item,String search, bool account, String id, State state) {
	ShapeBorder? shape;
    double height = 0;
	double totalHeight = 0;
	   totalHeight = totalHeight + 2 ;
	totalHeight = totalHeight + 8 ;
	   totalHeight = totalHeight + 2 ;
	   totalHeight = totalHeight + 2 ;
	  height = totalHeight * 50;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item!.toJson())).contains(search)),
        child:  ItemPortofolioCard(destination :item, search : search, shape : shape, height: height, state: state)
    );


	}
	
  Widget viewItem1 (ItemPortofolioModel item,ItemPortofolioModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index) {
	ShapeBorder? shape;
    double height = 0;
	double totalHeight = 0;
	    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item!.toJson())).contains(search)),
        child:  ItemPortofolioCard(destination :item, search : search, shape : shape, height: height)
    );


	}	   
	

	
   List<SpeedDialChild>	 listButton(BuildContext context, String id){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
      buttonChildren.add(ListButtonPortofolioWidget(tools.buttons[i],context));
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
   
    List<SpeedDialChild>	 listButton1(BuildContext context, String id, String id1){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < tools.buttons.length; i++)
    {
      buttonChildren.add(ListButtonPortofolioWidget(tools.buttons[i],context));
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





class PortofolioListingItems{
  List<ItemPortofolioModel?>? items;
  PortofolioListingItems(
      this.items,
      );

  factory PortofolioListingItems.fromJson(Map<String, dynamic> json) {
  	return PortofolioListingItems(
				(json['items'] as List)
						?.map((e) => e == null
						? null
						: ItemPortofolioModel(e as Map<String, dynamic>))
						?.toList());
	}
}


@JsonSerializable()
class PortofolioListingTools{

	String? id;
	Meta? meta;
	List<Button?>? buttons;
	Paging? paging;
	List<ItemPortofolio?>? items;
	PortofolioListingTools(
			this.id,
			this.buttons,
			this.meta,
			this.paging,
			this.items,
			);


	factory PortofolioListingTools.fromJson(Map<String, dynamic> json) => _$PortofolioListingToolsFromJson(json);

	Map<String, dynamic> toJson() => _$PortofolioListingToolsToJson(this);

}




class ItemPortofolioCard extends StatelessWidget {
  const ItemPortofolioCard({ Key? key, @required this.destination, this.search, this.shape, this.height, this.state})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height;
  final ItemPortofolioModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final State? state;

  @override
  Widget build(BuildContext context) {

		return Center(
			child:
			Padding(
				padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
				child: Column(
					children: <Widget>[
					//	index == 0? Container(height: 30,): Container(),
						// const SectionTitle(title: ''),
						Container(
							// height: height,
							// child: Card(
							// This ensures that the Card's children are clipped correctly.
							//   clipBehavior: Clip.antiAlias,
							//   shape: shape,
							//  margin: EdgeInsets.all(0.0),
							child: ItemPortofolioContent(destination: destination, state: state),
						),
						// ),

					],
				),
			),
			/*
      Card(
        elevation : 3.0,
        borderOnForeground: false,
        margin : EdgeInsets.all(6.0),
        child:
        ItemTestimonialContent1(destination: destination, account: account),
      ),

           */
		);
		/*
  	
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
             // child: Card(
                // This ensures that the Card's children are clipped correctly.
              //  clipBehavior: Clip.antiAlias,
              //  shape: shape,
                child: ItemPortofolioContent(destination: destination),
             // ),
            ),
          ],
        ),
      ),
    );

		 */
  }
}

class ItemPortofolioContent extends StatelessWidget {
  const ItemPortofolioContent({ Key? key, @required this.destination, this.state })
      : assert(destination != null),
        super(key: key);

  final ItemPortofolioModel? destination;
  final State? state;
	@override
	Widget build(BuildContext context) {
		final ThemeData theme = Theme.of(context);
		final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
		final TextStyle? descriptionStyle = theme.textTheme.headline5;
		final mediaQueryData = MediaQuery.of(context);

		final List<Widget> children = <Widget>[
			// Photo and title.
			SizedBox(
				height:  230.0,
				child: Stack(

					children: <Widget>[
						Positioned.fill(
								bottom: 0.0,
								left: 0.0,
								right: 0.0,
								// In order to have the ink splash appear above the image, you
								// must use Ink.image. This allows the image to be painted as part
								// of the Material and display ink effects above it. Using a
								// standard Image will obscure the ink splash.
								child:
								Image.network(
									destination!.item!.image_url,
									fit: BoxFit.cover,
								)
						),
						Positioned.fill(
								child: new Material(
										color: Colors.transparent,
										child: new InkWell(
											splashColor: Colors.lightGreenAccent,
											onTap: () {
												/*
												Navigator.push(
													context,
													MaterialPageRoute(builder: (context) => MyProfilePortofolioEdit(id: '', title: '', url :urlToRoute(destination!.item!.buttons[0].url ))),
												);

												 */
											},
										)
								)
						),

					],
				),
			),

			SizedBox(
				height: 72.0,
				child:
				Row(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							// three line description

							Container(
								padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0 , 0.0),
								child:  ClipRRect(
									borderRadius: BorderRadius.circular(50),
									child: Image.network(
										destination!.item!.image_url,
										fit: BoxFit.cover,
										height: 55.0,
										width: 55.0,
									),
								),
							),
							//newly added
							Flexible(
									child: Container(
											padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
											child: Column(
													crossAxisAlignment : CrossAxisAlignment.start,
													children : <Widget>[
														Padding(
															padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0 , 0.0),
															child:  Row(
																	children: <Widget>[

																		// three line description
																		Text(
																			destination!.item!.year.toString(),
																			style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 13),
																		), destination!.item!.link == null? Container(width: 0.0, height: 0.0,):
																		Text(
																			' . '+ destination!.item!.link + ' . ',
																			style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 13),
																		),


																	]
															),
														),

														HtmlWidget(readText(destination!.item!.description, 62) ),
													]
											)
									)
							),
							Container(
								padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0 , 0.0),
								child: PopupMenuButton<int>(
									onSelected: (int value) async{

										if(value == 1) {
											// AppProvider.getRouter(context).navigateTo(
											//     context,
											//     urlToRoute(destination!.item!.buttons[0].url ));
											//
											Navigator.push(
												context,
												MaterialPageRoute(builder: (context) => MyProfilePortofolioEdit(id: '', title: '', url :urlToRoute(destination!.item!.buttons[0].url ))),
											);
										}
										if(value == 2){




											SubModelController del;
											String delPath = Env.value!.baseUrl! + destination!.item!.buttons[1].url  ;
											del = new  SubModelController(AppProvider.getApplication(context),
													delPath,
													null);
											await del.getData();

													state!.setState(() {

													});
										}



									},
									itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
										const PopupMenuItem<int>(
											value: 1,
											child: Text('Edit'),
										),
										const PopupMenuItem<int>(
											value: 2,
											child: Text('Delete'),
										),

									],
								),
							),

						]

				),

			)
			// Description and share/explore buttons.


		];



		// }
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: children,
		);
	}
/*
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    final List<Widget> buttonChildren = <Widget>[
    ];
	if (destination!.item!.buttons != null) {
		for(var i = 0; i < destination!.item!.buttons.length; i++)
		{
		  buttonChildren.add(itemPortofolioButton(destination,i , context));
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
	   children.add(destination!.viewLink(context)); 
	   children.add(destination!.viewImage(context));
	   children.add(destination!.viewYear(context)); 
	   children.add(destination!.viewDescription(context)); 
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
		  ButtonTheme.bar(
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
		  ButtonTheme.bar(
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
		  ButtonTheme.bar(
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
		  ButtonTheme.bar(
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
		  ButtonTheme.bar(
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
		  ButtonTheme.bar(
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
		  ButtonTheme.bar(
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
		  ButtonTheme.bar(
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
		  ButtonTheme.bar(
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

 */
}

Widget itemPortofolioButton(ItemPortofolioModel destination, int index, BuildContext context){

  return(
    FlatButton(
      child: Text(destination!.item!.buttons[index].text, semanticsLabel: 'Share ${destination!.item!.ttl}'),
      textColor: CurrentTheme.MainAccentColor,
      splashColor : CurrentTheme.ShadeColor,
      color : CurrentTheme.SecondaryAccentColor,
      onPressed: () {
        print('${destination!.item!.buttons[index].url}');
        AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(destination!.item!.buttons[index].url));
      },
    )
  );
}



class ItemPortofolioWidget extends StatelessWidget {

	final ItemPortofolioModel? item;
	final String? search;
	const  ItemPortofolioWidget({Key? key, @required this.item, this.search}) : super(key: key);


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
						data:item!.item!.sbttl ,
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


SpeedDialChild ListButtonPortofolioWidget(Button button, BuildContext context){
  
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
                        //AppProvider.getRouter(context).navigateTo(context,
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














  

