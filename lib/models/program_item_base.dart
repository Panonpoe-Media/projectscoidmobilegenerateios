

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'image_fields.dart';
import 'file_fields.dart';
import 'option_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'selection.dart';
import 'photo.dart';
import 'paging.dart';
part 'program_item_base.g.dart';
//


class ItemProgramBase {
	var item;
	Map<String, dynamic> json;
	ItemProgramBase(this.json){
		item = ItemProgram.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget> buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons.length; i++) {
			buttonChildren.add(itemButton( i, context));
		}
	}


	Widget itemButton( int?index, BuildContext context){
		return(
				TextButton(
					child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
					style: ButtonStyle(
					  textStyle:
					  MaterialStateProperty.all<TextStyle>(
						  const TextStyle(color: CurrentTheme.MainAccentColor)),
					  backgroundColor:
					  MaterialStateProperty.all<Color>(
						CurrentTheme.SecondaryAccentColor,),
					),
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
					},
				)
		);
	}	
	
	
		    Widget viewUserName (BuildContext context) {  
	return(  UsernameView(
		value: item.user_name,
		caption: 'User Name',
	));}
		    Widget viewGroup (BuildContext context) {  
	return(  ModelView(
		value: item.group_id,
		caption: 'Group',
		idenum: item.group_list,
		nameenum: item.group_str,
	));} 
		    Widget viewEmail (BuildContext context) {  
	return(  EmailView(
		value: item.email,
		caption: 'Email',
	));}
		    Widget viewPassword (BuildContext context) {  
	return(  PasswordView(
		value: item.password,
		caption: 'Password',
	));}
		    Widget viewAuth (BuildContext context) { 
	return(  DisplayNameView(
		value: item.auth,
		caption: 'Auth',
	));}
	    Widget viewAccountStatus (BuildContext context) {
      return( 
	 EnumView(
		value: item.account_status_id,
		caption: 'Account Status',
		idenum: item.account_status_list,
		nameenum: item.account_status_str,
	));} 
	    Widget viewAccountType (BuildContext context) {
      return( 
	 EnumView(
		value: item.account_type_id,
		caption: 'Account Type',
		idenum: item.account_type_list,
		nameenum: item.account_type_str,
	));} 
		    Widget viewDateRegistered (BuildContext context) {  
	return(  DateTimeView(
		value: item.date_registered,
		caption: 'Date Registered',
	));} 
		    Widget viewLastLogin (BuildContext context) {  
	return(  DateTimeView(
		value: item.last_login,
		caption: 'Last Login',
	));} 
		    Widget viewLastSeen (BuildContext context) {  
	return(  DateTimeView(
		value: item.last_seen,
		caption: 'Last Seen',
	));} 
		    Widget viewOnline (BuildContext context) {  
	return(  BooleanView(
		value: item.online,
		caption: 'Online',
	));} 
		    Widget viewLastOnlineMark (BuildContext context) {  
	return(  DateTimeView(
		value: item.last_online_mark,
		caption: 'Last Online Mark',
	));} 
		    Widget viewOnlineHours (BuildContext context) {  
	return(  DoubleView(
	  value: item.online_hours,
		caption: 'Online Hours',
	));}
		    Widget viewNomorKtp (BuildContext context) { 
	return(  DisplayNameView(
		value: item.nomor_ktp,
		caption: 'Nomor KTP',
	));}
		    Widget viewScanKtp (BuildContext context) {  
	return(  ImageView(
		value: item.scan_ktp_url,
		caption: 'Scan KTP',
	));} 
		    Widget viewNomorSiup (BuildContext context) { 
	return(  DisplayNameView(
		value: item.nomor_siup,
		caption: 'Nomor SIUP',
	));}
		    Widget viewScanSiup (BuildContext context) {  
	return(  ImageView(
		value: item.scan_siup_url,
		caption: 'Scan SIUP',
	));} 
		    Widget viewNpwp (BuildContext context) { 
	return(  DisplayNameView(
		value: item.npwp,
		caption: 'NPWP',
	));}
	    Widget viewStatusMarital (BuildContext context) {
      return( 
	 EnumView(
		value: item.status_marital_id,
		caption: 'Status Marital',
		idenum: item.status_marital_list,
		nameenum: item.status_marital_str,
	));} 
		    Widget viewJumlahTanggungan (BuildContext context) { 
	return(  NumberView(
		value: item.jumlah_tanggungan,
		caption: 'Jumlah Tanggungan',
	));}
		    Widget viewPhoto (BuildContext context) {  
	return(  ImageView(
		value: item.photo_url,
		caption: 'Photo',
	));} 
		    Widget viewDisplayName (BuildContext context) { 
	return(  DisplayNameView(
		value: item.display_name,
		caption: 'Display Name',
	));}
		    Widget viewBirthDate (BuildContext context) {  
	return(  DateView(
		value: item.birth_date,
		caption: 'Birth Date',
	));} 
		    Widget viewBirthCode (BuildContext context) { 
	return(  DisplayNameView(
		value: item.birth_code,
		caption: 'Birth Code',
	));}
	    Widget viewJenisKelamin (BuildContext context) {
      return( 
	 EnumView(
		value: item.jenis_kelamin_id,
		caption: 'Jenis Kelamin',
		idenum: item.jenis_kelamin_list,
		nameenum: item.jenis_kelamin_str,
	));} 
		    Widget viewAddress (BuildContext context) {  
	return(  AddressView(
		value: item.address,
		caption: 'Address',
	));}
		    Widget viewCountry (BuildContext context) {  
	return(  ModelView(
		value: item.country_id,
		caption: 'Country',
		idenum: item.country_list,
		nameenum: item.country_str,
	));} 
		    Widget viewProvinsi (BuildContext context) {  
	return(  ModelView(
		value: item.provinsi_id,
		caption: 'Provinsi',
		idenum: item.provinsi_list,
		nameenum: item.provinsi_str,
	));} 
		    Widget viewKabupaten (BuildContext context) {  
	return(  ModelView(
		value: item.kabupaten_id,
		caption: 'Kabupaten',
		idenum: item.kabupaten_list,
		nameenum: item.kabupaten_str,
	));} 
		    Widget viewKecamatan (BuildContext context) {  
	return(  ModelView(
		value: item.kecamatan_id,
		caption: 'Kecamatan',
		idenum: item.kecamatan_list,
		nameenum: item.kecamatan_str,
	));} 
		    Widget viewKelurahan (BuildContext context) {  
	return(  ModelView(
		value: item.kelurahan_id,
		caption: 'Kelurahan',
		idenum: item.kelurahan_list,
		nameenum: item.kelurahan_str,
	));} 
		    Widget viewPostCode (BuildContext context) { 
	return(  DisplayNameView(
		value: item.post_code,
		caption: 'Post Code',
	));}
		    Widget viewHandphone (BuildContext context) { 
	return(  HandphoneView(
		value: item.handphone,
		caption: 'Handphone',
	));}
		    Widget viewSelfIntroduction (BuildContext context) {  
	return(  ArticleView(
		value: item.self_introduction,
		caption: 'Self Introduction',
	));}
		    Widget viewWebsite (BuildContext context) {  
	return(  WebsiteView(
		value: item.website,
		caption: 'Website',
	));}
		    Widget viewLanguage (BuildContext context) {  
	return(  ModelView(
		value: item.language_id,
		caption: 'Language',
		idenum: item.language_list,
		nameenum: item.language_str,
	));} 
	Widget viewSkills (BuildContext context) {  
	return( 	ChannelRouteTagsWidget(
                value: item.skills_id,
                caption: '',
                hint: ' ',
                required: true,
                idroutetags: item.skills_id,
                nameroutetags: item.skills_str,
                urlroutetags: item.skills_url,
                getValue: (String?  val) {
                  AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
                },
              ));} 
		    Widget viewCaptcha (BuildContext context) {  
	return(  CaptchaView(
		value: item.captcha,
		caption: 'Captcha',
	));}
	 // String?  item.secure_code;
		    Widget viewBank (BuildContext context) {  
	return(  ModelView(
		value: item.bank_id,
		caption: 'Bank',
		idenum: item.bank_list,
		nameenum: item.bank_str,
	));} 
		    Widget viewBranch (BuildContext context) { 
	return(  DisplayNameView(
		value: item.branch,
		caption: 'Branch',
	));}
		    Widget viewCity (BuildContext context) { 
	return(  DisplayNameView(
		value: item.city,
		caption: 'City',
	));}
		    Widget viewAccountNumber (BuildContext context) { 
	return(  DisplayNameView(
		value: item.account_number,
		caption: 'Account Number',
	));}
		    Widget viewAccountName (BuildContext context) { 
	return(  DisplayNameView(
		value: item.account_name,
		caption: 'Account Name',
	));}
	    Widget viewCutOffPeriod (BuildContext context) {
      return( 
	 EnumView(
		value: item.cutoff_period_id,
		caption: 'Cut-off Period',
		idenum: item.cutoff_period_list,
		nameenum: item.cutoff_period_str,
	));} 
		    Widget viewCutOffAmount (BuildContext context) {  
	return(  MoneyView(
		value: item.cutoff_amount,
		caption: 'Cut-off Amount',
	));}
		    Widget viewDepositAmount (BuildContext context) {  
	return(  MoneyView(
		value: item.deposit_amount,
		caption: 'Deposit Amount',
	));}
		    Widget viewMoneyEarned (BuildContext context) {  
	return(  MoneyView(
		value: item.money_earned,
		caption: 'Money Earned',
	));}
		    Widget viewMoneySpent (BuildContext context) {  
	return(  MoneyView(
		value: item.money_spent,
		caption: 'Money Spent',
	));}
		    Widget viewAvailableBalance (BuildContext context) {  
	return(  MoneyView(
		value: item.available_balance,
		caption: 'Available Balance',
	));}
		    Widget viewWithheldBalance (BuildContext context) {  
	return(  MoneyView(
		value: item.withheld_balance,
		caption: 'Withheld Balance',
	));}
		    Widget viewAdminNotes (BuildContext context) {  
	return(  ArticleView(
		value: item.admin_notes,
		caption: 'Admin Notes',
	));}
		    Widget viewPestaPoint (BuildContext context) { 
	return(  NumberView(
		value: item.pesta_point,
		caption: 'Pesta Point',
	));}
		    Widget viewWorkerRating (BuildContext context) {  
	return(  RatingView(
		value: item.worker_rating,
		caption: 'Worker Rating'
	));}
		    Widget viewWorkerRanking (BuildContext context) { 
	return(  NumberView(
		value: item.worker_ranking,
		caption: 'Worker Ranking',
	));}
		    Widget viewWorkerPoint (BuildContext context) { 
	return(  NumberView(
		value: item.worker_point,
		caption: 'Worker Point',
	));}
		    Widget viewWorkerRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.worker_rating_num,
		caption: 'Worker Rating Num',
	));}
		    Widget viewWorkerRatingSum (BuildContext context) { 
	return(  NumberView(
		value: item.worker_rating_sum,
		caption: 'Worker Rating Sum',
	));}
		    Widget viewWorkerRatingDiv (BuildContext context) { 
	return(  NumberView(
		value: item.worker_rating_div,
		caption: 'Worker Rating Div',
	));}
		    Widget viewOwnerRating (BuildContext context) {  
	return(  RatingView(
		value: item.owner_rating,
		caption: 'Owner Rating'
	));}
		    Widget viewOwnerRanking (BuildContext context) { 
	return(  NumberView(
		value: item.owner_ranking,
		caption: 'Owner Ranking',
	));}
		    Widget viewOwnerPoint (BuildContext context) { 
	return(  NumberView(
		value: item.owner_point,
		caption: 'Owner Point',
	));}
		    Widget viewOwnerRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.owner_rating_num,
		caption: 'Owner Rating Num',
	));}
		    Widget viewOwnerRatingSum (BuildContext context) { 
	return(  NumberView(
		value: item.owner_rating_sum,
		caption: 'Owner Rating Sum',
	));}
		    Widget viewOwnerRatingDiv (BuildContext context) { 
	return(  NumberView(
		value: item.owner_rating_div,
		caption: 'Owner Rating Div',
	));}
		    Widget viewSellerRating (BuildContext context) {  
	return(  RatingView(
		value: item.seller_rating,
		caption: 'Seller Rating'
	));}
		    Widget viewSellerRanking (BuildContext context) { 
	return(  NumberView(
		value: item.seller_ranking,
		caption: 'Seller Ranking',
	));}
		    Widget viewSellerPoint (BuildContext context) { 
	return(  NumberView(
		value: item.seller_point,
		caption: 'Seller Point',
	));}
		    Widget viewSellerRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.seller_rating_num,
		caption: 'Seller Rating Num',
	));}
		    Widget viewSellerRatingSum (BuildContext context) { 
	return(  NumberView(
		value: item.seller_rating_sum,
		caption: 'Seller Rating Sum',
	));}
		    Widget viewSellerRatingDiv (BuildContext context) { 
	return(  NumberView(
		value: item.seller_rating_div,
		caption: 'Seller Rating Div',
	));}
		    Widget viewBuyerRating (BuildContext context) {  
	return(  RatingView(
		value: item.buyer_rating,
		caption: 'Buyer Rating'
	));}
		    Widget viewBuyerRanking (BuildContext context) { 
	return(  NumberView(
		value: item.buyer_ranking,
		caption: 'Buyer Ranking',
	));}
		    Widget viewBuyerPoint (BuildContext context) { 
	return(  NumberView(
		value: item.buyer_point,
		caption: 'Buyer Point',
	));}
		    Widget viewBuyerRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.buyer_rating_num,
		caption: 'Buyer Rating Num',
	));}
		    Widget viewBuyerRatingSum (BuildContext context) { 
	return(  NumberView(
		value: item.buyer_rating_sum,
		caption: 'Buyer Rating Sum',
	));}
		    Widget viewBuyerRatingDiv (BuildContext context) { 
	return(  NumberView(
		value: item.buyer_rating_div,
		caption: 'Buyer Rating Div',
	));}
		    Widget viewAffiliateRating (BuildContext context) {  
	return(  RatingView(
		value: item.affiliate_rating,
		caption: 'Affiliate Rating'
	));}
		    Widget viewAffiliateRanking (BuildContext context) { 
	return(  NumberView(
		value: item.affiliate_ranking,
		caption: 'Affiliate Ranking',
	));}
		    Widget viewAffiliatePoint (BuildContext context) { 
	return(  NumberView(
		value: item.affiliate_point,
		caption: 'Affiliate Point',
	));}
		    Widget viewAffiliateRatingNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.affiliate_rating_num,
		caption: 'Affiliate Rating Num',
	));}
		    Widget viewAffiliateRatingSum (BuildContext context) { 
	return(  NumberView(
		value: item.affiliate_rating_sum,
		caption: 'Affiliate Rating Sum',
	));}
		    Widget viewAffiliateRatingDiv (BuildContext context) { 
	return(  NumberView(
		value: item.affiliate_rating_div,
		caption: 'Affiliate Rating Div',
	));}
		    Widget viewProjectsWon (BuildContext context) { 
	return(  NumberView(
		value: item.projects_won,
		caption: 'Projects Won',
	));}
		    Widget viewProjectsWonCumulative (BuildContext context) {  
	return(  MoneyView(
		value: item.projects_won_cumulative,
		caption: 'Projects Won Cumulative',
	));}
		    Widget viewProjectsOwned (BuildContext context) { 
	return(  NumberView(
		value: item.projects_owned,
		caption: 'Projects Owned',
	));}
		    Widget viewProjectsOwnedCumulative (BuildContext context) {  
	return(  MoneyView(
		value: item.projects_owned_cumulative,
		caption: 'Projects Owned Cumulative',
	));}
		    Widget viewProjectsNoAction (BuildContext context) { 
	return(  NumberView(
		value: item.projects_noaction,
		caption: 'Projects No-Action',
	));}
		    Widget viewProjectsCanceled (BuildContext context) { 
	return(  NumberView(
		value: item.projects_canceled,
		caption: 'Projects Canceled',
	));}
		    Widget viewMissedPayment (BuildContext context) { 
	return(  NumberView(
		value: item.missed_payment,
		caption: 'Missed Payment',
	));}
		    Widget viewProjectsCompleted (BuildContext context) { 
	return(  NumberView(
		value: item.projects_completed,
		caption: 'Projects Completed',
	));}
		    Widget viewProjectsArbitrated (BuildContext context) { 
	return(  NumberView(
		value: item.projects_arbitrated,
		caption: 'Projects Arbitrated',
	));}
		    Widget viewProjectsWonInArbitration (BuildContext context) { 
	return(  NumberView(
		value: item.projects_arbit_won,
		caption: 'Projects Won in Arbitration',
	));}
		    Widget viewProjectsLostInArbitration (BuildContext context) { 
	return(  NumberView(
		value: item.projects_arbit_lost,
		caption: 'Projects Lost in Arbitration',
	));}
		    Widget viewCurrentProjects (BuildContext context) { 
	return(  NumberView(
		value: item.current_projects,
		caption: 'Current Projects',
	));}
		    Widget viewMissedWeeklyReport (BuildContext context) { 
	return(  NumberView(
		value: item.missed_weekly_report,
		caption: 'Missed Weekly Report',
	));}
		    Widget viewProductSold (BuildContext context) { 
	return(  NumberView(
		value: item.product_sold,
		caption: 'Product Sold',
	));}
		    Widget viewProductSoldCumulative (BuildContext context) {  
	return(  MoneyView(
		value: item.product_sold_cumulative,
		caption: 'Product Sold Cumulative',
	));}
		    Widget viewProductBought (BuildContext context) { 
	return(  NumberView(
		value: item.product_bought,
		caption: 'Product Bought',
	));}
		    Widget viewProductBoughtCumulative (BuildContext context) {  
	return(  MoneyView(
		value: item.product_bought_cumulative,
		caption: 'Product Bought Cumulative',
	));}
		    Widget viewBidCount (BuildContext context) { 
	return(  NumberView(
		value: item.bid_count,
		caption: 'Bid Count',
	));}
		    Widget viewPostCount (BuildContext context) { 
	return(  NumberView(
		value: item.post_count,
		caption: 'Post Count',
	));}
		    Widget viewWorkQuality (BuildContext context) {  
	return(  RatingView(
		value: item.work_quality,
		caption: 'Work Quality'
	));}
		    Widget viewWorkQualityNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.work_quality_num,
		caption: 'Work Quality Num',
	));}
		    Widget viewWorkQualitySum (BuildContext context) { 
	return(  NumberView(
		value: item.work_quality_sum,
		caption: 'Work Quality Sum',
	));}
		    Widget viewWorkQualityDiv (BuildContext context) { 
	return(  NumberView(
		value: item.work_quality_div,
		caption: 'Work Quality Div',
	));}
		    Widget viewExpertise (BuildContext context) {  
	return(  RatingView(
		value: item.expertise,
		caption: 'Expertise'
	));}
		    Widget viewExpertiseNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.expertise_num,
		caption: 'Expertise Num',
	));}
		    Widget viewExpertiseSum (BuildContext context) { 
	return(  NumberView(
		value: item.expertise_sum,
		caption: 'Expertise Sum',
	));}
		    Widget viewExpertiseDiv (BuildContext context) { 
	return(  NumberView(
		value: item.expertise_div,
		caption: 'Expertise Div',
	));}
		    Widget viewWorkerCommunication (BuildContext context) {  
	return(  RatingView(
		value: item.worker_communication,
		caption: 'Worker Communication'
	));}
		    Widget viewWorkerCommunicationNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.worker_communication_num,
		caption: 'Worker Communication Num',
	));}
		    Widget viewWorkerCommunicationSum (BuildContext context) { 
	return(  NumberView(
		value: item.worker_communication_sum,
		caption: 'Worker Communication Sum',
	));}
		    Widget viewWorkerCommunicationDiv (BuildContext context) { 
	return(  NumberView(
		value: item.worker_communication_div,
		caption: 'Worker Communication Div',
	));}
		    Widget viewWorkerProfessionalism (BuildContext context) {  
	return(  RatingView(
		value: item.worker_professionalism,
		caption: 'Worker Professionalism'
	));}
		    Widget viewWorkerProfessionalismNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.worker_professionalism_num,
		caption: 'Worker Professionalism Num',
	));}
		    Widget viewWorkerProfessionalismSum (BuildContext context) { 
	return(  NumberView(
		value: item.worker_professionalism_sum,
		caption: 'Worker Professionalism Sum',
	));}
		    Widget viewWorkerProfessionalismDiv (BuildContext context) { 
	return(  NumberView(
		value: item.worker_professionalism_div,
		caption: 'Worker Professionalism Div',
	));}
		    Widget viewClarity (BuildContext context) {  
	return(  RatingView(
		value: item.clarity,
		caption: 'Clarity'
	));}
		    Widget viewClarityNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.clarity_num,
		caption: 'Clarity Num',
	));}
		    Widget viewClaritySum (BuildContext context) { 
	return(  NumberView(
		value: item.clarity_sum,
		caption: 'Clarity Sum',
	));}
		    Widget viewClarityDiv (BuildContext context) { 
	return(  NumberView(
		value: item.clarity_div,
		caption: 'Clarity Div',
	));}
		    Widget viewFriendliness (BuildContext context) {  
	return(  RatingView(
		value: item.friendliness,
		caption: 'Friendliness'
	));}
		    Widget viewFriendlinessNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.friendliness_num,
		caption: 'Friendliness Num',
	));}
		    Widget viewFriendlinessSum (BuildContext context) { 
	return(  NumberView(
		value: item.friendliness_sum,
		caption: 'Friendliness Sum',
	));}
		    Widget viewFriendlinessDiv (BuildContext context) { 
	return(  NumberView(
		value: item.friendliness_div,
		caption: 'Friendliness Div',
	));}
		    Widget viewOwnerCommunication (BuildContext context) {  
	return(  RatingView(
		value: item.owner_communication,
		caption: 'Owner Communication'
	));}
		    Widget viewOwnerCommunicationNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.owner_communication_num,
		caption: 'Owner Communication Num',
	));}
		    Widget viewOwnerCommunicationSum (BuildContext context) { 
	return(  NumberView(
		value: item.owner_communication_sum,
		caption: 'Owner Communication Sum',
	));}
		    Widget viewOwnerCommunicationDiv (BuildContext context) { 
	return(  NumberView(
		value: item.owner_communication_div,
		caption: 'Owner Communication Div',
	));}
		    Widget viewOwnerProfessionalism (BuildContext context) {  
	return(  RatingView(
		value: item.owner_professionalism,
		caption: 'Owner Professionalism'
	));}
		    Widget viewOwnerProfessionalismNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.owner_professionalism_num,
		caption: 'Owner Professionalism Num',
	));}
		    Widget viewOwnerProfessionalismSum (BuildContext context) { 
	return(  NumberView(
		value: item.owner_professionalism_sum,
		caption: 'Owner Professionalism Sum',
	));}
		    Widget viewOwnerProfessionalismDiv (BuildContext context) { 
	return(  NumberView(
		value: item.owner_professionalism_div,
		caption: 'Owner Professionalism Div',
	));}
		    Widget viewProductQuality (BuildContext context) {  
	return(  RatingView(
		value: item.product_quality,
		caption: 'Product Quality'
	));}
		    Widget viewProductQualityNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.product_quality_num,
		caption: 'Product Quality Num',
	));}
		    Widget viewProductQualitySum (BuildContext context) { 
	return(  NumberView(
		value: item.product_quality_sum,
		caption: 'Product Quality Sum',
	));}
		    Widget viewProductQualityDiv (BuildContext context) { 
	return(  NumberView(
		value: item.product_quality_div,
		caption: 'Product Quality Div',
	));}
		    Widget viewServiceQuality (BuildContext context) {  
	return(  RatingView(
		value: item.service_quality,
		caption: 'Service Quality'
	));}
		    Widget viewServiceQualityNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.service_quality_num,
		caption: 'Service Quality Num',
	));}
		    Widget viewServiceQualitySum (BuildContext context) { 
	return(  NumberView(
		value: item.service_quality_sum,
		caption: 'Service Quality Sum',
	));}
		    Widget viewServiceQualityDiv (BuildContext context) { 
	return(  NumberView(
		value: item.service_quality_div,
		caption: 'Service Quality Div',
	));}
		    Widget viewSellerCommunication (BuildContext context) {  
	return(  RatingView(
		value: item.seller_communication,
		caption: 'Seller Communication'
	));}
		    Widget viewSellerCommunicationNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.seller_communication_num,
		caption: 'Seller Communication Num',
	));}
		    Widget viewSellerCommunicationSum (BuildContext context) { 
	return(  NumberView(
		value: item.seller_communication_sum,
		caption: 'Seller Communication Sum',
	));}
		    Widget viewSellerCommunicationDiv (BuildContext context) { 
	return(  NumberView(
		value: item.seller_communication_div,
		caption: 'Seller Communication Div',
	));}
		    Widget viewSellerProfessionalism (BuildContext context) {  
	return(  RatingView(
		value: item.seller_professionalism,
		caption: 'Seller Professionalism'
	));}
		    Widget viewSellerProfessionalismNum (BuildContext context) {  
	return(  DoubleView(
	  value: item.seller_professionalism_num,
		caption: 'Seller Professionalism Num',
	));}
		    Widget viewSellerProfessionalismSum (BuildContext context) { 
	return(  NumberView(
		value: item.seller_professionalism_sum,
		caption: 'Seller Professionalism Sum',
	));}
		    Widget viewSellerProfessionalismDiv (BuildContext context) { 
	return(  NumberView(
		value: item.seller_professionalism_div,
		caption: 'Seller Professionalism Div',
	));}
		    Widget viewReferer (BuildContext context) {  
	return(  ModelView(
		value: item.referer_id,
		caption: 'Referer',
		idenum: item.referer_list,
		nameenum: item.referer_str,
	));} 
		    Widget viewRefererExpires (BuildContext context) {  
	return(  DateTimeView(
		value: item.referer_expires,
		caption: 'Referer Expires',
	));} 
		    Widget viewReferalThisMonth (BuildContext context) { 
	return(  NumberView(
		value: item.referal_this_month,
		caption: 'Referal This Month',
	));}
		    Widget viewCookiesThisMonth (BuildContext context) { 
	return(  NumberView(
		value: item.cookies_this_month,
		caption: 'Cookies This Month',
	));}
		    Widget viewPremiumAffiliate (BuildContext context) {  
	return(  BooleanView(
		value: item.premium_affiliate,
		caption: 'Premium Affiliate',
	));} 
		    Widget viewReferedUsers (BuildContext context) { 
	return(  NumberView(
		value: item.refered_users,
		caption: 'Refered Users',
	));}
		    Widget viewReferalEarnings (BuildContext context) {  
	return(  MoneyView(
		value: item.referal_earnings,
		caption: 'Referal Earnings',
	));}
		    Widget viewAffiliateId (BuildContext context) { 
	return(  NumberView(
		value: item.affiliate_id,
		caption: 'Affiliate ID',
	));}
		    Widget viewLastAnnouncedProject (BuildContext context) { 
	return(  NumberView(
		value: item.last_announced_project,
		caption: 'Last Announced Project',
	));}
		    Widget viewNotifCount (BuildContext context) { 
	return(  NumberView(
		value: item.notif_count,
		caption: 'Notif Count',
	));}
		    Widget viewNotifyMeNewProjects (BuildContext context) {  
	return(  BooleanView(
		value: item.notify_projects,
		caption: 'Notify Me New Projects',
	));} 
		    Widget viewLostArbitrationRecently (BuildContext context) {  
	return(  BooleanView(
		value: item.lost_arbitration_recently,
		caption: 'Lost Arbitration Recently',
	));} 

}


