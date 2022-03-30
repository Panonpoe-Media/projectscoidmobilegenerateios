
import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'ShowAvatar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';


class ShowOwnerWithRating extends StatelessWidget {
  //final WorkerItemModel model;
  final String? username;
  final String? avatar;
  final double? rating;
  final String? viewRating;
  final String? projects;



  ShowOwnerWithRating({this.avatar, this.username, this.rating, this.viewRating, this.projects});

  @override
  Widget build(BuildContext context) {
    return (
        Container(
          height: 190.0,
          width: 121.0,
          color: Colors.transparent,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 90.0,
                width: 110.0,
                child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          bottom: 0.0,
                          left: 20.0,
                          right: 0.0,
                          // In order to have the ink splash appear above the image, you
                          // must use Ink.image. This allows the image to be painted as part
                          // of the Material and display ink effects above it. Using a
                          // standard Image will obscure the ink splash.
                          child:

                          ShowAvatar(avatar : avatar)

                      ),
                    ]
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
                child: //Html(data:readText(model.user_name, 35),defaultTextStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500 ))
                Text(username!,
                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 12.0,
                      //color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      //fontFamily: "Sans"
                    )
                ),
              ),
              Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 10.0, top: 3.0),
                  child:
                  RatingBarIndicator(
                    rating: rating!/2 -0.01,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: CurrentTheme.PrimaryLightColor,
                    ),
                    itemCount: 5,
                    itemSize: 14.0,
                    unratedColor: Colors.black26,
                    direction:  Axis.horizontal,
                  ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0,right: 3.0),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.sort,
                      size: 11.0,
                      color: Colors.black54,
                    ),
                    Text(
                      ' ' + viewRating!,
                      softWrap: false,
                      style: const TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Sans",
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              projects == '' || projects == null ? const SizedBox(width: 0.0, height: 0.0,)  :Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 3.0,right: 3.0),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.work,
                      size: 11.0,
                      color: Colors.black54,
                    ),
                    Text(
                      ' ' + projects!,
                      softWrap: false,
                      style: const TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Sans",
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}