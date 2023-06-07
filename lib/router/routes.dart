
import 'package:flutter/material.dart' hide Router;
import 'package:fluro/fluro.dart';
import 'package:projectscoid/router/route_handlers.dart';
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:projectscoid/app/signin.dart';
import 'package:projectscoid/app/root.dart';
import 'package:projectscoid/app/splashpage.dart';
import 'package:projectscoid/app/intro.dart';
import 'package:projectscoid/app/register.dart';
import 'package:projectscoid/app/setting.dart';


class Routes {

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String?>?> params) {
          print("ROUTE WAS NOT FOUND !!!");
        });
    router.define(Root.PATH, handler: rootHandler);
    router.define(Login.PATH, handler: loginHandler);
    router.define(Setting.PATH, handler: settingHandler);
    router.define(SplashPage.PATH, handler: splashHandler);
    router.define(IntroScreen.PATH, handler: introHandler);

    router.define(Register.PATH, handler: registerHandler);

    router.define(Projectscoid.PATH, handler: puProjectscoidHandler);
	router.define(UserHomeView.PATH, handler:viewHomeUser);
	router.define(PublicHomeView.PATH, handler: viewHomePublic);
	router.define(UserHomeListing.PATH, handler: listingHomeUser);
	router.define(PublicPageView.PATH, handler:viewPagePublic);
	
	
	//--------------------------------------------------------------
	router.define(MyProductsScreenshotsAddImage.PATH, handler: MyProductsScreenshotsAddImageUser);
	//--------------------------------------------------------------
		router.define(MyProjectsShortlistedBidsAcceptBid.PATH, handler: MyProjectsShortlistedBidsAcceptBidUser);
		router.define(MyProjectsShortlistedBidsRemoveFromShortlist.PATH, handler: MyProjectsShortlistedBidsRemoveFromShortlistUser);
		router.define(MyProjectsShortlistedBidsShowConversation.PATH, handler:MyProjectsShortlistedBidsShowConversationUser);
		router.define(MyProjectsShortlistedBidsViewProfile.PATH, handler:MyProjectsShortlistedBidsViewProfileUser);
		router.define(MyProjectsShowBidsAcceptBid.PATH, handler:MyProjectsShowBidsAcceptBidUser);
		router.define(MyProjectsShowBidsAddToShortlist.PATH, handler:MyProjectsShowBidsAddToShortlistUser);
		router.define(MyProjectsShowBidsShowConversation.PATH, handler:MyProjectsShowBidsShowConversationUser);
		router.define(MyProjectsShowBidsViewProfile.PATH, handler:MyProjectsShowBidsViewProfileUser);
		router.define(MyProjectsShowConversationAcceptBid.PATH, handler:MyProjectsShowConversationAcceptBidUser);
		router.define(MyProjectsShowConversationNewReply.PATH, handler:MyProjectsShowConversationNewReplyUser);
		router.define(MyProjectsShowConversationReply.PATH, handler:MyProjectsShowConversationReplyUser);
		router.define(MyProjectsShowConversationShowBids.PATH, handler:MyProjectsShowConversationShowBidsUser);
		router.define(MyProjectsShowThreadAcceptOffer.PATH, handler:MyProjectsShowThreadAcceptOfferUser);
		router.define(MyProjectsShowThreadBroadcastMessage.PATH, handler:MyProjectsShowThreadBroadcastMessageUser);

		router.define(MyProjectsShowThreadCancelArbitration.PATH, handler:MyProjectsShowThreadCancelArbitrationUser);
		router.define(MyProjectsShowThreadFileArbitration.PATH, handler:MyProjectsShowThreadFileArbitrationUser);
		router.define(MyProjectsShowThreadNewOffer.PATH, handler:MyProjectsShowThreadNewOfferUser);
		router.define(MyProjectsShowThreadNewReply.PATH, handler:MyProjectsShowThreadNewReplyUser);
		router.define(MyProjectsShowThreadRateOwner.PATH, handler:MyProjectsShowThreadRateOwnerUser);
		router.define(MyProjectsShowThreadRateWorker.PATH, handler:MyProjectsShowThreadRateWorkerUser);
		router.define(MyProjectsShowThreadReply.PATH, handler:MyProjectsShowThreadReplyUser);

		router.define(MyProjectsShowThreadReportDone.PATH, handler:MyProjectsShowThreadReportDoneUser);
		router.define(MyProjectsShowThreadReportProgress.PATH, handler:MyProjectsShowThreadReportProgressUser);
		router.define(MyProjectsShowThreadRespondArbitration.PATH, handler:MyProjectsShowThreadRespondArbitrationUser);
		router.define(MyProjectsShowThreadWeeklyReport.PATH, handler:MyProjectsShowThreadWeeklyReportUser);


		router.define(BrowseProductsProductCommentsNewReply.PATH, handler:BrowseProductsProductCommentsNewReplyPublic);
		router.define(BrowseServicesServiceCommentsNewReply.PATH, handler:BrowseServicesServiceCommentsNewReplyPublic);


		router.define(CartCartItemsDecrease.PATH, handler:CartCartItemsDecreaseUser);
		router.define(CartCartItemsIncrease.PATH, handler:CartCartItemsIncreaseUser);
		router.define(CartCartItemsRemove.PATH, handler:CartCartItemsRemoveUser);

		router.define(MyBidsShowConversationNewReply.PATH, handler:MyBidsShowConversationNewReplyUser);
		router.define(MyBidsShowConversationPlaceNewBid.PATH, handler:MyBidsShowConversationPlaceNewBidUser);
		router.define(MyBidsShowConversationReply.PATH, handler:MyBidsShowConversationReplyUser);

		router.define(MyProductsCommentsNewReply.PATH, handler:MyProductsCommentsNewReplyPublic);
		router.define(MyProductsScreenshotsAddImage.PATH, handler: MyProductsScreenshotsAddImageUser);
		router.define(MyProductsScreenshotsEditImage.PATH, handler:MyProductsScreenshotsEditImageUser);

		router.define(MyServicesCommentsNewReply.PATH, handler:MyServicesCommentsNewReplyPublic);
		router.define(MyServicesScreenshotsAddImage.PATH, handler:MyServicesScreenshotsAddImageUser);
		router.define(MyServicesScreenshotsEditImage.PATH, handler:MyServicesScreenshotsEditImageUser);

		router.define(MyProfilePortofolioAddPortofolio.PATH, handler:MyProfilePortofolioAddPortofolioUser);
		router.define(MyProfilePortofolioEdit.PATH, handler:MyProfilePortofolioEditUser);




	//--------------------------------------------------------------
	//--------------------------------------------------------------

    router.define(PublicTestEdit.PATH, handler: editTestPublic);
	router.define(PublicTestAdd.PATH, handler: addTestPublic);
    router.define(PublicTestView.PATH, handler:viewTestPublic);
    router.define(PublicTestListing.PATH, handler: listingTestPublic);
    router.define(PublicTestimonialEdit.PATH, handler: editTestimonialPublic);
	router.define(PublicTestimonialAdd.PATH, handler: addTestimonialPublic);
    router.define(PublicTestimonialView.PATH, handler:viewTestimonialPublic);
    router.define(PublicTestimonialListing.PATH, handler: listingTestimonialPublic);
    router.define(PublicCeritaSuksesEdit.PATH, handler: editCeritaSuksesPublic);
	router.define(PublicCeritaSuksesAdd.PATH, handler: addCeritaSuksesPublic);
    router.define(PublicCeritaSuksesView.PATH, handler:viewCeritaSuksesPublic);
    router.define(PublicCeritaSuksesListing.PATH, handler: listingCeritaSuksesPublic);
    router.define(PublicTipsEdit.PATH, handler: editTipsPublic);
	router.define(PublicTipsAdd.PATH, handler: addTipsPublic);
    router.define(PublicTipsView.PATH, handler:viewTipsPublic);
    router.define(PublicTipsListing.PATH, handler: listingTipsPublic);
    router.define(PublicBrowseProjectsEdit.PATH, handler: editBrowseProjectsPublic);
	router.define(PublicBrowseProjectsAdd.PATH, handler: addBrowseProjectsPublic);
    router.define(PublicBrowseProjectsView.PATH, handler:viewBrowseProjectsPublic);
    router.define(PublicBrowseProjectsListing.PATH, handler: listingBrowseProjectsPublic);

	 router.define(PlaceNewBidBrowseProjects.PATH, handler: PlaceNewBidBrowseProjectsHandler);

	 router.define(AskOwnerBrowseProjects.PATH, handler: AskOwnerBrowseProjectsHandler);


	 router.define(GuestCreateProjectBrowseProjects.PATH, handler: GuestCreateProjectBrowseProjectsHandler);

    router.define(PublicPastProjectsEdit.PATH, handler: editPastProjectsPublic);
	router.define(PublicPastProjectsAdd.PATH, handler: addPastProjectsPublic);
    router.define(PublicPastProjectsView.PATH, handler:viewPastProjectsPublic);
    router.define(PublicPastProjectsListing.PATH, handler: listingPastProjectsPublic);
    router.define(PublicNewUserEdit.PATH, handler: editNewUserPublic);
	router.define(PublicNewUserAdd.PATH, handler: addNewUserPublic);
    router.define(PublicNewUserView.PATH, handler:viewNewUserPublic);
    router.define(PublicNewUserListing.PATH, handler: listingNewUserPublic);
	 router.define(RegisterNewUser.PATH, handler: RegisterNewUserHandler);

	 router.define(VerifyNewUser.PATH, handler: VerifyNewUserHandler);

    router.define(PublicProgramEdit.PATH, handler: editProgramPublic);
	router.define(PublicProgramAdd.PATH, handler: addProgramPublic);
    router.define(PublicProgramView.PATH, handler:viewProgramPublic);
    router.define(PublicProgramListing.PATH, handler: listingProgramPublic);
	 router.define(PromoProgram.PATH, handler: PromoProgramHandler);

    router.define(PublicExistingUserEdit.PATH, handler: editExistingUserPublic);
	router.define(PublicExistingUserAdd.PATH, handler: addExistingUserPublic);
    router.define(PublicExistingUserView.PATH, handler:viewExistingUserPublic);
    router.define(PublicExistingUserListing.PATH, handler: listingExistingUserPublic);
	 router.define(ForgotPasswordExistingUser.PATH, handler: ForgotPasswordExistingUserHandler);

	 router.define(ResetPasswordExistingUser.PATH, handler: ResetPasswordExistingUserHandler);

    router.define(PublicSupportEdit.PATH, handler: editSupportPublic);
	router.define(PublicSupportAdd.PATH, handler: addSupportPublic);
    router.define(PublicSupportView.PATH, handler:viewSupportPublic);
    router.define(PublicSupportListing.PATH, handler: listingSupportPublic);
	 router.define(ContactFormSupport.PATH, handler: ContactFormSupportHandler);

    router.define(PublicBrowseServicesEdit.PATH, handler: editBrowseServicesPublic);
	router.define(PublicBrowseServicesAdd.PATH, handler: addBrowseServicesPublic);
    router.define(PublicBrowseServicesView.PATH, handler:viewBrowseServicesPublic);
    router.define(PublicBrowseServicesListing.PATH, handler: listingBrowseServicesPublic);


	 router.define(PlaceOrderBrowseServices.PATH, handler: PlaceOrderBrowseServicesHandler);

    router.define(PublicBrowseUsersEdit.PATH, handler: editBrowseUsersPublic);
	router.define(PublicBrowseUsersAdd.PATH, handler: addBrowseUsersPublic);
    router.define(PublicBrowseUsersView.PATH, handler:viewBrowseUsersPublic);
    router.define(PublicBrowseUsersListing.PATH, handler: listingBrowseUsersPublic);
	 router.define(InviteToBidBrowseUsers.PATH, handler: InviteToBidBrowseUsersHandler);

	 router.define(HireMeBrowseUsers.PATH, handler: HireMeBrowseUsersHandler);


    router.define(PublicBrowseProductsEdit.PATH, handler: editBrowseProductsPublic);
	router.define(PublicBrowseProductsAdd.PATH, handler: addBrowseProductsPublic);
    router.define(PublicBrowseProductsView.PATH, handler:viewBrowseProductsPublic);
    router.define(PublicBrowseProductsListing.PATH, handler: listingBrowseProductsPublic);


	 router.define(AddToCartBrowseProducts.PATH, handler: AddToCartBrowseProductsHandler);

    router.define(UserCartEdit.PATH, handler: editCartUser);
	router.define(UserCartAdd.PATH, handler: addCartUser);
    router.define(UserCartView.PATH, handler:viewCartUser);
    router.define(UserCartListing.PATH, handler: listingCartUser);
	 router.define(EmptyCartCart.PATH, handler: EmptyCartCartHandler);

	 router.define(ApplyCouponCart.PATH, handler: ApplyCouponCartHandler);


    router.define(UserCheckoutEdit.PATH, handler: editCheckoutUser);
	router.define(UserCheckoutAdd.PATH, handler: addCheckoutUser);
    router.define(UserCheckoutView.PATH, handler:viewCheckoutUser);
    router.define(UserCheckoutListing.PATH, handler: listingCheckoutUser);
	 router.define(PayWithAvailableBalanceCheckout.PATH, handler: PayWithAvailableBalanceCheckoutHandler);

	 router.define(PayViaBankTransferCheckout.PATH, handler: PayViaBankTransferCheckoutHandler);

	 router.define(PayWithCreditCardCheckout.PATH, handler: PayWithCreditCardCheckoutHandler);

	 router.define(PayWithCimbClicksCheckout.PATH, handler: PayWithCimbClicksCheckoutHandler);

	 router.define(PayWithBcaKlikpayCheckout.PATH, handler: PayWithBcaKlikpayCheckoutHandler);

	 router.define(PayWithMandiriClickpayCheckout.PATH, handler: PayWithMandiriClickpayCheckoutHandler);

	 router.define(PayWithQrisCheckout.PATH, handler: PayWithQrisCheckoutHandler);

	 router.define(PayWithPaypalCheckout.PATH, handler: PayWithPaypalCheckoutHandler);

    router.define(PublicBlogEdit.PATH, handler: editBlogPublic);
	router.define(PublicBlogAdd.PATH, handler: addBlogPublic);
    router.define(PublicBlogView.PATH, handler:viewBlogPublic);
    router.define(PublicBlogListing.PATH, handler: listingBlogPublic);
    router.define(UserMyProjectsEdit.PATH, handler: editMyProjectsUser);
	router.define(UserMyProjectsAdd.PATH, handler: addMyProjectsUser);
    router.define(UserMyProjectsView.PATH, handler:viewMyProjectsUser);
    router.define(UserMyProjectsListing.PATH, handler: listingMyProjectsUser);
	 router.define(BumpUpMyProjects.PATH, handler: BumpUpMyProjectsHandler);

	 router.define(BroadcastMessageMyProjects.PATH, handler: BroadcastMessageMyProjectsHandler);

	 router.define(ShowBidsMyProjects.PATH, handler: ShowBidsMyProjectsHandler);

	 router.define(ShowThreadMyProjects.PATH, handler: ShowThreadMyProjectsHandler);

	 router.define(ShowFilesMyProjects.PATH, handler: ShowFilesMyProjectsHandler);

	 router.define(ShowConversationMyProjects.PATH, handler: ShowConversationMyProjectsHandler);

	 router.define(CreateProjectMyProjects.PATH, handler: CreateProjectMyProjectsHandler);

	 router.define(EditDraftMyProjects.PATH, handler: EditDraftMyProjectsHandler);

	 router.define(PublishProjectMyProjects.PATH, handler: PublishProjectMyProjectsHandler);

	 router.define(CancelProjectMyProjects.PATH, handler: CancelProjectMyProjectsHandler);

	 router.define(AcceptOrRejectWorkMyProjects.PATH, handler: AcceptOrRejectWorkMyProjectsHandler);

	 router.define(RateWorkerMyProjects.PATH, handler: RateWorkerMyProjectsHandler);

	 router.define(ReportProgressMyProjects.PATH, handler: ReportProgressMyProjectsHandler);

	 router.define(WeeklyReportMyProjects.PATH, handler: WeeklyReportMyProjectsHandler);

	 router.define(ReportDoneMyProjects.PATH, handler: ReportDoneMyProjectsHandler);

	 router.define(RateOwnerMyProjects.PATH, handler: RateOwnerMyProjectsHandler);

	 router.define(FileArbitrationMyProjects.PATH, handler: FileArbitrationMyProjectsHandler);

	 router.define(NewOfferMyProjects.PATH, handler: NewOfferMyProjectsHandler);

	 router.define(AcceptOfferMyProjects.PATH, handler: AcceptOfferMyProjectsHandler);

	 router.define(RespondArbitrationMyProjects.PATH, handler: RespondArbitrationMyProjectsHandler);

	 router.define(CancelArbitrationMyProjects.PATH, handler: CancelArbitrationMyProjectsHandler);

    router.define(UserMyBidsEdit.PATH, handler: editMyBidsUser);
	router.define(UserMyBidsAdd.PATH, handler: addMyBidsUser);
    router.define(UserMyBidsView.PATH, handler:viewMyBidsUser);
    router.define(UserMyBidsListing.PATH, handler: listingMyBidsUser);
	 router.define(ShowConversationMyBids.PATH, handler: ShowConversationMyBidsHandler);


	 router.define(CancelBidMyBids.PATH, handler: CancelBidMyBidsHandler);

    router.define(UserMyProductsEdit.PATH, handler: editMyProductsUser);
	router.define(UserMyProductsAdd.PATH, handler: addMyProductsUser);
    router.define(UserMyProductsView.PATH, handler:viewMyProductsUser);
    router.define(UserMyProductsListing.PATH, handler: listingMyProductsUser);

	 router.define(SalesMyProducts.PATH, handler: SalesMyProductsHandler);

	 router.define(CommentsMyProducts.PATH, handler: CommentsMyProductsHandler);

	 router.define(AddNewProductMyProducts.PATH, handler: AddNewProductMyProductsHandler);

	 router.define(PublishProductMyProducts.PATH, handler: PublishProductMyProductsHandler);

	 router.define(EditProductMyProducts.PATH, handler: EditProductMyProductsHandler);

	 router.define(BumpUpMyProducts.PATH, handler: BumpUpMyProductsHandler);

	 router.define(ScreenshotsMyProducts.PATH, handler: ScreenshotsMyProductsHandler);

	 router.define(UnlistMyProducts.PATH, handler: UnlistMyProductsHandler);

	 router.define(ReactivateProductMyProducts.PATH, handler: ReactivateProductMyProductsHandler);

    router.define(UserMyServicesEdit.PATH, handler: editMyServicesUser);
	router.define(UserMyServicesAdd.PATH, handler: addMyServicesUser);
    router.define(UserMyServicesView.PATH, handler:viewMyServicesUser);
    router.define(UserMyServicesListing.PATH, handler: listingMyServicesUser);

	 router.define(SalesMyServices.PATH, handler: SalesMyServicesHandler);

	 router.define(CommentsMyServices.PATH, handler: CommentsMyServicesHandler);

	 router.define(AddNewServiceMyServices.PATH, handler: AddNewServiceMyServicesHandler);

	 router.define(PublishServiceMyServices.PATH, handler: PublishServiceMyServicesHandler);

	 router.define(BumpUpMyServices.PATH, handler: BumpUpMyServicesHandler);

	 router.define(EditServiceMyServices.PATH, handler: EditServiceMyServicesHandler);

	 router.define(ScreenshotsMyServices.PATH, handler: ScreenshotsMyServicesHandler);

	 router.define(UnlistMyServices.PATH, handler: UnlistMyServicesHandler);

	 router.define(ReactivateServiceMyServices.PATH, handler: ReactivateServiceMyServicesHandler);

    router.define(UserMySalesEdit.PATH, handler: editMySalesUser);
	router.define(UserMySalesAdd.PATH, handler: addMySalesUser);
    router.define(UserMySalesView.PATH, handler:viewMySalesUser);
    router.define(UserMySalesListing.PATH, handler: listingMySalesUser);
      router.define(UserMySalesIndex.PATH, handler: indexMySalesUser);

    router.define(UserMyOrdersEdit.PATH, handler: editMyOrdersUser);
	router.define(UserMyOrdersAdd.PATH, handler: addMyOrdersUser);
    router.define(UserMyOrdersView.PATH, handler:viewMyOrdersUser);
    router.define(UserMyOrdersListing.PATH, handler: listingMyOrdersUser);
      router.define(UserMyOrdersIndex.PATH, handler: indexMyOrdersUser);

	 router.define(ConfirmPaymentMyOrders.PATH, handler: ConfirmPaymentMyOrdersHandler);

    router.define(UserMyPurchasesEdit.PATH, handler: editMyPurchasesUser);
	router.define(UserMyPurchasesAdd.PATH, handler: addMyPurchasesUser);
    router.define(UserMyPurchasesView.PATH, handler:viewMyPurchasesUser);
    router.define(UserMyPurchasesListing.PATH, handler: listingMyPurchasesUser);
      router.define(UserMyPurchasesIndex.PATH, handler: indexMyPurchasesUser);

	 router.define(DownloadMyPurchases.PATH, handler: DownloadMyPurchasesHandler);

	 router.define(RateProductMyPurchases.PATH, handler: RateProductMyPurchasesHandler);

    router.define(UserMyReferalsEdit.PATH, handler: editMyReferalsUser);
	router.define(UserMyReferalsAdd.PATH, handler: addMyReferalsUser);
    router.define(UserMyReferalsView.PATH, handler:viewMyReferalsUser);
    router.define(UserMyReferalsListing.PATH, handler: listingMyReferalsUser);
    router.define(UserMyFinanceEdit.PATH, handler: editMyFinanceUser);
	router.define(UserMyFinanceAdd.PATH, handler: addMyFinanceUser);
    router.define(UserMyFinanceView.PATH, handler:viewMyFinanceUser);
    router.define(UserMyFinanceListing.PATH, handler: listingMyFinanceUser);
	 router.define(ChangePaymentSettingsMyFinance.PATH, handler: ChangePaymentSettingsMyFinanceHandler);

	 router.define(WithdrawPaymentMyFinance.PATH, handler: WithdrawPaymentMyFinanceHandler);

	 router.define(DepositBalanceMyFinance.PATH, handler: DepositBalanceMyFinanceHandler);

    router.define(UserMyPointsEdit.PATH, handler: editMyPointsUser);
	router.define(UserMyPointsAdd.PATH, handler: addMyPointsUser);
    router.define(UserMyPointsView.PATH, handler:viewMyPointsUser);
    router.define(UserMyPointsListing.PATH, handler: listingMyPointsUser);
    router.define(UserMyProfileEdit.PATH, handler: editMyProfileUser);
	router.define(UserMyProfileAdd.PATH, handler: addMyProfileUser);
    router.define(UserMyProfileView.PATH, handler:viewMyProfileUser);
    router.define(UserMyProfileListing.PATH, handler: listingMyProfileUser);

	 router.define(EditProfileMyProfile.PATH, handler: EditProfileMyProfileHandler);

	 router.define(PortofolioMyProfile.PATH, handler: PortofolioMyProfileHandler);

	 router.define(ChangePasswordMyProfile.PATH, handler: ChangePasswordMyProfileHandler);

	 router.define(ChangeEmailMyProfile.PATH, handler: ChangeEmailMyProfileHandler);

	 router.define(ChangeHandphoneMyProfile.PATH, handler: ChangeHandphoneMyProfileHandler);

    router.define(PublicKelurahanEdit.PATH, handler: editKelurahanPublic);
	router.define(PublicKelurahanAdd.PATH, handler: addKelurahanPublic);
    router.define(PublicKelurahanView.PATH, handler:viewKelurahanPublic);
    router.define(PublicKelurahanListing.PATH, handler: listingKelurahanPublic);
    router.define(UserMyBookmarksEdit.PATH, handler: editMyBookmarksUser);
	router.define(UserMyBookmarksAdd.PATH, handler: addMyBookmarksUser);
    router.define(UserMyBookmarksView.PATH, handler:viewMyBookmarksUser);
    router.define(UserMyBookmarksListing.PATH, handler: listingMyBookmarksUser);
    router.define(UserMyBuddiesEdit.PATH, handler: editMyBuddiesUser);
	router.define(UserMyBuddiesAdd.PATH, handler: addMyBuddiesUser);
    router.define(UserMyBuddiesView.PATH, handler:viewMyBuddiesUser);
    router.define(UserMyBuddiesListing.PATH, handler: listingMyBuddiesUser);
	 router.define(RemoveMyBuddies.PATH, handler: RemoveMyBuddiesHandler);


	//--------------------------------------------------------------
		
  }
}






