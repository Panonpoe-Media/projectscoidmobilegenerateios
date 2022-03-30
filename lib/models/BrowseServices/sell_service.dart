  import 'package:intl/intl.dart';
  
  
  Map<String, dynamic> convertFormDataSellService(String triger, var model
            ,var logolast 
   ){
  
   String action =   'SellService';
   bool isEdit = action.contains(new RegExp(r'edit', caseSensitive: false));    
	String logo = '';
  String logo_last = '';
  if(isEdit && logolast != null){
      logo_last = '{"name":"${ logolast.name}","dir":"${ logolast.dir}","file":"${ logolast.file}","thumb":"${ logolast.thumb}"}';
   
  }
	if (model.model.logo!= null) {
		 if (model.model.logo.temp != '' && model.model.logo.temp != null) {
		   logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      		
     }
	 }
  	String options = '';
	if(model.model.options!= null){
	  for(var obj in model.model.options){
	    options = options + '{"description":"${obj.description}","price":"${obj.price.toString()}"},';
    }
	  options = '[${ options.substring(0, options.length - 1)}]';
  }
      String tgr = triger.toLowerCase().replaceAll(' ', '_');
      var formData = {"service[_trigger_]":"$tgr"};
  formData.addAll({"service[seller_id]": "${model.model.seller_id }"});
  formData.addAll({"service[logo]": '$logo'});
  formData.addAll({"service[logo_lastval]": '$logo_last'});
  formData.addAll({"service[category_id]": "${model.model.category_id }"});
  formData.addAll({"service[title]": "${model.model.title }"});
  formData.addAll({"service[description]": "${model.model.description }"});
  formData.addAll({"service[short_description]": "${model.model.short_description }"});
  formData.addAll({"service[finish_days]": "${model.model.finish_days }"});
  formData.addAll({"service[price]": "${model.model.price }"});
  formData.addAll({"service[options]": '$options'});
   formData.addAll({"service[status_id]": "${model.model.status_id }"});
  formData.addAll({"service[registered_by_id]": "${model.model.registered_by_id }"});
  formData.addAll({"service[registered_date]": "${model.model.registered_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.registered_date)}"});
  formData.addAll({"service[registered_from_ip]": "${model.model.registered_from_ip }"});
  formData.addAll({"service[verified_by_id]": "${model.model.verified_by_id }"});
  formData.addAll({"service[verified_date]": "${model.model.verified_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.verified_date)}"});
  formData.addAll({"service[verified_from_ip]": "${model.model.verified_from_ip }"});
   formData.addAll({"service[verifier_note]": "${model.model.verifier_note }"});
  formData.addAll({"service[approved_by_id]": "${model.model.approved_by_id }"});
  formData.addAll({"service[approved_date]": "${model.model.approved_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.approved_date)}"});
  formData.addAll({"service[approved_from_ip]": "${model.model.approved_from_ip }"});
   formData.addAll({"service[approver_note]": "${model.model.approver_note }"});
  formData.addAll({"service[published_by_id]": "${model.model.published_by_id }"});
  formData.addAll({"service[published_date]": "${model.model.published_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.published_date)}"});
  formData.addAll({"service[published_from_ip]": "${model.model.published_from_ip }"});
  formData.addAll({"service[rejected_by_id]": "${model.model.rejected_by_id }"});
  formData.addAll({"service[rejected_date]": "${model.model.rejected_date == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.rejected_date)}"});
  formData.addAll({"service[rejected_from_ip]": "${model.model.rejected_from_ip }"});
  formData.addAll({"service[admin_note]": "${model.model.admin_note }"});
  formData.addAll({"service[last_bump]": "${model.model.last_bump == null? '':DateFormat('dd/MM/yyyy HH:mm:ss').format(model.model.last_bump)}"});
  formData.addAll({"service[sales_count]": "${model.model.sales_count }"});
  formData.addAll({"service[sales_amount]": "${model.model.sales_amount }"});
  formData.addAll({"service[rating]": "${model.model.rating }"});
  formData.addAll({"service[points]": "${model.model.points }"});
  formData.addAll({"service[ranking]": "${model.model.ranking }"});
  formData.addAll({"service[rating_num]": "${model.model.rating_num }"});
  formData.addAll({"service[rating_sum]": "${model.model.rating_sum }"});
  formData.addAll({"service[rating_div]": "${model.model.rating_div }"});
  formData.addAll({"service[selected_options]": "${model.model.selected_options }"});
  formData.addAll({"service[total_price]": "${model.model.total_price }"});
  formData.addAll({"service[special_requirements]": "${model.model.special_requirements }"});
 
      int count = 0;
      for(var tag in model.model.tags_id){
        formData.addAll({"service[tags][selection][$count]": "$tag"});
        count++;
      }
  int count1 = 1;
      String ro = '';
   for(var obj in model.model.options){
     formData.addAll({"service__options_tbl_description_${count1.toString()}": "${obj.description}"});
     formData.addAll({"service__options_tbl_price_${count1.toString()}": "${obj.price.toString()}"});

     if(count1 == 1){
       ro = '1';
     }else{
       ro = ro + ',${count1.toString()}';
     }
     count1++;

   }
   formData.addAll({"service__options_tbl_rowOrder":"$ro"});



    return( formData);
  } 	
	
