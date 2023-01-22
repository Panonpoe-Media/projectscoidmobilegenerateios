import 'support_item_base.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/models/support_base.dart';
import 'button.dart';
/** AUTOGENERATE OFF **/

class ContactFormSupportModel extends ContactFormSupportBase{

  Map<String, dynamic> json;
  ContactFormSupportModel(Map<String, dynamic> this.json):super(json);
  @override
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SupportController support,

      var postContactFormResult, State state, String? sendPath, String? id,  String? title){

    final List<Widget>buttonChildren = <Widget>[
    ];
    for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
        model!.model.question!.contains('Permintaan Peninjauan')? model.buttons[i].text = 'Report': model.buttons[i].text = model.buttons[i].text;
        buttonChildren!.add(RButtonActionSupportWidget( model.buttons[i], context,formKey, controller,support, postContactFormResult, state, sendPath, id,  title));


      }
    }
    return(
        buttonChildren
    );
  }
  @override
  Widget editQuestion (State state) {
    return(
    model!.model.question!.contains('Permintaan Peninjauan')?

        MultilineWidget(
          value: model.model.question,
          caption: 'Report',
          hint: 'Isi dengan Multiline Anda',
          required: true,
          getValue: (String? val) {
            state.setState(() {
              model.model.question = val;
            });
          },
        )

        :
        MultilineWidget(
          value: model.model.question,
          caption: 'Question',
          hint: 'Isi dengan Multiline Anda',
          required: true,
          getValue: (String? val) {
            state.setState(() {
              model.model.question = val;
            });
          },
        )
    );
  }
}


class SupportModel extends SupportBase{
  Map<String, dynamic> json;
  SupportModel(Map<String, dynamic> this.json):super(json); 	

  
}
 


class SupportViewModel  extends SupportViewBase{
  Map<String, dynamic> json;
  SupportViewModel(Map<String, dynamic> this.json):super(json); 	
  
}


///////////////////////////////////////////////////


class SupportListingModel extends SupportListingBase{
  Map<String, dynamic> json;
  SupportListingModel(Map<String, dynamic> this.json):super(json);  

}

//class ItemSupport extends class ItemSupportBase{
//
//}



////////////////////////////
