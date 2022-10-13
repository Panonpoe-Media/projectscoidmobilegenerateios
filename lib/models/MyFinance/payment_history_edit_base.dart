
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import '../photo.dart';
import '../paging.dart';
import '../option_fields.dart';
import '../image_fields.dart';
import '../file_fields.dart';
part 'payment_history_edit_base.g.dart';

 void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
Widget RButtonActionPaymentHistoryWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController payment_history,
 var postPaymentHistoryResult, State state, String? sendPath, String? id,  String? title,  var formData){
  var cl;
  var ic;
 //  final size =MediaQuery.of(context).size;
    double? width = 400; //size.width;
  if (button.color == 'green'){
    cl = Colors.green;
  }
  if (button.color == 'yellow'){
    cl = Colors.yellow;
  }
  if (button.color == 'blue'){
    cl = Colors.blue;
  }
  if (button.color == 'red'){
    cl = Colors.red;
  }
  if (button.color == 'orange'){
    cl = Colors.orange;
  }
  if (button.color == 'grey'){
    cl = Colors.grey;
  }
  if (button.color == 'black'){
    cl = Colors.black;
  }
  if (button.color == 'brown'){
    cl = Colors.brown;
  }
  if (button.icon == 'fa fa-briefcase'){
    ic = Icons.work;
  }
  if (button.icon == 'fa fa-plus'){
    ic = Icons.add;
  }
  if (button.icon == 'fa fa-list-alt'){
    ic = Icons.list;
  }

  if (button.icon == 'fa fa-credit-card'){
    ic = Icons.credit_card;
  }
  if (button.icon == 'fa fa-paypal'){
    ic = Icons.account_balance_wallet;
  }
  if (button.icon == 'fa fa-bank'){
    ic = Icons.account_balance;
  }
  if (button.icon == 'fa fa-dollar'){
    ic = Icons.attach_money;
  }
  if (button.icon == 'fa fa-user'){
    ic = Icons.person;
  }
  if (button.icon == 'fa fa-edit'){
    ic = Icons.edit;
  }
  if (button.icon == 'fa fa-picture-o'){
    ic = Icons.picture_in_picture;
  }
  if (button.icon == 'fa fa-asterisk'){
    ic = Icons.ac_unit;
  }
  if (button.icon == 'fa fa-envelope-o'){
    ic = Icons.local_post_office;
  }
  if (button.icon == 'fa fa-mobile'){
    ic = Icons.phone_iphone;
  }
      if (button.icon == 'fa fa-bullhorn'){
      ic = Icons.wifi_tethering;
    }

    if (button.icon == 'fa fa-arrow-circle-down'){
      ic = Icons.arrow_downward;
    }
    if (button.icon == 'fa fa-comment'){
      ic = Icons.comment;
    }
    if (button.icon == 'fa fa-send'){
      ic = Icons.send;
    }
	 if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
	  
  if(button.type == 'custom_filter'){
    return (
	       ElevatedButton(
              child: button.text == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
              style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: Colors.white)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  const Color(0xFF037f51),),
                                              ),

              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button.text,
                    initialitems: button.selections,
                    initvalue: button.selections![0]);
              }
          )
	);  
  }else{
	return(	
	ButtonBar(
		 alignment: MainAxisAlignment.center,
		 buttonMinWidth: 0.43 * width,
		 children: <Widget>[
             ElevatedButton(
              child:   Row(
                             children: [
                               Icon(ic, size: 20),
                               SizedBox(width: 5,),
							   Text(button.text!),
                             ],
                            ),
		       style: ButtonStyle(
                                                textStyle: button.color == 'green'?
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: Colors.white)):
												 MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: Colors.black))	,
                                                backgroundColor: button.color == 'green'? 
                                                MaterialStateProperty.all<Color>(
                                                  const Color(0xFF037f51),):
												  MaterialStateProperty.all<Color>(
                                                  Colors.white,) ,
												  shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
												  ),


             // shape: RoundedRectangleBorder(
               //   side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
                //  ),
                

             // color : Color(0xFF037f51),
              onPressed: () async  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        payment_history =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = payment_history.sendData();
                        future.then((value) {
                        state.setState(() {
                        postPaymentHistoryResult = value;
                        });
                        }).catchError((Error){
								       if(!Error.toString().contains('302')){
					                  _onWidgetDidBuild(() {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(Error.toString()),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        });
					                    }
                      });
						;

                        } else {
						        _onWidgetDidBuild(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Input yang Anda masukan Ada yang tidak valid.'),
                                        backgroundColor: Colors.red,
                                         ),
                                       );
                                   });
						}
                  }
                
             
           )
		   ]
		  ) 
     );
  }

}

