import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
//import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';

class UserMyReferalsAdd extends StatefulWidget {
  static const String PATH = '/user/my_referals/add/:id/:title';
  UserMyReferalsAdd({Key? key}) : super(key: key);
  @override
  UserMyReferalsAddState createState() => UserMyReferalsAddState();
}

class UserMyReferalsAddState extends State<UserMyReferalsAdd>{
  String getPath = Env.value!.baseUrl! + '/user/my_referals/add';
 // String sendPath = Env.value!.baseUrl! + '/user/my_referals/add';
  String sendPath = Env.value!.baseUrl! + '/user/my_referals/add';

  MyReferalsController? my_referals;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
 // var modelUser;
 var model;
  var formData;
  var postMyReferalsResult;
    var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
	];

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }


 fetchData(MyReferalsController? my_referals)async {
    if (this.model == null) {
      final future = my_referals!.editMyReferals();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
          this.model = value;

        });
      }
    }


  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;
    my_referals = new  MyReferalsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        '',
        '',
        null,
		false);

      fetchData(my_referals);
      return Scaffold(
          appBar: AppBar(

            title: Text('MyReferals'),
          ),
          body:isLoading?
             // Center(
             //   child: CircularProgressIndicator(),
             // )
              Container(width: 0.0, height: 0.0)
             :Form(
              key: formKey,
              child: SingleChildScrollView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
					  children: isLoading? [] : [
							  Padding(
								padding: const EdgeInsets.fromLTRB(
									8.0, 14.0, 8.0, 2.0),
								child: Html(data: "<h3>Header</h3>"),
							  ),
							   this.model.editReferals(this),  
							   this.model.editUserName(this),  
							   this.model.editGroup(this),  
							   this.model.editEmail(this),  
							   this.model.editPassword(this),  
							   this.model.editAuth(this),  
							   this.model.editAccountStatus(this),  
							   this.model.editAccountType(this),  
							   this.model.editDateRegistered(this),  
							   this.model.editLastLogin(this),  
							   this.model.editLastSeen(this),  
							   this.model.editOnline(this),  
							   this.model.editLastOnlineMark(this),  
							   this.model.editOnlineHours(this),  
							   this.model.editNomorKtp(this),  
							   this.model.editScanKtp(this),  
							   this.model.editNomorSiup(this),  
							   this.model.editScanSiup(this),  
							   this.model.editNpwp(this),  
							   this.model.editStatusMarital(this),  
							   this.model.editJumlahTanggungan(this),  
							   this.model.editPersonalData(this),  
							   this.model.editPhoto(this),  
							   this.model.editDisplayName(this),  
							   this.model.editBirthDate(this),  
							   this.model.editBirthCode(this),  
							   this.model.editJenisKelamin(this),  
							   this.model.editAddress(this),  
							   this.model.editCountry(this),  
							   this.model.editProvinsi(this),  
							   this.model.editKabupaten(this),  
							   this.model.editKecamatan(this),  
							   this.model.editKelurahan(this),  
							   this.model.editPostCode(this),  
							   this.model.editHandphone(this),  
							   this.model.editSelfIntroduction(this),  
							   this.model.editWebsite(this),  
							   this.model.editLanguage(this),  
							   this.model.editSkills(this),  
							   this.model.editFullName(this),  
							   this.model.editCaptcha(this),  
							   this.model.editOldPassword(this),  
							   this.model.editNewEmail(this),  
							   this.model.editYourEmail(this),  
							   this.model.editInvitationMessage(this),  
							   this.model.editFinancialData(this),  
							   this.model.editBank(this),  
							   this.model.editBranch(this),  
							   this.model.editCity(this),  
							   this.model.editAccountNumber(this),  
							   this.model.editAccountName(this),  
							   this.model.editCutOffPeriod(this),  
							   this.model.editCutOffAmount(this),  
							   this.model.editDepositAmount(this),  
							   this.model.editStatistics(this),  
							   this.model.editMoneyEarned(this),  
							   this.model.editMoneySpent(this),  
							   this.model.editAvailableBalance(this),  
							   this.model.editWithheldBalance(this),  
							   this.model.editAdminNotes(this),  
							   this.model.editPestaPoint(this),  
							   this.model.editWorkerRating(this),  
							   this.model.editWorkerRanking(this),  
							   this.model.editWorkerPoint(this),  
							   this.model.editWorkerRatingNum(this),  
							   this.model.editWorkerRatingSum(this),  
							   this.model.editWorkerRatingDiv(this),  
							   this.model.editOwnerRating(this),  
							   this.model.editOwnerRanking(this),  
							   this.model.editOwnerPoint(this),  
							   this.model.editOwnerRatingNum(this),  
							   this.model.editOwnerRatingSum(this),  
							   this.model.editOwnerRatingDiv(this),  
							   this.model.editSellerRating(this),  
							   this.model.editSellerRanking(this),  
							   this.model.editSellerPoint(this),  
							   this.model.editSellerRatingNum(this),  
							   this.model.editSellerRatingSum(this),  
							   this.model.editSellerRatingDiv(this),  
							   this.model.editBuyerRating(this),  
							   this.model.editBuyerRanking(this),  
							   this.model.editBuyerPoint(this),  
							   this.model.editBuyerRatingNum(this),  
							   this.model.editBuyerRatingSum(this),  
							   this.model.editBuyerRatingDiv(this),  
							   this.model.editAffiliateRating(this),  
							   this.model.editAffiliateRanking(this),  
							   this.model.editAffiliatePoint(this),  
							   this.model.editAffiliateRatingNum(this),  
							   this.model.editAffiliateRatingSum(this),  
							   this.model.editAffiliateRatingDiv(this),  
							   this.model.editProjectsWon(this),  
							   this.model.editProjectsWonCumulative(this),  
							   this.model.editProjectsOwned(this),  
							   this.model.editProjectsOwnedCumulative(this),  
							   this.model.editProjectsNoAction(this),  
							   this.model.editProjectsCanceled(this),  
							   this.model.editMissedPayment(this),  
							   this.model.editProjectsCompleted(this),  
							   this.model.editProjectsArbitrated(this),  
							   this.model.editProjectsWonInArbitration(this),  
							   this.model.editProjectsLostInArbitration(this),  
							   this.model.editCurrentProjects(this),  
							   this.model.editMissedWeeklyReport(this),  
							   this.model.editProductSold(this),  
							   this.model.editProductSoldCumulative(this),  
							   this.model.editProductBought(this),  
							   this.model.editProductBoughtCumulative(this),  
							   this.model.editBidCount(this),  
							   this.model.editPostCount(this),  
							   this.model.editWorkQuality(this),  
							   this.model.editWorkQualityNum(this),  
							   this.model.editWorkQualitySum(this),  
							   this.model.editWorkQualityDiv(this),  
							   this.model.editExpertise(this),  
							   this.model.editExpertiseNum(this),  
							   this.model.editExpertiseSum(this),  
							   this.model.editExpertiseDiv(this),  
							   this.model.editWorkerCommunication(this),  
							   this.model.editWorkerCommunicationNum(this),  
							   this.model.editWorkerCommunicationSum(this),  
							   this.model.editWorkerCommunicationDiv(this),  
							   this.model.editWorkerProfessionalism(this),  
							   this.model.editWorkerProfessionalismNum(this),  
							   this.model.editWorkerProfessionalismSum(this),  
							   this.model.editWorkerProfessionalismDiv(this),  
							   this.model.editClarity(this),  
							   this.model.editClarityNum(this),  
							   this.model.editClaritySum(this),  
							   this.model.editClarityDiv(this),  
							   this.model.editFriendliness(this),  
							   this.model.editFriendlinessNum(this),  
							   this.model.editFriendlinessSum(this),  
							   this.model.editFriendlinessDiv(this),  
							   this.model.editOwnerCommunication(this),  
							   this.model.editOwnerCommunicationNum(this),  
							   this.model.editOwnerCommunicationSum(this),  
							   this.model.editOwnerCommunicationDiv(this),  
							   this.model.editOwnerProfessionalism(this),  
							   this.model.editOwnerProfessionalismNum(this),  
							   this.model.editOwnerProfessionalismSum(this),  
							   this.model.editOwnerProfessionalismDiv(this),  
							   this.model.editProductQuality(this),  
							   this.model.editProductQualityNum(this),  
							   this.model.editProductQualitySum(this),  
							   this.model.editProductQualityDiv(this),  
							   this.model.editServiceQuality(this),  
							   this.model.editServiceQualityNum(this),  
							   this.model.editServiceQualitySum(this),  
							   this.model.editServiceQualityDiv(this),  
							   this.model.editSellerCommunication(this),  
							   this.model.editSellerCommunicationNum(this),  
							   this.model.editSellerCommunicationSum(this),  
							   this.model.editSellerCommunicationDiv(this),  
							   this.model.editSellerProfessionalism(this),  
							   this.model.editSellerProfessionalismNum(this),  
							   this.model.editSellerProfessionalismSum(this),  
							   this.model.editSellerProfessionalismDiv(this),  
							   this.model.editReferer(this),  
							   this.model.editRefererExpires(this),  
							   this.model.editReferalThisMonth(this),  
							   this.model.editCookiesThisMonth(this),  
							   this.model.editPremiumAffiliate(this),  
							   this.model.editReferedUsers(this),  
							   this.model.editReferalEarnings(this),  
							   this.model.editAffiliateId(this),  
							   this.model.editLastAnnouncedProject(this),  
							   this.model.editNotifCount(this),  
							   this.model.editNotifyMeNewProjects(this),  
							   this.model.editLostArbitrationRecently(this),  
							   this.model.editCoupon(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                    
                  )

              )
          ),

            floatingActionButton: isLoading? [] : this.model.Buttons(context, _dialVisible, formKey, controller,my_referals, postMyReferalsResult, this, sendPath, '', '')


      );

  }


  @override
  void dispose() {
    super.dispose();
  }
  
 

}

