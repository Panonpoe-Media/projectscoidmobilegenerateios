import 'package:json_annotation/json_annotation.dart';
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
import 'package:flutter_html/style.dart';
import 'dart:convert';
import 'image_fields.dart';
import 'file_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'selection.dart';
import 'home_item.dart';
import 'home_item_base.dart';
import 'photo.dart';
import 'paging.dart';
part 'home_base.g.dart';

class HomeListingBase {
  var items;
  var tools;
  Map<String, dynamic> json;
  HomeListingBase(this.json) {
    items = HomeListingItems.fromJson(this.json);
    tools = HomeListingTools.fromJson(this.json);
  }

  Widget viewItem(ItemHomeModel item, String search) {
    ShapeBorder? shape;
    double height = 0;
    double totalHeight = 0;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 4;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 15;
    totalHeight = totalHeight + 8;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 8;
    totalHeight = totalHeight + 2;
    height = totalHeight * 50;

    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item!.item!.toJson())).contains(search)),
        child: ItemHomeCard(
            destination: item, search: search, shape: shape, height: height));
  }

  Widget viewItemIndex(ItemHomeModel item, String search, int index) {
    ShapeBorder? shape;
    double height = 0;
    double totalHeight = 0;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 4;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 15;
    totalHeight = totalHeight + 8;
    totalHeight = totalHeight + 2;
    totalHeight = totalHeight + 8;
    totalHeight = totalHeight + 2;
    height = totalHeight * 50;

    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item!.item!.toJson())).contains(search)),
        child: ItemHomeCard(
            destination: item, search: search, shape: shape, height: height));
  }

  Widget viewItem1 (ItemHomeModel item,ItemHomeModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index) {
ShapeBorder? shape;
double height = 0;
double totalHeight = 0;
return Visibility (
visible: (search == '' || allModelWords(jsonEncode(item!.item!.toJson())).contains(search)),
child:  ItemHomeCard(destination :item, search : search, shape : shape, height: height)
);


}

List<SpeedDialChild> listButton(BuildContext context) {
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[];
    for (var i = 0; i < tools.buttons.length; i++) {
      buttonChildren.add(ListButtonHomeWidget(tools.buttons[i], context));
    }

    return (buttonChildren);
  }

  SpeedDial Buttons(BuildContext context, bool visible) {
    return (SpeedDial(
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
        children: listButton(context)));
  }
}

class HomeListingItems {
  List<ItemHomeModel?>? items;
  HomeListingItems(
    this.items,
  );

  factory HomeListingItems.fromJson(Map<String, dynamic> json) {
    return HomeListingItems((json['items'] as List)
        ?.map(
            (e) => e == null ? null : ItemHomeModel(e as Map<String, dynamic>))
        ?.toList());
  }
}

@JsonSerializable()
class HomeListingTools {
  String? id;
  Meta? meta;
  List<Button?>? buttons;
  Paging? paging;
  List<ItemHome?>? items;
  HomeListingTools(
    this.id,
    this.buttons,
    this.meta,
    this.paging,
    this.items,
  );

  factory HomeListingTools.fromJson(Map<String, dynamic> json) =>
      _$HomeListingToolsFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListingToolsToJson(this);
}

class ItemHomeCard extends StatelessWidget {
  const ItemHomeCard(
      {Key? key,
      @required this.destination,
      this.search,
      this.shape,
      this.height})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height;
  final ItemHomeModel? destination;
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
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: ItemHomeContent(destination: destination!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemHomeContent extends StatelessWidget {
  const ItemHomeContent({Key? key, @required this.destination})
      : assert(destination != null),
        super(key: key);

  final ItemHomeModel? destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.ShadeColor);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;

    final List<Widget> buttonChildren = <Widget>[];

    final List<Widget> children = [];
    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
      child: Html(data: "<h3>Header</h3>"),
    ));
    children.add(destination!.viewUserName(context));
    children.add(Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
      child: Html(data: "<h3>footer</h3>"),
    ));

    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class ItemHomeWidget extends StatelessWidget {
  final ItemHomeModel? item;
  final String? search;
  const ItemHomeWidget({Key? key, @required this.item, this.search})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // visible: (this.search! == '' || this.browse_projects.item!.title.contains(this.search!) || this.browse_projects.items.items.article.contains(this.search!)),
      visible: (this.search! == '' ||
          allModelWords(jsonEncode(this.item!.item!.toJson()))
              .contains(this.search!)),
      child: ListTile(
        leading: Container(
          height: 50.0,
          width: 50.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              item!.item!.pht!,
            ),
          ),
        ),
        title: Text(item!.item!.ttl!),
        isThreeLine: true,
        subtitle: Html(data: item!.item!.sbttl,
            //style: TextStyle(fontSize: 16, color: CurrentTheme.ShadeColor),
            //defaultTextStyle: TextStyle(color: CurrentTheme.DisableTextColor)
            style: {
              "html": Style(color: CurrentTheme.DisableTextColor),
            }),
        dense: true,
        onTap: () => {
          AppProvider.getRouter(context)!.navigateTo(
              context,
              "/public/browse_projects/view/" +
                  item!.item!.id! +
                  "/" +
                  // this.browse_projects.title.replaceAll(' ', '-'))},
                  "title")
        },
      ),
    );
  }
}

SpeedDialChild ListButtonHomeWidget(Button button, BuildContext context) {
  if (button.type == 'custom_filter') {
    return (SpeedDialChild(
      child: Icon(Icons.save),
      backgroundColor: Colors.red,
      label: button.text,
      labelStyle: TextStyle(fontSize: 18.0),
      onTap: () => {
        showSearchSelectDialog(
            context: context,
            caption: button.text,
            initialitems: button.selections,
            initvalue: button.selections![0])
        //AppProvider.getRouter(context)!.navigateTo(context,
      },
    ));
  } else {
    return (SpeedDialChild(
        child: Icon(Icons.save),
        backgroundColor: Colors.red,
        label: button.text,
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => {
              AppProvider.getRouter(context)!
                  .navigateTo(context, urlToRoute(button!.url!))
            }));
  }
}