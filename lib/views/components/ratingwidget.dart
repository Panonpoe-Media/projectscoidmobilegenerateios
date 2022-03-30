import 'package:flutter/material.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

class RatingWidget extends StatelessWidget {

  int? value;
  String? hint;
  final bool? required;
  String? caption;
  bool? validation = true;
  final ValueChanged<int?>? getValue;
  double? rat ;

   RatingWidget({Key? key,  this.value, this.caption, this.hint, this.required, this.getValue}) : super(key: key){
           if(required!){
             caption = caption! + '*';
           }
           rat = value!.toDouble() * 0.50;
           
   }


   void changedrating(int? val){
      getValue!(val);
  }

  @override
  Widget build (BuildContext context){
    return
      ItemListWidget(
          tooltip: 'Send message',
          onPressed: (){
          },
          lines:
          caption,
          isdivided: false,
          wgt:
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 2.0),
              child:// <Widget>[
              Container(
                // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  // alignment: Alignment.center,
                  height: 56.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: const Color(0xFF000000), width: 0.5),
                    //color: CurrentTheme.ShadeColor,
                  ),
                  child:
                  Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                      child:// <Widget>[

                      Container(
                        // padding: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
                          alignment: Alignment.center,
                          height: 46.0,

                          child:
                          RatingBar.builder(
                            initialRating: rat!,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              final val = rating * 2;
                              getValue!(val.round!());
                            },
                          )
                         /*
                          SmoothStarRating(
                            rating: rat,
                            size: 35,
                            starCount: 5,
                            // allowHalfRating: true,
                            allowHalfRating: false,
                            onRatingChanged: (value) {
                              final val = value * 2;
                              getValue(val.round());
                              // setState(() {
                              //   rating = value;
                              // });
                            },
                          )
                      */
                      )

                    // ]
                  )
              )

            // ]
          )


      );
    /*
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: Text(caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
           ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
            child:// <Widget>[

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
                alignment: Alignment.center,
                height: 46.0,

                child:  SmoothStarRating(
                                rating: rat,
                                size: 35,
                                starCount: 5,
                               // allowHalfRating: true,
                                allowHalfRating: false,
                                onRatingChanged: (value) {
                                  final val = value * 2; 
                                  getValue(val.round());
                                 // setState(() {
                                 //   rating = value;
                                 // });
                                },
                      )
              )

           // ]
           )
        ]

      );

     */
  }


}