SpeedDialChild ButtonEditPaymentHistoryWidget(Button button, BuildContext context,var formKey, ScrollController controller, SubModelController payment_history,
 var postPaymentHistoryResult, State state, String? sendPath, String? id,  String? title, var formData){
  if(button.type == 'custom_filter'){
    return (
	       SpeedDialChild(
                        child: Icon(Icons.save),
                        backgroundColor: Colors.red,
                        label: button.text,
                        labelStyle: TextStyle(fontSize: 18.0),
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
		  labelStyle: TextStyle(fontSize: 18.0),
		  onTap: ()async{
		  {
                        controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                        if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        payment_history =      SubModelController(AppProvider.getApplication(context),
                        sendPath,
                        formData);
                        final future = payment_history.sendData();
                        future.then((value) {
                        state.setState(() {
                        postPaymentHistoryResult = value;
                        });
                        });

                        } else {}
                  }
		  }
	  ));
  }

}

@JsonSerializable()

class EditModelPaymentHistory {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  String? payment_id;
  int? user_id;
  String? user_url;
  String? user_str;
  List<int?>? user_list;
  List<String?>? user_list_str;
  int? our_account_id;
  String? our_account_url;
  String? our_account_str;
  List<int?>? our_account_list;
  List<String?>? our_account_list_str;
  int? direction_id;
  String? direction_str;
  List<int?>? direction_list;
  List<String?>? direction_list_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? bank_id;
  String? bank_url;
  String? bank_str;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  String? branch;
  String? city;
  String? account_no;
  String? account_name;
  DateTime? transfer_date;
  double? amount;
  String? amount_str;
  double? transfer_fee;
  String? transfer_fee_str;
  String? message;
  Photo? attachment;
  String?  attachment_url;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  int? ref_id;
  String? ref_id_str;
  DateTime? approved_date;
  int? approved_by_id;
  String? approved_by_url;
  String? approved_by_str;
  List<int?>? approved_by_list;
  List<String?>? approved_by_list_str;
  String? approved_from_ip;
  String? approver_note;
  String? secure_code;

	
	  EditModelPaymentHistory(
            this.id,
            this.payment_id,
			this.user_id,
			this.user_str,
			this.user_list,
			this.user_list_str,
			this.our_account_id,
			this.our_account_str,
			this.our_account_list,
			this.our_account_list_str,
			this.direction_id,
			this.direction_str,
			this.direction_list,
			this.direction_list_str,
			this.status_id,
			this.status_str,
			this.status_list,
			this.status_list_str,
			this.bank_id,
			this.bank_str,
			this.bank_list,
			this.bank_list_str,
			this.amount,
			this.amount_str,
			this.transfer_fee,
			this.transfer_fee_str,
			this.attachment,
			this.attachment_url,
			this.type_id,
			this.type_str,
			this.type_list,
			this.type_list_str,
			this.ref_id,
			this.ref_id_str,
			this.approved_by_id,
			this.approved_by_str,
			this.approved_by_list,
			this.approved_by_list_str,

  );
    factory EditModelPaymentHistory.fromJson(Map<String, dynamic> json) => _$EditModelPaymentHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$EditModelPaymentHistoryToJson(this);

}



@JsonSerializable()

class PaymentHistorySuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  EditModelPaymentHistory? model;
  PaymentHistorySuperBase(
	  this.id,
	  this.buttons,
	  this.meta,
	  this.model,
	  );
	
  
	
  factory PaymentHistorySuperBase.fromJson(Map<String, dynamic> json) => _$PaymentHistorySuperBaseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentHistorySuperBaseToJson(this);
   
}




class EditPaymentHistoryBase{
	var model;
	Map<String, dynamic> json;
	EditPaymentHistoryBase(this.json){
		model = PaymentHistorySuperBase.fromJson(this.json);
	}
	
