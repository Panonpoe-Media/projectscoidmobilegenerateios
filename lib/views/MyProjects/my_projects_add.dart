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

class UserMyProjectsAdd extends StatefulWidget {
  static const String PATH = '/user/my_projects/add/:id/:title';
  UserMyProjectsAdd({Key? key}) : super(key: key);
  @override
  UserMyProjectsAddState createState() => UserMyProjectsAddState();
}

class UserMyProjectsAddState extends State<UserMyProjectsAdd>{
  String getPath = Env.value!.baseUrl! + '/user/my_projects/add';
 // String sendPath = Env.value!.baseUrl! + '/user/my_projects/add';
  String sendPath = Env.value!.baseUrl! + '/user/my_projects/add';

  MyProjectsController? my_projects;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
 // var modelProject;
 var model;
  var formData;
  var postMyProjectsResult;
    var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
	];

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }


 fetchData(MyProjectsController? my_projects)async {
    if (this.model == null) {
      final future = my_projects!.editMyProjects();
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
    my_projects = new  MyProjectsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        '',
        '',
        null,
		false);

      fetchData(my_projects);
      return Scaffold(
          appBar: AppBar(

            title: Text('MyProjects'),
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
							   this.model.editOwner(this),  
							   this.model.editAcceptedWorker(this),  
							   this.model.editShortlistedBids(this),  
							   this.model.editTestimonialForProjectsCoId(this),  
							   this.model.editYourOffer(this),  
							   this.model.editCategory(this),  
							   this.model.editTitle(this),  
							   this.model.editDescription(this),  
							   this.model.editShortDescription(this),  
							   this.model.editAttachments(this),  
							   this.model.editFinishDays(this),  
							   this.model.editSearchText(this),  
							   this.model.editChannels(this),  
							   this.model.editLastBump(this),  
							   this.model.editSelectDeadline(this),  
							   this.model.editStartDate(this),  
							   this.model.editFinishDeadline(this),  
							   this.model.editFinishDate(this),  
							   this.model.editClosedDate(this),  
							   this.model.editBidCount(this),  
							   this.model.editProgress(this),  
							   this.model.editProjectStatus(this),  
							   this.model.editProjectEnding(this),  
							   this.model.editProjectType(this),  
							   this.model.editProjectClass(this),  
							   this.model.editPublishedBudget(this),  
							   this.model.editBudgetRange(this),  
							   this.model.editFeePercent(this),  
							   this.model.editService(this),  
							   this.model.editPrivateWorker(this),  
							   this.model.editInvitedUsers(this),  
							   this.model.editAcceptedBid(this),  
							   this.model.editAcceptedBudget(this),  
							   this.model.editAcceptedWork(this),  
							   this.model.editAcceptedDate(this),  
							   this.model.editAvailableBudget(this),  
							   this.model.editNeedWeeklyReport(this),  
							   this.model.editWeeklyReportNeeded(this),  
							   this.model.editWeeklyReportPosted(this),  
							   this.model.editDeadlinePassedSent(this),  
							   this.model.editDeadlineApproachingSent(this),  
							   this.model.editRatingForWorker(this),  
							   this.model.editWorkQuality(this),  
							   this.model.editExpertise(this),  
							   this.model.editWorkerCommunication(this),  
							   this.model.editWorkerProfessionalism(this),  
							   this.model.editWorkerRating(this),  
							   this.model.editWorkerRatingNum(this),  
							   this.model.editWorkerFeedback(this),  
							   this.model.editRatingForOwner(this),  
							   this.model.editClarity(this),  
							   this.model.editFriendliness(this),  
							   this.model.editOwnerCommunication(this),  
							   this.model.editOwnerProfessionalism(this),  
							   this.model.editOwnerRating(this),  
							   this.model.editOwnerRatingNum(this),  
							   this.model.editOwnerFeedback(this),  
							   this.model.editOwnerSignatureIp(this),  
							   this.model.editOwnerSignatureDate(this),  
							   this.model.editWorkerSignatureIp(this),  
							   this.model.editWorkerSignatureDate(this),  
							   this.model.editOwnerEscrow(this),  
							   this.model.editWorkerCredit(this),  
							   this.model.editArbitration(this),  
							   this.model.editOwnerCredit(this),  
							   this.model.editRegisteredBy(this),  
							   this.model.editRegisteredDate(this),  
							   this.model.editRegisteredFromIp(this),  
							   this.model.editCanceledBy(this),  
							   this.model.editCanceledDate(this),  
							   this.model.editCanceledFromIp(this),  
							   this.model.editPublishedBy(this),  
							   this.model.editPublishedDate(this),  
							   this.model.editPublishedFromIp(this),  
							   this.model.editRejectedBy(this),  
							   this.model.editRejectedDate(this),  
							   this.model.editRejectedFromIp(this),  
							   this.model.editAdminNote(this),  
							   this.model.editAnnounced(this),  
							   this.model.editYourWishes(this),  
							   this.model.editExtendDeadlineDays(this),  
							   this.model.editTestimony(this),  
							   this.model.editPickUserName(this),  
							   this.model.editEnterEmailAddress(this),  
							   this.model.editHandphone(this),  
							   this.model.editBroadcastMessage(this),  
							   this.model.editAttachFile(this),  
							   this.model.editAutomaticSendToNewBidder(this),  
							   this.model.editIsSystemMessage(this),  
							   this.model.editAdminNotes(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                    
                  )

              )
          ),

            floatingActionButton: isLoading? [] : this.model.Buttons(context, _dialVisible, formKey, controller,my_projects, postMyProjectsResult, this, sendPath, '', '')


      );

  }


  @override
  void dispose() {
    super.dispose();
  }
  
 

}

