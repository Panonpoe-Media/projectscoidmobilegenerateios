  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataSales(String triger, var model
   ){
  
   String action =   'Sales';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"order_item[_trigger_]":"$tgr"};
  formData.addAll({"order_item[buyer_id]": "${model.model.buyer_id }"});
  formData.addAll({"order_item[order_id]": "${model.model.order_id }"});
  formData.addAll({"order_item[title]": "${model.model.title }"});
   formData.addAll({"order_item[type_id]": "${model.model.type_id }"});
  formData.addAll({"order_item[product_id]": "${model.model.product_id }"});
  formData.addAll({"order_item[project_id]": "${model.model.project_id }"});
  formData.addAll({"order_item[service_id]": "${model.model.service_id }"});
  formData.addAll({"order_item[bid_id]": "${model.model.bid_id }"});
  formData.addAll({"order_item[iklan_id]": "${model.model.iklan_id }"});
  formData.addAll({"order_item[date]": "${model.model.date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.date)}"});
  formData.addAll({"order_item[price]": "${model.model.price }"});
   formData.addAll({"order_item[status_id]": "${model.model.status_id }"});
  formData.addAll({"order_item[seller_id]": "${model.model.seller_id }"});
  formData.addAll({"order_item[buyer_payment_id]": "${model.model.buyer_payment_id }"});
  formData.addAll({"order_item[seller_credit_id]": "${model.model.seller_credit_id }"});
  formData.addAll({"order_item[rating]": "${model.model.rating }"});
  formData.addAll({"order_item[testimony]": "${model.model.testimony }"});
 


    return( formData);
  } 	
	
