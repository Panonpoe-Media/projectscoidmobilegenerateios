
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';
//////
class MyProjectsController {

  ProjectscoidApplication application;
  MyProjectsListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;
  ShowBidsMyProjectsListing? listingShowBids;
  ShowThreadMyProjectsListing? listingShowThread;
  ShowFilesMyProjectsListing? listingShowFiles;
  ShowConversationMyProjectsListing? listingShowConversation;

  MyProjectsController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyProjectsListing(this.application, this.url!, this.isSearch, MyProjectsListingUninitialized());}
      break;
      case 1 : {}
      break;
      default:{}
    }
  }


 Future<String?> downloadFile1( ProgressDlCallback showProgress) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.downloadFile1(url!, title!, showProgress!);
  }
  
  Future downloadFile() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await apiRepProvider?.downloadFile(url!, title!);
  }

  Future editMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMyProjects;
    editMyProjects = await apiRepProvider?.getMyProjectsEdit(url!, id!, title!);
    return editMyProjects;
  }
  
    Future viewMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMyProjects;
    viewMyProjects = await apiRepProvider?.getMyProjectsView(url!, id!, title!);
    return viewMyProjects;
  }

  Future postMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyProjects;
    postMyProjects = await apiRepProvider?.sendMyProjectsPost(url!,formData);
    return postMyProjects;
  }
  
    Future postMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyProjects;
    postMyProjects = await apiRepProvider?.sendMyProjectsPostWithID(url!,formData, id!, title!);
    return postMyProjects;
  }

  
  
    Future editBumpUpMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editBumpUp;
    editBumpUp = await apiRepProvider?.getBumpUpMyProjectsEdit(url!, id!, title!);
    return editBumpUp;
  }

  Future postBumpUpMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBumpUp;
    postBumpUp = await apiRepProvider?.sendBumpUpMyProjectsPost(url!,formData);
    return postBumpUp;
  }
  
    Future postBumpUpMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBumpUp;
    postBumpUp = await apiRepProvider?.sendBumpUpMyProjectsPostWithID(url!,formData, id!, title!);
    return postBumpUp;
  }
  
      Future getBumpUpMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getBumpUp;
        getBumpUp = await apiRepProvider?.getBumpUpMyProjects(url!, id!, title!, spKey!);
	    return getBumpUp ;
	 }
   Future<BumpUpMyProjectsModel> loadBumpUpMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadBumpUp;
        loadBumpUp = await apiRepProvider?.loadBumpUpMyProjects('');
	    return loadBumpUp ;  
   }
  
   Future saveBumpUpMyProjects(BumpUpMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateBumpUpMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllBumpUpMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllBumpUpMyProjects(spKey!);   
   }
  
  
  
    Future editBroadcastMessageMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editBroadcastMessage;
    editBroadcastMessage = await apiRepProvider?.getBroadcastMessageMyProjectsEdit(url!, id!, title!);
    return editBroadcastMessage;
  }

  Future postBroadcastMessageMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBroadcastMessage;
    postBroadcastMessage = await apiRepProvider?.sendBroadcastMessageMyProjectsPost(url!,formData);
    return postBroadcastMessage;
  }
  
    Future postBroadcastMessageMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBroadcastMessage;
    postBroadcastMessage = await apiRepProvider?.sendBroadcastMessageMyProjectsPostWithID(url!,formData, id!, title!);
    return postBroadcastMessage;
  }
  
      Future getBroadcastMessageMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getBroadcastMessage;
        getBroadcastMessage = await apiRepProvider?.getBroadcastMessageMyProjects(url!, id!, title!, spKey!);
	    return getBroadcastMessage ;
	 }
   Future<BroadcastMessageMyProjectsModel> loadBroadcastMessageMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadBroadcastMessage;
        loadBroadcastMessage = await apiRepProvider?.loadBroadcastMessageMyProjects('');
	    return loadBroadcastMessage ;  
   }
  
   Future saveBroadcastMessageMyProjects(BroadcastMessageMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateBroadcastMessageMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllBroadcastMessageMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllBroadcastMessageMyProjects(spKey!);   
   }
  
  
  void listMyProjectsShowBids() async {
   listingShowBids = new ShowBidsMyProjectsListing(this.application!, this.url!, this.isSearch, ShowBidsMyProjectsListingUninitialized());
  }
  void listMyProjectsShowThread() async {
   listingShowThread = new ShowThreadMyProjectsListing(this.application!, this.url!, this.isSearch, ShowThreadMyProjectsListingUninitialized());
  }
  void listMyProjectsShowFiles() async {
   listingShowFiles = new ShowFilesMyProjectsListing(this.application!, this.url!, this.isSearch, ShowFilesMyProjectsListingUninitialized());
  }
  void listMyProjectsShowConversation() async {
   listingShowConversation = new ShowConversationMyProjectsListing(this.application!, this.url!, this.isSearch, ShowConversationMyProjectsListingUninitialized());
  }
  
    Future editCreateProjectMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editCreateProject;
    editCreateProject = await apiRepProvider?.getCreateProjectMyProjectsEdit(url!, id!, title!);
    return editCreateProject;
  }

  Future postCreateProjectMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCreateProject;
    postCreateProject = await apiRepProvider?.sendCreateProjectMyProjectsPost(url!,formData);
    return postCreateProject;
  }
  
    Future postCreateProjectMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCreateProject;
    postCreateProject = await apiRepProvider?.sendCreateProjectMyProjectsPostWithID(url!,formData, id!, title!);
    return postCreateProject;
  }
  
      Future getCreateProjectMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getCreateProject;
        getCreateProject = await apiRepProvider?.getCreateProjectMyProjects(url!, id!, title!, spKey!);
	    return getCreateProject ;
	 }
   Future<CreateProjectMyProjectsModel> loadCreateProjectMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadCreateProject;
        loadCreateProject = await apiRepProvider?.loadCreateProjectMyProjects('');
	    return loadCreateProject ;  
   }
  
   Future saveCreateProjectMyProjects(CreateProjectMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateCreateProjectMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllCreateProjectMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllCreateProjectMyProjects(spKey!);   
   }
  
  
  
    Future editEditDraftMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editEditDraft;
    editEditDraft = await apiRepProvider?.getEditDraftMyProjectsEdit(url!, id!, title!);
    return editEditDraft;
  }

  Future postEditDraftMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEditDraft;
    postEditDraft = await apiRepProvider?.sendEditDraftMyProjectsPost(url!,formData);
    return postEditDraft;
  }
  
    Future postEditDraftMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEditDraft;
    postEditDraft = await apiRepProvider?.sendEditDraftMyProjectsPostWithID(url!,formData, id!, title!);
    return postEditDraft;
  }
  
      Future getEditDraftMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getEditDraft;
        getEditDraft = await apiRepProvider?.getEditDraftMyProjects(url!, id!, title!, spKey!);
	    return getEditDraft ;
	 }
   Future<EditDraftMyProjectsModel> loadEditDraftMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadEditDraft;
        loadEditDraft = await apiRepProvider?.loadEditDraftMyProjects('');
	    return loadEditDraft ;  
   }
  
   Future saveEditDraftMyProjects(EditDraftMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateEditDraftMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllEditDraftMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllEditDraftMyProjects(spKey!);   
   }
  
  
  
    Future editPublishProjectMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPublishProject;
    editPublishProject = await apiRepProvider?.getPublishProjectMyProjectsEdit(url!, id!, title!);
    return editPublishProject;
  }

  Future postPublishProjectMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPublishProject;
    postPublishProject = await apiRepProvider?.sendPublishProjectMyProjectsPost(url!,formData);
    return postPublishProject;
  }
  
    Future postPublishProjectMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPublishProject;
    postPublishProject = await apiRepProvider?.sendPublishProjectMyProjectsPostWithID(url!,formData, id!, title!);
    return postPublishProject;
  }
  
      Future getPublishProjectMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPublishProject;
        getPublishProject = await apiRepProvider?.getPublishProjectMyProjects(url!, id!, title!, spKey!);
	    return getPublishProject ;
	 }
   Future<PublishProjectMyProjectsModel> loadPublishProjectMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPublishProject;
        loadPublishProject = await apiRepProvider?.loadPublishProjectMyProjects('');
	    return loadPublishProject ;  
   }
  
   Future savePublishProjectMyProjects(PublishProjectMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePublishProjectMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPublishProjectMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPublishProjectMyProjects(spKey!);   
   }
  
  
  
    Future editCancelProjectMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editCancelProject;
    editCancelProject = await apiRepProvider?.getCancelProjectMyProjectsEdit(url!, id!, title!);
    return editCancelProject;
  }

  Future postCancelProjectMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCancelProject;
    postCancelProject = await apiRepProvider?.sendCancelProjectMyProjectsPost(url!,formData);
    return postCancelProject;
  }
  
    Future postCancelProjectMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCancelProject;
    postCancelProject = await apiRepProvider?.sendCancelProjectMyProjectsPostWithID(url!,formData, id!, title!);
    return postCancelProject;
  }
  
      Future getCancelProjectMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getCancelProject;
        getCancelProject = await apiRepProvider?.getCancelProjectMyProjects(url!, id!, title!, spKey!);
	    return getCancelProject ;
	 }
   Future<CancelProjectMyProjectsModel> loadCancelProjectMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadCancelProject;
        loadCancelProject = await apiRepProvider?.loadCancelProjectMyProjects('');
	    return loadCancelProject ;  
   }
  
   Future saveCancelProjectMyProjects(CancelProjectMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateCancelProjectMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllCancelProjectMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllCancelProjectMyProjects(spKey!);   
   }
  
  
  
    Future editAcceptOrRejectWorkMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editAcceptOrRejectWork;
    editAcceptOrRejectWork = await apiRepProvider?.getAcceptOrRejectWorkMyProjectsEdit(url!, id!, title!);
    return editAcceptOrRejectWork;
  }

  Future postAcceptOrRejectWorkMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAcceptOrRejectWork;
    postAcceptOrRejectWork = await apiRepProvider?.sendAcceptOrRejectWorkMyProjectsPost(url!,formData);
    return postAcceptOrRejectWork;
  }
  
    Future postAcceptOrRejectWorkMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAcceptOrRejectWork;
    postAcceptOrRejectWork = await apiRepProvider?.sendAcceptOrRejectWorkMyProjectsPostWithID(url!,formData, id!, title!);
    return postAcceptOrRejectWork;
  }
  
      Future getAcceptOrRejectWorkMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getAcceptOrRejectWork;
        getAcceptOrRejectWork = await apiRepProvider?.getAcceptOrRejectWorkMyProjects(url!, id!, title!, spKey!);
	    return getAcceptOrRejectWork ;
	 }
   Future<AcceptOrRejectWorkMyProjectsModel> loadAcceptOrRejectWorkMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadAcceptOrRejectWork;
        loadAcceptOrRejectWork = await apiRepProvider?.loadAcceptOrRejectWorkMyProjects('');
	    return loadAcceptOrRejectWork ;  
   }
  
   Future saveAcceptOrRejectWorkMyProjects(AcceptOrRejectWorkMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateAcceptOrRejectWorkMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllAcceptOrRejectWorkMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllAcceptOrRejectWorkMyProjects(spKey!);   
   }
  
  
  
    Future editRateWorkerMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editRateWorker;
    editRateWorker = await apiRepProvider?.getRateWorkerMyProjectsEdit(url!, id!, title!);
    return editRateWorker;
  }

  Future postRateWorkerMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRateWorker;
    postRateWorker = await apiRepProvider?.sendRateWorkerMyProjectsPost(url!,formData);
    return postRateWorker;
  }
  
    Future postRateWorkerMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRateWorker;
    postRateWorker = await apiRepProvider?.sendRateWorkerMyProjectsPostWithID(url!,formData, id!, title!);
    return postRateWorker;
  }
  
      Future getRateWorkerMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getRateWorker;
        getRateWorker = await apiRepProvider?.getRateWorkerMyProjects(url!, id!, title!, spKey!);
	    return getRateWorker ;
	 }
   Future<RateWorkerMyProjectsModel> loadRateWorkerMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadRateWorker;
        loadRateWorker = await apiRepProvider?.loadRateWorkerMyProjects('');
	    return loadRateWorker ;  
   }
  
   Future saveRateWorkerMyProjects(RateWorkerMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateRateWorkerMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllRateWorkerMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllRateWorkerMyProjects(spKey!);   
   }
  
  
  
    Future editReportProgressMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editReportProgress;
    editReportProgress = await apiRepProvider?.getReportProgressMyProjectsEdit(url!, id!, title!);
    return editReportProgress;
  }

  Future postReportProgressMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postReportProgress;
    postReportProgress = await apiRepProvider?.sendReportProgressMyProjectsPost(url!,formData);
    return postReportProgress;
  }
  
    Future postReportProgressMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postReportProgress;
    postReportProgress = await apiRepProvider?.sendReportProgressMyProjectsPostWithID(url!,formData, id!, title!);
    return postReportProgress;
  }
  
      Future getReportProgressMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getReportProgress;
        getReportProgress = await apiRepProvider?.getReportProgressMyProjects(url!, id!, title!, spKey!);
	    return getReportProgress ;
	 }
   Future<ReportProgressMyProjectsModel> loadReportProgressMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadReportProgress;
        loadReportProgress = await apiRepProvider?.loadReportProgressMyProjects('');
	    return loadReportProgress ;  
   }
  
   Future saveReportProgressMyProjects(ReportProgressMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateReportProgressMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllReportProgressMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllReportProgressMyProjects(spKey!);   
   }
  
  
  
    Future editWeeklyReportMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editWeeklyReport;
    editWeeklyReport = await apiRepProvider?.getWeeklyReportMyProjectsEdit(url!, id!, title!);
    return editWeeklyReport;
  }

  Future postWeeklyReportMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postWeeklyReport;
    postWeeklyReport = await apiRepProvider?.sendWeeklyReportMyProjectsPost(url!,formData);
    return postWeeklyReport;
  }
  
    Future postWeeklyReportMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postWeeklyReport;
    postWeeklyReport = await apiRepProvider?.sendWeeklyReportMyProjectsPostWithID(url!,formData, id!, title!);
    return postWeeklyReport;
  }
  
      Future getWeeklyReportMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getWeeklyReport;
        getWeeklyReport = await apiRepProvider?.getWeeklyReportMyProjects(url!, id!, title!, spKey!);
	    return getWeeklyReport ;
	 }
   Future<WeeklyReportMyProjectsModel> loadWeeklyReportMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadWeeklyReport;
        loadWeeklyReport = await apiRepProvider?.loadWeeklyReportMyProjects('');
	    return loadWeeklyReport ;  
   }
  
   Future saveWeeklyReportMyProjects(WeeklyReportMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateWeeklyReportMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllWeeklyReportMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllWeeklyReportMyProjects(spKey!);   
   }
  
  
  
    Future editReportDoneMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editReportDone;
    editReportDone = await apiRepProvider?.getReportDoneMyProjectsEdit(url!, id!, title!);
    return editReportDone;
  }

  Future postReportDoneMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postReportDone;
    postReportDone = await apiRepProvider?.sendReportDoneMyProjectsPost(url!,formData);
    return postReportDone;
  }
  
    Future postReportDoneMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postReportDone;
    postReportDone = await apiRepProvider?.sendReportDoneMyProjectsPostWithID(url!,formData, id!, title!);
    return postReportDone;
  }
  
      Future getReportDoneMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getReportDone;
        getReportDone = await apiRepProvider?.getReportDoneMyProjects(url!, id!, title!, spKey!);
	    return getReportDone ;
	 }
   Future<ReportDoneMyProjectsModel> loadReportDoneMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadReportDone;
        loadReportDone = await apiRepProvider?.loadReportDoneMyProjects('');
	    return loadReportDone ;  
   }
  
   Future saveReportDoneMyProjects(ReportDoneMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateReportDoneMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllReportDoneMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllReportDoneMyProjects(spKey!);   
   }
  
  
  
    Future editRateOwnerMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editRateOwner;
    editRateOwner = await apiRepProvider?.getRateOwnerMyProjectsEdit(url!, id!, title!);
    return editRateOwner;
  }

  Future postRateOwnerMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRateOwner;
    postRateOwner = await apiRepProvider?.sendRateOwnerMyProjectsPost(url!,formData);
    return postRateOwner;
  }
  
    Future postRateOwnerMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRateOwner;
    postRateOwner = await apiRepProvider?.sendRateOwnerMyProjectsPostWithID(url!,formData, id!, title!);
    return postRateOwner;
  }
  
      Future getRateOwnerMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getRateOwner;
        getRateOwner = await apiRepProvider?.getRateOwnerMyProjects(url!, id!, title!, spKey!);
	    return getRateOwner ;
	 }
   Future<RateOwnerMyProjectsModel> loadRateOwnerMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadRateOwner;
        loadRateOwner = await apiRepProvider?.loadRateOwnerMyProjects('');
	    return loadRateOwner ;  
   }
  
   Future saveRateOwnerMyProjects(RateOwnerMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateRateOwnerMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllRateOwnerMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllRateOwnerMyProjects(spKey!);   
   }
  
  
  
    Future editFileArbitrationMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editFileArbitration;
    editFileArbitration = await apiRepProvider?.getFileArbitrationMyProjectsEdit(url!, id!, title!);
    return editFileArbitration;
  }

  Future postFileArbitrationMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postFileArbitration;
    postFileArbitration = await apiRepProvider?.sendFileArbitrationMyProjectsPost(url!,formData);
    return postFileArbitration;
  }
  
    Future postFileArbitrationMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postFileArbitration;
    postFileArbitration = await apiRepProvider?.sendFileArbitrationMyProjectsPostWithID(url!,formData, id!, title!);
    return postFileArbitration;
  }
  
      Future getFileArbitrationMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getFileArbitration;
        getFileArbitration = await apiRepProvider?.getFileArbitrationMyProjects(url!, id!, title!, spKey!);
	    return getFileArbitration ;
	 }
   Future<FileArbitrationMyProjectsModel> loadFileArbitrationMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadFileArbitration;
        loadFileArbitration = await apiRepProvider?.loadFileArbitrationMyProjects('');
	    return loadFileArbitration ;  
   }
  
   Future saveFileArbitrationMyProjects(FileArbitrationMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateFileArbitrationMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllFileArbitrationMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllFileArbitrationMyProjects(spKey!);   
   }
  
  
  
    Future editNewOfferMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editNewOffer;
    editNewOffer = await apiRepProvider?.getNewOfferMyProjectsEdit(url!, id!, title!);
    return editNewOffer;
  }

  Future postNewOfferMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postNewOffer;
    postNewOffer = await apiRepProvider?.sendNewOfferMyProjectsPost(url!,formData);
    return postNewOffer;
  }
  
    Future postNewOfferMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postNewOffer;
    postNewOffer = await apiRepProvider?.sendNewOfferMyProjectsPostWithID(url!,formData, id!, title!);
    return postNewOffer;
  }
  
      Future getNewOfferMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getNewOffer;
        getNewOffer = await apiRepProvider?.getNewOfferMyProjects(url!, id!, title!, spKey!);
	    return getNewOffer ;
	 }
   Future<NewOfferMyProjectsModel> loadNewOfferMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadNewOffer;
        loadNewOffer = await apiRepProvider?.loadNewOfferMyProjects('');
	    return loadNewOffer ;  
   }
  
   Future saveNewOfferMyProjects(NewOfferMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateNewOfferMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllNewOfferMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllNewOfferMyProjects(spKey!);   
   }
  
  
  
    Future editAcceptOfferMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editAcceptOffer;
    editAcceptOffer = await apiRepProvider?.getAcceptOfferMyProjectsEdit(url!, id!, title!);
    return editAcceptOffer;
  }

  Future postAcceptOfferMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAcceptOffer;
    postAcceptOffer = await apiRepProvider?.sendAcceptOfferMyProjectsPost(url!,formData);
    return postAcceptOffer;
  }
  
    Future postAcceptOfferMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAcceptOffer;
    postAcceptOffer = await apiRepProvider?.sendAcceptOfferMyProjectsPostWithID(url!,formData, id!, title!);
    return postAcceptOffer;
  }
  
      Future getAcceptOfferMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getAcceptOffer;
        getAcceptOffer = await apiRepProvider?.getAcceptOfferMyProjects(url!, id!, title!, spKey!);
	    return getAcceptOffer ;
	 }
   Future<AcceptOfferMyProjectsModel> loadAcceptOfferMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadAcceptOffer;
        loadAcceptOffer = await apiRepProvider?.loadAcceptOfferMyProjects('');
	    return loadAcceptOffer ;  
   }
  
   Future saveAcceptOfferMyProjects(AcceptOfferMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateAcceptOfferMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllAcceptOfferMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllAcceptOfferMyProjects(spKey!);   
   }
  
  
  
    Future editRespondArbitrationMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editRespondArbitration;
    editRespondArbitration = await apiRepProvider?.getRespondArbitrationMyProjectsEdit(url!, id!, title!);
    return editRespondArbitration;
  }

  Future postRespondArbitrationMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRespondArbitration;
    postRespondArbitration = await apiRepProvider?.sendRespondArbitrationMyProjectsPost(url!,formData);
    return postRespondArbitration;
  }
  
    Future postRespondArbitrationMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRespondArbitration;
    postRespondArbitration = await apiRepProvider?.sendRespondArbitrationMyProjectsPostWithID(url!,formData, id!, title!);
    return postRespondArbitration;
  }
  
      Future getRespondArbitrationMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getRespondArbitration;
        getRespondArbitration = await apiRepProvider?.getRespondArbitrationMyProjects(url!, id!, title!, spKey!);
	    return getRespondArbitration ;
	 }
   Future<RespondArbitrationMyProjectsModel> loadRespondArbitrationMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadRespondArbitration;
        loadRespondArbitration = await apiRepProvider?.loadRespondArbitrationMyProjects('');
	    return loadRespondArbitration ;  
   }
  
   Future saveRespondArbitrationMyProjects(RespondArbitrationMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateRespondArbitrationMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllRespondArbitrationMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllRespondArbitrationMyProjects(spKey!);   
   }
  
  
  
    Future editCancelArbitrationMyProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editCancelArbitration;
    editCancelArbitration = await apiRepProvider?.getCancelArbitrationMyProjectsEdit(url!, id!, title!);
    return editCancelArbitration;
  }

  Future postCancelArbitrationMyProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCancelArbitration;
    postCancelArbitration = await apiRepProvider?.sendCancelArbitrationMyProjectsPost(url!,formData);
    return postCancelArbitration;
  }
  
    Future postCancelArbitrationMyProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCancelArbitration;
    postCancelArbitration = await apiRepProvider?.sendCancelArbitrationMyProjectsPostWithID(url!,formData, id!, title!);
    return postCancelArbitration;
  }
  
      Future getCancelArbitrationMyProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getCancelArbitration;
        getCancelArbitration = await apiRepProvider?.getCancelArbitrationMyProjects(url!, id!, title!, spKey!);
	    return getCancelArbitration ;
	 }
   Future<CancelArbitrationMyProjectsModel> loadCancelArbitrationMyProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadCancelArbitration;
        loadCancelArbitration = await apiRepProvider?.loadCancelArbitrationMyProjects('');
	    return loadCancelArbitration ;  
   }
  
   Future saveCancelArbitrationMyProjects(CancelArbitrationMyProjectsModel? my_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateCancelArbitrationMyProjects(my_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllCancelArbitrationMyProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllCancelArbitrationMyProjects(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyProjectsListing extends Bloc<MyProjectsEvent, MyProjectsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyProjectsListing(this.application, this.url, this.isSearch, MyProjectsState initialState):
  super(initialState){
     on<MyProjectsList>(_MyProjectsListEvent);
	
	  on<MyProjectsListingRefresh>(_MyProjectsListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyProjectsEvent, MyProjectsState>> transformEvents(
      Stream<MyProjectsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyProjectsEvent> transform<MyProjectsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyProjectsEvent, MyProjectsState> transition) {
    print(transition);
  }

  @override
  get initialState => MyProjectsListingUninitialized();

void _MyProjectsListEvent(MyProjectsList event, Emitter<MyProjectsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyProjectsListingUninitialized){
			  if(isSearch!){
			     MyProjectsListingModel? my_projects = await listingSearchMyProjects(1);
				  int deltaPage;
				  if(my_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_projects?.items.items.length ~/ (my_projects?.tools.paging.total_rows/my_projects?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_projects?.items.items.isEmpty
					  ? MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyProjectsListingModel? my_projects = await listingMyProjects(1);
				   int deltaPage;
				  if(my_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_projects?.items.items.length ~/ (my_projects?.tools.paging.total_rows/my_projects?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_projects?.items.items.isEmpty
					  ? MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyProjectsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyProjectsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyProjectsListingLoaded).page! + 1;
			 if ((currentState as MyProjectsListingLoaded).my_projects?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyProjectsListingModel? my_projects = await listingSearchMyProjects(page);
						  if(!my_projects?.items.items.isEmpty){
							 (currentState as MyProjectsListingLoaded).my_projects?.items.items.addAll(my_projects?.items.items);
						  }
						  return emit ( my_projects?.items.items.isEmpty
							  ? (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyProjectsListingLoaded(  my_projects:  (currentState as MyProjectsListingLoaded).my_projects! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyProjectsListingLoaded).page! + 1;
							  if ((currentState as MyProjectsListingLoaded).my_projects?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyProjectsListingModel? my_projects = await listingMyProjects(page);
							  return emit ( my_projects?.items.items.isEmpty
								  ? (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyProjectsListingLoaded(  my_projects:  my_projects! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyProjectsListingError());
        
      }
    }
  }

void _MyProjectsListingRefreshEvent(MyProjectsListingRefresh event, Emitter<MyProjectsState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyProjectsListingUninitialized) {
		   if(isSearch!){

			    MyProjectsListingModel? my_projects = await listingSearchMyProjects(1);
              return emit (  MyProjectsListingLoaded( my_projects: my_projects!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyProjectsListingModel? my_projects = await listingMyProjects(1);
				   return emit (  MyProjectsListingLoaded( my_projects: my_projects!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyProjectsListingLoaded) {
		  if(isSearch!){
		     MyProjectsListingModel? my_projects = await listingSearchRefreshMyProjects();
              return emit (  my_projects?.items.items.isEmpty
              ? (currentState as MyProjectsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyProjectsListingLoaded(  my_projects: my_projects! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyProjectsListingModel? my_projects = await listingMyProjects(1);
				  int deltaPage = my_projects?.items.items.length ~/ (my_projects?.tools.paging.total_rows/my_projects?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_projects?.items.items.isEmpty
					  ? (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyProjectsListingError());
      }
  }

  @override

  Stream<MyProjectsState> mapEventToState(MyProjectsEvent event) async* {
    final currentState = state;
    if (event is MyProjectsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyProjectsListingUninitialized){
			  if(isSearch!){
			     MyProjectsListingModel? my_projects = await listingSearchMyProjects(1);
				  int deltaPage;
				  if(my_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_projects?.items.items.length ~/ (my_projects?.tools.paging.total_rows/my_projects?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_projects?.items.items.isEmpty
					  ? MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyProjectsListingModel? my_projects = await listingMyProjects(1);
				   int deltaPage;
				  if(my_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_projects?.items.items.length ~/ (my_projects?.tools.paging.total_rows/my_projects?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_projects?.items.items.isEmpty
					  ? MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyProjectsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyProjectsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyProjectsListingLoaded).page! + 1;
			 if ((currentState as MyProjectsListingLoaded).my_projects?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyProjectsListingModel? my_projects = await listingSearchMyProjects(page);
						  if(!my_projects?.items.items.isEmpty){
							 (currentState as MyProjectsListingLoaded).my_projects?.items.items.addAll(my_projects?.items.items);
						  }
						  yield my_projects?.items.items.isEmpty
							  ? (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyProjectsListingLoaded(  my_projects:  (currentState as MyProjectsListingLoaded).my_projects! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyProjectsListingLoaded).page! + 1;
							  if ((currentState as MyProjectsListingLoaded).my_projects?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyProjectsListingModel? my_projects = await listingMyProjects(page);
							  yield my_projects?.items.items.isEmpty
								  ? (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyProjectsListingLoaded(  my_projects:  my_projects! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyProjectsListingError();
        
      }
    } else if (event is MyProjectsListingRefresh){
      try {
        if (currentState is MyProjectsListingUninitialized) {
		   if(isSearch!){

			    MyProjectsListingModel? my_projects = await listingSearchMyProjects(1);
              yield MyProjectsListingLoaded( my_projects: my_projects!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyProjectsListingModel? my_projects = await listingMyProjects(1);
				   yield MyProjectsListingLoaded( my_projects: my_projects!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyProjectsListingLoaded) {
		  if(isSearch!){
		     MyProjectsListingModel? my_projects = await listingSearchRefreshMyProjects();
              yield my_projects?.items.items.isEmpty
              ? (currentState as MyProjectsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyProjectsListingLoaded(  my_projects: my_projects! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyProjectsListingModel? my_projects = await listingMyProjects(1);
				  int deltaPage = my_projects?.items.items.length ~/ (my_projects?.tools.paging.total_rows/my_projects?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_projects?.items.items.isEmpty
					  ? (currentState as MyProjectsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProjectsListingLoaded(my_projects: my_projects!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyProjectsListingError();
      }

    }
  }

  bool hasReachedMax(MyProjectsState state) =>
      state is MyProjectsListingLoaded && state.hasReachedMax!;

  Future<MyProjectsListingModel?> listingMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyProjectsList(url!, page!);
  }

  Future<MyProjectsListingModel?> listingRefreshMyProjects() async {
    MyProjectsListingModel? my_projects;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyProjectsList();
    my_projects  = await apiRepProvider?.getMyProjectsList(url!, 1);
    return my_projects;
  }
  
  

  Future<MyProjectsListingModel?> listingSearchMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyProjectsListSearch(url!, page!);
  }

  Future<MyProjectsListingModel?> listingSearchRefreshMyProjects() async {
    MyProjectsListingModel? my_projects ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_projects  = await apiRepProvider?.getMyProjectsListSearch(url!, 1);
    return my_projects;
  }
}


class ShowBidsMyProjectsListing extends Bloc<ShowBidsMyProjectsEvent, ShowBidsMyProjectsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  ShowBidsMyProjectsListing(this.application, this.url, this.isSearch, ShowBidsMyProjectsState initialState):
  super(initialState){
     on<ShowBidsMyProjectsList>(_ShowBidsMyProjectsListEvent);
	 on<ShowBidsMyProjectsListingRefresh>(_ShowBidsMyProjectsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<ShowBidsMyProjectsEvent, ShowBidsMyProjectsState>> transformEvents(
      Stream<ShowBidsMyProjectsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<ShowBidsMyProjectsEvent> transform<ShowBidsMyProjectsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<ShowBidsMyProjectsEvent, ShowBidsMyProjectsState> transition) {
    print(transition);
  }

  @override
  get initialState => ShowBidsMyProjectsListingUninitialized();
  
  
  void _ShowBidsMyProjectsListEvent(ShowBidsMyProjectsList event, Emitter<ShowBidsMyProjectsState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
					if (currentState is ShowBidsMyProjectsListingUninitialized){
						  if(isSearch!){
							 ShowBidsListingModel? show_bids = await listingSearchShowBidsMyProjects(-1);
							  int deltaPage;
							  
							  if(show_bids?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_bids?.items.items.length ~/(show_bids?.tools.paging.total_rows/show_bids?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( show_bids?.items.items.isEmpty ?
							  ShowBidsMyProjectsListingLoaded(show_bids: show_bids!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : ShowBidsMyProjectsListingLoaded(show_bids: show_bids!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }else{
							  ShowBidsListingModel? show_bids = await listingShowBidsMyProjects(1);
							  int deltaPage = show_bids?.items.items.length ~/ (show_bids?.tools.paging.total_rows/show_bids?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( ShowBidsMyProjectsListingLoaded(show_bids: show_bids!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }
					}

					if (currentState is ShowBidsMyProjectsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as ShowBidsMyProjectsListingLoaded).page! + 1;
							  bool max = false;
							  ShowBidsListingModel? show_bids = await listingShowBidsMyProjects(page);
							  if(show_bids?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!show_bids?.items.items.isEmpty && !max){
								 (currentState as ShowBidsMyProjectsListingLoaded).show_bids?.items.items.addAll(show_bids?.items.items);
							  }
							  return emit ( show_bids?.items.items.isEmpty || max
								  ? (currentState as ShowBidsMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowBidsMyProjectsListingLoaded(  show_bids:  (currentState as ShowBidsMyProjectsListingLoaded).show_bids! ,
														  hasReachedMax: false,
														  page: page,));
						}else{
					  
							  final page = (currentState as ShowBidsMyProjectsListingLoaded).page! + 1;
							  ShowBidsListingModel? show_bids = await listingShowBidsMyProjects(page);
							  return emit ( show_bids?.items.items.isEmpty
								  ? (currentState as ShowBidsMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ShowBidsMyProjectsListingLoaded(  show_bids:  show_bids! ,
														  hasReachedMax: false,
														  page: page,));
						}	  
					}
					
      } catch (_) {
        return emit ( ShowBidsMyProjectsListingError());
      }
    }
  }
  
  void _ShowBidsMyProjectsListingRefreshEvent(ShowBidsMyProjectsListingRefresh event, Emitter<ShowBidsMyProjectsState> emit)async{
  final currentState = state;
   try {
					if (currentState is ShowBidsMyProjectsListingUninitialized) {
					   if(isSearch!){
						  ShowBidsListingModel? show_bids = await listingSearchShowBidsMyProjects(1);
						  return emit (  ShowBidsMyProjectsListingLoaded( show_bids: show_bids!,
							   hasReachedMax: false,
							   page: 1 ));
					   }else{
						 ShowBidsListingModel? show_bids = await listingShowBidsMyProjects(1);
						 return emit ( ShowBidsMyProjectsListingLoaded( show_bids: show_bids!,
							   hasReachedMax: false,
							   page: 1 ));
					   }

					}

					if (currentState is ShowBidsMyProjectsListingLoaded) {
					  if(isSearch!){
						 ShowBidsListingModel? show_bids = await listingSearchRefreshShowBidsMyProjects();
						  return emit (  show_bids?.items.items.isEmpty
						  ? (currentState as ShowBidsMyProjectsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ShowBidsMyProjectsListingLoaded(  show_bids: show_bids! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }else{
						  ShowBidsListingModel? show_bids = await listingRefreshShowBidsMyProjects();
						  return emit (  show_bids?.items.items.isEmpty
						  ? (currentState as ShowBidsMyProjectsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ShowBidsMyProjectsListingLoaded(  show_bids: show_bids! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }

					}
			
      } catch (_) {
        return emit ( ShowBidsMyProjectsListingError());
      }

  }

  @override

  Stream<ShowBidsMyProjectsState> mapEventToState(ShowBidsMyProjectsEvent event) async* {
  final currentState = state;
    if (event is ShowBidsMyProjectsList && !hasReachedMax(currentState)) {
      try {
					if (currentState is ShowBidsMyProjectsListingUninitialized){
						  if(isSearch!){
							 ShowBidsListingModel? show_bids = await listingSearchShowBidsMyProjects(-1);
							  int deltaPage;
							  
							  if(show_bids?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_bids?.items.items.length ~/(show_bids?.tools.paging.total_rows/show_bids?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield show_bids?.items.items.isEmpty ?
							  ShowBidsMyProjectsListingLoaded(show_bids: show_bids!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : ShowBidsMyProjectsListingLoaded(show_bids: show_bids!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }else{
							  ShowBidsListingModel? show_bids = await listingShowBidsMyProjects(1);
							  int deltaPage = show_bids?.items.items.length ~/ (show_bids?.tools.paging.total_rows/show_bids?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield ShowBidsMyProjectsListingLoaded(show_bids: show_bids!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }
					}

					if (currentState is ShowBidsMyProjectsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as ShowBidsMyProjectsListingLoaded).page! + 1;
							  bool max = false;
							  ShowBidsListingModel? show_bids = await listingShowBidsMyProjects(page);
							  if(show_bids?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!show_bids?.items.items.isEmpty && !max){
								 (currentState as ShowBidsMyProjectsListingLoaded).show_bids?.items.items.addAll(show_bids?.items.items);
							  }
							  yield show_bids?.items.items.isEmpty || max
								  ? (currentState as ShowBidsMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowBidsMyProjectsListingLoaded(  show_bids:  (currentState as ShowBidsMyProjectsListingLoaded).show_bids! ,
														  hasReachedMax: false,
														  page: page,);
						}else{
					  
							  final page = (currentState as ShowBidsMyProjectsListingLoaded).page! + 1;
							  ShowBidsListingModel? show_bids = await listingShowBidsMyProjects(page);
							  yield show_bids?.items.items.isEmpty
								  ? (currentState as ShowBidsMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ShowBidsMyProjectsListingLoaded(  show_bids:  show_bids! ,
														  hasReachedMax: false,
														  page: page,);
						}	  
					}
					
      } catch (_) {
        yield ShowBidsMyProjectsListingError();
      }
    } else if (event is ShowBidsMyProjectsListingRefresh){
      try {
					if (currentState is ShowBidsMyProjectsListingUninitialized) {
					   if(isSearch!){
						  ShowBidsListingModel? show_bids = await listingSearchShowBidsMyProjects(1);
						  yield ShowBidsMyProjectsListingLoaded( show_bids: show_bids!,
							   hasReachedMax: false,
							   page: 1 );
					   }else{
						 ShowBidsListingModel? show_bids = await listingShowBidsMyProjects(1);
						 yield ShowBidsMyProjectsListingLoaded( show_bids: show_bids!,
							   hasReachedMax: false,
							   page: 1 );
					   }

					}

					if (currentState is ShowBidsMyProjectsListingLoaded) {
					  if(isSearch!){
						 ShowBidsListingModel? show_bids = await listingSearchRefreshShowBidsMyProjects();
						  yield show_bids?.items.items.isEmpty
						  ? (currentState as ShowBidsMyProjectsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ShowBidsMyProjectsListingLoaded(  show_bids: show_bids! ,
						  hasReachedMax: false,
						  page: 1 );
					  }else{
						  ShowBidsListingModel? show_bids = await listingRefreshShowBidsMyProjects();
						  yield show_bids?.items.items.isEmpty
						  ? (currentState as ShowBidsMyProjectsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ShowBidsMyProjectsListingLoaded(  show_bids: show_bids! ,
						  hasReachedMax: false,
						  page: 1 );
					  }

					}
			
      } catch (_) {
        yield ShowBidsMyProjectsListingError();
      }

    }
  }

  bool hasReachedMax(ShowBidsMyProjectsState state) =>
      state is ShowBidsMyProjectsListingLoaded && state.hasReachedMax!;

  Future<ShowBidsListingModel?> listingShowBidsMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowBidsMyProjectsListSearch(url!, page!);
  }
    Future<ShowBidsListingModel?> listingRefreshShowBidsMyProjects() async {
    ShowBidsListingModel? show_bids ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_bids  = await apiRepProvider?.getShowBidsMyProjectsListSearch(url!, 1);
    return show_bids;
  }
  Future<ShowBidsListingModel?> listingSearchShowBidsMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowBidsMyProjectsListSearch(url!, page!);
  }

  Future<ShowBidsListingModel?> listingSearchRefreshShowBidsMyProjects() async {
    ShowBidsListingModel? show_bids ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_bids  = await apiRepProvider?.getShowBidsMyProjectsListSearch(url!, 1);
    return show_bids;
  }
  
  
  
}




class ShowThreadMyProjectsListing extends Bloc<ShowThreadMyProjectsEvent, ShowThreadMyProjectsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  ShowThreadMyProjectsListing(this.application, this.url, this.isSearch, ShowThreadMyProjectsState initialState):
  super(initialState){
     on<ShowThreadMyProjectsList>(_ShowThreadMyProjectsListEvent);
	 on<ShowThreadMyProjectsListingRefresh>(_ShowThreadMyProjectsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<ShowThreadMyProjectsEvent, ShowThreadMyProjectsState>> transformEvents(
      Stream<ShowThreadMyProjectsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<ShowThreadMyProjectsEvent> transform<ShowThreadMyProjectsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<ShowThreadMyProjectsEvent, ShowThreadMyProjectsState> transition) {
    print(transition);
  }

  @override
  get initialState => ShowThreadMyProjectsListingUninitialized();
  
  
  void _ShowThreadMyProjectsListEvent(ShowThreadMyProjectsList event, Emitter<ShowThreadMyProjectsState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
			 					if (currentState is ShowThreadMyProjectsListingUninitialized){
						  if(isSearch!){
							 ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									return emit ( show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage ));
                                  }else if(show_thread?.tools.paging.total_pages > 1) {
								    if(show_thread?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
											show_thread1?.items.items.addAll(show_thread?.items.items);
											var deltaPage = show_thread1?.tools.paging.total_pages - 1;
											return emit (  show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
												hasReachedMax: false,
												page: deltaPage ));
									  }else{
									
									       ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									      show_thread1?.items.items.addAll(show_thread?.items.items);
									      ShowThreadListingModel? show_thread2 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 2);
											show_thread2?.items.items.addAll(show_thread1?.items.items);
											var deltaPage = show_thread2?.tools.paging.total_pages - 2;
											return emit ( show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread2! ,
												hasReachedMax: false,
												page: deltaPage ));
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  return emit (  ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
						  }else{
							  ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(1);
							  int deltaPage = show_thread?.items.items.length ~/ (show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							        if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
								//	print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									return emit ( show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage ));

								  }else{
									var deltaPage = show_thread?.tools.paging.total_pages;


									return emit (  show_thread?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread! ,
										hasReachedMax: false,
										page: deltaPage ));
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  return emit (  ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
						  }
					}

					if (currentState is ShowThreadMyProjectsListingLoaded) {
					  //page++;
					  final oldpage = (currentState as ShowThreadMyProjectsListingLoaded).page;
						if(isSearch!){
							  final page = (currentState as ShowThreadMyProjectsListingLoaded).page! - 1;
							  bool max = false;
							  if(oldpage == 1){
							  ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(1);							
							  return emit ( show_thread?.items.items.isEmpty 
								  ? (currentState as ShowThreadMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: 1)                           
								  : ShowThreadMyProjectsListingLoaded(  show_thread:  (currentState as ShowThreadMyProjectsListingLoaded).show_thread! ,
														  hasReachedMax: false,
														  page: 1,));
							  }else{
							    ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(page);
							 
							  if(!show_thread?.items.items.isEmpty){
								 show_thread?.items.items.addAll((currentState as ShowThreadMyProjectsListingLoaded).show_thread?.items.items);
							  }
							  return emit ( show_thread?.items.items.isEmpty 
								  ? (currentState as ShowThreadMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowThreadMyProjectsListingLoaded(  show_thread:  show_thread! ,
														  hasReachedMax: false,
														  page: page,));
							  }
							  
							
						}else{
					  
							  final page = (currentState as ShowThreadMyProjectsListingLoaded).page! - 1;
							  if(oldpage == 1){
								  ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(1);							
								  return emit ( show_thread?.items.items.isEmpty 
									  ? (currentState as ShowThreadMyProjectsListingLoaded).copyWith(hasReachedMax: true,
									  page: 1)                           
									  : ShowThreadMyProjectsListingLoaded(  show_thread:  (currentState as ShowThreadMyProjectsListingLoaded).show_thread! ,
															  hasReachedMax: false,
															  page: 1,));
								  }else{
									ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(page);
								 
								  if(!show_thread?.items.items.isEmpty){
									 show_thread?.items.items.addAll((currentState as ShowThreadMyProjectsListingLoaded).show_thread?.items.items);
								  }
								  return emit ( show_thread?.items.items.isEmpty 
									  ? (currentState as ShowThreadMyProjectsListingLoaded).copyWith(hasReachedMax: true,
									  page: page)                           
									  : ShowThreadMyProjectsListingLoaded(  show_thread:  show_thread! ,
															  hasReachedMax: false,
															  page: page,));
								  }
						}	  
					}
      } catch (_) {
        return emit ( ShowThreadMyProjectsListingError());
      }
    }
  }
  
  void _ShowThreadMyProjectsListingRefreshEvent(ShowThreadMyProjectsListingRefresh event, Emitter<ShowThreadMyProjectsState> emit)async{
  final currentState = state;
   try {
			       if (currentState is ShowThreadMyProjectsListingUninitialized) {
					   if(isSearch!){
						  ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								   if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									return emit ( show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage ));
                                  }else if(show_thread?.tools.paging.total_pages > 1) {
								    if(show_thread?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
											show_thread1?.items.items.addAll(show_thread?.items.items);
											var deltaPage = show_thread1?.tools.paging.total_pages - 1;
											return emit (  show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
												hasReachedMax: false,
												page: deltaPage ));
									  }else{
									
									       ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									      show_thread1?.items.items.addAll(show_thread?.items.items);
									      ShowThreadListingModel? show_thread2 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 2);
											show_thread2?.items.items.addAll(show_thread1?.items.items);
											var deltaPage = show_thread2?.tools.paging.total_pages - 2;
											return emit (  show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread2! ,
												hasReachedMax: false,
												page: deltaPage ));
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  return emit ( ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					   }else{
						 ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									return emit ( show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage ));

								  }else{
									var deltaPage = show_thread?.tools.paging.total_pages;


									return emit ( show_thread?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread! ,
										hasReachedMax: false,
										page: deltaPage ));
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  return emit ( ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					   }

					}

					if (currentState is ShowThreadMyProjectsListingLoaded) {
					  if(isSearch!){
						
						  ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								    if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									return emit ( show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage ));
                                  }else if(show_thread?.tools.paging.total_pages > 1) {
								    if(show_thread?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
											show_thread1?.items.items.addAll(show_thread?.items.items);
											var deltaPage = show_thread1?.tools.paging.total_pages - 1;
											return emit ( show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
												hasReachedMax: false,
												page: deltaPage ));
									  }else{
									
									       ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									      show_thread1?.items.items.addAll(show_thread?.items.items);
									      ShowThreadListingModel? show_thread2 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 2);
											show_thread2?.items.items.addAll(show_thread1?.items.items);
											var deltaPage = show_thread2?.tools.paging.total_pages - 2;
											return emit (  show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread2! ,
												hasReachedMax: false,
												page: deltaPage ));
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  return emit ( ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					  }else{
						   ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									return emit ( show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage ));

								  }else{
									var deltaPage = show_thread?.tools.paging.total_pages;


									return emit ( show_thread?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread! ,
										hasReachedMax: false,
										page: deltaPage ));
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  return emit (  ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					  }

					}
			  
      } catch (_) {
        return emit ( ShowThreadMyProjectsListingError());
      }

  }

  @override

  Stream<ShowThreadMyProjectsState> mapEventToState(ShowThreadMyProjectsEvent event) async* {
  final currentState = state;
    if (event is ShowThreadMyProjectsList && !hasReachedMax(currentState)) {
      try {
			 					if (currentState is ShowThreadMyProjectsListingUninitialized){
						  if(isSearch!){
							 ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									yield show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage );
                                  }else if(show_thread?.tools.paging.total_pages > 1) {
								    if(show_thread?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
											show_thread1?.items.items.addAll(show_thread?.items.items);
											var deltaPage = show_thread1?.tools.paging.total_pages - 1;
											yield show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
												hasReachedMax: false,
												page: deltaPage );
									  }else{
									
									       ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									      show_thread1?.items.items.addAll(show_thread?.items.items);
									      ShowThreadListingModel? show_thread2 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 2);
											show_thread2?.items.items.addAll(show_thread1?.items.items);
											var deltaPage = show_thread2?.tools.paging.total_pages - 2;
											yield show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread2! ,
												hasReachedMax: false,
												page: deltaPage );
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  yield ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
						  }else{
							  ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(1);
							  int deltaPage = show_thread?.items.items.length ~/ (show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							        if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
								//	print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									yield show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage );

								  }else{
									var deltaPage = show_thread?.tools.paging.total_pages;


									yield show_thread?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread! ,
										hasReachedMax: false,
										page: deltaPage );
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  yield ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
						  }
					}

					if (currentState is ShowThreadMyProjectsListingLoaded) {
					  //page++;
					  final oldpage = (currentState as ShowThreadMyProjectsListingLoaded).page;
						if(isSearch!){
							  final page = (currentState as ShowThreadMyProjectsListingLoaded).page! - 1;
							  bool max = false;
							  if(oldpage == 1){
							  ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(1);							
							  yield show_thread?.items.items.isEmpty 
								  ? (currentState as ShowThreadMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: 1)                           
								  : ShowThreadMyProjectsListingLoaded(  show_thread:  (currentState as ShowThreadMyProjectsListingLoaded).show_thread! ,
														  hasReachedMax: false,
														  page: 1,);
							  }else{
							    ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(page);
							 
							  if(!show_thread?.items.items.isEmpty){
								 show_thread?.items.items.addAll((currentState as ShowThreadMyProjectsListingLoaded).show_thread?.items.items);
							  }
							  yield show_thread?.items.items.isEmpty 
								  ? (currentState as ShowThreadMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowThreadMyProjectsListingLoaded(  show_thread:  show_thread! ,
														  hasReachedMax: false,
														  page: page,);
							  }
							  
							
						}else{
					  
							  final page = (currentState as ShowThreadMyProjectsListingLoaded).page! - 1;
							  if(oldpage == 1){
								  ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(1);							
								  yield show_thread?.items.items.isEmpty 
									  ? (currentState as ShowThreadMyProjectsListingLoaded).copyWith(hasReachedMax: true,
									  page: 1)                           
									  : ShowThreadMyProjectsListingLoaded(  show_thread:  (currentState as ShowThreadMyProjectsListingLoaded).show_thread! ,
															  hasReachedMax: false,
															  page: 1,);
								  }else{
									ShowThreadListingModel? show_thread = await listingShowThreadMyProjects(page);
								 
								  if(!show_thread?.items.items.isEmpty){
									 show_thread?.items.items.addAll((currentState as ShowThreadMyProjectsListingLoaded).show_thread?.items.items);
								  }
								  yield show_thread?.items.items.isEmpty 
									  ? (currentState as ShowThreadMyProjectsListingLoaded).copyWith(hasReachedMax: true,
									  page: page)                           
									  : ShowThreadMyProjectsListingLoaded(  show_thread:  show_thread! ,
															  hasReachedMax: false,
															  page: page,);
								  }
						}	  
					}
      } catch (_) {
        yield ShowThreadMyProjectsListingError();
      }
    } else if (event is ShowThreadMyProjectsListingRefresh){
      try {
			       if (currentState is ShowThreadMyProjectsListingUninitialized) {
					   if(isSearch!){
						  ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								   if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									yield show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage );
                                  }else if(show_thread?.tools.paging.total_pages > 1) {
								    if(show_thread?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
											show_thread1?.items.items.addAll(show_thread?.items.items);
											var deltaPage = show_thread1?.tools.paging.total_pages - 1;
											yield show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
												hasReachedMax: false,
												page: deltaPage );
									  }else{
									
									       ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									      show_thread1?.items.items.addAll(show_thread?.items.items);
									      ShowThreadListingModel? show_thread2 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 2);
											show_thread2?.items.items.addAll(show_thread1?.items.items);
											var deltaPage = show_thread2?.tools.paging.total_pages - 2;
											yield show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread2! ,
												hasReachedMax: false,
												page: deltaPage );
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  yield ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					   }else{
						 ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									yield show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage );

								  }else{
									var deltaPage = show_thread?.tools.paging.total_pages;


									yield show_thread?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread! ,
										hasReachedMax: false,
										page: deltaPage );
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  yield ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					   }

					}

					if (currentState is ShowThreadMyProjectsListingLoaded) {
					  if(isSearch!){
						
						  ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								    if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									yield show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage );
                                  }else if(show_thread?.tools.paging.total_pages > 1) {
								    if(show_thread?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
											show_thread1?.items.items.addAll(show_thread?.items.items);
											var deltaPage = show_thread1?.tools.paging.total_pages - 1;
											yield show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
												hasReachedMax: false,
												page: deltaPage );
									  }else{
									
									       ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									      show_thread1?.items.items.addAll(show_thread?.items.items);
									      ShowThreadListingModel? show_thread2 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 2);
											show_thread2?.items.items.addAll(show_thread1?.items.items);
											var deltaPage = show_thread2?.tools.paging.total_pages - 2;
											yield show_thread1?.items.items.isEmpty
												? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread2! ,
												hasReachedMax: false,
												page: deltaPage );
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  yield ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					  }else{
						   ShowThreadListingModel? show_thread = await listingSearchShowThreadMyProjects(-1);
							  int deltaPage;
							  
							  if(show_thread?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_thread?.items.items.length ~/(show_thread?.tools.paging.total_rows/show_thread?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_thread?.tools.paging.total_pages != 1){
								  if(show_thread?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowThreadListingModel? show_thread1 = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages - 1);
									show_thread1?.items.items.addAll(show_thread?.items.items);
									var deltaPage = show_thread1?.tools.paging.total_pages - 1;
									yield show_thread1?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread1! ,
										hasReachedMax: false,
										page: deltaPage );

								  }else{
									var deltaPage = show_thread?.tools.paging.total_pages;


									yield show_thread?.items.items.isEmpty
										? (currentState as ShowThreadMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowThreadMyProjectsListingLoaded(  show_thread: show_thread! ,
										hasReachedMax: false,
										page: deltaPage );
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_thread?.tools.paging.total_pages > 1){
									// show_thread = await listingSearchShowThreadMyProjects(show_thread?.tools.paging.total_pages);
									deltaPage = show_thread?.tools.paging.total_pages;
								  }
								  yield ShowThreadMyProjectsListingLoaded(show_thread: show_thread!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					  }

					}
			  
      } catch (_) {
        yield ShowThreadMyProjectsListingError();
      }

    }
  }

  bool hasReachedMax(ShowThreadMyProjectsState state) =>
      state is ShowThreadMyProjectsListingLoaded && state.hasReachedMax!;

  Future<ShowThreadListingModel?> listingShowThreadMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowThreadMyProjectsListSearch(url!, page!);
  }
  Future<ShowThreadListingModel?> listingRefreshShowThreadMyProjects(int? page) async {
    ShowThreadListingModel? show_thread;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_thread  = await apiRepProvider?.getShowThreadMyProjectsListSearch(url!, page!);
    return show_thread;
  }
  Future<ShowThreadListingModel?> listingSearchShowThreadMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowThreadMyProjectsListSearch(url!, page!);
  }

  Future<ShowThreadListingModel?> listingSearchRefreshShowThreadMyProjects() async {
    ShowThreadListingModel? show_thread ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_thread  = await apiRepProvider?.getShowThreadMyProjectsListSearch(url!, 1);
    return show_thread;
  }
  
  
  
}




class ShowFilesMyProjectsListing extends Bloc<ShowFilesMyProjectsEvent, ShowFilesMyProjectsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  ShowFilesMyProjectsListing(this.application, this.url, this.isSearch, ShowFilesMyProjectsState initialState):
  super(initialState){
     on<ShowFilesMyProjectsList>(_ShowFilesMyProjectsListEvent);
	 on<ShowFilesMyProjectsListingRefresh>(_ShowFilesMyProjectsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<ShowFilesMyProjectsEvent, ShowFilesMyProjectsState>> transformEvents(
      Stream<ShowFilesMyProjectsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<ShowFilesMyProjectsEvent> transform<ShowFilesMyProjectsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<ShowFilesMyProjectsEvent, ShowFilesMyProjectsState> transition) {
    print(transition);
  }

  @override
  get initialState => ShowFilesMyProjectsListingUninitialized();
  
  
  void _ShowFilesMyProjectsListEvent(ShowFilesMyProjectsList event, Emitter<ShowFilesMyProjectsState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
					if (currentState is ShowFilesMyProjectsListingUninitialized){
						  if(isSearch!){
							 ShowFilesListingModel? show_files = await listingSearchShowFilesMyProjects(-1);
							  int deltaPage;
							  
							  if(show_files?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_files?.items.items.length ~/(show_files?.tools.paging.total_rows/show_files?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( show_files?.items.items.isEmpty ?
							  ShowFilesMyProjectsListingLoaded(show_files: show_files!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : ShowFilesMyProjectsListingLoaded(show_files: show_files!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }else{
							  ShowFilesListingModel? show_files = await listingShowFilesMyProjects(1);
							  int deltaPage = show_files?.items.items.length ~/ (show_files?.tools.paging.total_rows/show_files?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( ShowFilesMyProjectsListingLoaded(show_files: show_files!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }
					}

					if (currentState is ShowFilesMyProjectsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as ShowFilesMyProjectsListingLoaded).page! + 1;
							  bool max = false;
							  ShowFilesListingModel? show_files = await listingShowFilesMyProjects(page);
							  if(show_files?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!show_files?.items.items.isEmpty && !max){
								 (currentState as ShowFilesMyProjectsListingLoaded).show_files?.items.items.addAll(show_files?.items.items);
							  }
							  return emit ( show_files?.items.items.isEmpty || max
								  ? (currentState as ShowFilesMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowFilesMyProjectsListingLoaded(  show_files:  (currentState as ShowFilesMyProjectsListingLoaded).show_files! ,
														  hasReachedMax: false,
														  page: page,));
						}else{
					  
							  final page = (currentState as ShowFilesMyProjectsListingLoaded).page! + 1;
							  ShowFilesListingModel? show_files = await listingShowFilesMyProjects(page);
							  return emit ( show_files?.items.items.isEmpty
								  ? (currentState as ShowFilesMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ShowFilesMyProjectsListingLoaded(  show_files:  show_files! ,
														  hasReachedMax: false,
														  page: page,));
						}	  
					}
					
      } catch (_) {
        return emit ( ShowFilesMyProjectsListingError());
      }
    }
  }
  
  void _ShowFilesMyProjectsListingRefreshEvent(ShowFilesMyProjectsListingRefresh event, Emitter<ShowFilesMyProjectsState> emit)async{
  final currentState = state;
   try {
					if (currentState is ShowFilesMyProjectsListingUninitialized) {
					   if(isSearch!){
						  ShowFilesListingModel? show_files = await listingSearchShowFilesMyProjects(1);
						  return emit (  ShowFilesMyProjectsListingLoaded( show_files: show_files!,
							   hasReachedMax: false,
							   page: 1 ));
					   }else{
						 ShowFilesListingModel? show_files = await listingShowFilesMyProjects(1);
						 return emit ( ShowFilesMyProjectsListingLoaded( show_files: show_files!,
							   hasReachedMax: false,
							   page: 1 ));
					   }

					}

					if (currentState is ShowFilesMyProjectsListingLoaded) {
					  if(isSearch!){
						 ShowFilesListingModel? show_files = await listingSearchRefreshShowFilesMyProjects();
						  return emit (  show_files?.items.items.isEmpty
						  ? (currentState as ShowFilesMyProjectsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ShowFilesMyProjectsListingLoaded(  show_files: show_files! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }else{
						  ShowFilesListingModel? show_files = await listingRefreshShowFilesMyProjects();
						  return emit (  show_files?.items.items.isEmpty
						  ? (currentState as ShowFilesMyProjectsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ShowFilesMyProjectsListingLoaded(  show_files: show_files! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }

					}
			
      } catch (_) {
        return emit ( ShowFilesMyProjectsListingError());
      }

  }

  @override

  Stream<ShowFilesMyProjectsState> mapEventToState(ShowFilesMyProjectsEvent event) async* {
  final currentState = state;
    if (event is ShowFilesMyProjectsList && !hasReachedMax(currentState)) {
      try {
					if (currentState is ShowFilesMyProjectsListingUninitialized){
						  if(isSearch!){
							 ShowFilesListingModel? show_files = await listingSearchShowFilesMyProjects(-1);
							  int deltaPage;
							  
							  if(show_files?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_files?.items.items.length ~/(show_files?.tools.paging.total_rows/show_files?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield show_files?.items.items.isEmpty ?
							  ShowFilesMyProjectsListingLoaded(show_files: show_files!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : ShowFilesMyProjectsListingLoaded(show_files: show_files!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }else{
							  ShowFilesListingModel? show_files = await listingShowFilesMyProjects(1);
							  int deltaPage = show_files?.items.items.length ~/ (show_files?.tools.paging.total_rows/show_files?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield ShowFilesMyProjectsListingLoaded(show_files: show_files!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }
					}

					if (currentState is ShowFilesMyProjectsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as ShowFilesMyProjectsListingLoaded).page! + 1;
							  bool max = false;
							  ShowFilesListingModel? show_files = await listingShowFilesMyProjects(page);
							  if(show_files?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!show_files?.items.items.isEmpty && !max){
								 (currentState as ShowFilesMyProjectsListingLoaded).show_files?.items.items.addAll(show_files?.items.items);
							  }
							  yield show_files?.items.items.isEmpty || max
								  ? (currentState as ShowFilesMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowFilesMyProjectsListingLoaded(  show_files:  (currentState as ShowFilesMyProjectsListingLoaded).show_files! ,
														  hasReachedMax: false,
														  page: page,);
						}else{
					  
							  final page = (currentState as ShowFilesMyProjectsListingLoaded).page! + 1;
							  ShowFilesListingModel? show_files = await listingShowFilesMyProjects(page);
							  yield show_files?.items.items.isEmpty
								  ? (currentState as ShowFilesMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ShowFilesMyProjectsListingLoaded(  show_files:  show_files! ,
														  hasReachedMax: false,
														  page: page,);
						}	  
					}
					
      } catch (_) {
        yield ShowFilesMyProjectsListingError();
      }
    } else if (event is ShowFilesMyProjectsListingRefresh){
      try {
					if (currentState is ShowFilesMyProjectsListingUninitialized) {
					   if(isSearch!){
						  ShowFilesListingModel? show_files = await listingSearchShowFilesMyProjects(1);
						  yield ShowFilesMyProjectsListingLoaded( show_files: show_files!,
							   hasReachedMax: false,
							   page: 1 );
					   }else{
						 ShowFilesListingModel? show_files = await listingShowFilesMyProjects(1);
						 yield ShowFilesMyProjectsListingLoaded( show_files: show_files!,
							   hasReachedMax: false,
							   page: 1 );
					   }

					}

					if (currentState is ShowFilesMyProjectsListingLoaded) {
					  if(isSearch!){
						 ShowFilesListingModel? show_files = await listingSearchRefreshShowFilesMyProjects();
						  yield show_files?.items.items.isEmpty
						  ? (currentState as ShowFilesMyProjectsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ShowFilesMyProjectsListingLoaded(  show_files: show_files! ,
						  hasReachedMax: false,
						  page: 1 );
					  }else{
						  ShowFilesListingModel? show_files = await listingRefreshShowFilesMyProjects();
						  yield show_files?.items.items.isEmpty
						  ? (currentState as ShowFilesMyProjectsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ShowFilesMyProjectsListingLoaded(  show_files: show_files! ,
						  hasReachedMax: false,
						  page: 1 );
					  }

					}
			
      } catch (_) {
        yield ShowFilesMyProjectsListingError();
      }

    }
  }

  bool hasReachedMax(ShowFilesMyProjectsState state) =>
      state is ShowFilesMyProjectsListingLoaded && state.hasReachedMax!;

  Future<ShowFilesListingModel?> listingShowFilesMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowFilesMyProjectsListSearch(url!, page!);
  }
    Future<ShowFilesListingModel?> listingRefreshShowFilesMyProjects() async {
    ShowFilesListingModel? show_files ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_files  = await apiRepProvider?.getShowFilesMyProjectsListSearch(url!, 1);
    return show_files;
  }
  Future<ShowFilesListingModel?> listingSearchShowFilesMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowFilesMyProjectsListSearch(url!, page!);
  }

  Future<ShowFilesListingModel?> listingSearchRefreshShowFilesMyProjects() async {
    ShowFilesListingModel? show_files ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_files  = await apiRepProvider?.getShowFilesMyProjectsListSearch(url!, 1);
    return show_files;
  }
  
  
  
}




class ShowConversationMyProjectsListing extends Bloc<ShowConversationMyProjectsEvent, ShowConversationMyProjectsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  ShowConversationMyProjectsListing(this.application, this.url, this.isSearch, ShowConversationMyProjectsState initialState):
  super(initialState){
     on<ShowConversationMyProjectsList>(_ShowConversationMyProjectsListEvent);
	 on<ShowConversationMyProjectsListingRefresh>(_ShowConversationMyProjectsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<ShowConversationMyProjectsEvent, ShowConversationMyProjectsState>> transformEvents(
      Stream<ShowConversationMyProjectsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<ShowConversationMyProjectsEvent> transform<ShowConversationMyProjectsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<ShowConversationMyProjectsEvent, ShowConversationMyProjectsState> transition) {
    print(transition);
  }

  @override
  get initialState => ShowConversationMyProjectsListingUninitialized();
  
  
  void _ShowConversationMyProjectsListEvent(ShowConversationMyProjectsList event, Emitter<ShowConversationMyProjectsState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
			 					if (currentState is ShowConversationMyProjectsListingUninitialized){
						  if(isSearch!){
							 ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											return emit (  show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage ));
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											return emit ( show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage ));
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit (  ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
						  }else{
							  ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(1);
							  int deltaPage = show_conversation?.items.items.length ~/ (show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							        if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
								//	print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									return emit (  show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage ));
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit (  ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
						  }
					}

					if (currentState is ShowConversationMyProjectsListingLoaded) {
					  //page++;
					  final oldpage = (currentState as ShowConversationMyProjectsListingLoaded).page;
						if(isSearch!){
							  final page = (currentState as ShowConversationMyProjectsListingLoaded).page! - 1;
							  bool max = false;
							  if(oldpage == 1){
							  ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(1);							
							  return emit ( show_conversation?.items.items.isEmpty 
								  ? (currentState as ShowConversationMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: 1)                           
								  : ShowConversationMyProjectsListingLoaded(  show_conversation:  (currentState as ShowConversationMyProjectsListingLoaded).show_conversation! ,
														  hasReachedMax: false,
														  page: 1,));
							  }else{
							    ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(page);
							 
							  if(!show_conversation?.items.items.isEmpty){
								 show_conversation?.items.items.addAll((currentState as ShowConversationMyProjectsListingLoaded).show_conversation?.items.items);
							  }
							  return emit ( show_conversation?.items.items.isEmpty 
								  ? (currentState as ShowConversationMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowConversationMyProjectsListingLoaded(  show_conversation:  show_conversation! ,
														  hasReachedMax: false,
														  page: page,));
							  }
							  
							
						}else{
					  
							  final page = (currentState as ShowConversationMyProjectsListingLoaded).page! - 1;
							  if(oldpage == 1){
								  ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(1);							
								  return emit ( show_conversation?.items.items.isEmpty 
									  ? (currentState as ShowConversationMyProjectsListingLoaded).copyWith(hasReachedMax: true,
									  page: 1)                           
									  : ShowConversationMyProjectsListingLoaded(  show_conversation:  (currentState as ShowConversationMyProjectsListingLoaded).show_conversation! ,
															  hasReachedMax: false,
															  page: 1,));
								  }else{
									ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(page);
								 
								  if(!show_conversation?.items.items.isEmpty){
									 show_conversation?.items.items.addAll((currentState as ShowConversationMyProjectsListingLoaded).show_conversation?.items.items);
								  }
								  return emit ( show_conversation?.items.items.isEmpty 
									  ? (currentState as ShowConversationMyProjectsListingLoaded).copyWith(hasReachedMax: true,
									  page: page)                           
									  : ShowConversationMyProjectsListingLoaded(  show_conversation:  show_conversation! ,
															  hasReachedMax: false,
															  page: page,));
								  }
						}	  
					}
      } catch (_) {
        return emit ( ShowConversationMyProjectsListingError());
      }
    }
  }
  
  void _ShowConversationMyProjectsListingRefreshEvent(ShowConversationMyProjectsListingRefresh event, Emitter<ShowConversationMyProjectsState> emit)async{
  final currentState = state;
   try {
			       if (currentState is ShowConversationMyProjectsListingUninitialized) {
					   if(isSearch!){
						  ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								   if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											return emit (  show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage ));
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											return emit (  show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage ));
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit ( ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					   }else{
						 ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									return emit ( show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage ));
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit ( ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					   }

					}

					if (currentState is ShowConversationMyProjectsListingLoaded) {
					  if(isSearch!){
						
						  ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								    if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											return emit ( show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage ));
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											return emit (  show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage ));
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit ( ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					  }else{
						   ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									return emit ( show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage ));
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit (  ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					  }

					}
			  
      } catch (_) {
        return emit ( ShowConversationMyProjectsListingError());
      }

  }

  @override

  Stream<ShowConversationMyProjectsState> mapEventToState(ShowConversationMyProjectsEvent event) async* {
  final currentState = state;
    if (event is ShowConversationMyProjectsList && !hasReachedMax(currentState)) {
      try {
			 					if (currentState is ShowConversationMyProjectsListingUninitialized){
						  if(isSearch!){
							 ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage );
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage );
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
						  }else{
							  ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(1);
							  int deltaPage = show_conversation?.items.items.length ~/ (show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							        if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
								//	print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									yield show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage );
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
						  }
					}

					if (currentState is ShowConversationMyProjectsListingLoaded) {
					  //page++;
					  final oldpage = (currentState as ShowConversationMyProjectsListingLoaded).page;
						if(isSearch!){
							  final page = (currentState as ShowConversationMyProjectsListingLoaded).page! - 1;
							  bool max = false;
							  if(oldpage == 1){
							  ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(1);							
							  yield show_conversation?.items.items.isEmpty 
								  ? (currentState as ShowConversationMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: 1)                           
								  : ShowConversationMyProjectsListingLoaded(  show_conversation:  (currentState as ShowConversationMyProjectsListingLoaded).show_conversation! ,
														  hasReachedMax: false,
														  page: 1,);
							  }else{
							    ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(page);
							 
							  if(!show_conversation?.items.items.isEmpty){
								 show_conversation?.items.items.addAll((currentState as ShowConversationMyProjectsListingLoaded).show_conversation?.items.items);
							  }
							  yield show_conversation?.items.items.isEmpty 
								  ? (currentState as ShowConversationMyProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowConversationMyProjectsListingLoaded(  show_conversation:  show_conversation! ,
														  hasReachedMax: false,
														  page: page,);
							  }
							  
							
						}else{
					  
							  final page = (currentState as ShowConversationMyProjectsListingLoaded).page! - 1;
							  if(oldpage == 1){
								  ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(1);							
								  yield show_conversation?.items.items.isEmpty 
									  ? (currentState as ShowConversationMyProjectsListingLoaded).copyWith(hasReachedMax: true,
									  page: 1)                           
									  : ShowConversationMyProjectsListingLoaded(  show_conversation:  (currentState as ShowConversationMyProjectsListingLoaded).show_conversation! ,
															  hasReachedMax: false,
															  page: 1,);
								  }else{
									ShowConversationListingModel? show_conversation = await listingShowConversationMyProjects(page);
								 
								  if(!show_conversation?.items.items.isEmpty){
									 show_conversation?.items.items.addAll((currentState as ShowConversationMyProjectsListingLoaded).show_conversation?.items.items);
								  }
								  yield show_conversation?.items.items.isEmpty 
									  ? (currentState as ShowConversationMyProjectsListingLoaded).copyWith(hasReachedMax: true,
									  page: page)                           
									  : ShowConversationMyProjectsListingLoaded(  show_conversation:  show_conversation! ,
															  hasReachedMax: false,
															  page: page,);
								  }
						}	  
					}
      } catch (_) {
        yield ShowConversationMyProjectsListingError();
      }
    } else if (event is ShowConversationMyProjectsListingRefresh){
      try {
			       if (currentState is ShowConversationMyProjectsListingUninitialized) {
					   if(isSearch!){
						  ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								   if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage );
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage );
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					   }else{
						 ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									yield show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage );
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					   }

					}

					if (currentState is ShowConversationMyProjectsListingLoaded) {
					  if(isSearch!){
						
						  ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								    if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage );
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage );
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					  }else{
						   ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyProjects(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									yield show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyProjectsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyProjectsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage );
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyProjects(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyProjectsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					  }

					}
			  
      } catch (_) {
        yield ShowConversationMyProjectsListingError();
      }

    }
  }

  bool hasReachedMax(ShowConversationMyProjectsState state) =>
      state is ShowConversationMyProjectsListingLoaded && state.hasReachedMax!;

  Future<ShowConversationListingModel?> listingShowConversationMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowConversationMyProjectsListSearch(url!, page!);
  }
  Future<ShowConversationListingModel?> listingRefreshShowConversationMyProjects(int? page) async {
    ShowConversationListingModel? show_conversation;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_conversation  = await apiRepProvider?.getShowConversationMyProjectsListSearch(url!, page!);
    return show_conversation;
  }
  Future<ShowConversationListingModel?> listingSearchShowConversationMyProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowConversationMyProjectsListSearch(url!, page!);
  }

  Future<ShowConversationListingModel?> listingSearchRefreshShowConversationMyProjects() async {
    ShowConversationListingModel? show_conversation ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_conversation  = await apiRepProvider?.getShowConversationMyProjectsListSearch(url!, 1);
    return show_conversation;
  }
  
  
  
}




