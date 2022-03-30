
import 'package:json_annotation/json_annotation.dart';
import 'portofolio_list_base.dart';
import 'portofolio_list_item.dart';
import 'portofolio_list_item_base.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/views/MyProfile/portofolio_edit.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/app/Env.dart';


/** AUTOGENERATE OFF **/

class PortofolioListingModel extends PortofolioListingBase{
  Map<String, dynamic> json;

  PortofolioListingModel(Map<String, dynamic> this.json):super(json);

  @override
  Widget viewItem2(ItemPortofolioModel item,String search, bool account, String id, State state) {
    ShapeBorder? shape;
    double? height = 302;


    return Visibility (
        child:  PortofolioCard1(destination :item, search : search, shape : shape, height : height, id : id, state : state)
    );

  }
  
  
}


class PortofolioCard1 extends StatelessWidget {
  const PortofolioCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.id, this.state})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemPortofolioModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final String? id;
  final State? state;
 



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
                height: height,
                /*   child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                margin: EdgeInsets.all(0.0),
                borderOnForeground : false, */
                child: PortofolioContent1(destination: destination, id : id, state : state),
                //   ),
              ),

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
                height: 10.0,
                decoration: new BoxDecoration(
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


class PortofolioContent1 extends StatelessWidget {
  const PortofolioContent1({ Key? key, @required this.destination, this.id, this.state })
      : assert(destination != null),
        super(key: key);

  final ItemPortofolioModel? destination;
  final String? id;
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
                  destination!.item.image_url,
                  fit: BoxFit.cover,
                )
            ),
            Positioned.fill(
                child: new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyProfilePortofolioEdit(id: '', title: '', url :urlToRoute(destination!.item.buttons[0].url ))),
                        );
                        /*
                        AppProvider.getRouter(context).navigateTo(
                            context,
                            urlToRoute(destination!.item.buttons[0].url ));

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
                    destination!.item.image_url,
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
                                     destination!.item.year.toString(),
                                     style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 13),
                                   ), destination!.item.link == null? Container(width: 0.0, height: 0.0,):
                                   Text(
                                     ' . '+ destination!.item.link + ' . ',
                                     style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 13),
                                   ),


                                 ]
                             ),
                           ),

                            HtmlWidget(readText(destination!.item.description, 62) ),
                          ]
                      )
                  )
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0 , 0.0),
                child: PopupMenuButton<int>(
                  onSelected: (int value)async{

                    if(value == 1) {
                     // AppProvider.getRouter(context).navigateTo(
                     //     context,
                     //     urlToRoute(destination!.item.buttons[0].url ));
                     //
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyProfilePortofolioEdit(id: '', title: '', url :urlToRoute(destination!.item.buttons[0].url ))),
                      ).then((value){state!.setState(() {});});
                    }
                    if(value == 2) {

                      SubModelController del;
                     // String delPath = Env.value.baseUrl + '/user/cart/cart_items_remove/${mdl.model.model.user_id}/123/${mdl.model.model.cart_items.items[position].cart_id.toString()}/${mdl.model.model.cart_items.items[position].total_price.round().toString()}' ;
                      del = new  SubModelController(AppProvider.getApplication(context),
                          Env.value!.baseUrl! + destination!.item.buttons[1].url,
                          null);
                      await del.getData();
                      state!.setState(() {});
                      /*
                      AppProvider.getRouter(context).navigateTo(
                          context,
                          urlToRoute(destination!.item.buttons[1].url ));

                       */
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

}






  

