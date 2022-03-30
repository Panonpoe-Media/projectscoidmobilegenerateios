import 'package:flutter/material.dart';




class ShowAvatar extends StatelessWidget {
  const ShowAvatar({
    Key? key,
    this.avatar, this.ishuge = true,
  }) : super(key: key);


  final String? avatar;
  final bool? ishuge;

  @override
  Widget build(BuildContext context) {
    return(
        Container(
          width: ishuge! ? 100.0  : 65,
          height: ishuge! ? 100.0  : 65,
          decoration: ShapeDecoration(
            shadows:const [
              BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0)),
            ],

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: const BorderSide(
                  width: 3,
                  color: Colors.white
              ),
            ),


            image: DecorationImage(
              image: NetworkImage(avatar!),
              fit: BoxFit.contain,

          ),
        ),
        )
    );
  }
}



class ShowBoxAvatar extends StatelessWidget {
  const ShowBoxAvatar({
    Key? key,
    this.avatar, this.ishuge = true,
  }) : super(key: key);


  final String? avatar;
  final bool? ishuge;

  @override
  Widget build(BuildContext context) {
    return(
        Container(
          width: ishuge! ? 100.0  : 65,
          height: ishuge! ? 100.0  : 70,
          decoration: ShapeDecoration(
            shadows:const [
              BoxShadow(color: Colors.grey, offset: Offset(0.6, 0.6)),
            ],

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                  width: 2,
                  color: Colors.white
              ),
            ),


            image: DecorationImage(
              image: NetworkImage(avatar!),
              fit: BoxFit.none,

            ),
          ),
        )
    );
  }
}
