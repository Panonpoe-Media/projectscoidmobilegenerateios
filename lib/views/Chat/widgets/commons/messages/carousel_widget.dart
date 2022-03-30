import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/models/messages/commons/commons.dart';
import 'package:projectscoid/views/Chat/widgets/commons/messages/messages.dart';

class CarouselWidget extends StatefulWidget {
  final List<Elements>? elements;
  final Function? onPayloadPress;
  const CarouselWidget({Key? key, this.elements, this.onPayloadPress})
      : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  CarouselSlider? slider;

  @override
  Widget build(BuildContext context) {
    slider = CarouselSlider(
      /*  viewportFraction: 1.0,
        height: MediaQuery.of(context).size.width,
        autoPlay: false,
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
        scrollPhysics: BouncingScrollPhysics(),


       */
        options: CarouselOptions(
          viewportFraction: 1.0,
          height: MediaQuery.of(context).size.width,
          autoPlay: false,
          enlargeCenterPage: false,
          enableInfiniteScroll: false,
          scrollPhysics: const BouncingScrollPhysics(),
        ),
        items: widget.elements?.map((element) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CardWidget(
                    element,
                    onPayloadPress: widget.onPayloadPress!,
                  ));
            },
          );
        }).toList());

    return Column(
      children: <Widget>[slider!, _sliderButtons!],
    );
  }

  Row sliderControlButtons(slider) {
    return Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: OutlineButton(
            onPressed: () => slider.previousPage(
                duration: const Duration(milliseconds: 300), curve: Curves.linear),
            child: const Text('prev item'),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: OutlineButton(
            onPressed: () => slider.nextPage(
                duration: const Duration(milliseconds: 300), curve: Curves.linear),
            child: const Text('next item'),
          ),
        ),
      ),
    ]);
  }

  Widget? get _sliderButtons => widget.elements!.length > 1
      ? sliderControlButtons(slider)
      : const IgnorePointer();
}