@JsonSerializable()

class ItemProgram{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  user_id;
  String?  user_name;
  int?group_id;
  String?  group_str;
  String?  group_url;
  List<int?>? group_list;
  List<String?>? group_list_str;
  String?  email;
  String?  password;
  String?  auth;
  int?account_status_id;
  String?  account_status_str;
  List<int?>? account_status_list;
  List<String?>? account_status_list_str;
  int?account_type_id;
  String?  account_type_str;
  List<int?>? account_type_list;
  List<String?>? account_type_list_str;
  DateTime? date_registered;
  DateTime? last_login;
  DateTime? last_seen;
  bool? online;
  DateTime? last_online_mark;
  double? online_hours;
  String?  online_hours_str;
  String?  nomor_ktp;
  String?  scan_ktp_url;
  Photo? scan_ktp;
  String?  nomor_siup;
  String?  scan_siup_url;
  Photo? scan_siup;
  String?  npwp;
  int?status_marital_id;
  String?  status_marital_str;
  List<int?>? status_marital_list;
  List<String?>? status_marital_list_str;
  int?jumlah_tanggungan;
  String?  jumlah_tanggungan_str;
  String?  photo_url;
  Photo? photo;
  String?  display_name;
  DateTime? birth_date;
  String?  birth_code;
  int?jenis_kelamin_id;
  String?  jenis_kelamin_str;
  List<int?>? jenis_kelamin_list;
  List<String?>? jenis_kelamin_list_str;
  String?  address;
  int?country_id;
  String?  country_str;
  String?  country_url;
  List<int?>? country_list;
  List<String?>? country_list_str;
  int?provinsi_id;
  String?  provinsi_str;
  String?  provinsi_url;
  List<int?>? provinsi_list;
  List<String?>? provinsi_list_str;
  int?kabupaten_id;
  String?  kabupaten_str;
  String?  kabupaten_url;
  List<int?>? kabupaten_list;
  List<String?>? kabupaten_list_str;
  int?kecamatan_id;
  String?  kecamatan_str;
  String?  kecamatan_url;
  List<int?>? kecamatan_list;
  List<String?>? kecamatan_list_str;
  int?kelurahan_id;
  String?  kelurahan_str;
  String?  kelurahan_url;
  List<int?>? kelurahan_list;
  List<String?>? kelurahan_list_str;
  String?  post_code;
  String?  handphone;
  String?  self_introduction;
  String?  website;
  int?language_id;
  String?  language_str;
  String?  language_url;
  List<int?>? language_list;
  List<String?>? language_list_str;
  List<int?>? skills_id;
  List<String?>?  skills_str;
  List<String?>? skills_url;
  String?  captcha;
  String?  secure_code;
  int?bank_id;
  String?  bank_str;
  String?  bank_url;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  String?  branch;
  String?  city;
  String?  account_number;
  String?  account_name;
  int?cutoff_period_id;
  String?  cutoff_period_str;
  List<int?>? cutoff_period_list;
  List<String?>? cutoff_period_list_str;
  double? cutoff_amount;
  String?  cutoff_amount_str;
  double? deposit_amount;
  String?  deposit_amount_str;
  double? money_earned;
  String?  money_earned_str;
  double? money_spent;
  String?  money_spent_str;
  double? available_balance;
  String?  available_balance_str;
  double? withheld_balance;
  String?  withheld_balance_str;
  String?  admin_notes;
  int?pesta_point;
  String?  pesta_point_str;
  int?worker_rating;
  int?worker_ranking;
  String?  worker_ranking_str;
  int?worker_point;
  String?  worker_point_str;
  double? worker_rating_num;
  String?  worker_rating_num_str;
  int?worker_rating_sum;
  String?  worker_rating_sum_str;
  int?worker_rating_div;
  String?  worker_rating_div_str;
  int?owner_rating;
  int?owner_ranking;
  String?  owner_ranking_str;
  int?owner_point;
  String?  owner_point_str;
  double? owner_rating_num;
  String?  owner_rating_num_str;
  int?owner_rating_sum;
  String?  owner_rating_sum_str;
  int?owner_rating_div;
  String?  owner_rating_div_str;
  int?seller_rating;
  int?seller_ranking;
  String?  seller_ranking_str;
  int?seller_point;
  String?  seller_point_str;
  double? seller_rating_num;
  String?  seller_rating_num_str;
  int?seller_rating_sum;
  String?  seller_rating_sum_str;
  int?seller_rating_div;
  String?  seller_rating_div_str;
  int?buyer_rating;
  int?buyer_ranking;
  String?  buyer_ranking_str;
  int?buyer_point;
  String?  buyer_point_str;
  double? buyer_rating_num;
  String?  buyer_rating_num_str;
  int?buyer_rating_sum;
  String?  buyer_rating_sum_str;
  int?buyer_rating_div;
  String?  buyer_rating_div_str;
  int?affiliate_rating;
  int?affiliate_ranking;
  String?  affiliate_ranking_str;
  int?affiliate_point;
  String?  affiliate_point_str;
  double? affiliate_rating_num;
  String?  affiliate_rating_num_str;
  int?affiliate_rating_sum;
  String?  affiliate_rating_sum_str;
  int?affiliate_rating_div;
  String?  affiliate_rating_div_str;
  int?projects_won;
  String?  projects_won_str;
  double? projects_won_cumulative;
  String?  projects_won_cumulative_str;
  int?projects_owned;
  String?  projects_owned_str;
  double? projects_owned_cumulative;
  String?  projects_owned_cumulative_str;
  int?projects_noaction;
  String?  projects_noaction_str;
  int?projects_canceled;
  String?  projects_canceled_str;
  int?missed_payment;
  String?  missed_payment_str;
  int?projects_completed;
  String?  projects_completed_str;
  int?projects_arbitrated;
  String?  projects_arbitrated_str;
  int?projects_arbit_won;
  String?  projects_arbit_won_str;
  int?projects_arbit_lost;
  String?  projects_arbit_lost_str;
  int?current_projects;
  String?  current_projects_str;
  int?missed_weekly_report;
  String?  missed_weekly_report_str;
  int?product_sold;
  String?  product_sold_str;
  double? product_sold_cumulative;
  String?  product_sold_cumulative_str;
  int?product_bought;
  String?  product_bought_str;
  double? product_bought_cumulative;
  String?  product_bought_cumulative_str;
  int?bid_count;
  String?  bid_count_str;
  int?post_count;
  String?  post_count_str;
  int?work_quality;
  double? work_quality_num;
  String?  work_quality_num_str;
  int?work_quality_sum;
  String?  work_quality_sum_str;
  int?work_quality_div;
  String?  work_quality_div_str;
  int?expertise;
  double? expertise_num;
  String?  expertise_num_str;
  int?expertise_sum;
  String?  expertise_sum_str;
  int?expertise_div;
  String?  expertise_div_str;
  int?worker_communication;
  double? worker_communication_num;
  String?  worker_communication_num_str;
  int?worker_communication_sum;
  String?  worker_communication_sum_str;
  int?worker_communication_div;
  String?  worker_communication_div_str;
  int?worker_professionalism;
  double? worker_professionalism_num;
  String?  worker_professionalism_num_str;
  int?worker_professionalism_sum;
  String?  worker_professionalism_sum_str;
  int?worker_professionalism_div;
  String?  worker_professionalism_div_str;
  int?clarity;
  double? clarity_num;
  String?  clarity_num_str;
  int?clarity_sum;
  String?  clarity_sum_str;
  int?clarity_div;
  String?  clarity_div_str;
  int?friendliness;
  double? friendliness_num;
  String?  friendliness_num_str;
  int?friendliness_sum;
  String?  friendliness_sum_str;
  int?friendliness_div;
  String?  friendliness_div_str;
  int?owner_communication;
  double? owner_communication_num;
  String?  owner_communication_num_str;
  int?owner_communication_sum;
  String?  owner_communication_sum_str;
  int?owner_communication_div;
  String?  owner_communication_div_str;
  int?owner_professionalism;
  double? owner_professionalism_num;
  String?  owner_professionalism_num_str;
  int?owner_professionalism_sum;
  String?  owner_professionalism_sum_str;
  int?owner_professionalism_div;
  String?  owner_professionalism_div_str;
  int?product_quality;
  double? product_quality_num;
  String?  product_quality_num_str;
  int?product_quality_sum;
  String?  product_quality_sum_str;
  int?product_quality_div;
  String?  product_quality_div_str;
  int?service_quality;
  double? service_quality_num;
  String?  service_quality_num_str;
  int?service_quality_sum;
  String?  service_quality_sum_str;
  int?service_quality_div;
  String?  service_quality_div_str;
  int?seller_communication;
  double? seller_communication_num;
  String?  seller_communication_num_str;
  int?seller_communication_sum;
  String?  seller_communication_sum_str;
  int?seller_communication_div;
  String?  seller_communication_div_str;
  int?seller_professionalism;
  double? seller_professionalism_num;
  String?  seller_professionalism_num_str;
  int?seller_professionalism_sum;
  String?  seller_professionalism_sum_str;
  int?seller_professionalism_div;
  String?  seller_professionalism_div_str;
  int?referer_id;
  String?  referer_str;
  String?  referer_url;
  List<int?>? referer_list;
  List<String?>? referer_list_str;
  DateTime? referer_expires;
  int?referal_this_month;
  String?  referal_this_month_str;
  int?cookies_this_month;
  String?  cookies_this_month_str;
  bool? premium_affiliate;
  int?refered_users;
  String?  refered_users_str;
  double? referal_earnings;
  String?  referal_earnings_str;
  int?affiliate_id;
  String?  affiliate_id_str;
  int?last_announced_project;
  String?  last_announced_project_str;
  int?notif_count;
  String?  notif_count_str;
  bool? notify_projects;
  bool? lost_arbitration_recently;

	
	 ItemProgram(
			this.buttons,
			this.user_id,			
			this.user_name,
			this.group_id,
			this.group_str,
			this.group_url,
			this.group_list,
			this.group_list_str,
			this.email,
			this.password,
			this.auth,
			this.account_status_id,
			this.account_status_str,
			this.account_status_list,
			this.account_status_list_str,
			this.account_type_id,
			this.account_type_str,
			this.account_type_list,
			this.account_type_list_str,
			this.date_registered,
			this.last_login,
			this.last_seen,
			this.online,
			this.last_online_mark,
			this.online_hours,
			this.online_hours_str,
			this.nomor_ktp,
			this.scan_ktp,
			this.scan_ktp_url,
			this.nomor_siup,
			this.scan_siup,
			this.scan_siup_url,
			this.npwp,
			this.status_marital_id,
			this.status_marital_str,
			this.status_marital_list,
			this.status_marital_list_str,
			this.jumlah_tanggungan,
			this.jumlah_tanggungan_str,
			this.photo,
			this.photo_url,
			this.display_name,
			this.birth_date,
			this.birth_code,
			this.jenis_kelamin_id,
			this.jenis_kelamin_str,
			this.jenis_kelamin_list,
			this.jenis_kelamin_list_str,
			this.address,
			this.country_id,
			this.country_str,
			this.country_url,
			this.country_list,
			this.country_list_str,
			this.provinsi_id,
			this.provinsi_str,
			this.provinsi_url,
			this.provinsi_list,
			this.provinsi_list_str,
			this.kabupaten_id,
			this.kabupaten_str,
			this.kabupaten_url,
			this.kabupaten_list,
			this.kabupaten_list_str,
			this.kecamatan_id,
			this.kecamatan_str,
			this.kecamatan_url,
			this.kecamatan_list,
			this.kecamatan_list_str,
			this.kelurahan_id,
			this.kelurahan_str,
			this.kelurahan_url,
			this.kelurahan_list,
			this.kelurahan_list_str,
			this.post_code,
			this.handphone,
			this.self_introduction,
			this.website,
			this.language_id,
			this.language_str,
			this.language_url,
			this.language_list,
			this.language_list_str,
			this.skills_id,
			this.skills_str,
			this.skills_url,
			this.captcha,
			this.secure_code,
			this.bank_id,
			this.bank_str,
			this.bank_url,
			this.bank_list,
			this.bank_list_str,
			this.branch,
			this.city,
			this.account_number,
			this.account_name,
			this.cutoff_period_id,
			this.cutoff_period_str,
			this.cutoff_period_list,
			this.cutoff_period_list_str,
			this.cutoff_amount,
			this.cutoff_amount_str,
			this.deposit_amount,
			this.deposit_amount_str,
			this.money_earned,
			this.money_earned_str,
			this.money_spent,
			this.money_spent_str,
			this.available_balance,
			this.available_balance_str,
			this.withheld_balance,
			this.withheld_balance_str,
			this.admin_notes,
			this.pesta_point,
			this.pesta_point_str,
			this.worker_rating,
			this.worker_ranking,
			this.worker_ranking_str,
			this.worker_point,
			this.worker_point_str,
			this.worker_rating_num,
			this.worker_rating_num_str,
			this.worker_rating_sum,
			this.worker_rating_sum_str,
			this.worker_rating_div,
			this.worker_rating_div_str,
			this.owner_rating,
			this.owner_ranking,
			this.owner_ranking_str,
			this.owner_point,
			this.owner_point_str,
			this.owner_rating_num,
			this.owner_rating_num_str,
			this.owner_rating_sum,
			this.owner_rating_sum_str,
			this.owner_rating_div,
			this.owner_rating_div_str,
			this.seller_rating,
			this.seller_ranking,
			this.seller_ranking_str,
			this.seller_point,
			this.seller_point_str,
			this.seller_rating_num,
			this.seller_rating_num_str,
			this.seller_rating_sum,
			this.seller_rating_sum_str,
			this.seller_rating_div,
			this.seller_rating_div_str,
			this.buyer_rating,
			this.buyer_ranking,
			this.buyer_ranking_str,
			this.buyer_point,
			this.buyer_point_str,
			this.buyer_rating_num,
			this.buyer_rating_num_str,
			this.buyer_rating_sum,
			this.buyer_rating_sum_str,
			this.buyer_rating_div,
			this.buyer_rating_div_str,
			this.affiliate_rating,
			this.affiliate_ranking,
			this.affiliate_ranking_str,
			this.affiliate_point,
			this.affiliate_point_str,
			this.affiliate_rating_num,
			this.affiliate_rating_num_str,
			this.affiliate_rating_sum,
			this.affiliate_rating_sum_str,
			this.affiliate_rating_div,
			this.affiliate_rating_div_str,
			this.projects_won,
			this.projects_won_str,
			this.projects_won_cumulative,
			this.projects_won_cumulative_str,
			this.projects_owned,
			this.projects_owned_str,
			this.projects_owned_cumulative,
			this.projects_owned_cumulative_str,
			this.projects_noaction,
			this.projects_noaction_str,
			this.projects_canceled,
			this.projects_canceled_str,
			this.missed_payment,
			this.missed_payment_str,
			this.projects_completed,
			this.projects_completed_str,
			this.projects_arbitrated,
			this.projects_arbitrated_str,
			this.projects_arbit_won,
			this.projects_arbit_won_str,
			this.projects_arbit_lost,
			this.projects_arbit_lost_str,
			this.current_projects,
			this.current_projects_str,
			this.missed_weekly_report,
			this.missed_weekly_report_str,
			this.product_sold,
			this.product_sold_str,
			this.product_sold_cumulative,
			this.product_sold_cumulative_str,
			this.product_bought,
			this.product_bought_str,
			this.product_bought_cumulative,
			this.product_bought_cumulative_str,
			this.bid_count,
			this.bid_count_str,
			this.post_count,
			this.post_count_str,
			this.work_quality,
			this.work_quality_num,
			this.work_quality_num_str,
			this.work_quality_sum,
			this.work_quality_sum_str,
			this.work_quality_div,
			this.work_quality_div_str,
			this.expertise,
			this.expertise_num,
			this.expertise_num_str,
			this.expertise_sum,
			this.expertise_sum_str,
			this.expertise_div,
			this.expertise_div_str,
			this.worker_communication,
			this.worker_communication_num,
			this.worker_communication_num_str,
			this.worker_communication_sum,
			this.worker_communication_sum_str,
			this.worker_communication_div,
			this.worker_communication_div_str,
			this.worker_professionalism,
			this.worker_professionalism_num,
			this.worker_professionalism_num_str,
			this.worker_professionalism_sum,
			this.worker_professionalism_sum_str,
			this.worker_professionalism_div,
			this.worker_professionalism_div_str,
			this.clarity,
			this.clarity_num,
			this.clarity_num_str,
			this.clarity_sum,
			this.clarity_sum_str,
			this.clarity_div,
			this.clarity_div_str,
			this.friendliness,
			this.friendliness_num,
			this.friendliness_num_str,
			this.friendliness_sum,
			this.friendliness_sum_str,
			this.friendliness_div,
			this.friendliness_div_str,
			this.owner_communication,
			this.owner_communication_num,
			this.owner_communication_num_str,
			this.owner_communication_sum,
			this.owner_communication_sum_str,
			this.owner_communication_div,
			this.owner_communication_div_str,
			this.owner_professionalism,
			this.owner_professionalism_num,
			this.owner_professionalism_num_str,
			this.owner_professionalism_sum,
			this.owner_professionalism_sum_str,
			this.owner_professionalism_div,
			this.owner_professionalism_div_str,
			this.product_quality,
			this.product_quality_num,
			this.product_quality_num_str,
			this.product_quality_sum,
			this.product_quality_sum_str,
			this.product_quality_div,
			this.product_quality_div_str,
			this.service_quality,
			this.service_quality_num,
			this.service_quality_num_str,
			this.service_quality_sum,
			this.service_quality_sum_str,
			this.service_quality_div,
			this.service_quality_div_str,
			this.seller_communication,
			this.seller_communication_num,
			this.seller_communication_num_str,
			this.seller_communication_sum,
			this.seller_communication_sum_str,
			this.seller_communication_div,
			this.seller_communication_div_str,
			this.seller_professionalism,
			this.seller_professionalism_num,
			this.seller_professionalism_num_str,
			this.seller_professionalism_sum,
			this.seller_professionalism_sum_str,
			this.seller_professionalism_div,
			this.seller_professionalism_div_str,
			this.referer_id,
			this.referer_str,
			this.referer_url,
			this.referer_list,
			this.referer_list_str,
			this.referer_expires,
			this.referal_this_month,
			this.referal_this_month_str,
			this.cookies_this_month,
			this.cookies_this_month_str,
			this.premium_affiliate,
			this.refered_users,
			this.refered_users_str,
			this.referal_earnings,
			this.referal_earnings_str,
			this.affiliate_id,
			this.last_announced_project,
			this.last_announced_project_str,
			this.notif_count,
			this.notif_count_str,
			this.notify_projects,
			this.lost_arbitration_recently,

  );
	

	
  factory ItemProgram.fromJson(Map<String, dynamic> json) => _$ItemProgramFromJson(json);

  Map<String, dynamic> toJson() => _$ItemProgramToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