   Map<String, dynamic> convertFormDataEdit(var data){
      var formData = {
      "user_payments[_trigger_]":"",
  "user_payments[user_id]": "${model.model.user_id }",
  "user_payments[our_account_id]": "${model.model.our_account_id }",
   "user_payments[direction_id]": "${model.model.direction_id}",
   "user_payments[status_id]": "${model.model.status_id}",
  "user_payments[bank_id]": "${model.model.bank_id }",
  "user_payments[branch]": "${model.model.branch }",
  "user_payments[city]": "${model.model.city }",
  "user_payments[account_no]": "${model.model.account_no }",
  "user_payments[account_name]": "${model.model.account_name }",
  "user_payments[transfer_date]": "${model.model.transfer_date}",
  "user_payments[amount]": "${model.model.amount}",
  "user_payments[transfer_fee]": "${model.model.transfer_fee}",
   "user_payments[message]": "${model.model.message }",
  "user_payments[attachment]": '{"status":"1","name":"${model.model.attachment.name}","temp":"${model.model.attachment.dir}"}',
   "user_payments[type_id]": "${model.model.type_id}",
  "user_payments[ref_id]": "${model.model.ref_id }",
  "user_payments[approved_date]": "${model.model.approved_date}",
  "user_payments[approved_by_id]": "${model.model.approved_by_id }",
  "user_payments[approved_from_ip]": "${model.model.approved_from_ip }",
   "user_payments[approver_note]": "${model.model.approver_note }",
  "user_payments[secure_code]": "${model.model.secure_code }",
	  
  };  

    return( formData);

  } 
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController payment_history,
  var postPaymentHistoryResult, State state, String? sendPath, String? id,  String? title){
  var formData = convertFormDataEdit(model);  
    final List<Widget> buttonChildren = <Widget>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      if(model.buttons[i].text != "Table View"){
      buttonChildren.add(RButtonActionPaymentHistoryWidget(model.buttons[i], context,formKey, controller,payment_history, postPaymentHistoryResult, state, sendPath, id,  title, formData));
      }
    }
       return(
	        buttonChildren 
	   );
   } 
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController payment_history,
  var postPaymentHistoryResult, State state, String? sendPath, String? id,  String? title){
	var formData = convertFormDataEdit(model);   
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
	for(var i = 0; i < model.buttons.length; i++)
    {
      buttonChildren.add(ButtonEditPaymentHistoryWidget(model.buttons[i], context,formKey, controller,payment_history, postPaymentHistoryResult, state, sendPath, id,  title, formData ));
    }
       return(
	        buttonChildren 
	   );
   } 
   
   
       Widget	 RButtons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController payment_history,
  var postPaymentHistoryResult, State state, String? sendPath, String? id,  String? title ){
    //  final size =MediaQuery.of(context).size;
    double? width = 400;

    return(
        ButtonBarTheme(
            data: ButtonBarThemeData(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.9 * width,
            ),
            child: ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 0.9 * width,
                children:
           RlistButton(context, formKey,controller,payment_history, postPaymentHistoryResult, state, sendPath, id,  title )
	    
            )
        )
    );
   
   }    
   
    SpeedDial	 Buttons(BuildContext context, bool? visible, var formKey, ScrollController controller, SubModelController payment_history,
  var postPaymentHistoryResult, State state, String? sendPath, String? id,  String? title ){
     return(
	 SpeedDial(
                childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
				animatedIcon: AnimatedIcons.menu_close,
				animatedIconTheme: IconThemeData(size: 22.0),
				// this is ignored if animatedIcon is non null
				// child: Icon(Icons.add),
				visible: visible!,
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
				children:listButton(context, formKey,controller,payment_history, postPaymentHistoryResult, state, sendPath, id,  title )
	    )
	 );
   } 	


	  	    Widget editUser (State state) {
	   return(  StringView(
		value: model.model.user_str,
		caption: 'User',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.user_id,
	  caption: 'User',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.user_id_list,
	  nameenum: model.model.user_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.user_id = val;
		});
	  },
	));*/
	}

	  	    Widget editOurAccount (State state) {
	   return(  StringView(
		value: model.model.our_account_str,
		caption: 'Our Account',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.our_account_id,
	  caption: 'Our Account',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.our_account_id_list,
	  nameenum: model.model.our_account_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.our_account_id = val;
		});
	  },
	));*/
	}

   	    Widget editDirection (State state) {
      return(
	  EnumWidget(
	  value: model.model.direction_id,
	  caption: 'Direction',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.direction_list,
	  nameenum: model.model.direction_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.direction_id = val;
		});
	  },
	));}

   	    Widget editStatus (State state) {
      return(
	  EnumWidget(
	  value: model.model.status_id,
	  caption: 'Status',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.status_list,
	  nameenum: model.model.status_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.status_id = val;
		});
	  },
	));}

	  	    Widget editBank (State state) {
	   return(  StringView(
		value: model.model.bank_str,
		caption: 'Bank',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.bank_id,
	  caption: 'Bank',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.bank_id_list,
	  nameenum: model.model.bank_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.bank_id = val;
		});
	  },
	));*/
	}

	  	    Widget editBranch (State state) {
      return(
	DisplayNameWidget(
		value: model.model.branch,
		caption: 'Branch',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.branch = val;
		  });
		},
    ));}

	  	    Widget editCity (State state) {
      return(
	DisplayNameWidget(
		value: model.model.city,
		caption: 'City',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.city = val;
		  });
		},
    ));}

	  	    Widget editAccountNo (State state) {
      return(
	DisplayNameWidget(
		value: model.model.account_no,
		caption: 'Account No',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.account_no = val;
		  });
		},
    ));}

	  	    Widget editAccountName (State state) {
      return(
	DisplayNameWidget(
		value: model.model.account_name,
		caption: 'Account Name',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.account_name = val;
		  });
		},
    ));}

	  	    Widget editTransferDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.transfer_date,
	  caption: 'Transfer Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.transfer_date = val;
		});
	  },
	));} 

	  	    Widget editAmount (State state) {
      return(
	MoneyWidget(
	  value: model.model.amount,
	  caption: 'Amount',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.amount = val;
		});
	  },
	));}

	  	    Widget editTransferFee (State state) {
      return(
	MoneyWidget(
	  value: model.model.transfer_fee,
	  caption: 'Transfer Fee',
	  hint: 'Isi dengan Money Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (double? val) {
		state.setState(() {	
		  model.model.transfer_fee = val;
		});
	  },
	));}

	 	    Widget editMessage (State state) {
      return(
	MultilineWidget(
	  value: model.model.message,
	  caption: 'Message',
	  hint: 'Isi dengan Multiline Anda',
	  required:true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.message = val;
		});
	  },
	));}

	  	    Widget editAttachment (State state) {
      return(
  //ImageWidget edit& FileWidget editexperiment validation non from validation.
	ImageWidget(
		value: model.model.attachment,
		caption: 'Attachment',
		hint: 'Isi dengan Image Anda',
		required: true,
		getValue: (var val) {
		  state.setState(() {
			model.model.attachment = val;
		  });
		},
	));} 

   	    Widget editType (State state) {
      return(
	  EnumWidget(
	  value: model.model.type_id,
	  caption: 'Type',
	  hint: 'pilih Enum',
	  required:true,
	  idenum: model.model.type_list,
	  nameenum: model.model.type_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.type_id = val;
		});
	  },
	));}

	  	    Widget editRefId (State state) {
      return(
	NumberWidget(
	  value: model.model.ref_id,
	  caption: 'Ref Id',
	  hint: 'Isi dengan Number Anda',
	  required:true,
	  min:'10',
	  max:'2000000',
	  getValue: (int? val) {
		state.setState(() {
		  model.model.ref_id = val;
		});
	  },
	));}

	  	    Widget editApprovedDate (State state) {
      return(
	    DateTimeWidget(
	  value: model.model.approved_date,
	  caption: 'Approved Date',
	  hint: 'isi dengan DateTime? diatas.',
	  required: true,
	  getValue:(DateTime val) {
		state.setState(() {
		  model.model.approved_date = val;
		});
	  },
	));} 

	  	    Widget editApprovedBy (State state) {
	   return(  StringView(
		value: model.model.approved_by_str,
		caption: 'Approved By',
	));		
    /*  return(
	  ModelWidget(
	  value: model.model.approved_by_id,
	  caption: 'Approved By',
	  hint: 'pilih Model',
	  required:true,
	  idenum: model.model.approved_by_id_list,
	  nameenum: model.model.approved_by_id_list_str,
	  getValue: (int? val) {
		state.setState(() {
		  model.model.approved_by_id = val;
		});
	  },
	));*/
	}

	  	    Widget editApprovedFromIp (State state) {
      return(
	DisplayNameWidget(
		value: model.model.approved_from_ip,
		caption: 'Approved From IP',
		hint: 'Isi dengan Website Anda',
		required:true,
		getValue: (String? val) {
		  state.setState(() {
			model.model.approved_from_ip = val;
		  });
		},
    ));}

	 	    Widget editApproverNote (State state) {
      return(
	MultilineWidget(
	  value: model.model.approver_note,
	  caption: 'Approver Note',
	  hint: 'Isi dengan Multiline Anda',
	  required:true,
	  getValue: (String? val) {
		state.setState(() {
		  model.model.approver_note = val;
		});
	  },
	));}

	  
	 // String? model.model.secure_code;
	
}













  

