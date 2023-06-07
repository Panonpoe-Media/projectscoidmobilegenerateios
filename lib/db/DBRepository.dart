
import 'dart:convert';
import 'package:projectscoid/models/model.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:projectscoid/core/components/utility/log/Log.dart';
//non generate import

////////////////////

import 'package:projectscoid/models/BrowseProducts/product_comments_list_item.dart';

import 'package:projectscoid/models/BrowseProducts/product_reviews_list_item.dart';
import 'package:projectscoid/models/BrowseProducts/screenshots_list_item.dart';
import 'package:projectscoid/models/BrowseProjects/user_bids_list_item.dart';
//import 'package:projectscoid/models/BrowseServices/screenshots_list_item.dart';
import 'package:projectscoid/models/BrowseServices/service_comments_list_item.dart';
import 'package:projectscoid/models/BrowseServices/service_reviews_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/as_project_owner_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/as_project_worker_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/portofolio_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/products_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/services_list_item.dart';
import 'package:projectscoid/models/BrowseUsers/user_arbitrations_list_item.dart';
import 'package:projectscoid/models/Cart/cart_items_list_item.dart';
import 'package:projectscoid/models/Checkout/checkout_items_list_item.dart';
//import 'package:projectscoid/models/MyBids/show_conversation_list_item.dart';
import 'package:projectscoid/models/MyFinance/credit_history_list_item.dart';
import 'package:projectscoid/models/MyFinance/payment_history_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_affiliate_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_buyer_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_owner_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_pesta_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_seller_list_item.dart';
import 'package:projectscoid/models/MyPoints/points_worker_list_item.dart';
import 'package:projectscoid/models/MyProducts/comments_list_item.dart';
import 'package:projectscoid/models/MyProducts/sales_list_item.dart';
//import 'package:projectscoid/models/MyProducts/screenshots_list_item.dart';
//import 'package:projectscoid/models/MyProfile/portofolio_list_item.dart';
import 'package:projectscoid/models/MyProjects/shortlisted_bids_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_bids_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_conversation_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_files_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_thread_list_item.dart';
import 'package:projectscoid/models/MyReferals/referals_list_item.dart';
//import 'package:projectscoid/models/MyServices/comments_list_item.dart';
//import 'package:projectscoid/models/MyServices/sales_list_item.dart';
//import 'package:projectscoid/models/MyServices/screenshots_list_item.dart';
//import 'package:projectscoid/models/PastProjects/user_bids_list_item.dart';

////////////////////

part 'package:projectscoid/db/BrowseProducts/product_comments_api.dart';
part 'package:projectscoid/db/BrowseProducts/product_reviews_api.dart';
part 'package:projectscoid/db/BrowseProducts/screenshots_api.dart';
part 'package:projectscoid/db/BrowseProjects/user_bids_api.dart';
part 'package:projectscoid/db/BrowseServices/screenshots_api.dart';
part 'package:projectscoid/db/BrowseServices/service_comments_api.dart';
part 'package:projectscoid/db/BrowseServices/service_reviews_api.dart';
part 'package:projectscoid/db/BrowseUsers/as_project_owner_api.dart';
part 'package:projectscoid/db/BrowseUsers/as_project_worker_api.dart';
part 'package:projectscoid/db/BrowseUsers/portofolio_api.dart';
part 'package:projectscoid/db/BrowseUsers/products_api.dart';
part 'package:projectscoid/db/BrowseUsers/services_api.dart';
part 'package:projectscoid/db/BrowseUsers/user_arbitrations_api.dart';
part 'package:projectscoid/db/Cart/cart_items_api.dart';
part 'package:projectscoid/db/Checkout/checkout_items_api.dart';
part 'package:projectscoid/db/MyBids/show_conversation_api.dart';
part 'package:projectscoid/db/MyFinance/credit_history_api.dart';
part 'package:projectscoid/db/MyFinance/payment_history_api.dart';
part 'package:projectscoid/db/MyPoints/points_affiliate_api.dart';
part 'package:projectscoid/db/MyPoints/points_buyer_api.dart';
part 'package:projectscoid/db/MyPoints/points_owner_api.dart';
part 'package:projectscoid/db/MyPoints/points_pesta_api.dart';
part 'package:projectscoid/db/MyPoints/points_seller_api.dart';
part 'package:projectscoid/db/MyPoints/points_worker_api.dart';
part 'package:projectscoid/db/MyProducts/comments_api.dart';
part 'package:projectscoid/db/MyProducts/sales_api.dart';
part 'package:projectscoid/db/MyProducts/screenshots_api.dart';
part 'package:projectscoid/db/MyProfile/portofolio_api.dart';
part 'package:projectscoid/db/MyProjects/shortlisted_bids_api.dart';
part 'package:projectscoid/db/MyProjects/show_bids_api.dart';
part 'package:projectscoid/db/MyProjects/show_conversation_api.dart';
part 'package:projectscoid/db/MyProjects/show_files_api.dart';
part 'package:projectscoid/db/MyProjects/show_thread_api.dart';
part 'package:projectscoid/db/MyReferals/referals_api.dart';
part 'package:projectscoid/db/MyServices/comments_api.dart';
part 'package:projectscoid/db/MyServices/sales_api.dart';
part 'package:projectscoid/db/MyServices/screenshots_api.dart';
part 'package:projectscoid/db/PastProjects/user_bids_api.dart';




///////////////////
class DBRepository{

  Database? _database;
  static const int TableID_Test = 1;
  static const int TableID_Testimonial = 2;
  static const int TableID_CeritaSukses = 3;
  static const int TableID_Tips = 4;
  static const int TableID_BrowseProjects = 5;
  static const int TableID_PastProjects = 6;
  static const int TableID_NewUser = 7;
  static const int TableID_Program = 8;
  static const int TableID_ExistingUser = 9;
  static const int TableID_Support = 10;
  static const int TableID_BrowseServices = 11;
  static const int TableID_BrowseUsers = 12;
  static const int TableID_BrowseProducts = 13;
  static const int TableID_Cart = 14;
  static const int TableID_Checkout = 15;
  static const int TableID_Blog = 16;
  static const int TableID_MyProjects = 17;
  static const int TableID_MyBids = 18;
  static const int TableID_MyProducts = 19;
  static const int TableID_MyServices = 20;
  static const int TableID_MySales = 21;
  static const int TableID_MyOrders = 22;
  static const int TableID_MyPurchases = 23;
  static const int TableID_MyReferals = 24;
  static const int TableID_MyFinance = 25;
  static const int TableID_MyPoints = 26;
  static const int TableID_MyProfile = 27;
  static const int TableID_Kelurahan = 28;
  static const int TableID_MyBookmarks = 29;
  static const int TableID_MyBuddies = 30;
  
		int TableID_PlaceNewBidBrowseProjects = int.parse('PlaceNewBid'.split("")[0].codeUnits[0].toString() + 'PlaceNewBid'.split("")[1].codeUnits[0].toString() + 'PlaceNewBid'.split("")[2].codeUnits[0].toString() + 'PlaceNewBid'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_AskOwnerBrowseProjects = int.parse('AskOwner'.split("")[0].codeUnits[0].toString() + 'AskOwner'.split("")[1].codeUnits[0].toString() + 'AskOwner'.split("")[2].codeUnits[0].toString() + 'AskOwner'.split("")[3].codeUnits[0].toString()+3.toString());
		int TableID_GuestCreateProjectBrowseProjects = int.parse('GuestCreateProject'.split("")[0].codeUnits[0].toString() + 'GuestCreateProject'.split("")[1].codeUnits[0].toString() + 'GuestCreateProject'.split("")[2].codeUnits[0].toString() + 'GuestCreateProject'.split("")[3].codeUnits[0].toString()+5.toString());
		int TableID_RegisterNewUser = int.parse('Register'.split("")[0].codeUnits[0].toString() + 'Register'.split("")[1].codeUnits[0].toString() + 'Register'.split("")[2].codeUnits[0].toString() + 'Register'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_VerifyNewUser = int.parse('Verify'.split("")[0].codeUnits[0].toString() + 'Verify'.split("")[1].codeUnits[0].toString() + 'Verify'.split("")[2].codeUnits[0].toString() + 'Verify'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_PromoProgram = int.parse('Promo'.split("")[0].codeUnits[0].toString() + 'Promo'.split("")[1].codeUnits[0].toString() + 'Promo'.split("")[2].codeUnits[0].toString() + 'Promo'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_ForgotPasswordExistingUser = int.parse('ForgotPassword'.split("")[0].codeUnits[0].toString() + 'ForgotPassword'.split("")[1].codeUnits[0].toString() + 'ForgotPassword'.split("")[2].codeUnits[0].toString() + 'ForgotPassword'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_ResetPasswordExistingUser = int.parse('ResetPassword'.split("")[0].codeUnits[0].toString() + 'ResetPassword'.split("")[1].codeUnits[0].toString() + 'ResetPassword'.split("")[2].codeUnits[0].toString() + 'ResetPassword'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_ContactFormSupport = int.parse('ContactForm'.split("")[0].codeUnits[0].toString() + 'ContactForm'.split("")[1].codeUnits[0].toString() + 'ContactForm'.split("")[2].codeUnits[0].toString() + 'ContactForm'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_PlaceOrderBrowseServices = int.parse('PlaceOrder'.split("")[0].codeUnits[0].toString() + 'PlaceOrder'.split("")[1].codeUnits[0].toString() + 'PlaceOrder'.split("")[2].codeUnits[0].toString() + 'PlaceOrder'.split("")[3].codeUnits[0].toString()+3.toString());
		int TableID_InviteToBidBrowseUsers = int.parse('InviteToBid'.split("")[0].codeUnits[0].toString() + 'InviteToBid'.split("")[1].codeUnits[0].toString() + 'InviteToBid'.split("")[2].codeUnits[0].toString() + 'InviteToBid'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_HireMeBrowseUsers = int.parse('HireMe'.split("")[0].codeUnits[0].toString() + 'HireMe'.split("")[1].codeUnits[0].toString() + 'HireMe'.split("")[2].codeUnits[0].toString() + 'HireMe'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_AddToCartBrowseProducts = int.parse('AddToCart'.split("")[0].codeUnits[0].toString() + 'AddToCart'.split("")[1].codeUnits[0].toString() + 'AddToCart'.split("")[2].codeUnits[0].toString() + 'AddToCart'.split("")[3].codeUnits[0].toString()+3.toString());
		int TableID_EmptyCartCart = int.parse('EmptyCart'.split("")[0].codeUnits[0].toString() + 'EmptyCart'.split("")[1].codeUnits[0].toString() + 'EmptyCart'.split("")[2].codeUnits[0].toString() + 'EmptyCart'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_ApplyCouponCart = int.parse('ApplyCoupon'.split("")[0].codeUnits[0].toString() + 'ApplyCoupon'.split("")[1].codeUnits[0].toString() + 'ApplyCoupon'.split("")[2].codeUnits[0].toString() + 'ApplyCoupon'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_PayWithAvailableBalanceCheckout = int.parse('PayWithAvailableBalance'.split("")[0].codeUnits[0].toString() + 'PayWithAvailableBalance'.split("")[1].codeUnits[0].toString() + 'PayWithAvailableBalance'.split("")[2].codeUnits[0].toString() + 'PayWithAvailableBalance'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_PayViaBankTransferCheckout = int.parse('PayViaBankTransfer'.split("")[0].codeUnits[0].toString() + 'PayViaBankTransfer'.split("")[1].codeUnits[0].toString() + 'PayViaBankTransfer'.split("")[2].codeUnits[0].toString() + 'PayViaBankTransfer'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_PayWithCreditCardCheckout = int.parse('PayWithCreditCard'.split("")[0].codeUnits[0].toString() + 'PayWithCreditCard'.split("")[1].codeUnits[0].toString() + 'PayWithCreditCard'.split("")[2].codeUnits[0].toString() + 'PayWithCreditCard'.split("")[3].codeUnits[0].toString()+3.toString());
		int TableID_PayWithCimbClicksCheckout = int.parse('PayWithCimbClicks'.split("")[0].codeUnits[0].toString() + 'PayWithCimbClicks'.split("")[1].codeUnits[0].toString() + 'PayWithCimbClicks'.split("")[2].codeUnits[0].toString() + 'PayWithCimbClicks'.split("")[3].codeUnits[0].toString()+4.toString());
		int TableID_PayWithBcaKlikpayCheckout = int.parse('PayWithBcaKlikpay'.split("")[0].codeUnits[0].toString() + 'PayWithBcaKlikpay'.split("")[1].codeUnits[0].toString() + 'PayWithBcaKlikpay'.split("")[2].codeUnits[0].toString() + 'PayWithBcaKlikpay'.split("")[3].codeUnits[0].toString()+5.toString());
		int TableID_PayWithMandiriClickpayCheckout = int.parse('PayWithMandiriClickpay'.split("")[0].codeUnits[0].toString() + 'PayWithMandiriClickpay'.split("")[1].codeUnits[0].toString() + 'PayWithMandiriClickpay'.split("")[2].codeUnits[0].toString() + 'PayWithMandiriClickpay'.split("")[3].codeUnits[0].toString()+6.toString());
		int TableID_PayWithQrisCheckout = int.parse('PayWithQris'.split("")[0].codeUnits[0].toString() + 'PayWithQris'.split("")[1].codeUnits[0].toString() + 'PayWithQris'.split("")[2].codeUnits[0].toString() + 'PayWithQris'.split("")[3].codeUnits[0].toString()+7.toString());
		int TableID_PayWithPaypalCheckout = int.parse('PayWithPaypal'.split("")[0].codeUnits[0].toString() + 'PayWithPaypal'.split("")[1].codeUnits[0].toString() + 'PayWithPaypal'.split("")[2].codeUnits[0].toString() + 'PayWithPaypal'.split("")[3].codeUnits[0].toString()+8.toString());
		int TableID_BumpUpMyProjects = int.parse('BumpUp'.split("")[0].codeUnits[0].toString() + 'BumpUp'.split("")[1].codeUnits[0].toString() + 'BumpUp'.split("")[2].codeUnits[0].toString() + 'BumpUp'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_BroadcastMessageMyProjects = int.parse('BroadcastMessage'.split("")[0].codeUnits[0].toString() + 'BroadcastMessage'.split("")[1].codeUnits[0].toString() + 'BroadcastMessage'.split("")[2].codeUnits[0].toString() + 'BroadcastMessage'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_CreateProjectMyProjects = int.parse('CreateProject'.split("")[0].codeUnits[0].toString() + 'CreateProject'.split("")[1].codeUnits[0].toString() + 'CreateProject'.split("")[2].codeUnits[0].toString() + 'CreateProject'.split("")[3].codeUnits[0].toString()+7.toString());
		int TableID_EditDraftMyProjects = int.parse('EditDraft'.split("")[0].codeUnits[0].toString() + 'EditDraft'.split("")[1].codeUnits[0].toString() + 'EditDraft'.split("")[2].codeUnits[0].toString() + 'EditDraft'.split("")[3].codeUnits[0].toString()+8.toString());
		int TableID_PublishProjectMyProjects = int.parse('PublishProject'.split("")[0].codeUnits[0].toString() + 'PublishProject'.split("")[1].codeUnits[0].toString() + 'PublishProject'.split("")[2].codeUnits[0].toString() + 'PublishProject'.split("")[3].codeUnits[0].toString()+9.toString());
		int TableID_CancelProjectMyProjects = int.parse('CancelProject'.split("")[0].codeUnits[0].toString() + 'CancelProject'.split("")[1].codeUnits[0].toString() + 'CancelProject'.split("")[2].codeUnits[0].toString() + 'CancelProject'.split("")[3].codeUnits[0].toString()+10.toString());
		int TableID_AcceptOrRejectWorkMyProjects = int.parse('AcceptOrRejectWork'.split("")[0].codeUnits[0].toString() + 'AcceptOrRejectWork'.split("")[1].codeUnits[0].toString() + 'AcceptOrRejectWork'.split("")[2].codeUnits[0].toString() + 'AcceptOrRejectWork'.split("")[3].codeUnits[0].toString()+11.toString());
		int TableID_RateWorkerMyProjects = int.parse('RateWorker'.split("")[0].codeUnits[0].toString() + 'RateWorker'.split("")[1].codeUnits[0].toString() + 'RateWorker'.split("")[2].codeUnits[0].toString() + 'RateWorker'.split("")[3].codeUnits[0].toString()+12.toString());
		int TableID_ReportProgressMyProjects = int.parse('ReportProgress'.split("")[0].codeUnits[0].toString() + 'ReportProgress'.split("")[1].codeUnits[0].toString() + 'ReportProgress'.split("")[2].codeUnits[0].toString() + 'ReportProgress'.split("")[3].codeUnits[0].toString()+13.toString());
		int TableID_WeeklyReportMyProjects = int.parse('WeeklyReport'.split("")[0].codeUnits[0].toString() + 'WeeklyReport'.split("")[1].codeUnits[0].toString() + 'WeeklyReport'.split("")[2].codeUnits[0].toString() + 'WeeklyReport'.split("")[3].codeUnits[0].toString()+14.toString());
		int TableID_ReportDoneMyProjects = int.parse('ReportDone'.split("")[0].codeUnits[0].toString() + 'ReportDone'.split("")[1].codeUnits[0].toString() + 'ReportDone'.split("")[2].codeUnits[0].toString() + 'ReportDone'.split("")[3].codeUnits[0].toString()+15.toString());
		int TableID_RateOwnerMyProjects = int.parse('RateOwner'.split("")[0].codeUnits[0].toString() + 'RateOwner'.split("")[1].codeUnits[0].toString() + 'RateOwner'.split("")[2].codeUnits[0].toString() + 'RateOwner'.split("")[3].codeUnits[0].toString()+16.toString());
		int TableID_FileArbitrationMyProjects = int.parse('FileArbitration'.split("")[0].codeUnits[0].toString() + 'FileArbitration'.split("")[1].codeUnits[0].toString() + 'FileArbitration'.split("")[2].codeUnits[0].toString() + 'FileArbitration'.split("")[3].codeUnits[0].toString()+17.toString());
		int TableID_NewOfferMyProjects = int.parse('NewOffer'.split("")[0].codeUnits[0].toString() + 'NewOffer'.split("")[1].codeUnits[0].toString() + 'NewOffer'.split("")[2].codeUnits[0].toString() + 'NewOffer'.split("")[3].codeUnits[0].toString()+18.toString());
		int TableID_AcceptOfferMyProjects = int.parse('AcceptOffer'.split("")[0].codeUnits[0].toString() + 'AcceptOffer'.split("")[1].codeUnits[0].toString() + 'AcceptOffer'.split("")[2].codeUnits[0].toString() + 'AcceptOffer'.split("")[3].codeUnits[0].toString()+19.toString());
		int TableID_RespondArbitrationMyProjects = int.parse('RespondArbitration'.split("")[0].codeUnits[0].toString() + 'RespondArbitration'.split("")[1].codeUnits[0].toString() + 'RespondArbitration'.split("")[2].codeUnits[0].toString() + 'RespondArbitration'.split("")[3].codeUnits[0].toString()+20.toString());
		int TableID_CancelArbitrationMyProjects = int.parse('CancelArbitration'.split("")[0].codeUnits[0].toString() + 'CancelArbitration'.split("")[1].codeUnits[0].toString() + 'CancelArbitration'.split("")[2].codeUnits[0].toString() + 'CancelArbitration'.split("")[3].codeUnits[0].toString()+21.toString());
		int TableID_CancelBidMyBids = int.parse('CancelBid'.split("")[0].codeUnits[0].toString() + 'CancelBid'.split("")[1].codeUnits[0].toString() + 'CancelBid'.split("")[2].codeUnits[0].toString() + 'CancelBid'.split("")[3].codeUnits[0].toString()+3.toString());
		int TableID_AddNewProductMyProducts = int.parse('AddNewProduct'.split("")[0].codeUnits[0].toString() + 'AddNewProduct'.split("")[1].codeUnits[0].toString() + 'AddNewProduct'.split("")[2].codeUnits[0].toString() + 'AddNewProduct'.split("")[3].codeUnits[0].toString()+4.toString());
		int TableID_PublishProductMyProducts = int.parse('PublishProduct'.split("")[0].codeUnits[0].toString() + 'PublishProduct'.split("")[1].codeUnits[0].toString() + 'PublishProduct'.split("")[2].codeUnits[0].toString() + 'PublishProduct'.split("")[3].codeUnits[0].toString()+5.toString());
		int TableID_EditProductMyProducts = int.parse('EditProduct'.split("")[0].codeUnits[0].toString() + 'EditProduct'.split("")[1].codeUnits[0].toString() + 'EditProduct'.split("")[2].codeUnits[0].toString() + 'EditProduct'.split("")[3].codeUnits[0].toString()+6.toString());
		int TableID_BumpUpMyProducts = int.parse('BumpUp'.split("")[0].codeUnits[0].toString() + 'BumpUp'.split("")[1].codeUnits[0].toString() + 'BumpUp'.split("")[2].codeUnits[0].toString() + 'BumpUp'.split("")[3].codeUnits[0].toString()+7.toString());
		int TableID_UnlistMyProducts = int.parse('Unlist'.split("")[0].codeUnits[0].toString() + 'Unlist'.split("")[1].codeUnits[0].toString() + 'Unlist'.split("")[2].codeUnits[0].toString() + 'Unlist'.split("")[3].codeUnits[0].toString()+9.toString());
		int TableID_ReactivateProductMyProducts = int.parse('ReactivateProduct'.split("")[0].codeUnits[0].toString() + 'ReactivateProduct'.split("")[1].codeUnits[0].toString() + 'ReactivateProduct'.split("")[2].codeUnits[0].toString() + 'ReactivateProduct'.split("")[3].codeUnits[0].toString()+10.toString());
		int TableID_AddNewServiceMyServices = int.parse('AddNewService'.split("")[0].codeUnits[0].toString() + 'AddNewService'.split("")[1].codeUnits[0].toString() + 'AddNewService'.split("")[2].codeUnits[0].toString() + 'AddNewService'.split("")[3].codeUnits[0].toString()+4.toString());
		int TableID_PublishServiceMyServices = int.parse('PublishService'.split("")[0].codeUnits[0].toString() + 'PublishService'.split("")[1].codeUnits[0].toString() + 'PublishService'.split("")[2].codeUnits[0].toString() + 'PublishService'.split("")[3].codeUnits[0].toString()+5.toString());
		int TableID_BumpUpMyServices = int.parse('BumpUp'.split("")[0].codeUnits[0].toString() + 'BumpUp'.split("")[1].codeUnits[0].toString() + 'BumpUp'.split("")[2].codeUnits[0].toString() + 'BumpUp'.split("")[3].codeUnits[0].toString()+6.toString());
		int TableID_EditServiceMyServices = int.parse('EditService'.split("")[0].codeUnits[0].toString() + 'EditService'.split("")[1].codeUnits[0].toString() + 'EditService'.split("")[2].codeUnits[0].toString() + 'EditService'.split("")[3].codeUnits[0].toString()+7.toString());
		int TableID_UnlistMyServices = int.parse('Unlist'.split("")[0].codeUnits[0].toString() + 'Unlist'.split("")[1].codeUnits[0].toString() + 'Unlist'.split("")[2].codeUnits[0].toString() + 'Unlist'.split("")[3].codeUnits[0].toString()+9.toString());
		int TableID_ReactivateServiceMyServices = int.parse('ReactivateService'.split("")[0].codeUnits[0].toString() + 'ReactivateService'.split("")[1].codeUnits[0].toString() + 'ReactivateService'.split("")[2].codeUnits[0].toString() + 'ReactivateService'.split("")[3].codeUnits[0].toString()+10.toString());
		int TableID_ConfirmPaymentMyOrders = int.parse('ConfirmPayment'.split("")[0].codeUnits[0].toString() + 'ConfirmPayment'.split("")[1].codeUnits[0].toString() + 'ConfirmPayment'.split("")[2].codeUnits[0].toString() + 'ConfirmPayment'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_DownloadMyPurchases = int.parse('Download'.split("")[0].codeUnits[0].toString() + 'Download'.split("")[1].codeUnits[0].toString() + 'Download'.split("")[2].codeUnits[0].toString() + 'Download'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_RateProductMyPurchases = int.parse('RateProduct'.split("")[0].codeUnits[0].toString() + 'RateProduct'.split("")[1].codeUnits[0].toString() + 'RateProduct'.split("")[2].codeUnits[0].toString() + 'RateProduct'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_ChangePaymentSettingsMyFinance = int.parse('ChangePaymentSettings'.split("")[0].codeUnits[0].toString() + 'ChangePaymentSettings'.split("")[1].codeUnits[0].toString() + 'ChangePaymentSettings'.split("")[2].codeUnits[0].toString() + 'ChangePaymentSettings'.split("")[3].codeUnits[0].toString()+1.toString());
		int TableID_WithdrawPaymentMyFinance = int.parse('WithdrawPayment'.split("")[0].codeUnits[0].toString() + 'WithdrawPayment'.split("")[1].codeUnits[0].toString() + 'WithdrawPayment'.split("")[2].codeUnits[0].toString() + 'WithdrawPayment'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_DepositBalanceMyFinance = int.parse('DepositBalance'.split("")[0].codeUnits[0].toString() + 'DepositBalance'.split("")[1].codeUnits[0].toString() + 'DepositBalance'.split("")[2].codeUnits[0].toString() + 'DepositBalance'.split("")[3].codeUnits[0].toString()+3.toString());
		int TableID_EditProfileMyProfile = int.parse('EditProfile'.split("")[0].codeUnits[0].toString() + 'EditProfile'.split("")[1].codeUnits[0].toString() + 'EditProfile'.split("")[2].codeUnits[0].toString() + 'EditProfile'.split("")[3].codeUnits[0].toString()+2.toString());
		int TableID_ChangePasswordMyProfile = int.parse('ChangePassword'.split("")[0].codeUnits[0].toString() + 'ChangePassword'.split("")[1].codeUnits[0].toString() + 'ChangePassword'.split("")[2].codeUnits[0].toString() + 'ChangePassword'.split("")[3].codeUnits[0].toString()+4.toString());
		int TableID_ChangeEmailMyProfile = int.parse('ChangeEmail'.split("")[0].codeUnits[0].toString() + 'ChangeEmail'.split("")[1].codeUnits[0].toString() + 'ChangeEmail'.split("")[2].codeUnits[0].toString() + 'ChangeEmail'.split("")[3].codeUnits[0].toString()+5.toString());
		int TableID_ChangeHandphoneMyProfile = int.parse('ChangeHandphone'.split("")[0].codeUnits[0].toString() + 'ChangeHandphone'.split("")[1].codeUnits[0].toString() + 'ChangeHandphone'.split("")[2].codeUnits[0].toString() + 'ChangeHandphone'.split("")[3].codeUnits[0].toString()+6.toString());
		int TableID_RemoveMyBuddies = int.parse('Remove'.split("")[0].codeUnits[0].toString() + 'Remove'.split("")[1].codeUnits[0].toString() + 'Remove'.split("")[2].codeUnits[0].toString() + 'Remove'.split("")[3].codeUnits[0].toString()+1.toString());
  
  static const int TableID_Home = 222;
  static const int TableID_DataHome = 223;
  DBRepository(this._database);



 Future<List<Map>> loadBlacklist(String userID)async{
    List<Map> list = [];
    String searchSql = '''`id` = '$userID' ''';
   // _database!.transaction((txn) async {
      var batch = _database!.batch();
      batch.rawQuery('''
                                    SELECT
                                    meta
                                    FROM blacklist
                                    WHERE $searchSql
                                   ''');
      var batchList = await batch.commit();
      list.addAll(batchList.first as List<Map>);
   // });

    return list;
  }

  Future<void> saveOrUpdateBlacklist(String userID, String meta) async{
    var oldblack = await loadBlacklist(userID);

    if(oldblack != null && !oldblack.isEmpty){

      for(var map in oldblack) {
        meta =   map['meta']  + meta + '|';

      }
    }else{
      meta = meta +  '|';
    }

    if(userID != '') {
      _database!.transaction((txn) async {
        var batch = txn.batch();
        var batch1 = txn.batch();
        batch.rawUpdate(
            '''UPDATE blacklist
          SET
          meta = ?
          WHERE id = ?
           '''
            ,
            [
              meta,
              userID,
            ]);
        var batchList = await batch.commit();
        if (0 == batchList[0]) {
          batch1.rawInsert(
              ''' INSERT INTO
            blacklist (
            id,
            meta )
            VALUES (
            ?,
            ? ) '''
              ,
              [

                userID,
                meta,

              ]);
          await batch1.commit(noResult: true);
        }
      });
    }

  }
  
  Future<void> deleteBlacklist() async{
   // _database!.transaction((txn) async {
   //   var batch = txn.batch();
    var batch = _database!.batch();

      batch.rawDelete('DELETE FROM blacklist');
      await batch.commit(noResult: true);
  //  });
  }
 

  Future loadToken()async{
    String searchSql = '''`token` = '1' ''';
    var batchList;
   // _database!.transaction((txn) async {
      var batch = _database!.batch();

      batch.rawQuery('''
                                    SELECT
                                    token
                                    FROM token
                                    WHERE $searchSql
                                   ''');
       batchList = await batch.commit();
	   return batchList.first as List<Map>;
   // });
	
  }

  Future<void> saveOrUpdateToken(String token) async{
    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
    if(token != '') {

   _database!.transaction((txn) async {
     var batch = txn.batch();
     var batch1 = txn.batch();
            batch.rawUpdate(
                '''UPDATE token
                SET
                age = ?
                WHERE token = ?
                 '''
                ,
                [
                  age,
                  token,
                ]);
          var batchList = await batch.commit();
            if (0 == batchList[0]) {
              batch1.rawInsert(
                  ''' INSERT INTO
                  token (
                  token,
                  age )
                  VALUES (
                  ?,
                  ? ) '''
                  ,
                  [

                    token,
                    age,

                  ]);
                await batch1.commit(noResult: true);
            }
          });
       }

  }

  Future<void> deleteToken() async{

    _database!.transaction((txn) async {
      var batch = txn.batch();
      batch.rawDelete('DELETE FROM token');
      await batch.commit(noResult: true);
    });
  }

  Future<void> saveOrUpdateIntro(int intro) async{
    _database!.transaction((txn) async {
      var batch = txn.batch();
      var batch1 = txn.batch();
      batch.rawUpdate(
          '''UPDATE setting
          SET
          tool = ?,
          value = ?
          WHERE id = ?
           '''
          ,
          [
            'intro',
            intro,
            'intro',
          ]);

      var batchList = await batch.commit();
      if (0 == batchList[0]) {
        batch1.rawInsert(
            ''' INSERT INTO
            setting (
            id,
            tool,
            value )
            VALUES (
            ?,
            ?,
            ? ) '''
            ,
            [
              'intro',
              'intro',
              intro,

            ]);
        await batch1.commit(noResult: true);
      }
    });
  }
 Future loadIntro()async{
    String searchSql = '''`tool` = 'intro' ''';
    var batchList;
    //_database!.transaction((txn) async {
      var batch = _database!.batch();
      batch.rawQuery('''
                                    SELECT
                                    value
                                    FROM setting
                                    WHERE $searchSql
                                   ''');
      batchList = await batch.commit();
      return batchList.first as List<Map>;
  //  });

  }
   Future<void> saveOrUpdateAccount(LoginItem loginItem, String password) async{

     _database!.transaction((txn) async {
       var batch = txn.batch();
       var batch1 = txn.batch();
       batch.rawUpdate(
           '''UPDATE account
              SET
              user_name = ?,
          password = ?,
              user_display = ?,
              user_photo = ?,
              user_hash = ?,
              notif_count = ?,
              hash = ?
              WHERE id= ?
               '''
           ,
           [
             loginItem.user_name,
             password,
             loginItem.user_display,
             loginItem.user_photo,
             loginItem.user_hash,
             loginItem.notif_count,
             loginItem.hash,
             loginItem.user_id,
           ]);
       var batchList = await batch.commit();
       if (0 == batchList[0]) {
         batch1.rawInsert(
             ''' INSERT INTO
                account (
                id,
                user_name,
                password,
                user_display,
                user_photo,
                user_hash,
                notif_count,
                hash )
                VALUES (
                ?,
          ?,
                ?,
                ?,
                ?,
          ?,
                ?,
                ? ) '''
             ,
             [

               loginItem.user_id,
               loginItem.user_name,
               password,
               loginItem.user_display,
               loginItem.user_photo,
               loginItem.user_hash,
               loginItem.notif_count,
               loginItem.hash,

             ]);
         await batch1.commit(noResult: true);
       }
     });


  }

  Future<List<Map>> loadAccount() async{
    List<Map> list = [];
    

        //_database!.transaction((txn) async {
          var batch = _database!.batch();
          batch.rawQuery('''
                                             SELECT
                                              id,
                                              user_name,
											  password,
                                              user_display,
                                              user_photo,
                                              user_hash,
                                              notif_count,
                                              hash
                                             FROM account
                                             ''');
           var batchList = await batch.commit();
          return batchList.first as List<Map>;
       // });
    
    
   // print('list ===' + list.toString());
   // return list;
  }

  Future<void> deleteAccount() async{

    _database!.transaction((txn) async {
      var batch = txn.batch();

      batch.rawDelete('DELETE FROM account');
      await batch.commit(noResult: true);
    });
  }

  searchT(String words) => words.replaceAllMapped(
      new RegExp(r',"(.*?)":', caseSensitive: false),
          (Match m) => ' ');

  String search(String words){
       String text = searchT(words);
       text = text.replaceFirst('"age":', ' ');
       return text;
  }
  
//Home
  // ---------------------------------------------------------------------------

  Future<void> saveOrUpdateHomeList(ItemHomeModel home) async{

    String meta = jsonEncode(home.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }

    _database!.transaction((txn) async {
      var batch = txn.batch();
      var batch1 = txn.batch();
      batch.rawUpdate(
          '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
          ,
          [
            TableID_Home,
            userID,
            home.item!.page,
            home.item!.age,
            home.item!.cnt,
            home.item!.ttl,
            home.item!.pht,
            home.item!.sbttl,
            searchText,
            meta,
            home.item!.id,
          ]);
      var batchList = await batch.commit();
      if (0 == batchList[0]) {
        batch1.rawInsert(
            ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
            ,
            [

              home.item!.id,
              TableID_Home,
              userID,
              home.item!.page,
              home.item!.age,
              home.item!.cnt,
              home.item!.ttl,
              home.item!.pht,
              home.item!.sbttl,
              searchText,
              meta,
            ]);
        await batch1.commit(noResult: true);
      }
    });

  }

  Future<int> listHomeAge() async {
    String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Home.toString() + ''' AND `user_id` = ''' + userID + ''' ''' ;
    List<ItemHomeModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
    var batchList;
   // _database!.transaction((txn) async {
      var batch = _database!.batch();
      batch.rawQuery('''
                                                    SELECT  
                                                    cnt, 
                            page,
                                                    age,
                            ttl,
                            pht,
                            sbttl,
                                                    meta 
                                                    FROM storage
                                                    WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                              ''');
      batchList = await batch.commit();
   // });  

    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemHomeModel home = ItemHomeModel(jsonDecode(map['meta']));
      home.item!.cnt = map['cnt'];
      home.item!.age = map['age'];
	   home.item!.page = map['page'];
	  home.item!.ttl = map['ttl'];
	  home.item!.pht = map['pht'];
	  home.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(home);
    }
    return age;

  }

  Future<List<ItemHomeModel>> loadHomeList(String searchKey) async{
    String searchSql = '';
    List<ItemHomeModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = ''' + TableID_Home.toString() + ''' AND `user_id` = '$userID' ''' ;
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
     // _database!.transaction((txn) async {
        var batch = _database!.batch();
        batch.rawQuery('''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
         batchList = await batch.commit();
     // });

    list.addAll(batchList.first as List<Map>);

      for(var map in list) {
        ItemHomeModel home = ItemHomeModel(jsonDecode(map['meta']));
        home.item!.cnt = map['cnt'];
		home.item!.page = map['page'];
        home.item!.age = map['age'];
	    home.item!.ttl = map['ttl'];
	    home.item!.pht = map['pht'];
	    home.item!.sbttl = map['sbttl'];
        appList.add(home);
      }
    } else{
      List<Map> list = [];
      var batchList;
     // _database!.transaction((txn) async {
        var batch = _database!.batch();
        batch.rawQuery('''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
					     WHERE `table_id` = ''' + TableID_Home.toString() +
            ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC
                                             ''');
        batchList = await batch.commit();
     // });
    list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemHomeModel home = ItemHomeModel(jsonDecode(map['meta']));
        home.item!.cnt = map['cnt'];
		home.item!.page = map['page'];
        home.item!.age = map['age'];
		home.item!.ttl = map['ttl'];
	    home.item!.pht = map['pht'];
	    home.item!.sbttl = map['sbttl'];
        appList.add(home);
      }
    }

    return appList;
  }

  Future<void> deleteAllHomeList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    
   // _database!.transaction((txn) async {
      var batch = _database!.batch();
      batch.rawDelete('''DELETE FROM storage Where `table_id` = ''' +
          TableID_Home.toString() + ''' AND `user_id` = '$userID' ''');
      await batch.commit(noResult: true);
   // });
  }


Future<HomeListingModel> loadHomeListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
     var batchList;
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    // _database!.transaction((txn) async {
       var batch = _database!.batch();
       batch.rawQuery('''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = ''' + TableID_Home.toString() +
           ''' AND `user_id` = '$userID'
                                             ''');
       batchList = await batch.commit();
    // });
    list.addAll(batchList.first as List<Map>);

	for(var map in list) {
     meta =  HomeListingModel(jsonDecode(map['meta']));
    }										 
    return meta;												
   }
  
    Future<void> saveOrUpdateHomeListInfo(HomeListingModel home) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(home.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
  _database!.transaction((txn) async {
    var batch = txn.batch();
    var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [
          userID,
          meta,
          TableID_Home,

        ]);
    var batchList = await batch.commit();
    if (0 == batchList[0]) {
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
            TableID_Home,
            userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
  });

  }
  
 //--------------
  //GetDataHome

  Future<int> DataHomeAge() async {
    String userID = '';
    List<Map>  listuser = [];
  /*  var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    } */
    String searchSql = '''`cnt` = 1 AND `table_id` = ''' + TableID_DataHome.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<PublicHomeModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
    var batchList;
    //_database!.transaction((txn) async {
      var batch = _database!.batch();
      batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
      batchList = await batch.commit();
   // });
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
     // PublicHomeModel datahome = PublicHomeModel.fromJson(jsonDecode(map['meta']));
      age = map['age'];
    //  print('age = $age');
    //  appList.add(datahome);
    }
    return age;
  }

  Future<PublicHomeModel?> loadDataHome(String searchKey) async{
    String searchSql = '';
    PublicHomeModel? datahome;
    List<Map>  listuser = [];
    String userID = '';
  /*  var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    } */
    if(searchKey.isNotEmpty){
      // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
      searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_DataHome.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
     // _database!.transaction((txn) async {
        var batch = _database!.batch();
      batch.rawQuery('''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList = await batch.commit();
   // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        datahome = PublicHomeModel.fromJson(jsonDecode(map['meta']));
        datahome.age = map['age'];

      }
    } else {
      List<Map> list = [];
      var batchList;
     // _database!.transaction((txn) async {
        var batch = _database!.batch();
      batch.rawQuery('''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
					     WHERE `table_id` = ''' + TableID_DataHome.toString() +
          ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
      batchList = await batch.commit();
   // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
       datahome = PublicHomeModel.fromJson(jsonDecode(map['meta']));
        datahome.age = map['age'];
      }
    }

    return datahome;
  }

  Future<PublicHomeModel> loadDataHomeInfo(String searchKey) async {
    List<Map> list = [];
    List<Map> listuser = [];
    var meta;
    String userID = '';
    /* var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    } */
    var batchList;
   // _database!.transaction((txn) async {
      var batch = _database!.batch();
    batch.rawQuery('''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = ''' + TableID_DataHome.toString() +
        ''' AND `user_id` = '$userID'
                                             ''');

    batchList = await batch.commit();
   // });
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      meta =  PublicHomeModel.fromJson(jsonDecode(map['meta']));
    }
    return meta;
  }

  Future<void> saveOrUpdateDataHomeInfo(PublicHomeModel datahome) async {
    String userID = '';
    List<Map> listuser = [];
    /* var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    } */
    String meta = jsonEncode(datahome.toJson());
    //String searchText = search(meta);
    String searchText = ''; //search(meta);
    _database!.transaction((txn) async {
      var batch = txn.batch();
    var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [
          userID,
          meta,
          TableID_DataHome,

        ]);
    var batchList = await batch.commit();
    if (0 == batchList[0]) {
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
            TableID_DataHome,
            userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
  });

  }

  Future<void> saveOrUpdateDataHome(PublicHomeModel datahome) async {
    String userID = '';
    List<Map> listuser = [];
    /*  var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    } */
    String meta = jsonEncode(datahome.toJson());
    //String searchText = search(meta);
    String searchText = ''; //search(meta);
    _database!.transaction((txn) async {
      var batch = txn.batch();
    var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
          TableID_DataHome,
          userID,
          1,
          datahome.age,
          1,
          '',
          '',
          '',
          '',
          meta,
          '1',
        ]);
    var batchList = await batch.commit();
    if (0 == batchList[0]) {
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            '1',
            TableID_DataHome,
            userID,
            1,
            datahome.age,
            1,
            '',
            '',
            '',
            '',
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
  });

  }


  //END of GetDataHome
//----------------------

// DELETE ALL !!!!
Future<void> deleteAll() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
   // _database!.transaction((txn) async {
      var batch = _database!.batch();
      batch.rawDelete('''DELETE FROM storage Where  `user_id` = '$userID' ''');
      await batch.commit(noResult: true);
   // });
 }
  //-------------------------------------------------



  Future<void> saveOrUpdateTestList(ItemTestModel test) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(test.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_Test, 
		  userID, 
		  test.item!.page,
          test.item!.age,
          test.item!.cnt,
		  test.item!.ttl,
		  test.item!.pht,
		  test.item!.sbttl,
          searchText,
          meta,
          test.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            test.item!.id,
			TableID_Test,
			userID,
			 test.item!.page,
            test.item!.age,
            test.item!.cnt,
			test.item!.ttl,
		    test.item!.pht,
		    test.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<TestListingModel> loadTestListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_Test.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  TestListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateTestListInfo(TestListingModel test) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(test.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_Test,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_Test,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listTestAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Test.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemTestModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemTestModel test = ItemTestModel(jsonDecode(map['meta']));
      test.item!.cnt = map['cnt'];
      test.item!.age = map['age'];
	   test.item!.page = map['page'];
	  test.item!.ttl = map['ttl'];
	  test.item!.pht = map['pht'];
	  test.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(test);
    }
    return age;
  }

  Future<List<ItemTestModel>> loadTestList(String searchKey) async{
    String searchSql = '';
    List<ItemTestModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Test.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemTestModel test = ItemTestModel(jsonDecode(map['meta']));
        test.item!.cnt = map['cnt'];
		test.item!.page = map['page'];
        test.item!.age = map['age'];
	    test.item!.ttl = map['ttl'];
	    test.item!.pht = map['pht'];
	    test.item!.sbttl = map['sbttl'];
        appList.add(test);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_Test.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemTestModel test = ItemTestModel(jsonDecode(map['meta']));
        test.item!.cnt = map['cnt'];
		test.item!.page = map['page'];
        test.item!.age = map['age'];
		test.item!.ttl = map['ttl'];
	    test.item!.pht = map['pht'];
	    test.item!.sbttl = map['sbttl'];
        appList.add(test);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllTestList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Test.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateTestimonialList(ItemTestimonialModel testimonial) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(testimonial.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_Testimonial, 
		  userID, 
		  testimonial.item!.page,
          testimonial.item!.age,
          testimonial.item!.cnt,
		  testimonial.item!.ttl,
		  testimonial.item!.pht,
		  testimonial.item!.sbttl,
          searchText,
          meta,
          testimonial.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            testimonial.item!.id,
			TableID_Testimonial,
			userID,
			 testimonial.item!.page,
            testimonial.item!.age,
            testimonial.item!.cnt,
			testimonial.item!.ttl,
		    testimonial.item!.pht,
		    testimonial.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<TestimonialListingModel> loadTestimonialListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_Testimonial.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  TestimonialListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateTestimonialListInfo(TestimonialListingModel testimonial) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(testimonial.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_Testimonial,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_Testimonial,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listTestimonialAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Testimonial.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemTestimonialModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemTestimonialModel testimonial = ItemTestimonialModel(jsonDecode(map['meta']));
      testimonial.item!.cnt = map['cnt'];
      testimonial.item!.age = map['age'];
	   testimonial.item!.page = map['page'];
	  testimonial.item!.ttl = map['ttl'];
	  testimonial.item!.pht = map['pht'];
	  testimonial.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(testimonial);
    }
    return age;
  }

  Future<List<ItemTestimonialModel>> loadTestimonialList(String searchKey) async{
    String searchSql = '';
    List<ItemTestimonialModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Testimonial.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemTestimonialModel testimonial = ItemTestimonialModel(jsonDecode(map['meta']));
        testimonial.item!.cnt = map['cnt'];
		testimonial.item!.page = map['page'];
        testimonial.item!.age = map['age'];
	    testimonial.item!.ttl = map['ttl'];
	    testimonial.item!.pht = map['pht'];
	    testimonial.item!.sbttl = map['sbttl'];
        appList.add(testimonial);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_Testimonial.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemTestimonialModel testimonial = ItemTestimonialModel(jsonDecode(map['meta']));
        testimonial.item!.cnt = map['cnt'];
		testimonial.item!.page = map['page'];
        testimonial.item!.age = map['age'];
		testimonial.item!.ttl = map['ttl'];
	    testimonial.item!.pht = map['pht'];
	    testimonial.item!.sbttl = map['sbttl'];
        appList.add(testimonial);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllTestimonialList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Testimonial.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateCeritaSuksesList(ItemCeritaSuksesModel cerita_sukses) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(cerita_sukses.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_CeritaSukses, 
		  userID, 
		  cerita_sukses.item!.page,
          cerita_sukses.item!.age,
          cerita_sukses.item!.cnt,
		  cerita_sukses.item!.ttl,
		  cerita_sukses.item!.pht,
		  cerita_sukses.item!.sbttl,
          searchText,
          meta,
          cerita_sukses.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            cerita_sukses.item!.id,
			TableID_CeritaSukses,
			userID,
			 cerita_sukses.item!.page,
            cerita_sukses.item!.age,
            cerita_sukses.item!.cnt,
			cerita_sukses.item!.ttl,
		    cerita_sukses.item!.pht,
		    cerita_sukses.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<CeritaSuksesListingModel> loadCeritaSuksesListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_CeritaSukses.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  CeritaSuksesListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateCeritaSuksesListInfo(CeritaSuksesListingModel cerita_sukses) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(cerita_sukses.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_CeritaSukses,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_CeritaSukses,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listCeritaSuksesAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_CeritaSukses.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemCeritaSuksesModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemCeritaSuksesModel cerita_sukses = ItemCeritaSuksesModel(jsonDecode(map['meta']));
      cerita_sukses.item!.cnt = map['cnt'];
      cerita_sukses.item!.age = map['age'];
	   cerita_sukses.item!.page = map['page'];
	  cerita_sukses.item!.ttl = map['ttl'];
	  cerita_sukses.item!.pht = map['pht'];
	  cerita_sukses.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(cerita_sukses);
    }
    return age;
  }

  Future<List<ItemCeritaSuksesModel>> loadCeritaSuksesList(String searchKey) async{
    String searchSql = '';
    List<ItemCeritaSuksesModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_CeritaSukses.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemCeritaSuksesModel cerita_sukses = ItemCeritaSuksesModel(jsonDecode(map['meta']));
        cerita_sukses.item!.cnt = map['cnt'];
		cerita_sukses.item!.page = map['page'];
        cerita_sukses.item!.age = map['age'];
	    cerita_sukses.item!.ttl = map['ttl'];
	    cerita_sukses.item!.pht = map['pht'];
	    cerita_sukses.item!.sbttl = map['sbttl'];
        appList.add(cerita_sukses);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_CeritaSukses.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemCeritaSuksesModel cerita_sukses = ItemCeritaSuksesModel(jsonDecode(map['meta']));
        cerita_sukses.item!.cnt = map['cnt'];
		cerita_sukses.item!.page = map['page'];
        cerita_sukses.item!.age = map['age'];
		cerita_sukses.item!.ttl = map['ttl'];
	    cerita_sukses.item!.pht = map['pht'];
	    cerita_sukses.item!.sbttl = map['sbttl'];
        appList.add(cerita_sukses);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllCeritaSuksesList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_CeritaSukses.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateTipsList(ItemTipsModel tips) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(tips.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_Tips, 
		  userID, 
		  tips.item!.page,
          tips.item!.age,
          tips.item!.cnt,
		  tips.item!.ttl,
		  tips.item!.pht,
		  tips.item!.sbttl,
          searchText,
          meta,
          tips.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            tips.item!.id,
			TableID_Tips,
			userID,
			 tips.item!.page,
            tips.item!.age,
            tips.item!.cnt,
			tips.item!.ttl,
		    tips.item!.pht,
		    tips.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<TipsListingModel> loadTipsListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_Tips.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  TipsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateTipsListInfo(TipsListingModel tips) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(tips.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_Tips,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_Tips,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listTipsAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Tips.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemTipsModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemTipsModel tips = ItemTipsModel(jsonDecode(map['meta']));
      tips.item!.cnt = map['cnt'];
      tips.item!.age = map['age'];
	   tips.item!.page = map['page'];
	  tips.item!.ttl = map['ttl'];
	  tips.item!.pht = map['pht'];
	  tips.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(tips);
    }
    return age;
  }

  Future<List<ItemTipsModel>> loadTipsList(String searchKey) async{
    String searchSql = '';
    List<ItemTipsModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Tips.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemTipsModel tips = ItemTipsModel(jsonDecode(map['meta']));
        tips.item!.cnt = map['cnt'];
		tips.item!.page = map['page'];
        tips.item!.age = map['age'];
	    tips.item!.ttl = map['ttl'];
	    tips.item!.pht = map['pht'];
	    tips.item!.sbttl = map['sbttl'];
        appList.add(tips);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_Tips.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemTipsModel tips = ItemTipsModel(jsonDecode(map['meta']));
        tips.item!.cnt = map['cnt'];
		tips.item!.page = map['page'];
        tips.item!.age = map['age'];
		tips.item!.ttl = map['ttl'];
	    tips.item!.pht = map['pht'];
	    tips.item!.sbttl = map['sbttl'];
        appList.add(tips);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllTipsList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Tips.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateBrowseProjectsList(ItemBrowseProjectsModel browse_projects) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(browse_projects.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_BrowseProjects, 
		  userID, 
		  browse_projects.item!.page,
          browse_projects.item!.age,
          browse_projects.item!.cnt,
		  browse_projects.item!.ttl,
		  browse_projects.item!.pht,
		  browse_projects.item!.sbttl,
          searchText,
          meta,
          browse_projects.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            browse_projects.item!.id,
			TableID_BrowseProjects,
			userID,
			 browse_projects.item!.page,
            browse_projects.item!.age,
            browse_projects.item!.cnt,
			browse_projects.item!.ttl,
		    browse_projects.item!.pht,
		    browse_projects.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<BrowseProjectsListingModel> loadBrowseProjectsListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_BrowseProjects.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  BrowseProjectsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateBrowseProjectsListInfo(BrowseProjectsListingModel browse_projects) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(browse_projects.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_BrowseProjects,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_BrowseProjects,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listBrowseProjectsAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_BrowseProjects.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemBrowseProjectsModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemBrowseProjectsModel browse_projects = ItemBrowseProjectsModel(jsonDecode(map['meta']));
      browse_projects.item!.cnt = map['cnt'];
      browse_projects.item!.age = map['age'];
	   browse_projects.item!.page = map['page'];
	  browse_projects.item!.ttl = map['ttl'];
	  browse_projects.item!.pht = map['pht'];
	  browse_projects.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(browse_projects);
    }
    return age;
  }

  Future<List<ItemBrowseProjectsModel>> loadBrowseProjectsList(String searchKey) async{
    String searchSql = '';
    List<ItemBrowseProjectsModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_BrowseProjects.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemBrowseProjectsModel browse_projects = ItemBrowseProjectsModel(jsonDecode(map['meta']));
        browse_projects.item!.cnt = map['cnt'];
		browse_projects.item!.page = map['page'];
        browse_projects.item!.age = map['age'];
	    browse_projects.item!.ttl = map['ttl'];
	    browse_projects.item!.pht = map['pht'];
	    browse_projects.item!.sbttl = map['sbttl'];
        appList.add(browse_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_BrowseProjects.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemBrowseProjectsModel browse_projects = ItemBrowseProjectsModel(jsonDecode(map['meta']));
        browse_projects.item!.cnt = map['cnt'];
		browse_projects.item!.page = map['page'];
        browse_projects.item!.age = map['age'];
		browse_projects.item!.ttl = map['ttl'];
	    browse_projects.item!.pht = map['pht'];
	    browse_projects.item!.sbttl = map['sbttl'];
        appList.add(browse_projects);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllBrowseProjectsList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_BrowseProjects.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdatePlaceNewBidBrowseProjects(PlaceNewBidBrowseProjectsModel place_new_bid, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(place_new_bid.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PlaceNewBidBrowseProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PlaceNewBidBrowseProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PlaceNewBidBrowseProjects$spKey',
			 TableID_PlaceNewBidBrowseProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PlaceNewBidBrowseProjectsModel? > loadPlaceNewBidBrowseProjects(String searchKey) async{
    String searchSql = '';
    PlaceNewBidBrowseProjectsModel appList ;
	List<Map>  listuser = [];
	PlaceNewBidBrowseProjectsModel? place_new_bid;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PlaceNewBidBrowseProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          place_new_bid = PlaceNewBidBrowseProjectsModel(jsonDecode(map['meta']));
        place_new_bid.model.model.cnt = map['cnt'];
		place_new_bid.model.model.page = map['page'];
        place_new_bid.model.model.age = map['age'];
	    place_new_bid.model.model.ttl = map['ttl'];
	    place_new_bid.model.model.pht = map['pht'];
	    place_new_bid.model.model.sbttl = map['sbttl'];
       // appList.add(browse_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PlaceNewBidBrowseProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        place_new_bid = PlaceNewBidBrowseProjectsModel(jsonDecode(map['meta']));
        place_new_bid.model.model.cnt = map['cnt'];
		place_new_bid.model.model.page = map['page'];
        place_new_bid.model.model.age = map['age'];
	    place_new_bid.model.model.ttl = map['ttl'];
	    place_new_bid.model.model.pht = map['pht'];
	    place_new_bid.model.model.sbttl = map['sbttl'];
        //appList.add(browse_projects);
      }
    }

    return place_new_bid;
  }
  
   Future<void> deleteAllPlaceNewBidBrowseProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PlaceNewBidBrowseProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PlaceNewBidBrowseProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateAskOwnerBrowseProjects(AskOwnerBrowseProjectsModel ask_owner, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(ask_owner.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_AskOwnerBrowseProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'AskOwnerBrowseProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'AskOwnerBrowseProjects$spKey',
			 TableID_AskOwnerBrowseProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<AskOwnerBrowseProjectsModel? > loadAskOwnerBrowseProjects(String searchKey) async{
    String searchSql = '';
    AskOwnerBrowseProjectsModel appList ;
	List<Map>  listuser = [];
	AskOwnerBrowseProjectsModel? ask_owner;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'AskOwnerBrowseProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          ask_owner = AskOwnerBrowseProjectsModel(jsonDecode(map['meta']));
        ask_owner.model.model.cnt = map['cnt'];
		ask_owner.model.model.page = map['page'];
        ask_owner.model.model.age = map['age'];
	    ask_owner.model.model.ttl = map['ttl'];
	    ask_owner.model.model.pht = map['pht'];
	    ask_owner.model.model.sbttl = map['sbttl'];
       // appList.add(browse_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'AskOwnerBrowseProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ask_owner = AskOwnerBrowseProjectsModel(jsonDecode(map['meta']));
        ask_owner.model.model.cnt = map['cnt'];
		ask_owner.model.model.page = map['page'];
        ask_owner.model.model.age = map['age'];
	    ask_owner.model.model.ttl = map['ttl'];
	    ask_owner.model.model.pht = map['pht'];
	    ask_owner.model.model.sbttl = map['sbttl'];
        //appList.add(browse_projects);
      }
    }

    return ask_owner;
  }
  
   Future<void> deleteAllAskOwnerBrowseProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AskOwnerBrowseProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AskOwnerBrowseProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateGuestCreateProjectBrowseProjects(GuestCreateProjectBrowseProjectsModel guest_create_project, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(guest_create_project.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_GuestCreateProjectBrowseProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'GuestCreateProjectBrowseProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'GuestCreateProjectBrowseProjects$spKey',
			 TableID_GuestCreateProjectBrowseProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<GuestCreateProjectBrowseProjectsModel? > loadGuestCreateProjectBrowseProjects(String searchKey) async{
    String searchSql = '';
    GuestCreateProjectBrowseProjectsModel appList ;
	List<Map>  listuser = [];
	GuestCreateProjectBrowseProjectsModel? guest_create_project;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'GuestCreateProjectBrowseProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          guest_create_project = GuestCreateProjectBrowseProjectsModel(jsonDecode(map['meta']));
        guest_create_project.model.model.cnt = map['cnt'];
		guest_create_project.model.model.page = map['page'];
        guest_create_project.model.model.age = map['age'];
	    guest_create_project.model.model.ttl = map['ttl'];
	    guest_create_project.model.model.pht = map['pht'];
	    guest_create_project.model.model.sbttl = map['sbttl'];
       // appList.add(browse_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'GuestCreateProjectBrowseProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        guest_create_project = GuestCreateProjectBrowseProjectsModel(jsonDecode(map['meta']));
        guest_create_project.model.model.cnt = map['cnt'];
		guest_create_project.model.model.page = map['page'];
        guest_create_project.model.model.age = map['age'];
	    guest_create_project.model.model.ttl = map['ttl'];
	    guest_create_project.model.model.pht = map['pht'];
	    guest_create_project.model.model.sbttl = map['sbttl'];
        //appList.add(browse_projects);
      }
    }

    return guest_create_project;
  }
  
   Future<void> deleteAllGuestCreateProjectBrowseProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'GuestCreateProjectBrowseProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'GuestCreateProjectBrowseProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdatePastProjectsList(ItemPastProjectsModel past_projects) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(past_projects.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PastProjects, 
		  userID, 
		  past_projects.item!.page,
          past_projects.item!.age,
          past_projects.item!.cnt,
		  past_projects.item!.ttl,
		  past_projects.item!.pht,
		  past_projects.item!.sbttl,
          searchText,
          meta,
          past_projects.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            past_projects.item!.id,
			TableID_PastProjects,
			userID,
			 past_projects.item!.page,
            past_projects.item!.age,
            past_projects.item!.cnt,
			past_projects.item!.ttl,
		    past_projects.item!.pht,
		    past_projects.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<PastProjectsListingModel> loadPastProjectsListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_PastProjects.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  PastProjectsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdatePastProjectsListInfo(PastProjectsListingModel past_projects) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(past_projects.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_PastProjects,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_PastProjects,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listPastProjectsAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_PastProjects.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemPastProjectsModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemPastProjectsModel past_projects = ItemPastProjectsModel(jsonDecode(map['meta']));
      past_projects.item!.cnt = map['cnt'];
      past_projects.item!.age = map['age'];
	   past_projects.item!.page = map['page'];
	  past_projects.item!.ttl = map['ttl'];
	  past_projects.item!.pht = map['pht'];
	  past_projects.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(past_projects);
    }
    return age;
  }

  Future<List<ItemPastProjectsModel>> loadPastProjectsList(String searchKey) async{
    String searchSql = '';
    List<ItemPastProjectsModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_PastProjects.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemPastProjectsModel past_projects = ItemPastProjectsModel(jsonDecode(map['meta']));
        past_projects.item!.cnt = map['cnt'];
		past_projects.item!.page = map['page'];
        past_projects.item!.age = map['age'];
	    past_projects.item!.ttl = map['ttl'];
	    past_projects.item!.pht = map['pht'];
	    past_projects.item!.sbttl = map['sbttl'];
        appList.add(past_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_PastProjects.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemPastProjectsModel past_projects = ItemPastProjectsModel(jsonDecode(map['meta']));
        past_projects.item!.cnt = map['cnt'];
		past_projects.item!.page = map['page'];
        past_projects.item!.age = map['age'];
		past_projects.item!.ttl = map['ttl'];
	    past_projects.item!.pht = map['pht'];
	    past_projects.item!.sbttl = map['sbttl'];
        appList.add(past_projects);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllPastProjectsList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_PastProjects.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateNewUserList(ItemNewUserModel new_user) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(new_user.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_NewUser, 
		  userID, 
		  new_user.item!.page,
          new_user.item!.age,
          new_user.item!.cnt,
		  new_user.item!.ttl,
		  new_user.item!.pht,
		  new_user.item!.sbttl,
          searchText,
          meta,
          new_user.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            new_user.item!.id,
			TableID_NewUser,
			userID,
			 new_user.item!.page,
            new_user.item!.age,
            new_user.item!.cnt,
			new_user.item!.ttl,
		    new_user.item!.pht,
		    new_user.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<NewUserListingModel> loadNewUserListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_NewUser.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  NewUserListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateNewUserListInfo(NewUserListingModel new_user) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(new_user.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_NewUser,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_NewUser,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listNewUserAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_NewUser.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemNewUserModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemNewUserModel new_user = ItemNewUserModel(jsonDecode(map['meta']));
      new_user.item!.cnt = map['cnt'];
      new_user.item!.age = map['age'];
	   new_user.item!.page = map['page'];
	  new_user.item!.ttl = map['ttl'];
	  new_user.item!.pht = map['pht'];
	  new_user.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(new_user);
    }
    return age;
  }

  Future<List<ItemNewUserModel>> loadNewUserList(String searchKey) async{
    String searchSql = '';
    List<ItemNewUserModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_NewUser.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemNewUserModel new_user = ItemNewUserModel(jsonDecode(map['meta']));
        new_user.item!.cnt = map['cnt'];
		new_user.item!.page = map['page'];
        new_user.item!.age = map['age'];
	    new_user.item!.ttl = map['ttl'];
	    new_user.item!.pht = map['pht'];
	    new_user.item!.sbttl = map['sbttl'];
        appList.add(new_user);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_NewUser.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemNewUserModel new_user = ItemNewUserModel(jsonDecode(map['meta']));
        new_user.item!.cnt = map['cnt'];
		new_user.item!.page = map['page'];
        new_user.item!.age = map['age'];
		new_user.item!.ttl = map['ttl'];
	    new_user.item!.pht = map['pht'];
	    new_user.item!.sbttl = map['sbttl'];
        appList.add(new_user);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllNewUserList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_NewUser.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateRegisterNewUser(RegisterNewUserModel register, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(register.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_RegisterNewUser, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'RegisterNewUser$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'RegisterNewUser$spKey',
			 TableID_RegisterNewUser, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<RegisterNewUserModel? > loadRegisterNewUser(String searchKey) async{
    String searchSql = '';
    RegisterNewUserModel appList ;
	List<Map>  listuser = [];
	RegisterNewUserModel? register;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'RegisterNewUser$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          register = RegisterNewUserModel(jsonDecode(map['meta']));
        register.model.model.cnt = map['cnt'];
		register.model.model.page = map['page'];
        register.model.model.age = map['age'];
	    register.model.model.ttl = map['ttl'];
	    register.model.model.pht = map['pht'];
	    register.model.model.sbttl = map['sbttl'];
       // appList.add(new_user);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'RegisterNewUser$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        register = RegisterNewUserModel(jsonDecode(map['meta']));
        register.model.model.cnt = map['cnt'];
		register.model.model.page = map['page'];
        register.model.model.age = map['age'];
	    register.model.model.ttl = map['ttl'];
	    register.model.model.pht = map['pht'];
	    register.model.model.sbttl = map['sbttl'];
        //appList.add(new_user);
      }
    }

    return register;
  }
  
   Future<void> deleteAllRegisterNewUser(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RegisterNewUser$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RegisterNewUser$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateVerifyNewUser(VerifyNewUserModel verify, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(verify.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_VerifyNewUser, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'VerifyNewUser$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'VerifyNewUser$spKey',
			 TableID_VerifyNewUser, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<VerifyNewUserModel? > loadVerifyNewUser(String searchKey) async{
    String searchSql = '';
    VerifyNewUserModel appList ;
	List<Map>  listuser = [];
	VerifyNewUserModel? verify;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'VerifyNewUser$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          verify = VerifyNewUserModel(jsonDecode(map['meta']));
        verify.model.model.cnt = map['cnt'];
		verify.model.model.page = map['page'];
        verify.model.model.age = map['age'];
	    verify.model.model.ttl = map['ttl'];
	    verify.model.model.pht = map['pht'];
	    verify.model.model.sbttl = map['sbttl'];
       // appList.add(new_user);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'VerifyNewUser$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        verify = VerifyNewUserModel(jsonDecode(map['meta']));
        verify.model.model.cnt = map['cnt'];
		verify.model.model.page = map['page'];
        verify.model.model.age = map['age'];
	    verify.model.model.ttl = map['ttl'];
	    verify.model.model.pht = map['pht'];
	    verify.model.model.sbttl = map['sbttl'];
        //appList.add(new_user);
      }
    }

    return verify;
  }
  
   Future<void> deleteAllVerifyNewUser(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'VerifyNewUser$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'VerifyNewUser$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateProgramList(ItemProgramModel program) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(program.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_Program, 
		  userID, 
		  program.item!.page,
          program.item!.age,
          program.item!.cnt,
		  program.item!.ttl,
		  program.item!.pht,
		  program.item!.sbttl,
          searchText,
          meta,
          program.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            program.item!.id,
			TableID_Program,
			userID,
			 program.item!.page,
            program.item!.age,
            program.item!.cnt,
			program.item!.ttl,
		    program.item!.pht,
		    program.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<ProgramListingModel> loadProgramListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_Program.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  ProgramListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateProgramListInfo(ProgramListingModel program) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(program.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_Program,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_Program,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listProgramAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Program.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemProgramModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemProgramModel program = ItemProgramModel(jsonDecode(map['meta']));
      program.item!.cnt = map['cnt'];
      program.item!.age = map['age'];
	   program.item!.page = map['page'];
	  program.item!.ttl = map['ttl'];
	  program.item!.pht = map['pht'];
	  program.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(program);
    }
    return age;
  }

  Future<List<ItemProgramModel>> loadProgramList(String searchKey) async{
    String searchSql = '';
    List<ItemProgramModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Program.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemProgramModel program = ItemProgramModel(jsonDecode(map['meta']));
        program.item!.cnt = map['cnt'];
		program.item!.page = map['page'];
        program.item!.age = map['age'];
	    program.item!.ttl = map['ttl'];
	    program.item!.pht = map['pht'];
	    program.item!.sbttl = map['sbttl'];
        appList.add(program);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_Program.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemProgramModel program = ItemProgramModel(jsonDecode(map['meta']));
        program.item!.cnt = map['cnt'];
		program.item!.page = map['page'];
        program.item!.age = map['age'];
		program.item!.ttl = map['ttl'];
	    program.item!.pht = map['pht'];
	    program.item!.sbttl = map['sbttl'];
        appList.add(program);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllProgramList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Program.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdatePromoProgram(PromoProgramModel promo, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(promo.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PromoProgram, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PromoProgram$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PromoProgram$spKey',
			 TableID_PromoProgram, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PromoProgramModel? > loadPromoProgram(String searchKey) async{
    String searchSql = '';
    PromoProgramModel appList ;
	List<Map>  listuser = [];
	PromoProgramModel? promo;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PromoProgram$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          promo = PromoProgramModel(jsonDecode(map['meta']));
        promo.model.model.cnt = map['cnt'];
		promo.model.model.page = map['page'];
        promo.model.model.age = map['age'];
	    promo.model.model.ttl = map['ttl'];
	    promo.model.model.pht = map['pht'];
	    promo.model.model.sbttl = map['sbttl'];
       // appList.add(program);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PromoProgram$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        promo = PromoProgramModel(jsonDecode(map['meta']));
        promo.model.model.cnt = map['cnt'];
		promo.model.model.page = map['page'];
        promo.model.model.age = map['age'];
	    promo.model.model.ttl = map['ttl'];
	    promo.model.model.pht = map['pht'];
	    promo.model.model.sbttl = map['sbttl'];
        //appList.add(program);
      }
    }

    return promo;
  }
  
   Future<void> deleteAllPromoProgram(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PromoProgram$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PromoProgram$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateExistingUserList(ItemExistingUserModel existing_user) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(existing_user.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ExistingUser, 
		  userID, 
		  existing_user.item!.page,
          existing_user.item!.age,
          existing_user.item!.cnt,
		  existing_user.item!.ttl,
		  existing_user.item!.pht,
		  existing_user.item!.sbttl,
          searchText,
          meta,
          existing_user.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            existing_user.item!.id,
			TableID_ExistingUser,
			userID,
			 existing_user.item!.page,
            existing_user.item!.age,
            existing_user.item!.cnt,
			existing_user.item!.ttl,
		    existing_user.item!.pht,
		    existing_user.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<ExistingUserListingModel> loadExistingUserListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_ExistingUser.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  ExistingUserListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateExistingUserListInfo(ExistingUserListingModel existing_user) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(existing_user.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_ExistingUser,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_ExistingUser,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listExistingUserAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_ExistingUser.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemExistingUserModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemExistingUserModel existing_user = ItemExistingUserModel(jsonDecode(map['meta']));
      existing_user.item!.cnt = map['cnt'];
      existing_user.item!.age = map['age'];
	   existing_user.item!.page = map['page'];
	  existing_user.item!.ttl = map['ttl'];
	  existing_user.item!.pht = map['pht'];
	  existing_user.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(existing_user);
    }
    return age;
  }

  Future<List<ItemExistingUserModel>> loadExistingUserList(String searchKey) async{
    String searchSql = '';
    List<ItemExistingUserModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_ExistingUser.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemExistingUserModel existing_user = ItemExistingUserModel(jsonDecode(map['meta']));
        existing_user.item!.cnt = map['cnt'];
		existing_user.item!.page = map['page'];
        existing_user.item!.age = map['age'];
	    existing_user.item!.ttl = map['ttl'];
	    existing_user.item!.pht = map['pht'];
	    existing_user.item!.sbttl = map['sbttl'];
        appList.add(existing_user);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_ExistingUser.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemExistingUserModel existing_user = ItemExistingUserModel(jsonDecode(map['meta']));
        existing_user.item!.cnt = map['cnt'];
		existing_user.item!.page = map['page'];
        existing_user.item!.age = map['age'];
		existing_user.item!.ttl = map['ttl'];
	    existing_user.item!.pht = map['pht'];
	    existing_user.item!.sbttl = map['sbttl'];
        appList.add(existing_user);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllExistingUserList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_ExistingUser.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateForgotPasswordExistingUser(ForgotPasswordExistingUserModel forgot_password, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(forgot_password.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ForgotPasswordExistingUser, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ForgotPasswordExistingUser$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ForgotPasswordExistingUser$spKey',
			 TableID_ForgotPasswordExistingUser, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ForgotPasswordExistingUserModel? > loadForgotPasswordExistingUser(String searchKey) async{
    String searchSql = '';
    ForgotPasswordExistingUserModel appList ;
	List<Map>  listuser = [];
	ForgotPasswordExistingUserModel? forgot_password;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ForgotPasswordExistingUser$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          forgot_password = ForgotPasswordExistingUserModel(jsonDecode(map['meta']));
        forgot_password.model.model.cnt = map['cnt'];
		forgot_password.model.model.page = map['page'];
        forgot_password.model.model.age = map['age'];
	    forgot_password.model.model.ttl = map['ttl'];
	    forgot_password.model.model.pht = map['pht'];
	    forgot_password.model.model.sbttl = map['sbttl'];
       // appList.add(existing_user);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ForgotPasswordExistingUser$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        forgot_password = ForgotPasswordExistingUserModel(jsonDecode(map['meta']));
        forgot_password.model.model.cnt = map['cnt'];
		forgot_password.model.model.page = map['page'];
        forgot_password.model.model.age = map['age'];
	    forgot_password.model.model.ttl = map['ttl'];
	    forgot_password.model.model.pht = map['pht'];
	    forgot_password.model.model.sbttl = map['sbttl'];
        //appList.add(existing_user);
      }
    }

    return forgot_password;
  }
  
   Future<void> deleteAllForgotPasswordExistingUser(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ForgotPasswordExistingUser$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ForgotPasswordExistingUser$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateResetPasswordExistingUser(ResetPasswordExistingUserModel reset_password, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(reset_password.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ResetPasswordExistingUser, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ResetPasswordExistingUser$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ResetPasswordExistingUser$spKey',
			 TableID_ResetPasswordExistingUser, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ResetPasswordExistingUserModel? > loadResetPasswordExistingUser(String searchKey) async{
    String searchSql = '';
    ResetPasswordExistingUserModel appList ;
	List<Map>  listuser = [];
	ResetPasswordExistingUserModel? reset_password;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ResetPasswordExistingUser$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          reset_password = ResetPasswordExistingUserModel(jsonDecode(map['meta']));
        reset_password.model.model.cnt = map['cnt'];
		reset_password.model.model.page = map['page'];
        reset_password.model.model.age = map['age'];
	    reset_password.model.model.ttl = map['ttl'];
	    reset_password.model.model.pht = map['pht'];
	    reset_password.model.model.sbttl = map['sbttl'];
       // appList.add(existing_user);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ResetPasswordExistingUser$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        reset_password = ResetPasswordExistingUserModel(jsonDecode(map['meta']));
        reset_password.model.model.cnt = map['cnt'];
		reset_password.model.model.page = map['page'];
        reset_password.model.model.age = map['age'];
	    reset_password.model.model.ttl = map['ttl'];
	    reset_password.model.model.pht = map['pht'];
	    reset_password.model.model.sbttl = map['sbttl'];
        //appList.add(existing_user);
      }
    }

    return reset_password;
  }
  
   Future<void> deleteAllResetPasswordExistingUser(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ResetPasswordExistingUser$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ResetPasswordExistingUser$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateSupportList(ItemSupportModel support) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(support.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_Support, 
		  userID, 
		  support.item!.page,
          support.item!.age,
          support.item!.cnt,
		  support.item!.ttl,
		  support.item!.pht,
		  support.item!.sbttl,
          searchText,
          meta,
          support.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            support.item!.id,
			TableID_Support,
			userID,
			 support.item!.page,
            support.item!.age,
            support.item!.cnt,
			support.item!.ttl,
		    support.item!.pht,
		    support.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<SupportListingModel> loadSupportListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_Support.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  SupportListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateSupportListInfo(SupportListingModel support) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(support.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_Support,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_Support,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listSupportAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Support.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemSupportModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemSupportModel support = ItemSupportModel(jsonDecode(map['meta']));
      support.item!.cnt = map['cnt'];
      support.item!.age = map['age'];
	   support.item!.page = map['page'];
	  support.item!.ttl = map['ttl'];
	  support.item!.pht = map['pht'];
	  support.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(support);
    }
    return age;
  }

  Future<List<ItemSupportModel>> loadSupportList(String searchKey) async{
    String searchSql = '';
    List<ItemSupportModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Support.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemSupportModel support = ItemSupportModel(jsonDecode(map['meta']));
        support.item!.cnt = map['cnt'];
		support.item!.page = map['page'];
        support.item!.age = map['age'];
	    support.item!.ttl = map['ttl'];
	    support.item!.pht = map['pht'];
	    support.item!.sbttl = map['sbttl'];
        appList.add(support);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_Support.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemSupportModel support = ItemSupportModel(jsonDecode(map['meta']));
        support.item!.cnt = map['cnt'];
		support.item!.page = map['page'];
        support.item!.age = map['age'];
		support.item!.ttl = map['ttl'];
	    support.item!.pht = map['pht'];
	    support.item!.sbttl = map['sbttl'];
        appList.add(support);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllSupportList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Support.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateContactFormSupport(ContactFormSupportModel contact_form, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(contact_form.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ContactFormSupport, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ContactFormSupport$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ContactFormSupport$spKey',
			 TableID_ContactFormSupport, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ContactFormSupportModel? > loadContactFormSupport(String searchKey) async{
    String searchSql = '';
    ContactFormSupportModel appList ;
	List<Map>  listuser = [];
	ContactFormSupportModel? contact_form;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ContactFormSupport$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          contact_form = ContactFormSupportModel(jsonDecode(map['meta']));
        contact_form.model.model.cnt = map['cnt'];
		contact_form.model.model.page = map['page'];
        contact_form.model.model.age = map['age'];
	    contact_form.model.model.ttl = map['ttl'];
	    contact_form.model.model.pht = map['pht'];
	    contact_form.model.model.sbttl = map['sbttl'];
       // appList.add(support);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ContactFormSupport$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        contact_form = ContactFormSupportModel(jsonDecode(map['meta']));
        contact_form.model.model.cnt = map['cnt'];
		contact_form.model.model.page = map['page'];
        contact_form.model.model.age = map['age'];
	    contact_form.model.model.ttl = map['ttl'];
	    contact_form.model.model.pht = map['pht'];
	    contact_form.model.model.sbttl = map['sbttl'];
        //appList.add(support);
      }
    }

    return contact_form;
  }
  
   Future<void> deleteAllContactFormSupport(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ContactFormSupport$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ContactFormSupport$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateBrowseServicesList(ItemBrowseServicesModel browse_services) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(browse_services.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_BrowseServices, 
		  userID, 
		  browse_services.item!.page,
          browse_services.item!.age,
          browse_services.item!.cnt,
		  browse_services.item!.ttl,
		  browse_services.item!.pht,
		  browse_services.item!.sbttl,
          searchText,
          meta,
          browse_services.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            browse_services.item!.id,
			TableID_BrowseServices,
			userID,
			 browse_services.item!.page,
            browse_services.item!.age,
            browse_services.item!.cnt,
			browse_services.item!.ttl,
		    browse_services.item!.pht,
		    browse_services.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<BrowseServicesListingModel> loadBrowseServicesListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_BrowseServices.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  BrowseServicesListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateBrowseServicesListInfo(BrowseServicesListingModel browse_services) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(browse_services.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_BrowseServices,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_BrowseServices,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listBrowseServicesAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_BrowseServices.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemBrowseServicesModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemBrowseServicesModel browse_services = ItemBrowseServicesModel(jsonDecode(map['meta']));
      browse_services.item!.cnt = map['cnt'];
      browse_services.item!.age = map['age'];
	   browse_services.item!.page = map['page'];
	  browse_services.item!.ttl = map['ttl'];
	  browse_services.item!.pht = map['pht'];
	  browse_services.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(browse_services);
    }
    return age;
  }

  Future<List<ItemBrowseServicesModel>> loadBrowseServicesList(String searchKey) async{
    String searchSql = '';
    List<ItemBrowseServicesModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_BrowseServices.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemBrowseServicesModel browse_services = ItemBrowseServicesModel(jsonDecode(map['meta']));
        browse_services.item!.cnt = map['cnt'];
		browse_services.item!.page = map['page'];
        browse_services.item!.age = map['age'];
	    browse_services.item!.ttl = map['ttl'];
	    browse_services.item!.pht = map['pht'];
	    browse_services.item!.sbttl = map['sbttl'];
        appList.add(browse_services);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_BrowseServices.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemBrowseServicesModel browse_services = ItemBrowseServicesModel(jsonDecode(map['meta']));
        browse_services.item!.cnt = map['cnt'];
		browse_services.item!.page = map['page'];
        browse_services.item!.age = map['age'];
		browse_services.item!.ttl = map['ttl'];
	    browse_services.item!.pht = map['pht'];
	    browse_services.item!.sbttl = map['sbttl'];
        appList.add(browse_services);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllBrowseServicesList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_BrowseServices.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdatePlaceOrderBrowseServices(PlaceOrderBrowseServicesModel place_order, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(place_order.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PlaceOrderBrowseServices, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PlaceOrderBrowseServices$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PlaceOrderBrowseServices$spKey',
			 TableID_PlaceOrderBrowseServices, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PlaceOrderBrowseServicesModel? > loadPlaceOrderBrowseServices(String searchKey) async{
    String searchSql = '';
    PlaceOrderBrowseServicesModel appList ;
	List<Map>  listuser = [];
	PlaceOrderBrowseServicesModel? place_order;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PlaceOrderBrowseServices$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          place_order = PlaceOrderBrowseServicesModel(jsonDecode(map['meta']));
        place_order.model.model.cnt = map['cnt'];
		place_order.model.model.page = map['page'];
        place_order.model.model.age = map['age'];
	    place_order.model.model.ttl = map['ttl'];
	    place_order.model.model.pht = map['pht'];
	    place_order.model.model.sbttl = map['sbttl'];
       // appList.add(browse_services);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PlaceOrderBrowseServices$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        place_order = PlaceOrderBrowseServicesModel(jsonDecode(map['meta']));
        place_order.model.model.cnt = map['cnt'];
		place_order.model.model.page = map['page'];
        place_order.model.model.age = map['age'];
	    place_order.model.model.ttl = map['ttl'];
	    place_order.model.model.pht = map['pht'];
	    place_order.model.model.sbttl = map['sbttl'];
        //appList.add(browse_services);
      }
    }

    return place_order;
  }
  
   Future<void> deleteAllPlaceOrderBrowseServices(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PlaceOrderBrowseServices$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PlaceOrderBrowseServices$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateBrowseUsersList(ItemBrowseUsersModel browse_users) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(browse_users.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_BrowseUsers, 
		  userID, 
		  browse_users.item!.page,
          browse_users.item!.age,
          browse_users.item!.cnt,
		  browse_users.item!.ttl,
		  browse_users.item!.pht,
		  browse_users.item!.sbttl,
          searchText,
          meta,
          browse_users.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            browse_users.item!.id,
			TableID_BrowseUsers,
			userID,
			 browse_users.item!.page,
            browse_users.item!.age,
            browse_users.item!.cnt,
			browse_users.item!.ttl,
		    browse_users.item!.pht,
		    browse_users.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<BrowseUsersListingModel> loadBrowseUsersListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_BrowseUsers.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  BrowseUsersListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateBrowseUsersListInfo(BrowseUsersListingModel browse_users) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(browse_users.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_BrowseUsers,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_BrowseUsers,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listBrowseUsersAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_BrowseUsers.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemBrowseUsersModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemBrowseUsersModel browse_users = ItemBrowseUsersModel(jsonDecode(map['meta']));
      browse_users.item!.cnt = map['cnt'];
      browse_users.item!.age = map['age'];
	   browse_users.item!.page = map['page'];
	  browse_users.item!.ttl = map['ttl'];
	  browse_users.item!.pht = map['pht'];
	  browse_users.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(browse_users);
    }
    return age;
  }

  Future<List<ItemBrowseUsersModel>> loadBrowseUsersList(String searchKey) async{
    String searchSql = '';
    List<ItemBrowseUsersModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_BrowseUsers.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemBrowseUsersModel browse_users = ItemBrowseUsersModel(jsonDecode(map['meta']));
        browse_users.item!.cnt = map['cnt'];
		browse_users.item!.page = map['page'];
        browse_users.item!.age = map['age'];
	    browse_users.item!.ttl = map['ttl'];
	    browse_users.item!.pht = map['pht'];
	    browse_users.item!.sbttl = map['sbttl'];
        appList.add(browse_users);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_BrowseUsers.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemBrowseUsersModel browse_users = ItemBrowseUsersModel(jsonDecode(map['meta']));
        browse_users.item!.cnt = map['cnt'];
		browse_users.item!.page = map['page'];
        browse_users.item!.age = map['age'];
		browse_users.item!.ttl = map['ttl'];
	    browse_users.item!.pht = map['pht'];
	    browse_users.item!.sbttl = map['sbttl'];
        appList.add(browse_users);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllBrowseUsersList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_BrowseUsers.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateInviteToBidBrowseUsers(InviteToBidBrowseUsersModel invite_to_bid, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(invite_to_bid.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_InviteToBidBrowseUsers, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'InviteToBidBrowseUsers$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'InviteToBidBrowseUsers$spKey',
			 TableID_InviteToBidBrowseUsers, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<InviteToBidBrowseUsersModel? > loadInviteToBidBrowseUsers(String searchKey) async{
    String searchSql = '';
    InviteToBidBrowseUsersModel appList ;
	List<Map>  listuser = [];
	InviteToBidBrowseUsersModel? invite_to_bid;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'InviteToBidBrowseUsers$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          invite_to_bid = InviteToBidBrowseUsersModel(jsonDecode(map['meta']));
        invite_to_bid.model.model.cnt = map['cnt'];
		invite_to_bid.model.model.page = map['page'];
        invite_to_bid.model.model.age = map['age'];
	    invite_to_bid.model.model.ttl = map['ttl'];
	    invite_to_bid.model.model.pht = map['pht'];
	    invite_to_bid.model.model.sbttl = map['sbttl'];
       // appList.add(browse_users);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'InviteToBidBrowseUsers$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        invite_to_bid = InviteToBidBrowseUsersModel(jsonDecode(map['meta']));
        invite_to_bid.model.model.cnt = map['cnt'];
		invite_to_bid.model.model.page = map['page'];
        invite_to_bid.model.model.age = map['age'];
	    invite_to_bid.model.model.ttl = map['ttl'];
	    invite_to_bid.model.model.pht = map['pht'];
	    invite_to_bid.model.model.sbttl = map['sbttl'];
        //appList.add(browse_users);
      }
    }

    return invite_to_bid;
  }
  
   Future<void> deleteAllInviteToBidBrowseUsers(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'InviteToBidBrowseUsers$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'InviteToBidBrowseUsers$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateHireMeBrowseUsers(HireMeBrowseUsersModel hire_me, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(hire_me.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_HireMeBrowseUsers, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'HireMeBrowseUsers$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'HireMeBrowseUsers$spKey',
			 TableID_HireMeBrowseUsers, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<HireMeBrowseUsersModel? > loadHireMeBrowseUsers(String searchKey) async{
    String searchSql = '';
    HireMeBrowseUsersModel appList ;
	List<Map>  listuser = [];
	HireMeBrowseUsersModel? hire_me;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'HireMeBrowseUsers$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          hire_me = HireMeBrowseUsersModel(jsonDecode(map['meta']));
        hire_me.model.model.cnt = map['cnt'];
		hire_me.model.model.page = map['page'];
        hire_me.model.model.age = map['age'];
	    hire_me.model.model.ttl = map['ttl'];
	    hire_me.model.model.pht = map['pht'];
	    hire_me.model.model.sbttl = map['sbttl'];
       // appList.add(browse_users);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'HireMeBrowseUsers$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        hire_me = HireMeBrowseUsersModel(jsonDecode(map['meta']));
        hire_me.model.model.cnt = map['cnt'];
		hire_me.model.model.page = map['page'];
        hire_me.model.model.age = map['age'];
	    hire_me.model.model.ttl = map['ttl'];
	    hire_me.model.model.pht = map['pht'];
	    hire_me.model.model.sbttl = map['sbttl'];
        //appList.add(browse_users);
      }
    }

    return hire_me;
  }
  
   Future<void> deleteAllHireMeBrowseUsers(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'HireMeBrowseUsers$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'HireMeBrowseUsers$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateBrowseProductsList(ItemBrowseProductsModel browse_products) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(browse_products.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_BrowseProducts, 
		  userID, 
		  browse_products.item!.page,
          browse_products.item!.age,
          browse_products.item!.cnt,
		  browse_products.item!.ttl,
		  browse_products.item!.pht,
		  browse_products.item!.sbttl,
          searchText,
          meta,
          browse_products.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            browse_products.item!.id,
			TableID_BrowseProducts,
			userID,
			 browse_products.item!.page,
            browse_products.item!.age,
            browse_products.item!.cnt,
			browse_products.item!.ttl,
		    browse_products.item!.pht,
		    browse_products.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<BrowseProductsListingModel> loadBrowseProductsListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_BrowseProducts.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  BrowseProductsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateBrowseProductsListInfo(BrowseProductsListingModel browse_products) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(browse_products.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_BrowseProducts,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_BrowseProducts,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listBrowseProductsAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_BrowseProducts.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemBrowseProductsModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemBrowseProductsModel browse_products = ItemBrowseProductsModel(jsonDecode(map['meta']));
      browse_products.item!.cnt = map['cnt'];
      browse_products.item!.age = map['age'];
	   browse_products.item!.page = map['page'];
	  browse_products.item!.ttl = map['ttl'];
	  browse_products.item!.pht = map['pht'];
	  browse_products.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(browse_products);
    }
    return age;
  }

  Future<List<ItemBrowseProductsModel>> loadBrowseProductsList(String searchKey) async{
    String searchSql = '';
    List<ItemBrowseProductsModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_BrowseProducts.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemBrowseProductsModel browse_products = ItemBrowseProductsModel(jsonDecode(map['meta']));
        browse_products.item!.cnt = map['cnt'];
		browse_products.item!.page = map['page'];
        browse_products.item!.age = map['age'];
	    browse_products.item!.ttl = map['ttl'];
	    browse_products.item!.pht = map['pht'];
	    browse_products.item!.sbttl = map['sbttl'];
        appList.add(browse_products);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_BrowseProducts.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemBrowseProductsModel browse_products = ItemBrowseProductsModel(jsonDecode(map['meta']));
        browse_products.item!.cnt = map['cnt'];
		browse_products.item!.page = map['page'];
        browse_products.item!.age = map['age'];
		browse_products.item!.ttl = map['ttl'];
	    browse_products.item!.pht = map['pht'];
	    browse_products.item!.sbttl = map['sbttl'];
        appList.add(browse_products);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllBrowseProductsList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_BrowseProducts.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateAddToCartBrowseProducts(AddToCartBrowseProductsModel add_to_cart, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(add_to_cart.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_AddToCartBrowseProducts, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'AddToCartBrowseProducts$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'AddToCartBrowseProducts$spKey',
			 TableID_AddToCartBrowseProducts, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<AddToCartBrowseProductsModel? > loadAddToCartBrowseProducts(String searchKey) async{
    String searchSql = '';
    AddToCartBrowseProductsModel appList ;
	List<Map>  listuser = [];
	AddToCartBrowseProductsModel? add_to_cart;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'AddToCartBrowseProducts$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          add_to_cart = AddToCartBrowseProductsModel(jsonDecode(map['meta']));
        add_to_cart.model.model.cnt = map['cnt'];
		add_to_cart.model.model.page = map['page'];
        add_to_cart.model.model.age = map['age'];
	    add_to_cart.model.model.ttl = map['ttl'];
	    add_to_cart.model.model.pht = map['pht'];
	    add_to_cart.model.model.sbttl = map['sbttl'];
       // appList.add(browse_products);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'AddToCartBrowseProducts$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        add_to_cart = AddToCartBrowseProductsModel(jsonDecode(map['meta']));
        add_to_cart.model.model.cnt = map['cnt'];
		add_to_cart.model.model.page = map['page'];
        add_to_cart.model.model.age = map['age'];
	    add_to_cart.model.model.ttl = map['ttl'];
	    add_to_cart.model.model.pht = map['pht'];
	    add_to_cart.model.model.sbttl = map['sbttl'];
        //appList.add(browse_products);
      }
    }

    return add_to_cart;
  }
  
   Future<void> deleteAllAddToCartBrowseProducts(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AddToCartBrowseProducts$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AddToCartBrowseProducts$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateCartList(ItemCartModel cart) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(cart.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_Cart, 
		  userID, 
		  cart.item!.page,
          cart.item!.age,
          cart.item!.cnt,
		  cart.item!.ttl,
		  cart.item!.pht,
		  cart.item!.sbttl,
          searchText,
          meta,
          cart.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            cart.item!.id,
			TableID_Cart,
			userID,
			 cart.item!.page,
            cart.item!.age,
            cart.item!.cnt,
			cart.item!.ttl,
		    cart.item!.pht,
		    cart.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<CartListingModel> loadCartListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_Cart.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  CartListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateCartListInfo(CartListingModel cart) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(cart.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_Cart,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_Cart,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listCartAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Cart.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemCartModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemCartModel cart = ItemCartModel(jsonDecode(map['meta']));
      cart.item!.cnt = map['cnt'];
      cart.item!.age = map['age'];
	   cart.item!.page = map['page'];
	  cart.item!.ttl = map['ttl'];
	  cart.item!.pht = map['pht'];
	  cart.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(cart);
    }
    return age;
  }

  Future<List<ItemCartModel>> loadCartList(String searchKey) async{
    String searchSql = '';
    List<ItemCartModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Cart.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemCartModel cart = ItemCartModel(jsonDecode(map['meta']));
        cart.item!.cnt = map['cnt'];
		cart.item!.page = map['page'];
        cart.item!.age = map['age'];
	    cart.item!.ttl = map['ttl'];
	    cart.item!.pht = map['pht'];
	    cart.item!.sbttl = map['sbttl'];
        appList.add(cart);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_Cart.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemCartModel cart = ItemCartModel(jsonDecode(map['meta']));
        cart.item!.cnt = map['cnt'];
		cart.item!.page = map['page'];
        cart.item!.age = map['age'];
		cart.item!.ttl = map['ttl'];
	    cart.item!.pht = map['pht'];
	    cart.item!.sbttl = map['sbttl'];
        appList.add(cart);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllCartList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Cart.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateEmptyCartCart(EmptyCartCartModel empty_cart, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(empty_cart.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_EmptyCartCart, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'EmptyCartCart$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'EmptyCartCart$spKey',
			 TableID_EmptyCartCart, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<EmptyCartCartModel? > loadEmptyCartCart(String searchKey) async{
    String searchSql = '';
    EmptyCartCartModel appList ;
	List<Map>  listuser = [];
	EmptyCartCartModel? empty_cart;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'EmptyCartCart$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          empty_cart = EmptyCartCartModel(jsonDecode(map['meta']));
        empty_cart.model.model.cnt = map['cnt'];
		empty_cart.model.model.page = map['page'];
        empty_cart.model.model.age = map['age'];
	    empty_cart.model.model.ttl = map['ttl'];
	    empty_cart.model.model.pht = map['pht'];
	    empty_cart.model.model.sbttl = map['sbttl'];
       // appList.add(cart);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'EmptyCartCart$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        empty_cart = EmptyCartCartModel(jsonDecode(map['meta']));
        empty_cart.model.model.cnt = map['cnt'];
		empty_cart.model.model.page = map['page'];
        empty_cart.model.model.age = map['age'];
	    empty_cart.model.model.ttl = map['ttl'];
	    empty_cart.model.model.pht = map['pht'];
	    empty_cart.model.model.sbttl = map['sbttl'];
        //appList.add(cart);
      }
    }

    return empty_cart;
  }
  
   Future<void> deleteAllEmptyCartCart(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EmptyCartCart$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EmptyCartCart$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateApplyCouponCart(ApplyCouponCartModel apply_coupon, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(apply_coupon.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ApplyCouponCart, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ApplyCouponCart$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ApplyCouponCart$spKey',
			 TableID_ApplyCouponCart, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ApplyCouponCartModel? > loadApplyCouponCart(String searchKey) async{
    String searchSql = '';
    ApplyCouponCartModel appList ;
	List<Map>  listuser = [];
	ApplyCouponCartModel? apply_coupon;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ApplyCouponCart$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          apply_coupon = ApplyCouponCartModel(jsonDecode(map['meta']));
        apply_coupon.model.model.cnt = map['cnt'];
		apply_coupon.model.model.page = map['page'];
        apply_coupon.model.model.age = map['age'];
	    apply_coupon.model.model.ttl = map['ttl'];
	    apply_coupon.model.model.pht = map['pht'];
	    apply_coupon.model.model.sbttl = map['sbttl'];
       // appList.add(cart);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ApplyCouponCart$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        apply_coupon = ApplyCouponCartModel(jsonDecode(map['meta']));
        apply_coupon.model.model.cnt = map['cnt'];
		apply_coupon.model.model.page = map['page'];
        apply_coupon.model.model.age = map['age'];
	    apply_coupon.model.model.ttl = map['ttl'];
	    apply_coupon.model.model.pht = map['pht'];
	    apply_coupon.model.model.sbttl = map['sbttl'];
        //appList.add(cart);
      }
    }

    return apply_coupon;
  }
  
   Future<void> deleteAllApplyCouponCart(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ApplyCouponCart$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ApplyCouponCart$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateCheckoutList(ItemCheckoutModel checkout) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(checkout.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_Checkout, 
		  userID, 
		  checkout.item!.page,
          checkout.item!.age,
          checkout.item!.cnt,
		  checkout.item!.ttl,
		  checkout.item!.pht,
		  checkout.item!.sbttl,
          searchText,
          meta,
          checkout.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            checkout.item!.id,
			TableID_Checkout,
			userID,
			 checkout.item!.page,
            checkout.item!.age,
            checkout.item!.cnt,
			checkout.item!.ttl,
		    checkout.item!.pht,
		    checkout.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<CheckoutListingModel> loadCheckoutListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_Checkout.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  CheckoutListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateCheckoutListInfo(CheckoutListingModel checkout) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(checkout.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_Checkout,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_Checkout,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listCheckoutAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Checkout.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemCheckoutModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemCheckoutModel checkout = ItemCheckoutModel(jsonDecode(map['meta']));
      checkout.item!.cnt = map['cnt'];
      checkout.item!.age = map['age'];
	   checkout.item!.page = map['page'];
	  checkout.item!.ttl = map['ttl'];
	  checkout.item!.pht = map['pht'];
	  checkout.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(checkout);
    }
    return age;
  }

  Future<List<ItemCheckoutModel>> loadCheckoutList(String searchKey) async{
    String searchSql = '';
    List<ItemCheckoutModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Checkout.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemCheckoutModel checkout = ItemCheckoutModel(jsonDecode(map['meta']));
        checkout.item!.cnt = map['cnt'];
		checkout.item!.page = map['page'];
        checkout.item!.age = map['age'];
	    checkout.item!.ttl = map['ttl'];
	    checkout.item!.pht = map['pht'];
	    checkout.item!.sbttl = map['sbttl'];
        appList.add(checkout);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_Checkout.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemCheckoutModel checkout = ItemCheckoutModel(jsonDecode(map['meta']));
        checkout.item!.cnt = map['cnt'];
		checkout.item!.page = map['page'];
        checkout.item!.age = map['age'];
		checkout.item!.ttl = map['ttl'];
	    checkout.item!.pht = map['pht'];
	    checkout.item!.sbttl = map['sbttl'];
        appList.add(checkout);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllCheckoutList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Checkout.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdatePayWithAvailableBalanceCheckout(PayWithAvailableBalanceCheckoutModel pay_with_available_balance, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(pay_with_available_balance.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PayWithAvailableBalanceCheckout, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PayWithAvailableBalanceCheckout$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PayWithAvailableBalanceCheckout$spKey',
			 TableID_PayWithAvailableBalanceCheckout, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PayWithAvailableBalanceCheckoutModel? > loadPayWithAvailableBalanceCheckout(String searchKey) async{
    String searchSql = '';
    PayWithAvailableBalanceCheckoutModel appList ;
	List<Map>  listuser = [];
	PayWithAvailableBalanceCheckoutModel? pay_with_available_balance;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PayWithAvailableBalanceCheckout$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          pay_with_available_balance = PayWithAvailableBalanceCheckoutModel(jsonDecode(map['meta']));
        pay_with_available_balance.model.model.cnt = map['cnt'];
		pay_with_available_balance.model.model.page = map['page'];
        pay_with_available_balance.model.model.age = map['age'];
	    pay_with_available_balance.model.model.ttl = map['ttl'];
	    pay_with_available_balance.model.model.pht = map['pht'];
	    pay_with_available_balance.model.model.sbttl = map['sbttl'];
       // appList.add(checkout);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PayWithAvailableBalanceCheckout$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        pay_with_available_balance = PayWithAvailableBalanceCheckoutModel(jsonDecode(map['meta']));
        pay_with_available_balance.model.model.cnt = map['cnt'];
		pay_with_available_balance.model.model.page = map['page'];
        pay_with_available_balance.model.model.age = map['age'];
	    pay_with_available_balance.model.model.ttl = map['ttl'];
	    pay_with_available_balance.model.model.pht = map['pht'];
	    pay_with_available_balance.model.model.sbttl = map['sbttl'];
        //appList.add(checkout);
      }
    }

    return pay_with_available_balance;
  }
  
   Future<void> deleteAllPayWithAvailableBalanceCheckout(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithAvailableBalanceCheckout$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithAvailableBalanceCheckout$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePayViaBankTransferCheckout(PayViaBankTransferCheckoutModel pay_via_bank_transfer, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(pay_via_bank_transfer.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PayViaBankTransferCheckout, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PayViaBankTransferCheckout$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PayViaBankTransferCheckout$spKey',
			 TableID_PayViaBankTransferCheckout, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PayViaBankTransferCheckoutModel? > loadPayViaBankTransferCheckout(String searchKey) async{
    String searchSql = '';
    PayViaBankTransferCheckoutModel appList ;
	List<Map>  listuser = [];
	PayViaBankTransferCheckoutModel? pay_via_bank_transfer;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PayViaBankTransferCheckout$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          pay_via_bank_transfer = PayViaBankTransferCheckoutModel(jsonDecode(map['meta']));
        pay_via_bank_transfer.model.model.cnt = map['cnt'];
		pay_via_bank_transfer.model.model.page = map['page'];
        pay_via_bank_transfer.model.model.age = map['age'];
	    pay_via_bank_transfer.model.model.ttl = map['ttl'];
	    pay_via_bank_transfer.model.model.pht = map['pht'];
	    pay_via_bank_transfer.model.model.sbttl = map['sbttl'];
       // appList.add(checkout);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PayViaBankTransferCheckout$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        pay_via_bank_transfer = PayViaBankTransferCheckoutModel(jsonDecode(map['meta']));
        pay_via_bank_transfer.model.model.cnt = map['cnt'];
		pay_via_bank_transfer.model.model.page = map['page'];
        pay_via_bank_transfer.model.model.age = map['age'];
	    pay_via_bank_transfer.model.model.ttl = map['ttl'];
	    pay_via_bank_transfer.model.model.pht = map['pht'];
	    pay_via_bank_transfer.model.model.sbttl = map['sbttl'];
        //appList.add(checkout);
      }
    }

    return pay_via_bank_transfer;
  }
  
   Future<void> deleteAllPayViaBankTransferCheckout(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayViaBankTransferCheckout$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayViaBankTransferCheckout$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePayWithCreditCardCheckout(PayWithCreditCardCheckoutModel pay_with_credit_card, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(pay_with_credit_card.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PayWithCreditCardCheckout, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PayWithCreditCardCheckout$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PayWithCreditCardCheckout$spKey',
			 TableID_PayWithCreditCardCheckout, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PayWithCreditCardCheckoutModel? > loadPayWithCreditCardCheckout(String searchKey) async{
    String searchSql = '';
    PayWithCreditCardCheckoutModel appList ;
	List<Map>  listuser = [];
	PayWithCreditCardCheckoutModel? pay_with_credit_card;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PayWithCreditCardCheckout$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          pay_with_credit_card = PayWithCreditCardCheckoutModel(jsonDecode(map['meta']));
        pay_with_credit_card.model.model.cnt = map['cnt'];
		pay_with_credit_card.model.model.page = map['page'];
        pay_with_credit_card.model.model.age = map['age'];
	    pay_with_credit_card.model.model.ttl = map['ttl'];
	    pay_with_credit_card.model.model.pht = map['pht'];
	    pay_with_credit_card.model.model.sbttl = map['sbttl'];
       // appList.add(checkout);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PayWithCreditCardCheckout$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        pay_with_credit_card = PayWithCreditCardCheckoutModel(jsonDecode(map['meta']));
        pay_with_credit_card.model.model.cnt = map['cnt'];
		pay_with_credit_card.model.model.page = map['page'];
        pay_with_credit_card.model.model.age = map['age'];
	    pay_with_credit_card.model.model.ttl = map['ttl'];
	    pay_with_credit_card.model.model.pht = map['pht'];
	    pay_with_credit_card.model.model.sbttl = map['sbttl'];
        //appList.add(checkout);
      }
    }

    return pay_with_credit_card;
  }
  
   Future<void> deleteAllPayWithCreditCardCheckout(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithCreditCardCheckout$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithCreditCardCheckout$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePayWithCimbClicksCheckout(PayWithCimbClicksCheckoutModel pay_with_cimb_clicks, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(pay_with_cimb_clicks.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PayWithCimbClicksCheckout, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PayWithCimbClicksCheckout$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PayWithCimbClicksCheckout$spKey',
			 TableID_PayWithCimbClicksCheckout, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PayWithCimbClicksCheckoutModel? > loadPayWithCimbClicksCheckout(String searchKey) async{
    String searchSql = '';
    PayWithCimbClicksCheckoutModel appList ;
	List<Map>  listuser = [];
	PayWithCimbClicksCheckoutModel? pay_with_cimb_clicks;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PayWithCimbClicksCheckout$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          pay_with_cimb_clicks = PayWithCimbClicksCheckoutModel(jsonDecode(map['meta']));
        pay_with_cimb_clicks.model.model.cnt = map['cnt'];
		pay_with_cimb_clicks.model.model.page = map['page'];
        pay_with_cimb_clicks.model.model.age = map['age'];
	    pay_with_cimb_clicks.model.model.ttl = map['ttl'];
	    pay_with_cimb_clicks.model.model.pht = map['pht'];
	    pay_with_cimb_clicks.model.model.sbttl = map['sbttl'];
       // appList.add(checkout);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PayWithCimbClicksCheckout$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        pay_with_cimb_clicks = PayWithCimbClicksCheckoutModel(jsonDecode(map['meta']));
        pay_with_cimb_clicks.model.model.cnt = map['cnt'];
		pay_with_cimb_clicks.model.model.page = map['page'];
        pay_with_cimb_clicks.model.model.age = map['age'];
	    pay_with_cimb_clicks.model.model.ttl = map['ttl'];
	    pay_with_cimb_clicks.model.model.pht = map['pht'];
	    pay_with_cimb_clicks.model.model.sbttl = map['sbttl'];
        //appList.add(checkout);
      }
    }

    return pay_with_cimb_clicks;
  }
  
   Future<void> deleteAllPayWithCimbClicksCheckout(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithCimbClicksCheckout$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithCimbClicksCheckout$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePayWithBcaKlikpayCheckout(PayWithBcaKlikpayCheckoutModel pay_with_bca_klikpay, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(pay_with_bca_klikpay.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PayWithBcaKlikpayCheckout, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PayWithBcaKlikpayCheckout$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PayWithBcaKlikpayCheckout$spKey',
			 TableID_PayWithBcaKlikpayCheckout, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PayWithBcaKlikpayCheckoutModel? > loadPayWithBcaKlikpayCheckout(String searchKey) async{
    String searchSql = '';
    PayWithBcaKlikpayCheckoutModel appList ;
	List<Map>  listuser = [];
	PayWithBcaKlikpayCheckoutModel? pay_with_bca_klikpay;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PayWithBcaKlikpayCheckout$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          pay_with_bca_klikpay = PayWithBcaKlikpayCheckoutModel(jsonDecode(map['meta']));
        pay_with_bca_klikpay.model.model.cnt = map['cnt'];
		pay_with_bca_klikpay.model.model.page = map['page'];
        pay_with_bca_klikpay.model.model.age = map['age'];
	    pay_with_bca_klikpay.model.model.ttl = map['ttl'];
	    pay_with_bca_klikpay.model.model.pht = map['pht'];
	    pay_with_bca_klikpay.model.model.sbttl = map['sbttl'];
       // appList.add(checkout);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PayWithBcaKlikpayCheckout$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        pay_with_bca_klikpay = PayWithBcaKlikpayCheckoutModel(jsonDecode(map['meta']));
        pay_with_bca_klikpay.model.model.cnt = map['cnt'];
		pay_with_bca_klikpay.model.model.page = map['page'];
        pay_with_bca_klikpay.model.model.age = map['age'];
	    pay_with_bca_klikpay.model.model.ttl = map['ttl'];
	    pay_with_bca_klikpay.model.model.pht = map['pht'];
	    pay_with_bca_klikpay.model.model.sbttl = map['sbttl'];
        //appList.add(checkout);
      }
    }

    return pay_with_bca_klikpay;
  }
  
   Future<void> deleteAllPayWithBcaKlikpayCheckout(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithBcaKlikpayCheckout$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithBcaKlikpayCheckout$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePayWithMandiriClickpayCheckout(PayWithMandiriClickpayCheckoutModel pay_with_mandiri_clickpay, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(pay_with_mandiri_clickpay.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PayWithMandiriClickpayCheckout, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PayWithMandiriClickpayCheckout$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PayWithMandiriClickpayCheckout$spKey',
			 TableID_PayWithMandiriClickpayCheckout, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PayWithMandiriClickpayCheckoutModel? > loadPayWithMandiriClickpayCheckout(String searchKey) async{
    String searchSql = '';
    PayWithMandiriClickpayCheckoutModel appList ;
	List<Map>  listuser = [];
	PayWithMandiriClickpayCheckoutModel? pay_with_mandiri_clickpay;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PayWithMandiriClickpayCheckout$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          pay_with_mandiri_clickpay = PayWithMandiriClickpayCheckoutModel(jsonDecode(map['meta']));
        pay_with_mandiri_clickpay.model.model.cnt = map['cnt'];
		pay_with_mandiri_clickpay.model.model.page = map['page'];
        pay_with_mandiri_clickpay.model.model.age = map['age'];
	    pay_with_mandiri_clickpay.model.model.ttl = map['ttl'];
	    pay_with_mandiri_clickpay.model.model.pht = map['pht'];
	    pay_with_mandiri_clickpay.model.model.sbttl = map['sbttl'];
       // appList.add(checkout);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PayWithMandiriClickpayCheckout$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        pay_with_mandiri_clickpay = PayWithMandiriClickpayCheckoutModel(jsonDecode(map['meta']));
        pay_with_mandiri_clickpay.model.model.cnt = map['cnt'];
		pay_with_mandiri_clickpay.model.model.page = map['page'];
        pay_with_mandiri_clickpay.model.model.age = map['age'];
	    pay_with_mandiri_clickpay.model.model.ttl = map['ttl'];
	    pay_with_mandiri_clickpay.model.model.pht = map['pht'];
	    pay_with_mandiri_clickpay.model.model.sbttl = map['sbttl'];
        //appList.add(checkout);
      }
    }

    return pay_with_mandiri_clickpay;
  }
  
   Future<void> deleteAllPayWithMandiriClickpayCheckout(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithMandiriClickpayCheckout$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithMandiriClickpayCheckout$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePayWithQrisCheckout(PayWithQrisCheckoutModel pay_with_qris, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(pay_with_qris.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PayWithQrisCheckout, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PayWithQrisCheckout$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PayWithQrisCheckout$spKey',
			 TableID_PayWithQrisCheckout, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PayWithQrisCheckoutModel? > loadPayWithQrisCheckout(String searchKey) async{
    String searchSql = '';
    PayWithQrisCheckoutModel appList ;
	List<Map>  listuser = [];
	PayWithQrisCheckoutModel? pay_with_qris;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PayWithQrisCheckout$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          pay_with_qris = PayWithQrisCheckoutModel(jsonDecode(map['meta']));
        pay_with_qris.model.model.cnt = map['cnt'];
		pay_with_qris.model.model.page = map['page'];
        pay_with_qris.model.model.age = map['age'];
	    pay_with_qris.model.model.ttl = map['ttl'];
	    pay_with_qris.model.model.pht = map['pht'];
	    pay_with_qris.model.model.sbttl = map['sbttl'];
       // appList.add(checkout);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PayWithQrisCheckout$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        pay_with_qris = PayWithQrisCheckoutModel(jsonDecode(map['meta']));
        pay_with_qris.model.model.cnt = map['cnt'];
		pay_with_qris.model.model.page = map['page'];
        pay_with_qris.model.model.age = map['age'];
	    pay_with_qris.model.model.ttl = map['ttl'];
	    pay_with_qris.model.model.pht = map['pht'];
	    pay_with_qris.model.model.sbttl = map['sbttl'];
        //appList.add(checkout);
      }
    }

    return pay_with_qris;
  }
  
   Future<void> deleteAllPayWithQrisCheckout(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithQrisCheckout$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithQrisCheckout$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePayWithPaypalCheckout(PayWithPaypalCheckoutModel pay_with_paypal, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(pay_with_paypal.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PayWithPaypalCheckout, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PayWithPaypalCheckout$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PayWithPaypalCheckout$spKey',
			 TableID_PayWithPaypalCheckout, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PayWithPaypalCheckoutModel? > loadPayWithPaypalCheckout(String searchKey) async{
    String searchSql = '';
    PayWithPaypalCheckoutModel appList ;
	List<Map>  listuser = [];
	PayWithPaypalCheckoutModel? pay_with_paypal;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PayWithPaypalCheckout$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          pay_with_paypal = PayWithPaypalCheckoutModel(jsonDecode(map['meta']));
        pay_with_paypal.model.model.cnt = map['cnt'];
		pay_with_paypal.model.model.page = map['page'];
        pay_with_paypal.model.model.age = map['age'];
	    pay_with_paypal.model.model.ttl = map['ttl'];
	    pay_with_paypal.model.model.pht = map['pht'];
	    pay_with_paypal.model.model.sbttl = map['sbttl'];
       // appList.add(checkout);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PayWithPaypalCheckout$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        pay_with_paypal = PayWithPaypalCheckoutModel(jsonDecode(map['meta']));
        pay_with_paypal.model.model.cnt = map['cnt'];
		pay_with_paypal.model.model.page = map['page'];
        pay_with_paypal.model.model.age = map['age'];
	    pay_with_paypal.model.model.ttl = map['ttl'];
	    pay_with_paypal.model.model.pht = map['pht'];
	    pay_with_paypal.model.model.sbttl = map['sbttl'];
        //appList.add(checkout);
      }
    }

    return pay_with_paypal;
  }
  
   Future<void> deleteAllPayWithPaypalCheckout(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithPaypalCheckout$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PayWithPaypalCheckout$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateBlogList(ItemBlogModel blog) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(blog.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_Blog, 
		  userID, 
		  blog.item!.page,
          blog.item!.age,
          blog.item!.cnt,
		  blog.item!.ttl,
		  blog.item!.pht,
		  blog.item!.sbttl,
          searchText,
          meta,
          blog.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            blog.item!.id,
			TableID_Blog,
			userID,
			 blog.item!.page,
            blog.item!.age,
            blog.item!.cnt,
			blog.item!.ttl,
		    blog.item!.pht,
		    blog.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<BlogListingModel> loadBlogListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_Blog.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  BlogListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateBlogListInfo(BlogListingModel blog) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(blog.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_Blog,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_Blog,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listBlogAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Blog.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemBlogModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemBlogModel blog = ItemBlogModel(jsonDecode(map['meta']));
      blog.item!.cnt = map['cnt'];
      blog.item!.age = map['age'];
	   blog.item!.page = map['page'];
	  blog.item!.ttl = map['ttl'];
	  blog.item!.pht = map['pht'];
	  blog.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(blog);
    }
    return age;
  }

  Future<List<ItemBlogModel>> loadBlogList(String searchKey) async{
    String searchSql = '';
    List<ItemBlogModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Blog.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemBlogModel blog = ItemBlogModel(jsonDecode(map['meta']));
        blog.item!.cnt = map['cnt'];
		blog.item!.page = map['page'];
        blog.item!.age = map['age'];
	    blog.item!.ttl = map['ttl'];
	    blog.item!.pht = map['pht'];
	    blog.item!.sbttl = map['sbttl'];
        appList.add(blog);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_Blog.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemBlogModel blog = ItemBlogModel(jsonDecode(map['meta']));
        blog.item!.cnt = map['cnt'];
		blog.item!.page = map['page'];
        blog.item!.age = map['age'];
		blog.item!.ttl = map['ttl'];
	    blog.item!.pht = map['pht'];
	    blog.item!.sbttl = map['sbttl'];
        appList.add(blog);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllBlogList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Blog.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateMyProjectsList(ItemMyProjectsModel my_projects) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_projects.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyProjects, 
		  userID, 
		  my_projects.item!.page,
          my_projects.item!.age,
          my_projects.item!.cnt,
		  my_projects.item!.ttl,
		  my_projects.item!.pht,
		  my_projects.item!.sbttl,
          searchText,
          meta,
          my_projects.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_projects.item!.id,
			TableID_MyProjects,
			userID,
			 my_projects.item!.page,
            my_projects.item!.age,
            my_projects.item!.cnt,
			my_projects.item!.ttl,
		    my_projects.item!.pht,
		    my_projects.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyProjectsListingModel> loadMyProjectsListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyProjects.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyProjectsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyProjectsListInfo(MyProjectsListingModel my_projects) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_projects.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyProjects,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyProjects,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyProjectsAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyProjects.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyProjectsModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyProjectsModel my_projects = ItemMyProjectsModel(jsonDecode(map['meta']));
      my_projects.item!.cnt = map['cnt'];
      my_projects.item!.age = map['age'];
	   my_projects.item!.page = map['page'];
	  my_projects.item!.ttl = map['ttl'];
	  my_projects.item!.pht = map['pht'];
	  my_projects.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_projects);
    }
    return age;
  }

  Future<List<ItemMyProjectsModel>> loadMyProjectsList(String searchKey) async{
    String searchSql = '';
    List<ItemMyProjectsModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyProjects.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyProjectsModel my_projects = ItemMyProjectsModel(jsonDecode(map['meta']));
        my_projects.item!.cnt = map['cnt'];
		my_projects.item!.page = map['page'];
        my_projects.item!.age = map['age'];
	    my_projects.item!.ttl = map['ttl'];
	    my_projects.item!.pht = map['pht'];
	    my_projects.item!.sbttl = map['sbttl'];
        appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyProjects.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyProjectsModel my_projects = ItemMyProjectsModel(jsonDecode(map['meta']));
        my_projects.item!.cnt = map['cnt'];
		my_projects.item!.page = map['page'];
        my_projects.item!.age = map['age'];
		my_projects.item!.ttl = map['ttl'];
	    my_projects.item!.pht = map['pht'];
	    my_projects.item!.sbttl = map['sbttl'];
        appList.add(my_projects);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyProjectsList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyProjects.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateBumpUpMyProjects(BumpUpMyProjectsModel bump_up, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(bump_up.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_BumpUpMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'BumpUpMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'BumpUpMyProjects$spKey',
			 TableID_BumpUpMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<BumpUpMyProjectsModel? > loadBumpUpMyProjects(String searchKey) async{
    String searchSql = '';
    BumpUpMyProjectsModel appList ;
	List<Map>  listuser = [];
	BumpUpMyProjectsModel? bump_up;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'BumpUpMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          bump_up = BumpUpMyProjectsModel(jsonDecode(map['meta']));
        bump_up.model.model.cnt = map['cnt'];
		bump_up.model.model.page = map['page'];
        bump_up.model.model.age = map['age'];
	    bump_up.model.model.ttl = map['ttl'];
	    bump_up.model.model.pht = map['pht'];
	    bump_up.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'BumpUpMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        bump_up = BumpUpMyProjectsModel(jsonDecode(map['meta']));
        bump_up.model.model.cnt = map['cnt'];
		bump_up.model.model.page = map['page'];
        bump_up.model.model.age = map['age'];
	    bump_up.model.model.ttl = map['ttl'];
	    bump_up.model.model.pht = map['pht'];
	    bump_up.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return bump_up;
  }
  
   Future<void> deleteAllBumpUpMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'BumpUpMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'BumpUpMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateBroadcastMessageMyProjects(BroadcastMessageMyProjectsModel broadcast_message, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(broadcast_message.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_BroadcastMessageMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'BroadcastMessageMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'BroadcastMessageMyProjects$spKey',
			 TableID_BroadcastMessageMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<BroadcastMessageMyProjectsModel? > loadBroadcastMessageMyProjects(String searchKey) async{
    String searchSql = '';
    BroadcastMessageMyProjectsModel appList ;
	List<Map>  listuser = [];
	BroadcastMessageMyProjectsModel? broadcast_message;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'BroadcastMessageMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          broadcast_message = BroadcastMessageMyProjectsModel(jsonDecode(map['meta']));
        broadcast_message.model.model.cnt = map['cnt'];
		broadcast_message.model.model.page = map['page'];
        broadcast_message.model.model.age = map['age'];
	    broadcast_message.model.model.ttl = map['ttl'];
	    broadcast_message.model.model.pht = map['pht'];
	    broadcast_message.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'BroadcastMessageMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        broadcast_message = BroadcastMessageMyProjectsModel(jsonDecode(map['meta']));
        broadcast_message.model.model.cnt = map['cnt'];
		broadcast_message.model.model.page = map['page'];
        broadcast_message.model.model.age = map['age'];
	    broadcast_message.model.model.ttl = map['ttl'];
	    broadcast_message.model.model.pht = map['pht'];
	    broadcast_message.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return broadcast_message;
  }
  
   Future<void> deleteAllBroadcastMessageMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'BroadcastMessageMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'BroadcastMessageMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateCreateProjectMyProjects(CreateProjectMyProjectsModel create_project, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(create_project.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_CreateProjectMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'CreateProjectMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'CreateProjectMyProjects$spKey',
			 TableID_CreateProjectMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<CreateProjectMyProjectsModel? > loadCreateProjectMyProjects(String searchKey) async{
    String searchSql = '';
    CreateProjectMyProjectsModel appList ;
	List<Map>  listuser = [];
	CreateProjectMyProjectsModel? create_project;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'CreateProjectMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          create_project = CreateProjectMyProjectsModel(jsonDecode(map['meta']));
        create_project.model.model.cnt = map['cnt'];
		create_project.model.model.page = map['page'];
        create_project.model.model.age = map['age'];
	    create_project.model.model.ttl = map['ttl'];
	    create_project.model.model.pht = map['pht'];
	    create_project.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'CreateProjectMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        create_project = CreateProjectMyProjectsModel(jsonDecode(map['meta']));
        create_project.model.model.cnt = map['cnt'];
		create_project.model.model.page = map['page'];
        create_project.model.model.age = map['age'];
	    create_project.model.model.ttl = map['ttl'];
	    create_project.model.model.pht = map['pht'];
	    create_project.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return create_project;
  }
  
   Future<void> deleteAllCreateProjectMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'CreateProjectMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'CreateProjectMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateEditDraftMyProjects(EditDraftMyProjectsModel edit_draft, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(edit_draft.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_EditDraftMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'EditDraftMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'EditDraftMyProjects$spKey',
			 TableID_EditDraftMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<EditDraftMyProjectsModel? > loadEditDraftMyProjects(String searchKey) async{
    String searchSql = '';
    EditDraftMyProjectsModel appList ;
	List<Map>  listuser = [];
	EditDraftMyProjectsModel? edit_draft;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'EditDraftMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          edit_draft = EditDraftMyProjectsModel(jsonDecode(map['meta']));
        edit_draft.model.model.cnt = map['cnt'];
		edit_draft.model.model.page = map['page'];
        edit_draft.model.model.age = map['age'];
	    edit_draft.model.model.ttl = map['ttl'];
	    edit_draft.model.model.pht = map['pht'];
	    edit_draft.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'EditDraftMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        edit_draft = EditDraftMyProjectsModel(jsonDecode(map['meta']));
        edit_draft.model.model.cnt = map['cnt'];
		edit_draft.model.model.page = map['page'];
        edit_draft.model.model.age = map['age'];
	    edit_draft.model.model.ttl = map['ttl'];
	    edit_draft.model.model.pht = map['pht'];
	    edit_draft.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return edit_draft;
  }
  
   Future<void> deleteAllEditDraftMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EditDraftMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EditDraftMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePublishProjectMyProjects(PublishProjectMyProjectsModel publish_project, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(publish_project.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PublishProjectMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PublishProjectMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PublishProjectMyProjects$spKey',
			 TableID_PublishProjectMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PublishProjectMyProjectsModel? > loadPublishProjectMyProjects(String searchKey) async{
    String searchSql = '';
    PublishProjectMyProjectsModel appList ;
	List<Map>  listuser = [];
	PublishProjectMyProjectsModel? publish_project;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PublishProjectMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          publish_project = PublishProjectMyProjectsModel(jsonDecode(map['meta']));
        publish_project.model.model.cnt = map['cnt'];
		publish_project.model.model.page = map['page'];
        publish_project.model.model.age = map['age'];
	    publish_project.model.model.ttl = map['ttl'];
	    publish_project.model.model.pht = map['pht'];
	    publish_project.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PublishProjectMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        publish_project = PublishProjectMyProjectsModel(jsonDecode(map['meta']));
        publish_project.model.model.cnt = map['cnt'];
		publish_project.model.model.page = map['page'];
        publish_project.model.model.age = map['age'];
	    publish_project.model.model.ttl = map['ttl'];
	    publish_project.model.model.pht = map['pht'];
	    publish_project.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return publish_project;
  }
  
   Future<void> deleteAllPublishProjectMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PublishProjectMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PublishProjectMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateCancelProjectMyProjects(CancelProjectMyProjectsModel cancel_project, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(cancel_project.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_CancelProjectMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'CancelProjectMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'CancelProjectMyProjects$spKey',
			 TableID_CancelProjectMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<CancelProjectMyProjectsModel? > loadCancelProjectMyProjects(String searchKey) async{
    String searchSql = '';
    CancelProjectMyProjectsModel appList ;
	List<Map>  listuser = [];
	CancelProjectMyProjectsModel? cancel_project;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'CancelProjectMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          cancel_project = CancelProjectMyProjectsModel(jsonDecode(map['meta']));
        cancel_project.model.model.cnt = map['cnt'];
		cancel_project.model.model.page = map['page'];
        cancel_project.model.model.age = map['age'];
	    cancel_project.model.model.ttl = map['ttl'];
	    cancel_project.model.model.pht = map['pht'];
	    cancel_project.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'CancelProjectMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        cancel_project = CancelProjectMyProjectsModel(jsonDecode(map['meta']));
        cancel_project.model.model.cnt = map['cnt'];
		cancel_project.model.model.page = map['page'];
        cancel_project.model.model.age = map['age'];
	    cancel_project.model.model.ttl = map['ttl'];
	    cancel_project.model.model.pht = map['pht'];
	    cancel_project.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return cancel_project;
  }
  
   Future<void> deleteAllCancelProjectMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'CancelProjectMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'CancelProjectMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateAcceptOrRejectWorkMyProjects(AcceptOrRejectWorkMyProjectsModel accept_or_reject_work, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(accept_or_reject_work.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_AcceptOrRejectWorkMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'AcceptOrRejectWorkMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'AcceptOrRejectWorkMyProjects$spKey',
			 TableID_AcceptOrRejectWorkMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<AcceptOrRejectWorkMyProjectsModel? > loadAcceptOrRejectWorkMyProjects(String searchKey) async{
    String searchSql = '';
    AcceptOrRejectWorkMyProjectsModel appList ;
	List<Map>  listuser = [];
	AcceptOrRejectWorkMyProjectsModel? accept_or_reject_work;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'AcceptOrRejectWorkMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          accept_or_reject_work = AcceptOrRejectWorkMyProjectsModel(jsonDecode(map['meta']));
        accept_or_reject_work.model.model.cnt = map['cnt'];
		accept_or_reject_work.model.model.page = map['page'];
        accept_or_reject_work.model.model.age = map['age'];
	    accept_or_reject_work.model.model.ttl = map['ttl'];
	    accept_or_reject_work.model.model.pht = map['pht'];
	    accept_or_reject_work.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'AcceptOrRejectWorkMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        accept_or_reject_work = AcceptOrRejectWorkMyProjectsModel(jsonDecode(map['meta']));
        accept_or_reject_work.model.model.cnt = map['cnt'];
		accept_or_reject_work.model.model.page = map['page'];
        accept_or_reject_work.model.model.age = map['age'];
	    accept_or_reject_work.model.model.ttl = map['ttl'];
	    accept_or_reject_work.model.model.pht = map['pht'];
	    accept_or_reject_work.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return accept_or_reject_work;
  }
  
   Future<void> deleteAllAcceptOrRejectWorkMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AcceptOrRejectWorkMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AcceptOrRejectWorkMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateRateWorkerMyProjects(RateWorkerMyProjectsModel rate_worker, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(rate_worker.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_RateWorkerMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'RateWorkerMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'RateWorkerMyProjects$spKey',
			 TableID_RateWorkerMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<RateWorkerMyProjectsModel? > loadRateWorkerMyProjects(String searchKey) async{
    String searchSql = '';
    RateWorkerMyProjectsModel appList ;
	List<Map>  listuser = [];
	RateWorkerMyProjectsModel? rate_worker;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'RateWorkerMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          rate_worker = RateWorkerMyProjectsModel(jsonDecode(map['meta']));
        rate_worker.model.model.cnt = map['cnt'];
		rate_worker.model.model.page = map['page'];
        rate_worker.model.model.age = map['age'];
	    rate_worker.model.model.ttl = map['ttl'];
	    rate_worker.model.model.pht = map['pht'];
	    rate_worker.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'RateWorkerMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        rate_worker = RateWorkerMyProjectsModel(jsonDecode(map['meta']));
        rate_worker.model.model.cnt = map['cnt'];
		rate_worker.model.model.page = map['page'];
        rate_worker.model.model.age = map['age'];
	    rate_worker.model.model.ttl = map['ttl'];
	    rate_worker.model.model.pht = map['pht'];
	    rate_worker.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return rate_worker;
  }
  
   Future<void> deleteAllRateWorkerMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RateWorkerMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RateWorkerMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateReportProgressMyProjects(ReportProgressMyProjectsModel report_progress, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(report_progress.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ReportProgressMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ReportProgressMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ReportProgressMyProjects$spKey',
			 TableID_ReportProgressMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ReportProgressMyProjectsModel? > loadReportProgressMyProjects(String searchKey) async{
    String searchSql = '';
    ReportProgressMyProjectsModel appList ;
	List<Map>  listuser = [];
	ReportProgressMyProjectsModel? report_progress;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ReportProgressMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          report_progress = ReportProgressMyProjectsModel(jsonDecode(map['meta']));
        report_progress.model.model.cnt = map['cnt'];
		report_progress.model.model.page = map['page'];
        report_progress.model.model.age = map['age'];
	    report_progress.model.model.ttl = map['ttl'];
	    report_progress.model.model.pht = map['pht'];
	    report_progress.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ReportProgressMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        report_progress = ReportProgressMyProjectsModel(jsonDecode(map['meta']));
        report_progress.model.model.cnt = map['cnt'];
		report_progress.model.model.page = map['page'];
        report_progress.model.model.age = map['age'];
	    report_progress.model.model.ttl = map['ttl'];
	    report_progress.model.model.pht = map['pht'];
	    report_progress.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return report_progress;
  }
  
   Future<void> deleteAllReportProgressMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ReportProgressMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ReportProgressMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateWeeklyReportMyProjects(WeeklyReportMyProjectsModel weekly_report, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(weekly_report.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_WeeklyReportMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'WeeklyReportMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'WeeklyReportMyProjects$spKey',
			 TableID_WeeklyReportMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<WeeklyReportMyProjectsModel? > loadWeeklyReportMyProjects(String searchKey) async{
    String searchSql = '';
    WeeklyReportMyProjectsModel appList ;
	List<Map>  listuser = [];
	WeeklyReportMyProjectsModel? weekly_report;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'WeeklyReportMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          weekly_report = WeeklyReportMyProjectsModel(jsonDecode(map['meta']));
        weekly_report.model.model.cnt = map['cnt'];
		weekly_report.model.model.page = map['page'];
        weekly_report.model.model.age = map['age'];
	    weekly_report.model.model.ttl = map['ttl'];
	    weekly_report.model.model.pht = map['pht'];
	    weekly_report.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'WeeklyReportMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        weekly_report = WeeklyReportMyProjectsModel(jsonDecode(map['meta']));
        weekly_report.model.model.cnt = map['cnt'];
		weekly_report.model.model.page = map['page'];
        weekly_report.model.model.age = map['age'];
	    weekly_report.model.model.ttl = map['ttl'];
	    weekly_report.model.model.pht = map['pht'];
	    weekly_report.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return weekly_report;
  }
  
   Future<void> deleteAllWeeklyReportMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'WeeklyReportMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'WeeklyReportMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateReportDoneMyProjects(ReportDoneMyProjectsModel report_done, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(report_done.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ReportDoneMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ReportDoneMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ReportDoneMyProjects$spKey',
			 TableID_ReportDoneMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ReportDoneMyProjectsModel? > loadReportDoneMyProjects(String searchKey) async{
    String searchSql = '';
    ReportDoneMyProjectsModel appList ;
	List<Map>  listuser = [];
	ReportDoneMyProjectsModel? report_done;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ReportDoneMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          report_done = ReportDoneMyProjectsModel(jsonDecode(map['meta']));
        report_done.model.model.cnt = map['cnt'];
		report_done.model.model.page = map['page'];
        report_done.model.model.age = map['age'];
	    report_done.model.model.ttl = map['ttl'];
	    report_done.model.model.pht = map['pht'];
	    report_done.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ReportDoneMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        report_done = ReportDoneMyProjectsModel(jsonDecode(map['meta']));
        report_done.model.model.cnt = map['cnt'];
		report_done.model.model.page = map['page'];
        report_done.model.model.age = map['age'];
	    report_done.model.model.ttl = map['ttl'];
	    report_done.model.model.pht = map['pht'];
	    report_done.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return report_done;
  }
  
   Future<void> deleteAllReportDoneMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ReportDoneMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ReportDoneMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateRateOwnerMyProjects(RateOwnerMyProjectsModel rate_owner, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(rate_owner.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_RateOwnerMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'RateOwnerMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'RateOwnerMyProjects$spKey',
			 TableID_RateOwnerMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<RateOwnerMyProjectsModel? > loadRateOwnerMyProjects(String searchKey) async{
    String searchSql = '';
    RateOwnerMyProjectsModel appList ;
	List<Map>  listuser = [];
	RateOwnerMyProjectsModel? rate_owner;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'RateOwnerMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          rate_owner = RateOwnerMyProjectsModel(jsonDecode(map['meta']));
        rate_owner.model.model.cnt = map['cnt'];
		rate_owner.model.model.page = map['page'];
        rate_owner.model.model.age = map['age'];
	    rate_owner.model.model.ttl = map['ttl'];
	    rate_owner.model.model.pht = map['pht'];
	    rate_owner.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'RateOwnerMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        rate_owner = RateOwnerMyProjectsModel(jsonDecode(map['meta']));
        rate_owner.model.model.cnt = map['cnt'];
		rate_owner.model.model.page = map['page'];
        rate_owner.model.model.age = map['age'];
	    rate_owner.model.model.ttl = map['ttl'];
	    rate_owner.model.model.pht = map['pht'];
	    rate_owner.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return rate_owner;
  }
  
   Future<void> deleteAllRateOwnerMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RateOwnerMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RateOwnerMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateFileArbitrationMyProjects(FileArbitrationMyProjectsModel file_arbitration, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(file_arbitration.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_FileArbitrationMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'FileArbitrationMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'FileArbitrationMyProjects$spKey',
			 TableID_FileArbitrationMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<FileArbitrationMyProjectsModel? > loadFileArbitrationMyProjects(String searchKey) async{
    String searchSql = '';
    FileArbitrationMyProjectsModel appList ;
	List<Map>  listuser = [];
	FileArbitrationMyProjectsModel? file_arbitration;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'FileArbitrationMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          file_arbitration = FileArbitrationMyProjectsModel(jsonDecode(map['meta']));
        file_arbitration.model.model.cnt = map['cnt'];
		file_arbitration.model.model.page = map['page'];
        file_arbitration.model.model.age = map['age'];
	    file_arbitration.model.model.ttl = map['ttl'];
	    file_arbitration.model.model.pht = map['pht'];
	    file_arbitration.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'FileArbitrationMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        file_arbitration = FileArbitrationMyProjectsModel(jsonDecode(map['meta']));
        file_arbitration.model.model.cnt = map['cnt'];
		file_arbitration.model.model.page = map['page'];
        file_arbitration.model.model.age = map['age'];
	    file_arbitration.model.model.ttl = map['ttl'];
	    file_arbitration.model.model.pht = map['pht'];
	    file_arbitration.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return file_arbitration;
  }
  
   Future<void> deleteAllFileArbitrationMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'FileArbitrationMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'FileArbitrationMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateNewOfferMyProjects(NewOfferMyProjectsModel new_offer, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(new_offer.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_NewOfferMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'NewOfferMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'NewOfferMyProjects$spKey',
			 TableID_NewOfferMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<NewOfferMyProjectsModel? > loadNewOfferMyProjects(String searchKey) async{
    String searchSql = '';
    NewOfferMyProjectsModel appList ;
	List<Map>  listuser = [];
	NewOfferMyProjectsModel? new_offer;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'NewOfferMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          new_offer = NewOfferMyProjectsModel(jsonDecode(map['meta']));
        new_offer.model.model.cnt = map['cnt'];
		new_offer.model.model.page = map['page'];
        new_offer.model.model.age = map['age'];
	    new_offer.model.model.ttl = map['ttl'];
	    new_offer.model.model.pht = map['pht'];
	    new_offer.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'NewOfferMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        new_offer = NewOfferMyProjectsModel(jsonDecode(map['meta']));
        new_offer.model.model.cnt = map['cnt'];
		new_offer.model.model.page = map['page'];
        new_offer.model.model.age = map['age'];
	    new_offer.model.model.ttl = map['ttl'];
	    new_offer.model.model.pht = map['pht'];
	    new_offer.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return new_offer;
  }
  
   Future<void> deleteAllNewOfferMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'NewOfferMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'NewOfferMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateAcceptOfferMyProjects(AcceptOfferMyProjectsModel accept_offer, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(accept_offer.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_AcceptOfferMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'AcceptOfferMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'AcceptOfferMyProjects$spKey',
			 TableID_AcceptOfferMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<AcceptOfferMyProjectsModel? > loadAcceptOfferMyProjects(String searchKey) async{
    String searchSql = '';
    AcceptOfferMyProjectsModel appList ;
	List<Map>  listuser = [];
	AcceptOfferMyProjectsModel? accept_offer;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'AcceptOfferMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          accept_offer = AcceptOfferMyProjectsModel(jsonDecode(map['meta']));
        accept_offer.model.model.cnt = map['cnt'];
		accept_offer.model.model.page = map['page'];
        accept_offer.model.model.age = map['age'];
	    accept_offer.model.model.ttl = map['ttl'];
	    accept_offer.model.model.pht = map['pht'];
	    accept_offer.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'AcceptOfferMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        accept_offer = AcceptOfferMyProjectsModel(jsonDecode(map['meta']));
        accept_offer.model.model.cnt = map['cnt'];
		accept_offer.model.model.page = map['page'];
        accept_offer.model.model.age = map['age'];
	    accept_offer.model.model.ttl = map['ttl'];
	    accept_offer.model.model.pht = map['pht'];
	    accept_offer.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return accept_offer;
  }
  
   Future<void> deleteAllAcceptOfferMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AcceptOfferMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AcceptOfferMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateRespondArbitrationMyProjects(RespondArbitrationMyProjectsModel respond_arbitration, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(respond_arbitration.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_RespondArbitrationMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'RespondArbitrationMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'RespondArbitrationMyProjects$spKey',
			 TableID_RespondArbitrationMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<RespondArbitrationMyProjectsModel? > loadRespondArbitrationMyProjects(String searchKey) async{
    String searchSql = '';
    RespondArbitrationMyProjectsModel appList ;
	List<Map>  listuser = [];
	RespondArbitrationMyProjectsModel? respond_arbitration;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'RespondArbitrationMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          respond_arbitration = RespondArbitrationMyProjectsModel(jsonDecode(map['meta']));
        respond_arbitration.model.model.cnt = map['cnt'];
		respond_arbitration.model.model.page = map['page'];
        respond_arbitration.model.model.age = map['age'];
	    respond_arbitration.model.model.ttl = map['ttl'];
	    respond_arbitration.model.model.pht = map['pht'];
	    respond_arbitration.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'RespondArbitrationMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        respond_arbitration = RespondArbitrationMyProjectsModel(jsonDecode(map['meta']));
        respond_arbitration.model.model.cnt = map['cnt'];
		respond_arbitration.model.model.page = map['page'];
        respond_arbitration.model.model.age = map['age'];
	    respond_arbitration.model.model.ttl = map['ttl'];
	    respond_arbitration.model.model.pht = map['pht'];
	    respond_arbitration.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return respond_arbitration;
  }
  
   Future<void> deleteAllRespondArbitrationMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RespondArbitrationMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RespondArbitrationMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateCancelArbitrationMyProjects(CancelArbitrationMyProjectsModel cancel_arbitration, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(cancel_arbitration.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_CancelArbitrationMyProjects, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'CancelArbitrationMyProjects$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'CancelArbitrationMyProjects$spKey',
			 TableID_CancelArbitrationMyProjects, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<CancelArbitrationMyProjectsModel? > loadCancelArbitrationMyProjects(String searchKey) async{
    String searchSql = '';
    CancelArbitrationMyProjectsModel appList ;
	List<Map>  listuser = [];
	CancelArbitrationMyProjectsModel? cancel_arbitration;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'CancelArbitrationMyProjects$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          cancel_arbitration = CancelArbitrationMyProjectsModel(jsonDecode(map['meta']));
        cancel_arbitration.model.model.cnt = map['cnt'];
		cancel_arbitration.model.model.page = map['page'];
        cancel_arbitration.model.model.age = map['age'];
	    cancel_arbitration.model.model.ttl = map['ttl'];
	    cancel_arbitration.model.model.pht = map['pht'];
	    cancel_arbitration.model.model.sbttl = map['sbttl'];
       // appList.add(my_projects);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'CancelArbitrationMyProjects$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        cancel_arbitration = CancelArbitrationMyProjectsModel(jsonDecode(map['meta']));
        cancel_arbitration.model.model.cnt = map['cnt'];
		cancel_arbitration.model.model.page = map['page'];
        cancel_arbitration.model.model.age = map['age'];
	    cancel_arbitration.model.model.ttl = map['ttl'];
	    cancel_arbitration.model.model.pht = map['pht'];
	    cancel_arbitration.model.model.sbttl = map['sbttl'];
        //appList.add(my_projects);
      }
    }

    return cancel_arbitration;
  }
  
   Future<void> deleteAllCancelArbitrationMyProjects(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'CancelArbitrationMyProjects$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'CancelArbitrationMyProjects$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateMyBidsList(ItemMyBidsModel my_bids) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_bids.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyBids, 
		  userID, 
		  my_bids.item!.page,
          my_bids.item!.age,
          my_bids.item!.cnt,
		  my_bids.item!.ttl,
		  my_bids.item!.pht,
		  my_bids.item!.sbttl,
          searchText,
          meta,
          my_bids.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_bids.item!.id,
			TableID_MyBids,
			userID,
			 my_bids.item!.page,
            my_bids.item!.age,
            my_bids.item!.cnt,
			my_bids.item!.ttl,
		    my_bids.item!.pht,
		    my_bids.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyBidsListingModel> loadMyBidsListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyBids.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyBidsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyBidsListInfo(MyBidsListingModel my_bids) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_bids.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyBids,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyBids,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyBidsAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyBids.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyBidsModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyBidsModel my_bids = ItemMyBidsModel(jsonDecode(map['meta']));
      my_bids.item!.cnt = map['cnt'];
      my_bids.item!.age = map['age'];
	   my_bids.item!.page = map['page'];
	  my_bids.item!.ttl = map['ttl'];
	  my_bids.item!.pht = map['pht'];
	  my_bids.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_bids);
    }
    return age;
  }

  Future<List<ItemMyBidsModel>> loadMyBidsList(String searchKey) async{
    String searchSql = '';
    List<ItemMyBidsModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyBids.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyBidsModel my_bids = ItemMyBidsModel(jsonDecode(map['meta']));
        my_bids.item!.cnt = map['cnt'];
		my_bids.item!.page = map['page'];
        my_bids.item!.age = map['age'];
	    my_bids.item!.ttl = map['ttl'];
	    my_bids.item!.pht = map['pht'];
	    my_bids.item!.sbttl = map['sbttl'];
        appList.add(my_bids);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyBids.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyBidsModel my_bids = ItemMyBidsModel(jsonDecode(map['meta']));
        my_bids.item!.cnt = map['cnt'];
		my_bids.item!.page = map['page'];
        my_bids.item!.age = map['age'];
		my_bids.item!.ttl = map['ttl'];
	    my_bids.item!.pht = map['pht'];
	    my_bids.item!.sbttl = map['sbttl'];
        appList.add(my_bids);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyBidsList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyBids.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateCancelBidMyBids(CancelBidMyBidsModel cancel_bid, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(cancel_bid.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_CancelBidMyBids, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'CancelBidMyBids$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'CancelBidMyBids$spKey',
			 TableID_CancelBidMyBids, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<CancelBidMyBidsModel? > loadCancelBidMyBids(String searchKey) async{
    String searchSql = '';
    CancelBidMyBidsModel appList ;
	List<Map>  listuser = [];
	CancelBidMyBidsModel? cancel_bid;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'CancelBidMyBids$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          cancel_bid = CancelBidMyBidsModel(jsonDecode(map['meta']));
        cancel_bid.model.model.cnt = map['cnt'];
		cancel_bid.model.model.page = map['page'];
        cancel_bid.model.model.age = map['age'];
	    cancel_bid.model.model.ttl = map['ttl'];
	    cancel_bid.model.model.pht = map['pht'];
	    cancel_bid.model.model.sbttl = map['sbttl'];
       // appList.add(my_bids);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'CancelBidMyBids$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        cancel_bid = CancelBidMyBidsModel(jsonDecode(map['meta']));
        cancel_bid.model.model.cnt = map['cnt'];
		cancel_bid.model.model.page = map['page'];
        cancel_bid.model.model.age = map['age'];
	    cancel_bid.model.model.ttl = map['ttl'];
	    cancel_bid.model.model.pht = map['pht'];
	    cancel_bid.model.model.sbttl = map['sbttl'];
        //appList.add(my_bids);
      }
    }

    return cancel_bid;
  }
  
   Future<void> deleteAllCancelBidMyBids(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'CancelBidMyBids$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'CancelBidMyBids$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateMyProductsList(ItemMyProductsModel my_products) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_products.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyProducts, 
		  userID, 
		  my_products.item!.page,
          my_products.item!.age,
          my_products.item!.cnt,
		  my_products.item!.ttl,
		  my_products.item!.pht,
		  my_products.item!.sbttl,
          searchText,
          meta,
          my_products.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_products.item!.id,
			TableID_MyProducts,
			userID,
			 my_products.item!.page,
            my_products.item!.age,
            my_products.item!.cnt,
			my_products.item!.ttl,
		    my_products.item!.pht,
		    my_products.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyProductsListingModel> loadMyProductsListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyProducts.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyProductsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyProductsListInfo(MyProductsListingModel my_products) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_products.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyProducts,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyProducts,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyProductsAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyProducts.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyProductsModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyProductsModel my_products = ItemMyProductsModel(jsonDecode(map['meta']));
      my_products.item!.cnt = map['cnt'];
      my_products.item!.age = map['age'];
	   my_products.item!.page = map['page'];
	  my_products.item!.ttl = map['ttl'];
	  my_products.item!.pht = map['pht'];
	  my_products.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_products);
    }
    return age;
  }

  Future<List<ItemMyProductsModel>> loadMyProductsList(String searchKey) async{
    String searchSql = '';
    List<ItemMyProductsModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyProducts.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyProductsModel my_products = ItemMyProductsModel(jsonDecode(map['meta']));
        my_products.item!.cnt = map['cnt'];
		my_products.item!.page = map['page'];
        my_products.item!.age = map['age'];
	    my_products.item!.ttl = map['ttl'];
	    my_products.item!.pht = map['pht'];
	    my_products.item!.sbttl = map['sbttl'];
        appList.add(my_products);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyProducts.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyProductsModel my_products = ItemMyProductsModel(jsonDecode(map['meta']));
        my_products.item!.cnt = map['cnt'];
		my_products.item!.page = map['page'];
        my_products.item!.age = map['age'];
		my_products.item!.ttl = map['ttl'];
	    my_products.item!.pht = map['pht'];
	    my_products.item!.sbttl = map['sbttl'];
        appList.add(my_products);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyProductsList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyProducts.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateAddNewProductMyProducts(AddNewProductMyProductsModel add_new_product, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(add_new_product.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_AddNewProductMyProducts, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'AddNewProductMyProducts$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'AddNewProductMyProducts$spKey',
			 TableID_AddNewProductMyProducts, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<AddNewProductMyProductsModel? > loadAddNewProductMyProducts(String searchKey) async{
    String searchSql = '';
    AddNewProductMyProductsModel appList ;
	List<Map>  listuser = [];
	AddNewProductMyProductsModel? add_new_product;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'AddNewProductMyProducts$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          add_new_product = AddNewProductMyProductsModel(jsonDecode(map['meta']));
        add_new_product.model.model.cnt = map['cnt'];
		add_new_product.model.model.page = map['page'];
        add_new_product.model.model.age = map['age'];
	    add_new_product.model.model.ttl = map['ttl'];
	    add_new_product.model.model.pht = map['pht'];
	    add_new_product.model.model.sbttl = map['sbttl'];
       // appList.add(my_products);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'AddNewProductMyProducts$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        add_new_product = AddNewProductMyProductsModel(jsonDecode(map['meta']));
        add_new_product.model.model.cnt = map['cnt'];
		add_new_product.model.model.page = map['page'];
        add_new_product.model.model.age = map['age'];
	    add_new_product.model.model.ttl = map['ttl'];
	    add_new_product.model.model.pht = map['pht'];
	    add_new_product.model.model.sbttl = map['sbttl'];
        //appList.add(my_products);
      }
    }

    return add_new_product;
  }
  
   Future<void> deleteAllAddNewProductMyProducts(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AddNewProductMyProducts$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AddNewProductMyProducts$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePublishProductMyProducts(PublishProductMyProductsModel publish_product, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(publish_product.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PublishProductMyProducts, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PublishProductMyProducts$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PublishProductMyProducts$spKey',
			 TableID_PublishProductMyProducts, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PublishProductMyProductsModel? > loadPublishProductMyProducts(String searchKey) async{
    String searchSql = '';
    PublishProductMyProductsModel appList ;
	List<Map>  listuser = [];
	PublishProductMyProductsModel? publish_product;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PublishProductMyProducts$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          publish_product = PublishProductMyProductsModel(jsonDecode(map['meta']));
        publish_product.model.model.cnt = map['cnt'];
		publish_product.model.model.page = map['page'];
        publish_product.model.model.age = map['age'];
	    publish_product.model.model.ttl = map['ttl'];
	    publish_product.model.model.pht = map['pht'];
	    publish_product.model.model.sbttl = map['sbttl'];
       // appList.add(my_products);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PublishProductMyProducts$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        publish_product = PublishProductMyProductsModel(jsonDecode(map['meta']));
        publish_product.model.model.cnt = map['cnt'];
		publish_product.model.model.page = map['page'];
        publish_product.model.model.age = map['age'];
	    publish_product.model.model.ttl = map['ttl'];
	    publish_product.model.model.pht = map['pht'];
	    publish_product.model.model.sbttl = map['sbttl'];
        //appList.add(my_products);
      }
    }

    return publish_product;
  }
  
   Future<void> deleteAllPublishProductMyProducts(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PublishProductMyProducts$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PublishProductMyProducts$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateEditProductMyProducts(EditProductMyProductsModel edit_product, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(edit_product.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_EditProductMyProducts, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'EditProductMyProducts$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'EditProductMyProducts$spKey',
			 TableID_EditProductMyProducts, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<EditProductMyProductsModel? > loadEditProductMyProducts(String searchKey) async{
    String searchSql = '';
    EditProductMyProductsModel appList ;
	List<Map>  listuser = [];
	EditProductMyProductsModel? edit_product;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'EditProductMyProducts$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          edit_product = EditProductMyProductsModel(jsonDecode(map['meta']));
        edit_product.model.model.cnt = map['cnt'];
		edit_product.model.model.page = map['page'];
        edit_product.model.model.age = map['age'];
	    edit_product.model.model.ttl = map['ttl'];
	    edit_product.model.model.pht = map['pht'];
	    edit_product.model.model.sbttl = map['sbttl'];
       // appList.add(my_products);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'EditProductMyProducts$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        edit_product = EditProductMyProductsModel(jsonDecode(map['meta']));
        edit_product.model.model.cnt = map['cnt'];
		edit_product.model.model.page = map['page'];
        edit_product.model.model.age = map['age'];
	    edit_product.model.model.ttl = map['ttl'];
	    edit_product.model.model.pht = map['pht'];
	    edit_product.model.model.sbttl = map['sbttl'];
        //appList.add(my_products);
      }
    }

    return edit_product;
  }
  
   Future<void> deleteAllEditProductMyProducts(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EditProductMyProducts$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EditProductMyProducts$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateBumpUpMyProducts(BumpUpMyProductsModel bump_up, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(bump_up.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_BumpUpMyProducts, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'BumpUpMyProducts$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'BumpUpMyProducts$spKey',
			 TableID_BumpUpMyProducts, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<BumpUpMyProductsModel? > loadBumpUpMyProducts(String searchKey) async{
    String searchSql = '';
    BumpUpMyProductsModel appList ;
	List<Map>  listuser = [];
	BumpUpMyProductsModel? bump_up;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'BumpUpMyProducts$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          bump_up = BumpUpMyProductsModel(jsonDecode(map['meta']));
        bump_up.model.model.cnt = map['cnt'];
		bump_up.model.model.page = map['page'];
        bump_up.model.model.age = map['age'];
	    bump_up.model.model.ttl = map['ttl'];
	    bump_up.model.model.pht = map['pht'];
	    bump_up.model.model.sbttl = map['sbttl'];
       // appList.add(my_products);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'BumpUpMyProducts$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        bump_up = BumpUpMyProductsModel(jsonDecode(map['meta']));
        bump_up.model.model.cnt = map['cnt'];
		bump_up.model.model.page = map['page'];
        bump_up.model.model.age = map['age'];
	    bump_up.model.model.ttl = map['ttl'];
	    bump_up.model.model.pht = map['pht'];
	    bump_up.model.model.sbttl = map['sbttl'];
        //appList.add(my_products);
      }
    }

    return bump_up;
  }
  
   Future<void> deleteAllBumpUpMyProducts(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'BumpUpMyProducts$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'BumpUpMyProducts$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateUnlistMyProducts(UnlistMyProductsModel unlist, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(unlist.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_UnlistMyProducts, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'UnlistMyProducts$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'UnlistMyProducts$spKey',
			 TableID_UnlistMyProducts, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<UnlistMyProductsModel? > loadUnlistMyProducts(String searchKey) async{
    String searchSql = '';
    UnlistMyProductsModel appList ;
	List<Map>  listuser = [];
	UnlistMyProductsModel? unlist;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'UnlistMyProducts$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          unlist = UnlistMyProductsModel(jsonDecode(map['meta']));
        unlist.model.model.cnt = map['cnt'];
		unlist.model.model.page = map['page'];
        unlist.model.model.age = map['age'];
	    unlist.model.model.ttl = map['ttl'];
	    unlist.model.model.pht = map['pht'];
	    unlist.model.model.sbttl = map['sbttl'];
       // appList.add(my_products);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'UnlistMyProducts$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        unlist = UnlistMyProductsModel(jsonDecode(map['meta']));
        unlist.model.model.cnt = map['cnt'];
		unlist.model.model.page = map['page'];
        unlist.model.model.age = map['age'];
	    unlist.model.model.ttl = map['ttl'];
	    unlist.model.model.pht = map['pht'];
	    unlist.model.model.sbttl = map['sbttl'];
        //appList.add(my_products);
      }
    }

    return unlist;
  }
  
   Future<void> deleteAllUnlistMyProducts(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'UnlistMyProducts$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'UnlistMyProducts$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateReactivateProductMyProducts(ReactivateProductMyProductsModel reactivate_product, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(reactivate_product.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ReactivateProductMyProducts, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ReactivateProductMyProducts$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ReactivateProductMyProducts$spKey',
			 TableID_ReactivateProductMyProducts, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ReactivateProductMyProductsModel? > loadReactivateProductMyProducts(String searchKey) async{
    String searchSql = '';
    ReactivateProductMyProductsModel appList ;
	List<Map>  listuser = [];
	ReactivateProductMyProductsModel? reactivate_product;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ReactivateProductMyProducts$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          reactivate_product = ReactivateProductMyProductsModel(jsonDecode(map['meta']));
        reactivate_product.model.model.cnt = map['cnt'];
		reactivate_product.model.model.page = map['page'];
        reactivate_product.model.model.age = map['age'];
	    reactivate_product.model.model.ttl = map['ttl'];
	    reactivate_product.model.model.pht = map['pht'];
	    reactivate_product.model.model.sbttl = map['sbttl'];
       // appList.add(my_products);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ReactivateProductMyProducts$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        reactivate_product = ReactivateProductMyProductsModel(jsonDecode(map['meta']));
        reactivate_product.model.model.cnt = map['cnt'];
		reactivate_product.model.model.page = map['page'];
        reactivate_product.model.model.age = map['age'];
	    reactivate_product.model.model.ttl = map['ttl'];
	    reactivate_product.model.model.pht = map['pht'];
	    reactivate_product.model.model.sbttl = map['sbttl'];
        //appList.add(my_products);
      }
    }

    return reactivate_product;
  }
  
   Future<void> deleteAllReactivateProductMyProducts(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ReactivateProductMyProducts$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ReactivateProductMyProducts$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateMyServicesList(ItemMyServicesModel my_services) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_services.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyServices, 
		  userID, 
		  my_services.item!.page,
          my_services.item!.age,
          my_services.item!.cnt,
		  my_services.item!.ttl,
		  my_services.item!.pht,
		  my_services.item!.sbttl,
          searchText,
          meta,
          my_services.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_services.item!.id,
			TableID_MyServices,
			userID,
			 my_services.item!.page,
            my_services.item!.age,
            my_services.item!.cnt,
			my_services.item!.ttl,
		    my_services.item!.pht,
		    my_services.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyServicesListingModel> loadMyServicesListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyServices.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyServicesListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyServicesListInfo(MyServicesListingModel my_services) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_services.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyServices,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyServices,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyServicesAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyServices.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyServicesModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyServicesModel my_services = ItemMyServicesModel(jsonDecode(map['meta']));
      my_services.item!.cnt = map['cnt'];
      my_services.item!.age = map['age'];
	   my_services.item!.page = map['page'];
	  my_services.item!.ttl = map['ttl'];
	  my_services.item!.pht = map['pht'];
	  my_services.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_services);
    }
    return age;
  }

  Future<List<ItemMyServicesModel>> loadMyServicesList(String searchKey) async{
    String searchSql = '';
    List<ItemMyServicesModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyServices.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyServicesModel my_services = ItemMyServicesModel(jsonDecode(map['meta']));
        my_services.item!.cnt = map['cnt'];
		my_services.item!.page = map['page'];
        my_services.item!.age = map['age'];
	    my_services.item!.ttl = map['ttl'];
	    my_services.item!.pht = map['pht'];
	    my_services.item!.sbttl = map['sbttl'];
        appList.add(my_services);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyServices.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyServicesModel my_services = ItemMyServicesModel(jsonDecode(map['meta']));
        my_services.item!.cnt = map['cnt'];
		my_services.item!.page = map['page'];
        my_services.item!.age = map['age'];
		my_services.item!.ttl = map['ttl'];
	    my_services.item!.pht = map['pht'];
	    my_services.item!.sbttl = map['sbttl'];
        appList.add(my_services);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyServicesList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyServices.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateAddNewServiceMyServices(AddNewServiceMyServicesModel add_new_service, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(add_new_service.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_AddNewServiceMyServices, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'AddNewServiceMyServices$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'AddNewServiceMyServices$spKey',
			 TableID_AddNewServiceMyServices, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<AddNewServiceMyServicesModel? > loadAddNewServiceMyServices(String searchKey) async{
    String searchSql = '';
    AddNewServiceMyServicesModel appList ;
	List<Map>  listuser = [];
	AddNewServiceMyServicesModel? add_new_service;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'AddNewServiceMyServices$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          add_new_service = AddNewServiceMyServicesModel(jsonDecode(map['meta']));
        add_new_service.model.model.cnt = map['cnt'];
		add_new_service.model.model.page = map['page'];
        add_new_service.model.model.age = map['age'];
	    add_new_service.model.model.ttl = map['ttl'];
	    add_new_service.model.model.pht = map['pht'];
	    add_new_service.model.model.sbttl = map['sbttl'];
       // appList.add(my_services);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'AddNewServiceMyServices$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        add_new_service = AddNewServiceMyServicesModel(jsonDecode(map['meta']));
        add_new_service.model.model.cnt = map['cnt'];
		add_new_service.model.model.page = map['page'];
        add_new_service.model.model.age = map['age'];
	    add_new_service.model.model.ttl = map['ttl'];
	    add_new_service.model.model.pht = map['pht'];
	    add_new_service.model.model.sbttl = map['sbttl'];
        //appList.add(my_services);
      }
    }

    return add_new_service;
  }
  
   Future<void> deleteAllAddNewServiceMyServices(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AddNewServiceMyServices$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'AddNewServiceMyServices$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdatePublishServiceMyServices(PublishServiceMyServicesModel publish_service, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(publish_service.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_PublishServiceMyServices, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'PublishServiceMyServices$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'PublishServiceMyServices$spKey',
			 TableID_PublishServiceMyServices, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<PublishServiceMyServicesModel? > loadPublishServiceMyServices(String searchKey) async{
    String searchSql = '';
    PublishServiceMyServicesModel appList ;
	List<Map>  listuser = [];
	PublishServiceMyServicesModel? publish_service;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'PublishServiceMyServices$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          publish_service = PublishServiceMyServicesModel(jsonDecode(map['meta']));
        publish_service.model.model.cnt = map['cnt'];
		publish_service.model.model.page = map['page'];
        publish_service.model.model.age = map['age'];
	    publish_service.model.model.ttl = map['ttl'];
	    publish_service.model.model.pht = map['pht'];
	    publish_service.model.model.sbttl = map['sbttl'];
       // appList.add(my_services);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'PublishServiceMyServices$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        publish_service = PublishServiceMyServicesModel(jsonDecode(map['meta']));
        publish_service.model.model.cnt = map['cnt'];
		publish_service.model.model.page = map['page'];
        publish_service.model.model.age = map['age'];
	    publish_service.model.model.ttl = map['ttl'];
	    publish_service.model.model.pht = map['pht'];
	    publish_service.model.model.sbttl = map['sbttl'];
        //appList.add(my_services);
      }
    }

    return publish_service;
  }
  
   Future<void> deleteAllPublishServiceMyServices(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PublishServiceMyServices$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'PublishServiceMyServices$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateBumpUpMyServices(BumpUpMyServicesModel bump_up, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(bump_up.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_BumpUpMyServices, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'BumpUpMyServices$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'BumpUpMyServices$spKey',
			 TableID_BumpUpMyServices, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<BumpUpMyServicesModel? > loadBumpUpMyServices(String searchKey) async{
    String searchSql = '';
    BumpUpMyServicesModel appList ;
	List<Map>  listuser = [];
	BumpUpMyServicesModel? bump_up;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'BumpUpMyServices$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          bump_up = BumpUpMyServicesModel(jsonDecode(map['meta']));
        bump_up.model.model.cnt = map['cnt'];
		bump_up.model.model.page = map['page'];
        bump_up.model.model.age = map['age'];
	    bump_up.model.model.ttl = map['ttl'];
	    bump_up.model.model.pht = map['pht'];
	    bump_up.model.model.sbttl = map['sbttl'];
       // appList.add(my_services);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'BumpUpMyServices$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        bump_up = BumpUpMyServicesModel(jsonDecode(map['meta']));
        bump_up.model.model.cnt = map['cnt'];
		bump_up.model.model.page = map['page'];
        bump_up.model.model.age = map['age'];
	    bump_up.model.model.ttl = map['ttl'];
	    bump_up.model.model.pht = map['pht'];
	    bump_up.model.model.sbttl = map['sbttl'];
        //appList.add(my_services);
      }
    }

    return bump_up;
  }
  
   Future<void> deleteAllBumpUpMyServices(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'BumpUpMyServices$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'BumpUpMyServices$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateEditServiceMyServices(EditServiceMyServicesModel edit_service, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(edit_service.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_EditServiceMyServices, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'EditServiceMyServices$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'EditServiceMyServices$spKey',
			 TableID_EditServiceMyServices, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<EditServiceMyServicesModel? > loadEditServiceMyServices(String searchKey) async{
    String searchSql = '';
    EditServiceMyServicesModel appList ;
	List<Map>  listuser = [];
	EditServiceMyServicesModel? edit_service;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'EditServiceMyServices$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          edit_service = EditServiceMyServicesModel(jsonDecode(map['meta']));
        edit_service.model.model.cnt = map['cnt'];
		edit_service.model.model.page = map['page'];
        edit_service.model.model.age = map['age'];
	    edit_service.model.model.ttl = map['ttl'];
	    edit_service.model.model.pht = map['pht'];
	    edit_service.model.model.sbttl = map['sbttl'];
       // appList.add(my_services);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'EditServiceMyServices$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        edit_service = EditServiceMyServicesModel(jsonDecode(map['meta']));
        edit_service.model.model.cnt = map['cnt'];
		edit_service.model.model.page = map['page'];
        edit_service.model.model.age = map['age'];
	    edit_service.model.model.ttl = map['ttl'];
	    edit_service.model.model.pht = map['pht'];
	    edit_service.model.model.sbttl = map['sbttl'];
        //appList.add(my_services);
      }
    }

    return edit_service;
  }
  
   Future<void> deleteAllEditServiceMyServices(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EditServiceMyServices$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EditServiceMyServices$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateUnlistMyServices(UnlistMyServicesModel unlist, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(unlist.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_UnlistMyServices, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'UnlistMyServices$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'UnlistMyServices$spKey',
			 TableID_UnlistMyServices, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<UnlistMyServicesModel? > loadUnlistMyServices(String searchKey) async{
    String searchSql = '';
    UnlistMyServicesModel appList ;
	List<Map>  listuser = [];
	UnlistMyServicesModel? unlist;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'UnlistMyServices$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          unlist = UnlistMyServicesModel(jsonDecode(map['meta']));
        unlist.model.model.cnt = map['cnt'];
		unlist.model.model.page = map['page'];
        unlist.model.model.age = map['age'];
	    unlist.model.model.ttl = map['ttl'];
	    unlist.model.model.pht = map['pht'];
	    unlist.model.model.sbttl = map['sbttl'];
       // appList.add(my_services);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'UnlistMyServices$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        unlist = UnlistMyServicesModel(jsonDecode(map['meta']));
        unlist.model.model.cnt = map['cnt'];
		unlist.model.model.page = map['page'];
        unlist.model.model.age = map['age'];
	    unlist.model.model.ttl = map['ttl'];
	    unlist.model.model.pht = map['pht'];
	    unlist.model.model.sbttl = map['sbttl'];
        //appList.add(my_services);
      }
    }

    return unlist;
  }
  
   Future<void> deleteAllUnlistMyServices(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'UnlistMyServices$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'UnlistMyServices$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateReactivateServiceMyServices(ReactivateServiceMyServicesModel reactivate_service, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(reactivate_service.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ReactivateServiceMyServices, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ReactivateServiceMyServices$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ReactivateServiceMyServices$spKey',
			 TableID_ReactivateServiceMyServices, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ReactivateServiceMyServicesModel? > loadReactivateServiceMyServices(String searchKey) async{
    String searchSql = '';
    ReactivateServiceMyServicesModel appList ;
	List<Map>  listuser = [];
	ReactivateServiceMyServicesModel? reactivate_service;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ReactivateServiceMyServices$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          reactivate_service = ReactivateServiceMyServicesModel(jsonDecode(map['meta']));
        reactivate_service.model.model.cnt = map['cnt'];
		reactivate_service.model.model.page = map['page'];
        reactivate_service.model.model.age = map['age'];
	    reactivate_service.model.model.ttl = map['ttl'];
	    reactivate_service.model.model.pht = map['pht'];
	    reactivate_service.model.model.sbttl = map['sbttl'];
       // appList.add(my_services);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ReactivateServiceMyServices$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        reactivate_service = ReactivateServiceMyServicesModel(jsonDecode(map['meta']));
        reactivate_service.model.model.cnt = map['cnt'];
		reactivate_service.model.model.page = map['page'];
        reactivate_service.model.model.age = map['age'];
	    reactivate_service.model.model.ttl = map['ttl'];
	    reactivate_service.model.model.pht = map['pht'];
	    reactivate_service.model.model.sbttl = map['sbttl'];
        //appList.add(my_services);
      }
    }

    return reactivate_service;
  }
  
   Future<void> deleteAllReactivateServiceMyServices(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ReactivateServiceMyServices$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ReactivateServiceMyServices$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateMySalesList(ItemMySalesModel my_sales) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_sales.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MySales, 
		  userID, 
		  my_sales.item!.page,
          my_sales.item!.age,
          my_sales.item!.cnt,
		  my_sales.item!.ttl,
		  my_sales.item!.pht,
		  my_sales.item!.sbttl,
          searchText,
          meta,
          my_sales.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_sales.item!.id,
			TableID_MySales,
			userID,
			 my_sales.item!.page,
            my_sales.item!.age,
            my_sales.item!.cnt,
			my_sales.item!.ttl,
		    my_sales.item!.pht,
		    my_sales.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MySalesListingModel> loadMySalesListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MySales.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MySalesListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMySalesListInfo(MySalesListingModel my_sales) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_sales.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MySales,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MySales,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMySalesAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MySales.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMySalesModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMySalesModel my_sales = ItemMySalesModel(jsonDecode(map['meta']));
      my_sales.item!.cnt = map['cnt'];
      my_sales.item!.age = map['age'];
	   my_sales.item!.page = map['page'];
	  my_sales.item!.ttl = map['ttl'];
	  my_sales.item!.pht = map['pht'];
	  my_sales.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_sales);
    }
    return age;
  }

  Future<List<ItemMySalesModel>> loadMySalesList(String searchKey) async{
    String searchSql = '';
    List<ItemMySalesModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MySales.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMySalesModel my_sales = ItemMySalesModel(jsonDecode(map['meta']));
        my_sales.item!.cnt = map['cnt'];
		my_sales.item!.page = map['page'];
        my_sales.item!.age = map['age'];
	    my_sales.item!.ttl = map['ttl'];
	    my_sales.item!.pht = map['pht'];
	    my_sales.item!.sbttl = map['sbttl'];
        appList.add(my_sales);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MySales.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMySalesModel my_sales = ItemMySalesModel(jsonDecode(map['meta']));
        my_sales.item!.cnt = map['cnt'];
		my_sales.item!.page = map['page'];
        my_sales.item!.age = map['age'];
		my_sales.item!.ttl = map['ttl'];
	    my_sales.item!.pht = map['pht'];
	    my_sales.item!.sbttl = map['sbttl'];
        appList.add(my_sales);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMySalesList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MySales.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateMyOrdersList(ItemMyOrdersModel my_orders) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_orders.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyOrders, 
		  userID, 
		  my_orders.item!.page,
          my_orders.item!.age,
          my_orders.item!.cnt,
		  my_orders.item!.ttl,
		  my_orders.item!.pht,
		  my_orders.item!.sbttl,
          searchText,
          meta,
          my_orders.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_orders.item!.id,
			TableID_MyOrders,
			userID,
			 my_orders.item!.page,
            my_orders.item!.age,
            my_orders.item!.cnt,
			my_orders.item!.ttl,
		    my_orders.item!.pht,
		    my_orders.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyOrdersListingModel> loadMyOrdersListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyOrders.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyOrdersListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyOrdersListInfo(MyOrdersListingModel my_orders) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_orders.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyOrders,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyOrders,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyOrdersAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyOrders.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyOrdersModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyOrdersModel my_orders = ItemMyOrdersModel(jsonDecode(map['meta']));
      my_orders.item!.cnt = map['cnt'];
      my_orders.item!.age = map['age'];
	   my_orders.item!.page = map['page'];
	  my_orders.item!.ttl = map['ttl'];
	  my_orders.item!.pht = map['pht'];
	  my_orders.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_orders);
    }
    return age;
  }

  Future<List<ItemMyOrdersModel>> loadMyOrdersList(String searchKey) async{
    String searchSql = '';
    List<ItemMyOrdersModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyOrders.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyOrdersModel my_orders = ItemMyOrdersModel(jsonDecode(map['meta']));
        my_orders.item!.cnt = map['cnt'];
		my_orders.item!.page = map['page'];
        my_orders.item!.age = map['age'];
	    my_orders.item!.ttl = map['ttl'];
	    my_orders.item!.pht = map['pht'];
	    my_orders.item!.sbttl = map['sbttl'];
        appList.add(my_orders);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyOrders.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyOrdersModel my_orders = ItemMyOrdersModel(jsonDecode(map['meta']));
        my_orders.item!.cnt = map['cnt'];
		my_orders.item!.page = map['page'];
        my_orders.item!.age = map['age'];
		my_orders.item!.ttl = map['ttl'];
	    my_orders.item!.pht = map['pht'];
	    my_orders.item!.sbttl = map['sbttl'];
        appList.add(my_orders);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyOrdersList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyOrders.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateConfirmPaymentMyOrders(ConfirmPaymentMyOrdersModel confirm_payment, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(confirm_payment.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ConfirmPaymentMyOrders, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ConfirmPaymentMyOrders$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ConfirmPaymentMyOrders$spKey',
			 TableID_ConfirmPaymentMyOrders, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ConfirmPaymentMyOrdersModel? > loadConfirmPaymentMyOrders(String searchKey) async{
    String searchSql = '';
    ConfirmPaymentMyOrdersModel appList ;
	List<Map>  listuser = [];
	ConfirmPaymentMyOrdersModel? confirm_payment;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ConfirmPaymentMyOrders$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          confirm_payment = ConfirmPaymentMyOrdersModel(jsonDecode(map['meta']));
        confirm_payment.model.model.cnt = map['cnt'];
		confirm_payment.model.model.page = map['page'];
        confirm_payment.model.model.age = map['age'];
	    confirm_payment.model.model.ttl = map['ttl'];
	    confirm_payment.model.model.pht = map['pht'];
	    confirm_payment.model.model.sbttl = map['sbttl'];
       // appList.add(my_orders);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ConfirmPaymentMyOrders$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        confirm_payment = ConfirmPaymentMyOrdersModel(jsonDecode(map['meta']));
        confirm_payment.model.model.cnt = map['cnt'];
		confirm_payment.model.model.page = map['page'];
        confirm_payment.model.model.age = map['age'];
	    confirm_payment.model.model.ttl = map['ttl'];
	    confirm_payment.model.model.pht = map['pht'];
	    confirm_payment.model.model.sbttl = map['sbttl'];
        //appList.add(my_orders);
      }
    }

    return confirm_payment;
  }
  
   Future<void> deleteAllConfirmPaymentMyOrders(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ConfirmPaymentMyOrders$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ConfirmPaymentMyOrders$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateMyPurchasesList(ItemMyPurchasesModel my_purchases) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_purchases.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyPurchases, 
		  userID, 
		  my_purchases.item!.page,
          my_purchases.item!.age,
          my_purchases.item!.cnt,
		  my_purchases.item!.ttl,
		  my_purchases.item!.pht,
		  my_purchases.item!.sbttl,
          searchText,
          meta,
          my_purchases.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_purchases.item!.id,
			TableID_MyPurchases,
			userID,
			 my_purchases.item!.page,
            my_purchases.item!.age,
            my_purchases.item!.cnt,
			my_purchases.item!.ttl,
		    my_purchases.item!.pht,
		    my_purchases.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyPurchasesListingModel> loadMyPurchasesListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyPurchases.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyPurchasesListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyPurchasesListInfo(MyPurchasesListingModel my_purchases) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_purchases.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyPurchases,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyPurchases,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyPurchasesAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyPurchases.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyPurchasesModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyPurchasesModel my_purchases = ItemMyPurchasesModel(jsonDecode(map['meta']));
      my_purchases.item!.cnt = map['cnt'];
      my_purchases.item!.age = map['age'];
	   my_purchases.item!.page = map['page'];
	  my_purchases.item!.ttl = map['ttl'];
	  my_purchases.item!.pht = map['pht'];
	  my_purchases.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_purchases);
    }
    return age;
  }

  Future<List<ItemMyPurchasesModel>> loadMyPurchasesList(String searchKey) async{
    String searchSql = '';
    List<ItemMyPurchasesModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyPurchases.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyPurchasesModel my_purchases = ItemMyPurchasesModel(jsonDecode(map['meta']));
        my_purchases.item!.cnt = map['cnt'];
		my_purchases.item!.page = map['page'];
        my_purchases.item!.age = map['age'];
	    my_purchases.item!.ttl = map['ttl'];
	    my_purchases.item!.pht = map['pht'];
	    my_purchases.item!.sbttl = map['sbttl'];
        appList.add(my_purchases);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyPurchases.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyPurchasesModel my_purchases = ItemMyPurchasesModel(jsonDecode(map['meta']));
        my_purchases.item!.cnt = map['cnt'];
		my_purchases.item!.page = map['page'];
        my_purchases.item!.age = map['age'];
		my_purchases.item!.ttl = map['ttl'];
	    my_purchases.item!.pht = map['pht'];
	    my_purchases.item!.sbttl = map['sbttl'];
        appList.add(my_purchases);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyPurchasesList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyPurchases.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateDownloadMyPurchases(DownloadMyPurchasesModel download, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(download.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_DownloadMyPurchases, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'DownloadMyPurchases$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'DownloadMyPurchases$spKey',
			 TableID_DownloadMyPurchases, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<DownloadMyPurchasesModel? > loadDownloadMyPurchases(String searchKey) async{
    String searchSql = '';
    DownloadMyPurchasesModel appList ;
	List<Map>  listuser = [];
	DownloadMyPurchasesModel? download;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'DownloadMyPurchases$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          download = DownloadMyPurchasesModel(jsonDecode(map['meta']));
        download.model.model.cnt = map['cnt'];
		download.model.model.page = map['page'];
        download.model.model.age = map['age'];
	    download.model.model.ttl = map['ttl'];
	    download.model.model.pht = map['pht'];
	    download.model.model.sbttl = map['sbttl'];
       // appList.add(my_purchases);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'DownloadMyPurchases$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        download = DownloadMyPurchasesModel(jsonDecode(map['meta']));
        download.model.model.cnt = map['cnt'];
		download.model.model.page = map['page'];
        download.model.model.age = map['age'];
	    download.model.model.ttl = map['ttl'];
	    download.model.model.pht = map['pht'];
	    download.model.model.sbttl = map['sbttl'];
        //appList.add(my_purchases);
      }
    }

    return download;
  }
  
   Future<void> deleteAllDownloadMyPurchases(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'DownloadMyPurchases$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'DownloadMyPurchases$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateRateProductMyPurchases(RateProductMyPurchasesModel rate_product, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(rate_product.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_RateProductMyPurchases, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'RateProductMyPurchases$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'RateProductMyPurchases$spKey',
			 TableID_RateProductMyPurchases, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<RateProductMyPurchasesModel? > loadRateProductMyPurchases(String searchKey) async{
    String searchSql = '';
    RateProductMyPurchasesModel appList ;
	List<Map>  listuser = [];
	RateProductMyPurchasesModel? rate_product;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'RateProductMyPurchases$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          rate_product = RateProductMyPurchasesModel(jsonDecode(map['meta']));
        rate_product.model.model.cnt = map['cnt'];
		rate_product.model.model.page = map['page'];
        rate_product.model.model.age = map['age'];
	    rate_product.model.model.ttl = map['ttl'];
	    rate_product.model.model.pht = map['pht'];
	    rate_product.model.model.sbttl = map['sbttl'];
       // appList.add(my_purchases);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'RateProductMyPurchases$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        rate_product = RateProductMyPurchasesModel(jsonDecode(map['meta']));
        rate_product.model.model.cnt = map['cnt'];
		rate_product.model.model.page = map['page'];
        rate_product.model.model.age = map['age'];
	    rate_product.model.model.ttl = map['ttl'];
	    rate_product.model.model.pht = map['pht'];
	    rate_product.model.model.sbttl = map['sbttl'];
        //appList.add(my_purchases);
      }
    }

    return rate_product;
  }
  
   Future<void> deleteAllRateProductMyPurchases(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RateProductMyPurchases$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RateProductMyPurchases$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateMyReferalsList(ItemMyReferalsModel my_referals) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_referals.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyReferals, 
		  userID, 
		  my_referals.item!.page,
          my_referals.item!.age,
          my_referals.item!.cnt,
		  my_referals.item!.ttl,
		  my_referals.item!.pht,
		  my_referals.item!.sbttl,
          searchText,
          meta,
          my_referals.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_referals.item!.id,
			TableID_MyReferals,
			userID,
			 my_referals.item!.page,
            my_referals.item!.age,
            my_referals.item!.cnt,
			my_referals.item!.ttl,
		    my_referals.item!.pht,
		    my_referals.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyReferalsListingModel> loadMyReferalsListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyReferals.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyReferalsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyReferalsListInfo(MyReferalsListingModel my_referals) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_referals.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyReferals,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyReferals,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyReferalsAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyReferals.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyReferalsModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyReferalsModel my_referals = ItemMyReferalsModel(jsonDecode(map['meta']));
      my_referals.item!.cnt = map['cnt'];
      my_referals.item!.age = map['age'];
	   my_referals.item!.page = map['page'];
	  my_referals.item!.ttl = map['ttl'];
	  my_referals.item!.pht = map['pht'];
	  my_referals.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_referals);
    }
    return age;
  }

  Future<List<ItemMyReferalsModel>> loadMyReferalsList(String searchKey) async{
    String searchSql = '';
    List<ItemMyReferalsModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyReferals.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyReferalsModel my_referals = ItemMyReferalsModel(jsonDecode(map['meta']));
        my_referals.item!.cnt = map['cnt'];
		my_referals.item!.page = map['page'];
        my_referals.item!.age = map['age'];
	    my_referals.item!.ttl = map['ttl'];
	    my_referals.item!.pht = map['pht'];
	    my_referals.item!.sbttl = map['sbttl'];
        appList.add(my_referals);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyReferals.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyReferalsModel my_referals = ItemMyReferalsModel(jsonDecode(map['meta']));
        my_referals.item!.cnt = map['cnt'];
		my_referals.item!.page = map['page'];
        my_referals.item!.age = map['age'];
		my_referals.item!.ttl = map['ttl'];
	    my_referals.item!.pht = map['pht'];
	    my_referals.item!.sbttl = map['sbttl'];
        appList.add(my_referals);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyReferalsList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyReferals.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateMyFinanceList(ItemMyFinanceModel my_finance) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_finance.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyFinance, 
		  userID, 
		  my_finance.item!.page,
          my_finance.item!.age,
          my_finance.item!.cnt,
		  my_finance.item!.ttl,
		  my_finance.item!.pht,
		  my_finance.item!.sbttl,
          searchText,
          meta,
          my_finance.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_finance.item!.id,
			TableID_MyFinance,
			userID,
			 my_finance.item!.page,
            my_finance.item!.age,
            my_finance.item!.cnt,
			my_finance.item!.ttl,
		    my_finance.item!.pht,
		    my_finance.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyFinanceListingModel> loadMyFinanceListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyFinance.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyFinanceListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyFinanceListInfo(MyFinanceListingModel my_finance) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_finance.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyFinance,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyFinance,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyFinanceAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyFinance.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyFinanceModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyFinanceModel my_finance = ItemMyFinanceModel(jsonDecode(map['meta']));
      my_finance.item!.cnt = map['cnt'];
      my_finance.item!.age = map['age'];
	   my_finance.item!.page = map['page'];
	  my_finance.item!.ttl = map['ttl'];
	  my_finance.item!.pht = map['pht'];
	  my_finance.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_finance);
    }
    return age;
  }

  Future<List<ItemMyFinanceModel>> loadMyFinanceList(String searchKey) async{
    String searchSql = '';
    List<ItemMyFinanceModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyFinance.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyFinanceModel my_finance = ItemMyFinanceModel(jsonDecode(map['meta']));
        my_finance.item!.cnt = map['cnt'];
		my_finance.item!.page = map['page'];
        my_finance.item!.age = map['age'];
	    my_finance.item!.ttl = map['ttl'];
	    my_finance.item!.pht = map['pht'];
	    my_finance.item!.sbttl = map['sbttl'];
        appList.add(my_finance);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyFinance.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyFinanceModel my_finance = ItemMyFinanceModel(jsonDecode(map['meta']));
        my_finance.item!.cnt = map['cnt'];
		my_finance.item!.page = map['page'];
        my_finance.item!.age = map['age'];
		my_finance.item!.ttl = map['ttl'];
	    my_finance.item!.pht = map['pht'];
	    my_finance.item!.sbttl = map['sbttl'];
        appList.add(my_finance);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyFinanceList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyFinance.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateChangePaymentSettingsMyFinance(ChangePaymentSettingsMyFinanceModel change_payment_settings, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(change_payment_settings.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ChangePaymentSettingsMyFinance, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ChangePaymentSettingsMyFinance$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ChangePaymentSettingsMyFinance$spKey',
			 TableID_ChangePaymentSettingsMyFinance, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ChangePaymentSettingsMyFinanceModel? > loadChangePaymentSettingsMyFinance(String searchKey) async{
    String searchSql = '';
    ChangePaymentSettingsMyFinanceModel appList ;
	List<Map>  listuser = [];
	ChangePaymentSettingsMyFinanceModel? change_payment_settings;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ChangePaymentSettingsMyFinance$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          change_payment_settings = ChangePaymentSettingsMyFinanceModel(jsonDecode(map['meta']));
        change_payment_settings.model.model.cnt = map['cnt'];
		change_payment_settings.model.model.page = map['page'];
        change_payment_settings.model.model.age = map['age'];
	    change_payment_settings.model.model.ttl = map['ttl'];
	    change_payment_settings.model.model.pht = map['pht'];
	    change_payment_settings.model.model.sbttl = map['sbttl'];
       // appList.add(my_finance);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ChangePaymentSettingsMyFinance$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        change_payment_settings = ChangePaymentSettingsMyFinanceModel(jsonDecode(map['meta']));
        change_payment_settings.model.model.cnt = map['cnt'];
		change_payment_settings.model.model.page = map['page'];
        change_payment_settings.model.model.age = map['age'];
	    change_payment_settings.model.model.ttl = map['ttl'];
	    change_payment_settings.model.model.pht = map['pht'];
	    change_payment_settings.model.model.sbttl = map['sbttl'];
        //appList.add(my_finance);
      }
    }

    return change_payment_settings;
  }
  
   Future<void> deleteAllChangePaymentSettingsMyFinance(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ChangePaymentSettingsMyFinance$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ChangePaymentSettingsMyFinance$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateWithdrawPaymentMyFinance(WithdrawPaymentMyFinanceModel withdraw_payment, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(withdraw_payment.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_WithdrawPaymentMyFinance, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'WithdrawPaymentMyFinance$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'WithdrawPaymentMyFinance$spKey',
			 TableID_WithdrawPaymentMyFinance, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<WithdrawPaymentMyFinanceModel? > loadWithdrawPaymentMyFinance(String searchKey) async{
    String searchSql = '';
    WithdrawPaymentMyFinanceModel appList ;
	List<Map>  listuser = [];
	WithdrawPaymentMyFinanceModel? withdraw_payment;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'WithdrawPaymentMyFinance$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          withdraw_payment = WithdrawPaymentMyFinanceModel(jsonDecode(map['meta']));
        withdraw_payment.model.model.cnt = map['cnt'];
		withdraw_payment.model.model.page = map['page'];
        withdraw_payment.model.model.age = map['age'];
	    withdraw_payment.model.model.ttl = map['ttl'];
	    withdraw_payment.model.model.pht = map['pht'];
	    withdraw_payment.model.model.sbttl = map['sbttl'];
       // appList.add(my_finance);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'WithdrawPaymentMyFinance$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        withdraw_payment = WithdrawPaymentMyFinanceModel(jsonDecode(map['meta']));
        withdraw_payment.model.model.cnt = map['cnt'];
		withdraw_payment.model.model.page = map['page'];
        withdraw_payment.model.model.age = map['age'];
	    withdraw_payment.model.model.ttl = map['ttl'];
	    withdraw_payment.model.model.pht = map['pht'];
	    withdraw_payment.model.model.sbttl = map['sbttl'];
        //appList.add(my_finance);
      }
    }

    return withdraw_payment;
  }
  
   Future<void> deleteAllWithdrawPaymentMyFinance(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'WithdrawPaymentMyFinance$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'WithdrawPaymentMyFinance$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateDepositBalanceMyFinance(DepositBalanceMyFinanceModel deposit_balance, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(deposit_balance.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_DepositBalanceMyFinance, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'DepositBalanceMyFinance$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'DepositBalanceMyFinance$spKey',
			 TableID_DepositBalanceMyFinance, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<DepositBalanceMyFinanceModel? > loadDepositBalanceMyFinance(String searchKey) async{
    String searchSql = '';
    DepositBalanceMyFinanceModel appList ;
	List<Map>  listuser = [];
	DepositBalanceMyFinanceModel? deposit_balance;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'DepositBalanceMyFinance$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          deposit_balance = DepositBalanceMyFinanceModel(jsonDecode(map['meta']));
        deposit_balance.model.model.cnt = map['cnt'];
		deposit_balance.model.model.page = map['page'];
        deposit_balance.model.model.age = map['age'];
	    deposit_balance.model.model.ttl = map['ttl'];
	    deposit_balance.model.model.pht = map['pht'];
	    deposit_balance.model.model.sbttl = map['sbttl'];
       // appList.add(my_finance);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'DepositBalanceMyFinance$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        deposit_balance = DepositBalanceMyFinanceModel(jsonDecode(map['meta']));
        deposit_balance.model.model.cnt = map['cnt'];
		deposit_balance.model.model.page = map['page'];
        deposit_balance.model.model.age = map['age'];
	    deposit_balance.model.model.ttl = map['ttl'];
	    deposit_balance.model.model.pht = map['pht'];
	    deposit_balance.model.model.sbttl = map['sbttl'];
        //appList.add(my_finance);
      }
    }

    return deposit_balance;
  }
  
   Future<void> deleteAllDepositBalanceMyFinance(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'DepositBalanceMyFinance$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'DepositBalanceMyFinance$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateMyPointsList(ItemMyPointsModel my_points) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_points.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyPoints, 
		  userID, 
		  my_points.item!.page,
          my_points.item!.age,
          my_points.item!.cnt,
		  my_points.item!.ttl,
		  my_points.item!.pht,
		  my_points.item!.sbttl,
          searchText,
          meta,
          my_points.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_points.item!.id,
			TableID_MyPoints,
			userID,
			 my_points.item!.page,
            my_points.item!.age,
            my_points.item!.cnt,
			my_points.item!.ttl,
		    my_points.item!.pht,
		    my_points.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyPointsListingModel> loadMyPointsListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyPoints.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyPointsListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyPointsListInfo(MyPointsListingModel my_points) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_points.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyPoints,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyPoints,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyPointsAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyPoints.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyPointsModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyPointsModel my_points = ItemMyPointsModel(jsonDecode(map['meta']));
      my_points.item!.cnt = map['cnt'];
      my_points.item!.age = map['age'];
	   my_points.item!.page = map['page'];
	  my_points.item!.ttl = map['ttl'];
	  my_points.item!.pht = map['pht'];
	  my_points.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_points);
    }
    return age;
  }

  Future<List<ItemMyPointsModel>> loadMyPointsList(String searchKey) async{
    String searchSql = '';
    List<ItemMyPointsModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyPoints.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyPointsModel my_points = ItemMyPointsModel(jsonDecode(map['meta']));
        my_points.item!.cnt = map['cnt'];
		my_points.item!.page = map['page'];
        my_points.item!.age = map['age'];
	    my_points.item!.ttl = map['ttl'];
	    my_points.item!.pht = map['pht'];
	    my_points.item!.sbttl = map['sbttl'];
        appList.add(my_points);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyPoints.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyPointsModel my_points = ItemMyPointsModel(jsonDecode(map['meta']));
        my_points.item!.cnt = map['cnt'];
		my_points.item!.page = map['page'];
        my_points.item!.age = map['age'];
		my_points.item!.ttl = map['ttl'];
	    my_points.item!.pht = map['pht'];
	    my_points.item!.sbttl = map['sbttl'];
        appList.add(my_points);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyPointsList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyPoints.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateMyProfileList(ItemMyProfileModel my_profile) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_profile.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyProfile, 
		  userID, 
		  my_profile.item!.page,
          my_profile.item!.age,
          my_profile.item!.cnt,
		  my_profile.item!.ttl,
		  my_profile.item!.pht,
		  my_profile.item!.sbttl,
          searchText,
          meta,
          my_profile.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_profile.item!.id,
			TableID_MyProfile,
			userID,
			 my_profile.item!.page,
            my_profile.item!.age,
            my_profile.item!.cnt,
			my_profile.item!.ttl,
		    my_profile.item!.pht,
		    my_profile.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyProfileListingModel> loadMyProfileListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyProfile.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyProfileListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyProfileListInfo(MyProfileListingModel my_profile) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_profile.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyProfile,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyProfile,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyProfileAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyProfile.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyProfileModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyProfileModel my_profile = ItemMyProfileModel(jsonDecode(map['meta']));
      my_profile.item!.cnt = map['cnt'];
      my_profile.item!.age = map['age'];
	   my_profile.item!.page = map['page'];
	  my_profile.item!.ttl = map['ttl'];
	  my_profile.item!.pht = map['pht'];
	  my_profile.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_profile);
    }
    return age;
  }

  Future<List<ItemMyProfileModel>> loadMyProfileList(String searchKey) async{
    String searchSql = '';
    List<ItemMyProfileModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyProfile.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyProfileModel my_profile = ItemMyProfileModel(jsonDecode(map['meta']));
        my_profile.item!.cnt = map['cnt'];
		my_profile.item!.page = map['page'];
        my_profile.item!.age = map['age'];
	    my_profile.item!.ttl = map['ttl'];
	    my_profile.item!.pht = map['pht'];
	    my_profile.item!.sbttl = map['sbttl'];
        appList.add(my_profile);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyProfile.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyProfileModel my_profile = ItemMyProfileModel(jsonDecode(map['meta']));
        my_profile.item!.cnt = map['cnt'];
		my_profile.item!.page = map['page'];
        my_profile.item!.age = map['age'];
		my_profile.item!.ttl = map['ttl'];
	    my_profile.item!.pht = map['pht'];
	    my_profile.item!.sbttl = map['sbttl'];
        appList.add(my_profile);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyProfileList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyProfile.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateEditProfileMyProfile(EditProfileMyProfileModel edit_profile, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(edit_profile.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_EditProfileMyProfile, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'EditProfileMyProfile$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'EditProfileMyProfile$spKey',
			 TableID_EditProfileMyProfile, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<EditProfileMyProfileModel? > loadEditProfileMyProfile(String searchKey) async{
    String searchSql = '';
    EditProfileMyProfileModel appList ;
	List<Map>  listuser = [];
	EditProfileMyProfileModel? edit_profile;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'EditProfileMyProfile$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          edit_profile = EditProfileMyProfileModel(jsonDecode(map['meta']));
        edit_profile.model.model.cnt = map['cnt'];
		edit_profile.model.model.page = map['page'];
        edit_profile.model.model.age = map['age'];
	    edit_profile.model.model.ttl = map['ttl'];
	    edit_profile.model.model.pht = map['pht'];
	    edit_profile.model.model.sbttl = map['sbttl'];
       // appList.add(my_profile);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'EditProfileMyProfile$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        edit_profile = EditProfileMyProfileModel(jsonDecode(map['meta']));
        edit_profile.model.model.cnt = map['cnt'];
		edit_profile.model.model.page = map['page'];
        edit_profile.model.model.age = map['age'];
	    edit_profile.model.model.ttl = map['ttl'];
	    edit_profile.model.model.pht = map['pht'];
	    edit_profile.model.model.sbttl = map['sbttl'];
        //appList.add(my_profile);
      }
    }

    return edit_profile;
  }
  
   Future<void> deleteAllEditProfileMyProfile(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EditProfileMyProfile$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'EditProfileMyProfile$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateChangePasswordMyProfile(ChangePasswordMyProfileModel change_password, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(change_password.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ChangePasswordMyProfile, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ChangePasswordMyProfile$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ChangePasswordMyProfile$spKey',
			 TableID_ChangePasswordMyProfile, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ChangePasswordMyProfileModel? > loadChangePasswordMyProfile(String searchKey) async{
    String searchSql = '';
    ChangePasswordMyProfileModel appList ;
	List<Map>  listuser = [];
	ChangePasswordMyProfileModel? change_password;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ChangePasswordMyProfile$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          change_password = ChangePasswordMyProfileModel(jsonDecode(map['meta']));
        change_password.model.model.cnt = map['cnt'];
		change_password.model.model.page = map['page'];
        change_password.model.model.age = map['age'];
	    change_password.model.model.ttl = map['ttl'];
	    change_password.model.model.pht = map['pht'];
	    change_password.model.model.sbttl = map['sbttl'];
       // appList.add(my_profile);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ChangePasswordMyProfile$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        change_password = ChangePasswordMyProfileModel(jsonDecode(map['meta']));
        change_password.model.model.cnt = map['cnt'];
		change_password.model.model.page = map['page'];
        change_password.model.model.age = map['age'];
	    change_password.model.model.ttl = map['ttl'];
	    change_password.model.model.pht = map['pht'];
	    change_password.model.model.sbttl = map['sbttl'];
        //appList.add(my_profile);
      }
    }

    return change_password;
  }
  
   Future<void> deleteAllChangePasswordMyProfile(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ChangePasswordMyProfile$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ChangePasswordMyProfile$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateChangeEmailMyProfile(ChangeEmailMyProfileModel change_email, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(change_email.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ChangeEmailMyProfile, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ChangeEmailMyProfile$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ChangeEmailMyProfile$spKey',
			 TableID_ChangeEmailMyProfile, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ChangeEmailMyProfileModel? > loadChangeEmailMyProfile(String searchKey) async{
    String searchSql = '';
    ChangeEmailMyProfileModel appList ;
	List<Map>  listuser = [];
	ChangeEmailMyProfileModel? change_email;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ChangeEmailMyProfile$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          change_email = ChangeEmailMyProfileModel(jsonDecode(map['meta']));
        change_email.model.model.cnt = map['cnt'];
		change_email.model.model.page = map['page'];
        change_email.model.model.age = map['age'];
	    change_email.model.model.ttl = map['ttl'];
	    change_email.model.model.pht = map['pht'];
	    change_email.model.model.sbttl = map['sbttl'];
       // appList.add(my_profile);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ChangeEmailMyProfile$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        change_email = ChangeEmailMyProfileModel(jsonDecode(map['meta']));
        change_email.model.model.cnt = map['cnt'];
		change_email.model.model.page = map['page'];
        change_email.model.model.age = map['age'];
	    change_email.model.model.ttl = map['ttl'];
	    change_email.model.model.pht = map['pht'];
	    change_email.model.model.sbttl = map['sbttl'];
        //appList.add(my_profile);
      }
    }

    return change_email;
  }
  
   Future<void> deleteAllChangeEmailMyProfile(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ChangeEmailMyProfile$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ChangeEmailMyProfile$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  
  Future<void> saveOrUpdateChangeHandphoneMyProfile(ChangeHandphoneMyProfileModel change_handphone, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(change_handphone.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_ChangeHandphoneMyProfile, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'ChangeHandphoneMyProfile$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'ChangeHandphoneMyProfile$spKey',
			 TableID_ChangeHandphoneMyProfile, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<ChangeHandphoneMyProfileModel? > loadChangeHandphoneMyProfile(String searchKey) async{
    String searchSql = '';
    ChangeHandphoneMyProfileModel appList ;
	List<Map>  listuser = [];
	ChangeHandphoneMyProfileModel? change_handphone;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'ChangeHandphoneMyProfile$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          change_handphone = ChangeHandphoneMyProfileModel(jsonDecode(map['meta']));
        change_handphone.model.model.cnt = map['cnt'];
		change_handphone.model.model.page = map['page'];
        change_handphone.model.model.age = map['age'];
	    change_handphone.model.model.ttl = map['ttl'];
	    change_handphone.model.model.pht = map['pht'];
	    change_handphone.model.model.sbttl = map['sbttl'];
       // appList.add(my_profile);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'ChangeHandphoneMyProfile$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        change_handphone = ChangeHandphoneMyProfileModel(jsonDecode(map['meta']));
        change_handphone.model.model.cnt = map['cnt'];
		change_handphone.model.model.page = map['page'];
        change_handphone.model.model.age = map['age'];
	    change_handphone.model.model.ttl = map['ttl'];
	    change_handphone.model.model.pht = map['pht'];
	    change_handphone.model.model.sbttl = map['sbttl'];
        //appList.add(my_profile);
      }
    }

    return change_handphone;
  }
  
   Future<void> deleteAllChangeHandphoneMyProfile(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ChangeHandphoneMyProfile$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'ChangeHandphoneMyProfile$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  




  Future<void> saveOrUpdateKelurahanList(ItemKelurahanModel kelurahan) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(kelurahan.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_Kelurahan, 
		  userID, 
		  kelurahan.item!.page,
          kelurahan.item!.age,
          kelurahan.item!.cnt,
		  kelurahan.item!.ttl,
		  kelurahan.item!.pht,
		  kelurahan.item!.sbttl,
          searchText,
          meta,
          kelurahan.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            kelurahan.item!.id,
			TableID_Kelurahan,
			userID,
			 kelurahan.item!.page,
            kelurahan.item!.age,
            kelurahan.item!.cnt,
			kelurahan.item!.ttl,
		    kelurahan.item!.pht,
		    kelurahan.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<KelurahanListingModel> loadKelurahanListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_Kelurahan.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  KelurahanListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateKelurahanListInfo(KelurahanListingModel kelurahan) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(kelurahan.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_Kelurahan,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_Kelurahan,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listKelurahanAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_Kelurahan.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemKelurahanModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemKelurahanModel kelurahan = ItemKelurahanModel(jsonDecode(map['meta']));
      kelurahan.item!.cnt = map['cnt'];
      kelurahan.item!.age = map['age'];
	   kelurahan.item!.page = map['page'];
	  kelurahan.item!.ttl = map['ttl'];
	  kelurahan.item!.pht = map['pht'];
	  kelurahan.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(kelurahan);
    }
    return age;
  }

  Future<List<ItemKelurahanModel>> loadKelurahanList(String searchKey) async{
    String searchSql = '';
    List<ItemKelurahanModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_Kelurahan.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemKelurahanModel kelurahan = ItemKelurahanModel(jsonDecode(map['meta']));
        kelurahan.item!.cnt = map['cnt'];
		kelurahan.item!.page = map['page'];
        kelurahan.item!.age = map['age'];
	    kelurahan.item!.ttl = map['ttl'];
	    kelurahan.item!.pht = map['pht'];
	    kelurahan.item!.sbttl = map['sbttl'];
        appList.add(kelurahan);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_Kelurahan.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemKelurahanModel kelurahan = ItemKelurahanModel(jsonDecode(map['meta']));
        kelurahan.item!.cnt = map['cnt'];
		kelurahan.item!.page = map['page'];
        kelurahan.item!.age = map['age'];
		kelurahan.item!.ttl = map['ttl'];
	    kelurahan.item!.pht = map['pht'];
	    kelurahan.item!.sbttl = map['sbttl'];
        appList.add(kelurahan);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllKelurahanList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_Kelurahan.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateMyBookmarksList(ItemMyBookmarksModel my_bookmarks) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_bookmarks.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyBookmarks, 
		  userID, 
		  my_bookmarks.item!.page,
          my_bookmarks.item!.age,
          my_bookmarks.item!.cnt,
		  my_bookmarks.item!.ttl,
		  my_bookmarks.item!.pht,
		  my_bookmarks.item!.sbttl,
          searchText,
          meta,
          my_bookmarks.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_bookmarks.item!.id,
			TableID_MyBookmarks,
			userID,
			 my_bookmarks.item!.page,
            my_bookmarks.item!.age,
            my_bookmarks.item!.cnt,
			my_bookmarks.item!.ttl,
		    my_bookmarks.item!.pht,
		    my_bookmarks.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyBookmarksListingModel> loadMyBookmarksListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyBookmarks.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyBookmarksListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyBookmarksListInfo(MyBookmarksListingModel my_bookmarks) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_bookmarks.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyBookmarks,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyBookmarks,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyBookmarksAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyBookmarks.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyBookmarksModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyBookmarksModel my_bookmarks = ItemMyBookmarksModel(jsonDecode(map['meta']));
      my_bookmarks.item!.cnt = map['cnt'];
      my_bookmarks.item!.age = map['age'];
	   my_bookmarks.item!.page = map['page'];
	  my_bookmarks.item!.ttl = map['ttl'];
	  my_bookmarks.item!.pht = map['pht'];
	  my_bookmarks.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_bookmarks);
    }
    return age;
  }

  Future<List<ItemMyBookmarksModel>> loadMyBookmarksList(String searchKey) async{
    String searchSql = '';
    List<ItemMyBookmarksModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyBookmarks.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyBookmarksModel my_bookmarks = ItemMyBookmarksModel(jsonDecode(map['meta']));
        my_bookmarks.item!.cnt = map['cnt'];
		my_bookmarks.item!.page = map['page'];
        my_bookmarks.item!.age = map['age'];
	    my_bookmarks.item!.ttl = map['ttl'];
	    my_bookmarks.item!.pht = map['pht'];
	    my_bookmarks.item!.sbttl = map['sbttl'];
        appList.add(my_bookmarks);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyBookmarks.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyBookmarksModel my_bookmarks = ItemMyBookmarksModel(jsonDecode(map['meta']));
        my_bookmarks.item!.cnt = map['cnt'];
		my_bookmarks.item!.page = map['page'];
        my_bookmarks.item!.age = map['age'];
		my_bookmarks.item!.ttl = map['ttl'];
	    my_bookmarks.item!.pht = map['pht'];
	    my_bookmarks.item!.sbttl = map['sbttl'];
        appList.add(my_bookmarks);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyBookmarksList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyBookmarks.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }





  Future<void> saveOrUpdateMyBuddiesList(ItemMyBuddiesModel my_buddies) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_buddies.item!.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_MyBuddies, 
		  userID, 
		  my_buddies.item!.page,
          my_buddies.item!.age,
          my_buddies.item!.cnt,
		  my_buddies.item!.ttl,
		  my_buddies.item!.pht,
		  my_buddies.item!.sbttl,
          searchText,
          meta,
          my_buddies.item!.id,
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            my_buddies.item!.id,
			TableID_MyBuddies,
			userID,
			 my_buddies.item!.page,
            my_buddies.item!.age,
            my_buddies.item!.cnt,
			my_buddies.item!.ttl,
		    my_buddies.item!.pht,
		    my_buddies.item!.sbttl,
            searchText,
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
   Future<MyBuddiesListingModel> loadMyBuddiesListInfo(String searchKey) async{
     List<Map> list = [];
	 List<Map>  listuser = [];
	 var meta ;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery( '''
                                             SELECT 
                                             meta 
                                             FROM storage_info
					     WHERE `table_id` = '''+ TableID_MyBuddies.toString()  + ''' AND `user_id` = '$userID'
                                             ''');
	
	
	batchList =	await batch.commit();
	//});
     list.addAll(batchList.first as List<Map>);
	for(var map in list) {
     meta =  MyBuddiesListingModel(jsonDecode(map['meta']));
    }										 
    return meta;	
   }
  
    Future<void> saveOrUpdateMyBuddiesListInfo(MyBuddiesListingModel my_buddies) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(my_buddies.tools.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
      var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage_info
    SET  
	user_id = ?,
    meta = ?  

    WHERE table_id = ?
	      
     '''
        ,
        [ 
		  userID,
          meta,
          TableID_MyBuddies,
		  
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage_info (
	  table_id, 
	  user_id,
      meta ) 
      VALUES ( 
	  ?,
	  ?, 
      ? ) '''
          ,
          [
			TableID_MyBuddies,
			userID,
            meta,
          ]);
      await batch1.commit(noResult: true);
    }
	});

  }
  
  

  Future<int> listMyBuddiesAge() async {
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String searchSql = '''`cnt` = 0 AND `table_id` = ''' + TableID_MyBuddies.toString() + ''' AND `user_id` = '$userID' ''' ;
    List<ItemMyBuddiesModel> appList = [];
    int age = 0 ;
    List<Map> list = [];
	//var batchList;
	//_database!.transaction((txn) async {
      var batch = _database!.batch();
	batch.rawQuery('''
                                                SELECT  
                                                cnt, 
												page,
                                                age,
												ttl,
												pht,
												sbttl,
                                                meta 
                                                FROM storage
                                                WHERE $searchSql ORDER BY `page` ASC, `cnt` ASC
                                          ''');
	var batchList =	await batch.commit();	
   //});	
    list.addAll(batchList.first as List<Map>);
    for(var map in list) {
      ItemMyBuddiesModel my_buddies = ItemMyBuddiesModel(jsonDecode(map['meta']));
      my_buddies.item!.cnt = map['cnt'];
      my_buddies.item!.age = map['age'];
	   my_buddies.item!.page = map['page'];
	  my_buddies.item!.ttl = map['ttl'];
	  my_buddies.item!.pht = map['pht'];
	  my_buddies.item!.sbttl = map['sbttl'];
      age = map['age'];
      appList.add(my_buddies);
    }
    return age;
  }

  Future<List<ItemMyBuddiesModel>> loadMyBuddiesList(String searchKey) async{
    String searchSql = '';
    List<ItemMyBuddiesModel> appList = [];
	List<Map>  listuser = [];
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`search_text` LIKE '%$searchKey%  AND `table_id` = '''+ TableID_MyBuddies.toString()  + ''' AND `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
      var batchList;
		//	_database!.transaction((txn) async {
           var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();
     // });	  
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
        ItemMyBuddiesModel my_buddies = ItemMyBuddiesModel(jsonDecode(map['meta']));
        my_buddies.item!.cnt = map['cnt'];
		my_buddies.item!.page = map['page'];
        my_buddies.item!.age = map['age'];
	    my_buddies.item!.ttl = map['ttl'];
	    my_buddies.item!.pht = map['pht'];
	    my_buddies.item!.sbttl = map['sbttl'];
        appList.add(my_buddies);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE `table_id` = '''+ TableID_MyBuddies.toString() + ''' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	  batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        ItemMyBuddiesModel my_buddies = ItemMyBuddiesModel(jsonDecode(map['meta']));
        my_buddies.item!.cnt = map['cnt'];
		my_buddies.item!.page = map['page'];
        my_buddies.item!.age = map['age'];
		my_buddies.item!.ttl = map['ttl'];
	    my_buddies.item!.pht = map['pht'];
	    my_buddies.item!.sbttl = map['sbttl'];
        appList.add(my_buddies);
      }
    }

    return appList;
  }
  
  Future<void> deleteAllMyBuddiesList() async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	//_database!.transaction((txn) async {
	   var batch = _database!.batch();
    batch.rawDelete('''DELETE FROM storage Where `table_id` = '''+ TableID_MyBuddies.toString()  + ''' AND `user_id` = '$userID' ''');
    await batch.commit(noResult: true);
	//});
 }

  Future<void> saveOrUpdateRemoveMyBuddies(RemoveMyBuddiesModel remove, String spKey) async{
	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    String meta = jsonEncode(remove.model.toJson());
	//String searchText = search(meta);
	String searchText = ''; //search(meta);
	_database!.transaction((txn) async {
	   var batch = txn.batch();
	var batch1 = txn.batch();
    batch.rawUpdate(
        '''UPDATE storage
    SET  
	table_id = ?,
	user_id = ?,
	page = ?,
	age= ?, 
    cnt = ?,  
    ttl = ?,
	pht = ?,
	sbttl = ?,
    search_text =?,
    meta = ?  
    WHERE id = ? 
     '''
        ,
        [
		  TableID_RemoveMyBuddies, 
		  userID, 
		  1,
          1,
          1,
		  '',
		  spKey,
		 '',
          '',
          meta,
          'RemoveMyBuddies$spKey',
        ]);
	var batchList =	await batch.commit();
    if(0 == batchList[0]){
      batch1.rawInsert(
          ''' INSERT INTO  
      storage (
      id, 
	  table_id, 
	  user_id,
	  page, 
      age,  
      cnt,  
	  ttl, 
	  pht, 
	  sbttl, 
      search_text, 
      meta ) 
      VALUES ( 
	  ?, 
	  ?,
	  ?,
	  ?,
      ?, 
	  ?,
	  ?,
      ?, 
      ?, 
      ?,
      ? ) '''
          ,
          [

            'RemoveMyBuddies$spKey',
			 TableID_RemoveMyBuddies, 
			userID,
			 1,
             1,
             1,
			'',
		    spKey,
		    '',
            '',
            meta,
          ]);
         await batch1.commit(noResult: true);
    }
	});

  }
  
    Future<RemoveMyBuddiesModel? > loadRemoveMyBuddies(String searchKey) async{
    String searchSql = '';
    RemoveMyBuddiesModel appList ;
	List<Map>  listuser = [];
	RemoveMyBuddiesModel? remove;
	String userID = '';
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
    if(searchKey.isNotEmpty){
     // searchSql = '''`title` LIKE '%$searchKey%' OR `short_description` LIKE '%$searchKey%''';
	   searchSql = '''`id` = 'RemoveMyBuddies$searchKey' AND  `user_id` = '$userID' ''';
    }
    if(searchKey.isNotEmpty) {
      List<Map> list = [];
         var batchList;
		//	_database!.transaction((txn) async {
	        var batch = _database!.batch();
							batch.rawQuery( '''
                                                 SELECT 
                                                 cnt, 
												 page,
                                                 age, 
												 ttl,
												 pht,
												 sbttl,
                                                 meta 
                                                 FROM storage
                                                 WHERE $searchSql 
                                                 ORDER BY `page` ASC, `cnt` ASC
                                                 ''');
      batchList =	await batch.commit();	
	 // });
      list.addAll(batchList.first as List<Map>);
      for(var map in list) {
          remove = RemoveMyBuddiesModel(jsonDecode(map['meta']));
        remove.model.model.cnt = map['cnt'];
		remove.model.model.page = map['page'];
        remove.model.model.age = map['age'];
	    remove.model.model.ttl = map['ttl'];
	    remove.model.model.pht = map['pht'];
	    remove.model.model.sbttl = map['sbttl'];
       // appList.add(my_buddies);
      }
    } else{
      List<Map> list = [];
	  var batchList;
	 // _database!.transaction((txn) async {
		var batch = _database!.batch();
	  batch.rawQuery( '''
                                             SELECT 
                                             cnt, 
											 page,
                                             age, 
											 ttl,
											 pht,
										     sbttl,
                                             meta 
                                             FROM storage
											 WHERE  `id` = 'RemoveMyBuddies$searchKey' AND `user_id` = '$userID' ORDER BY `page` ASC, `cnt` ASC ''');
	   batchList =	await batch.commit();
	  // });
      list.addAll(batchList.first as List<Map>);

      for(var map in list){
        remove = RemoveMyBuddiesModel(jsonDecode(map['meta']));
        remove.model.model.cnt = map['cnt'];
		remove.model.model.page = map['page'];
        remove.model.model.age = map['age'];
	    remove.model.model.ttl = map['ttl'];
	    remove.model.model.pht = map['pht'];
	    remove.model.model.sbttl = map['sbttl'];
        //appList.add(my_buddies);
      }
    }

    return remove;
  }
  
   Future<void> deleteAllRemoveMyBuddies(String spKey) async{
  	String userID = '';
	List<Map>  listuser = [];
	var res = await loadAccount();
    if(res!= null || res != []){
      listuser.addAll(await loadAccount());
      for(var map in listuser) {
        userID = map['id'];
      }
    }
	 _database!.transaction((txn) async {
		var batch = txn.batch();
	
	if(spKey == ''){
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RemoveMyBuddies$spKey'  AND `user_id` = '$userID' ''');
	}else{
	 batch.rawDelete('''DELETE FROM storage Where `id` = 'RemoveMyBuddies$spKey'   AND `user_id` = '$userID'  AND `user_id` = '$spKey' '''  );
	}
   
    await batch.commit(noResult: true);
	});
 }
  
  





////////////////non generate parent field
  Future<void>                  saveOrUpdateProductCommentsList1(ItemProductCommentsModel product_comments) async{
                  return await        saveOrUpdateProductCommentsList(product_comments, _database!, 201);}
  Future<ProductCommentsListingModel>   loadProductCommentsListInfo1(String searchKey) async{
                  return await                loadProductCommentsListInfo( searchKey, _database!, 201);}
  Future<void>                  saveOrUpdateProductCommentsListInfo1(ProductCommentsListingModel product_comments) async{
                  return await        saveOrUpdateProductCommentsListInfo(product_comments, _database!, 201);}
  Future<int>                           listProductCommentsAge1() async {
                                 return await listProductCommentsAge(_database!, 201);}
  Future<List<ItemProductCommentsModel>> loadProductCommentsList1(String searchKey) async{
                                  return await loadProductCommentsList(searchKey,_database!,201);}
  Future<void>                      deleteAllProductCommentsList1() async{
                    return await          deleteAllProductCommentsList(_database!,201);}

                     
  Future<void>                  saveOrUpdateProductReviewsList1(ItemProductReviewsModel product_comments) async{
   return await        saveOrUpdateProductReviewsList(product_comments, _database!, 301);}
  Future<ProductReviewsListingModel>   loadProductReviewsListInfo1(String searchKey) async{
   return await                loadProductReviewsListInfo( searchKey, _database!, 301);}
  Future<void>                  saveOrUpdateProductReviewsListInfo1(ProductReviewsListingModel product_comments) async{
   return await        saveOrUpdateProductReviewsListInfo(product_comments, _database!, 301);}
  Future<int>                           listProductReviewsAge1() async {
   return await listProductReviewsAge(_database!, 301);}
  Future<List<ItemProductReviewsModel>> loadProductReviewsList1(String searchKey) async{
   return await loadProductReviewsList(searchKey,_database!,301);}
  Future<void>                      deleteAllProductReviewsList1() async{
   return await          deleteAllProductReviewsList(_database!,301);}


  Future<void>  saveOrUpdateScreenshotsList1(ItemScreenshotsModel product_comments) async{
   return await        saveOrUpdateScreenshotsList(product_comments, _database!, 401);}
  Future<ScreenshotsListingModel>   loadScreenshotsListInfo1(String searchKey) async{
   return await                loadScreenshotsListInfo( searchKey, _database!, 401);}
  Future<void>  saveOrUpdateScreenshotsListInfo1(ScreenshotsListingModel product_comments) async{
   return await        saveOrUpdateScreenshotsListInfo(product_comments, _database!, 401);}
  Future<int>   listScreenshotsAge1() async {
   return await listScreenshotsAge(_database!, 401);}
  Future<List<ItemScreenshotsModel>> loadScreenshotsList1(String searchKey) async{
   return await loadScreenshotsList(searchKey,_database!,401);}
  Future<void>  deleteAllScreenshotsList1() async{
   return await          deleteAllScreenshotsList(_database!,401);}


  Future<void>  saveOrUpdateUserBidsList1(ItemUserBidsModel product_comments) async{
   return await        saveOrUpdateUserBidsList(product_comments, _database!, 501);}
  Future<UserBidsListingModel>   loadUserBidsListInfo1(String searchKey) async{
   return await                loadUserBidsListInfo( searchKey, _database!, 501);}
  Future<void>  saveOrUpdateUserBidsListInfo1(UserBidsListingModel product_comments) async{
   return await        saveOrUpdateUserBidsListInfo(product_comments, _database!, 501);}
  Future<int>   listUserBidsAge1() async {
   return await listUserBidsAge(_database!, 501);}
  Future<List<ItemUserBidsModel>> loadUserBidsList1(String searchKey) async{
   return await loadUserBidsList(searchKey,_database!,501);}
  Future<void>  deleteAllUserBidsList1() async{
   return await          deleteAllUserBidsList(_database!,501);}

// browse service
  Future<void>  saveOrUpdateScreenshotsList2(ItemScreenshotsModel product_comments) async{
   return await        saveOrUpdateScreenshotsList(product_comments, _database!, 601);}
  Future<ScreenshotsListingModel>   loadScreenshotsListInfo2(String searchKey) async{
   return await                loadScreenshotsListInfo( searchKey, _database!, 601);}
  Future<void>  saveOrUpdateScreenshotsListInfo2(ScreenshotsListingModel product_comments) async{
   return await        saveOrUpdateScreenshotsListInfo(product_comments, _database!, 601);}
  Future<int>   listScreenshotsAge2() async {
   return await listScreenshotsAge(_database!, 601);}
  Future<List<ItemScreenshotsModel>> loadScreenshotsList2(String searchKey) async{
   return await loadScreenshotsList(searchKey,_database!,601);}
  Future<void>  deleteAllScreenshotsList2() async{
   return await          deleteAllScreenshotsList(_database!,601);}


  Future<void>  saveOrUpdateServiceCommentsList1(ItemServiceCommentsModel mdl) async{
   return await        saveOrUpdateServiceCommentsList(mdl, _database!, 701);}
  Future<ServiceCommentsListingModel>   loadServiceCommentsListInfo1(String searchKey) async{
   return await                loadServiceCommentsListInfo( searchKey, _database!, 701);}
  Future<void>  saveOrUpdateServiceCommentsListInfo1(ServiceCommentsListingModel mdl) async{
   return await        saveOrUpdateServiceCommentsListInfo(mdl, _database!, 701);}
  Future<int>   listServiceCommentsAge1() async {
   return await listServiceCommentsAge(_database!, 701);}
  Future<List<ItemServiceCommentsModel>> loadServiceCommentsList1(String searchKey) async{
   return await loadServiceCommentsList(searchKey,_database!,701);}
  Future<void>  deleteAllServiceCommentsList1() async{
   return await          deleteAllServiceCommentsList(_database!,701);}

  Future<void>  saveOrUpdateServiceReviewsList1(ItemServiceReviewsModel mdl) async{
   return await        saveOrUpdateServiceReviewsList(mdl, _database!, 801);}
  Future<ServiceReviewsListingModel>   loadServiceReviewsListInfo1(String searchKey) async{
   return await                loadServiceReviewsListInfo( searchKey, _database!, 801);}
  Future<void>  saveOrUpdateServiceReviewsListInfo1(ServiceReviewsListingModel mdl) async{
   return await        saveOrUpdateServiceReviewsListInfo(mdl, _database!, 801);}
  Future<int>   listServiceReviewsAge1() async {
   return await listServiceReviewsAge(_database!, 801);}
  Future<List<ItemServiceReviewsModel>> loadServiceReviewsList1(String searchKey) async{
   return await loadServiceReviewsList(searchKey,_database!,801);}
  Future<void>  deleteAllServiceReviewsList1() async{
   return await          deleteAllServiceReviewsList(_database!,801);}


  Future<void>  saveOrUpdateAsProjectOwnerList1(ItemAsProjectOwnerModel mdl) async{
   return await        saveOrUpdateAsProjectOwnerList(mdl, _database!, 901);}
  Future<AsProjectOwnerListingModel>   loadAsProjectOwnerListInfo1(String searchKey) async{
   return await                loadAsProjectOwnerListInfo( searchKey, _database!, 901);}
  Future<void>  saveOrUpdateAsProjectOwnerListInfo1(AsProjectOwnerListingModel mdl) async{
   return await        saveOrUpdateAsProjectOwnerListInfo(mdl, _database!, 901);}
  Future<int>   listAsProjectOwnerAge1() async {
   return await listAsProjectOwnerAge(_database!, 901);}
  Future<List<ItemAsProjectOwnerModel>> loadAsProjectOwnerList1(String searchKey) async{
   return await loadAsProjectOwnerList(searchKey,_database!,901);}
  Future<void>  deleteAllAsProjectOwnerList1() async{
   return await          deleteAllAsProjectOwnerList(_database!,901);}



  Future<void>  saveOrUpdateAsProjectWorkerList1(ItemAsProjectWorkerModel mdl) async{
   return await        saveOrUpdateAsProjectWorkerList(mdl, _database!, 1001);}
  Future<AsProjectWorkerListingModel>   loadAsProjectWorkerListInfo1(String searchKey) async{
   return await                loadAsProjectWorkerListInfo( searchKey, _database!, 1001);}
  Future<void>  saveOrUpdateAsProjectWorkerListInfo1(AsProjectWorkerListingModel mdl) async{
   return await        saveOrUpdateAsProjectWorkerListInfo(mdl, _database!, 1001);}
  Future<int>   listAsProjectWorkerAge1() async {
   return await listAsProjectWorkerAge(_database!, 1001);}
  Future<List<ItemAsProjectWorkerModel>> loadAsProjectWorkerList1(String searchKey) async{
   return await loadAsProjectWorkerList(searchKey,_database!,1001);}
  Future<void>  deleteAllAsProjectWorkerList1() async{
   return await          deleteAllAsProjectWorkerList(_database!,1001);}

  Future<void>  saveOrUpdatePortofolioList1(ItemPortofolioModel mdl) async{
   return await        saveOrUpdatePortofolioList(mdl, _database!, 1101);}
  Future<PortofolioListingModel>   loadPortofolioListInfo1(String searchKey) async{
   return await                loadPortofolioListInfo( searchKey, _database!, 1101);}
  Future<void>  saveOrUpdatePortofolioListInfo1(PortofolioListingModel mdl) async{
   return await        saveOrUpdatePortofolioListInfo(mdl, _database!, 1101);}
  Future<int>   listPortofolioAge1() async {
   return await listPortofolioAge(_database!, 1001);}
  Future<List<ItemPortofolioModel>> loadPortofolioList1(String searchKey) async{
   return await loadPortofolioList(searchKey,_database!,1101);}
  Future<void>  deleteAllPortofolioList1() async{
   return await          deleteAllPortofolioList(_database!,1101);}


  Future<void>  saveOrUpdateProductsList1(ItemProductsModel mdl) async{
   return await        saveOrUpdateProductsList(mdl, _database!, 1201);}
  Future<ProductsListingModel>   loadProductsListInfo1(String searchKey) async{
   return await                loadProductsListInfo( searchKey, _database!, 1201);}
  Future<void>  saveOrUpdateProductsListInfo1(ProductsListingModel mdl) async{
   return await        saveOrUpdateProductsListInfo(mdl, _database!, 1201);}
  Future<int>   listProductsAge1() async {
   return await listProductsAge(_database!, 1201);}
  Future<List<ItemProductsModel>> loadProductsList1(String searchKey) async{
   return await loadProductsList(searchKey,_database!,1201);}
  Future<void>  deleteAllProductsList1() async{
   return await          deleteAllProductsList(_database!,1201);}


  Future<void>  saveOrUpdateServicesList1(ItemServicesModel mdl) async{
   return await        saveOrUpdateServicesList(mdl, _database!, 1301);}
  Future<ServicesListingModel>   loadServicesListInfo1(String searchKey) async{
   return await                loadServicesListInfo( searchKey, _database!, 1301);}
  Future<void>  saveOrUpdateServicesListInfo1(ServicesListingModel mdl) async{
   return await        saveOrUpdateServicesListInfo(mdl, _database!, 1301);}
  Future<int>   listServicesAge1() async {
   return await listServicesAge(_database!, 1301);}
  Future<List<ItemServicesModel>> loadServicesList1(String searchKey) async{
   return await loadServicesList(searchKey,_database!,1301);}
  Future<void>  deleteAllServicesList1() async{
   return await          deleteAllServicesList(_database!,1301);}

  Future<void>  saveOrUpdateUserArbitrationsList1(ItemUserArbitrationsModel mdl) async{
   return await        saveOrUpdateUserArbitrationsList(mdl, _database!, 1401);}
  Future<UserArbitrationsListingModel>   loadUserArbitrationsListInfo1(String searchKey) async{
   return await                loadUserArbitrationsListInfo( searchKey, _database!, 1401);}
  Future<void>  saveOrUpdateUserArbitrationsListInfo1(UserArbitrationsListingModel mdl) async{
   return await        saveOrUpdateUserArbitrationsListInfo(mdl, _database!, 1401);}
  Future<int>   listUserArbitrationsAge1() async {
   return await listUserArbitrationsAge(_database!, 1401);}
  Future<List<ItemUserArbitrationsModel>> loadUserArbitrationsList1(String searchKey) async{
   return await loadUserArbitrationsList(searchKey,_database!,1401);}
  Future<void>  deleteAllUserArbitrationsList1() async{
   return await          deleteAllUserArbitrationsList(_database!,1401);}


  Future<void>  saveOrUpdateCartItemsList1(ItemCartItemsModel mdl) async{
   return await        saveOrUpdateCartItemsList(mdl, _database!, 1501);}
  Future<CartItemsListingModel>   loadCartItemsListInfo1(String searchKey) async{
   return await                loadCartItemsListInfo( searchKey, _database!, 1501);}
  Future<void>  saveOrUpdateCartItemsListInfo1(CartItemsListingModel mdl) async{
   return await        saveOrUpdateCartItemsListInfo(mdl, _database!, 1501);}
  Future<int>   listCartItemsAge1() async {
   return await listCartItemsAge(_database!, 1501);}
  Future<List<ItemCartItemsModel>> loadCartItemsList1(String searchKey) async{
   return await loadCartItemsList(searchKey,_database!,1501);}
  Future<void>  deleteAllCartItemsList1() async{
   return await          deleteAllCartItemsList(_database!,1501);}

  Future<void>  saveOrUpdateCheckoutItemsList1(ItemCheckoutItemsModel mdl) async{
   return await        saveOrUpdateCheckoutItemsList(mdl, _database!, 1601);}
  Future<CheckoutItemsListingModel>   loadCheckoutItemsListInfo1(String searchKey) async{
   return await                loadCheckoutItemsListInfo( searchKey, _database!, 1601);}
  Future<void>  saveOrUpdateCheckoutItemsListInfo1(CheckoutItemsListingModel mdl) async{
   return await        saveOrUpdateCheckoutItemsListInfo(mdl, _database!, 1601);}
  Future<int>   listCheckoutItemsAge1() async {
   return await listCheckoutItemsAge(_database!, 1601);}
  Future<List<ItemCheckoutItemsModel>> loadCheckoutItemsList1(String searchKey) async{
   return await loadCheckoutItemsList(searchKey,_database!,1601);}
  Future<void>  deleteAllCheckoutItemsList1() async{
   return await          deleteAllCheckoutItemsList(_database!,1601);}

  Future<void>  saveOrUpdateShowConversationList1(ItemShowConversationModel mdl) async{
   return await        saveOrUpdateShowConversationList(mdl, _database!, 1701);}
  Future<ShowConversationListingModel>   loadShowConversationListInfo1(String searchKey) async{
   return await                loadShowConversationListInfo( searchKey, _database!, 1701);}
  Future<void>  saveOrUpdateShowConversationListInfo1(ShowConversationListingModel mdl) async{
   return await        saveOrUpdateShowConversationListInfo(mdl, _database!, 1701);}
  Future<int>   listShowConversationAge1() async {
   return await listShowConversationAge(_database!, 1701);}
  Future<List<ItemShowConversationModel>> loadShowConversationList1(String searchKey) async{
   return await loadShowConversationList(searchKey,_database!,1701);}
  Future<void>  deleteAllShowConversationList1() async{
   return await          deleteAllShowConversationList(_database!,1701);}


  Future<void>  saveOrUpdateCreditHistoryList1(ItemCreditHistoryModel mdl) async{
   return await        saveOrUpdateCreditHistoryList(mdl, _database!, 1801);}
  Future<CreditHistoryListingModel>   loadCreditHistoryListInfo1(String searchKey) async{
   return await                loadCreditHistoryListInfo( searchKey, _database!, 1801);}
  Future<void>  saveOrUpdateCreditHistoryListInfo1(CreditHistoryListingModel mdl) async{
   return await        saveOrUpdateCreditHistoryListInfo(mdl, _database!, 1801);}
  Future<int>   listCreditHistoryAge1() async {
   return await listCreditHistoryAge(_database!, 1801);}
  Future<List<ItemCreditHistoryModel>> loadCreditHistoryList1(String searchKey) async{
   return await loadCreditHistoryList(searchKey,_database!,1801);}
  Future<void>  deleteAllCreditHistoryList1() async{
   return await          deleteAllCreditHistoryList(_database!,1801);}


  Future<void>  saveOrUpdatePaymentHistoryList1(ItemPaymentHistoryModel mdl) async{
   return await        saveOrUpdatePaymentHistoryList(mdl, _database!, 1901);}
  Future<PaymentHistoryListingModel>   loadPaymentHistoryListInfo1(String searchKey) async{
   return await                loadPaymentHistoryListInfo( searchKey, _database!, 1901);}
  Future<void>  saveOrUpdatePaymentHistoryListInfo1(PaymentHistoryListingModel mdl) async{
   return await        saveOrUpdatePaymentHistoryListInfo(mdl, _database!, 1901);}
  Future<int>   listPaymentHistoryAge1() async {
   return await listPaymentHistoryAge(_database!, 1901);}
  Future<List<ItemPaymentHistoryModel>> loadPaymentHistoryList1(String searchKey) async{
   return await loadPaymentHistoryList(searchKey,_database!,1901);}
  Future<void>  deleteAllPaymentHistoryList1() async{
   return await          deleteAllPaymentHistoryList(_database!,1901);}


// mypoint
  Future<void>  saveOrUpdatePointsAffiliateList1(ItemPointsAffiliateModel mdl) async{
   return await        saveOrUpdatePointsAffiliateList(mdl, _database!, 2001);}
  Future<PointsAffiliateListingModel>   loadPointsAffiliateListInfo1(String searchKey) async{
   return await                loadPointsAffiliateListInfo( searchKey, _database!, 2001);}
  Future<void>  saveOrUpdatePointsAffiliateListInfo1(PointsAffiliateListingModel mdl) async{
   return await        saveOrUpdatePointsAffiliateListInfo(mdl, _database!, 2001);}
  Future<int>   listPointsAffiliateAge1() async {
   return await listPointsAffiliateAge(_database!, 2001);}
  Future<List<ItemPointsAffiliateModel>> loadPointsAffiliateList1(String searchKey) async{
   return await loadPointsAffiliateList(searchKey,_database!,2001);}
  Future<void>  deleteAllPointsAffiliateList1() async{
   return await          deleteAllPointsAffiliateList(_database!,2001);}


  Future<void>  saveOrUpdatePointsBuyerList1(ItemPointsBuyerModel mdl) async{
   return await        saveOrUpdatePointsBuyerList(mdl, _database!, 2101);}
  Future<PointsBuyerListingModel>   loadPointsBuyerListInfo1(String searchKey) async{
   return await                loadPointsBuyerListInfo( searchKey, _database!, 2101);}
  Future<void>  saveOrUpdatePointsBuyerListInfo1(PointsBuyerListingModel mdl) async{
   return await        saveOrUpdatePointsBuyerListInfo(mdl, _database!, 2101);}
  Future<int>   listPointsBuyerAge1() async {
   return await listPointsBuyerAge(_database!, 2101);}
  Future<List<ItemPointsBuyerModel>> loadPointsBuyerList1(String searchKey) async{
   return await loadPointsBuyerList(searchKey,_database!,2101);}
  Future<void>  deleteAllPointsBuyerList1() async{
   return await          deleteAllPointsBuyerList(_database!,2101);}


  Future<void>  saveOrUpdatePointsOwnerList1(ItemPointsOwnerModel mdl) async{
   return await        saveOrUpdatePointsOwnerList(mdl, _database!, 2201);}
  Future<PointsOwnerListingModel>   loadPointsOwnerListInfo1(String searchKey) async{
   return await                loadPointsOwnerListInfo( searchKey, _database!, 2201);}
  Future<void>  saveOrUpdatePointsOwnerListInfo1(PointsOwnerListingModel mdl) async{
   return await        saveOrUpdatePointsOwnerListInfo(mdl, _database!, 2201);}
  Future<int>   listPointsOwnerAge1() async {
   return await listPointsOwnerAge(_database!, 2201);}
  Future<List<ItemPointsOwnerModel>> loadPointsOwnerList1(String searchKey) async{
   return await loadPointsOwnerList(searchKey,_database!,2201);}
  Future<void>  deleteAllPointsOwnerList1() async{
   return await          deleteAllPointsOwnerList(_database!,2201);}


  Future<void>  saveOrUpdatePointsPestaList1(ItemPointsPestaModel mdl) async{
   return await        saveOrUpdatePointsPestaList(mdl, _database!, 2301);}
  Future<PointsPestaListingModel>   loadPointsPestaListInfo1(String searchKey) async{
   return await                loadPointsPestaListInfo( searchKey, _database!, 2301);}
  Future<void>  saveOrUpdatePointsPestaListInfo1(PointsPestaListingModel mdl) async{
   return await        saveOrUpdatePointsPestaListInfo(mdl, _database!, 2301);}
  Future<int>   listPointsPestaAge1() async {
   return await listPointsPestaAge(_database!, 2301);}
  Future<List<ItemPointsPestaModel>> loadPointsPestaList1(String searchKey) async{
   return await loadPointsPestaList(searchKey,_database!,2301);}
  Future<void>  deleteAllPointsPestaList1() async{
   return await          deleteAllPointsPestaList(_database!,2301);}


  Future<void>  saveOrUpdatePointsSellerList1(ItemPointsSellerModel mdl) async{
   return await        saveOrUpdatePointsSellerList(mdl, _database!, 2401);}
  Future<PointsSellerListingModel>   loadPointsSellerListInfo1(String searchKey) async{
   return await                loadPointsSellerListInfo( searchKey, _database!, 2401);}
  Future<void>  saveOrUpdatePointsSellerListInfo1(PointsSellerListingModel mdl) async{
   return await        saveOrUpdatePointsSellerListInfo(mdl, _database!, 2401);}
  Future<int>   listPointsSellerAge1() async {
   return await listPointsSellerAge(_database!, 2401);}
  Future<List<ItemPointsSellerModel>> loadPointsSellerList1(String searchKey) async{
   return await loadPointsSellerList(searchKey,_database!,2401);}
  Future<void>  deleteAllPointsSellerList1() async{
   return await          deleteAllPointsSellerList(_database!,2401);}


  Future<void>  saveOrUpdatePointsWorkerList1(ItemPointsWorkerModel mdl) async{
   return await        saveOrUpdatePointsWorkerList(mdl, _database!, 2501);}
  Future<PointsWorkerListingModel>   loadPointsWorkerListInfo1(String searchKey) async{
   return await                loadPointsWorkerListInfo( searchKey, _database!, 2501);}
  Future<void>  saveOrUpdatePointsWorkerListInfo1(PointsWorkerListingModel mdl) async{
   return await        saveOrUpdatePointsWorkerListInfo(mdl, _database!, 2501);}
  Future<int>   listPointsWorkerAge1() async {
   return await listPointsWorkerAge(_database!, 2501);}
  Future<List<ItemPointsWorkerModel>> loadPointsWorkerList1(String searchKey) async{
   return await loadPointsWorkerList(searchKey,_database!,2501);}
  Future<void>  deleteAllPointsWorkerList1() async{
   return await          deleteAllPointsWorkerList(_database!,2501);}


//my products
  Future<void>  saveOrUpdateCommentsList1(ItemCommentsModel mdl) async{
   return await        saveOrUpdateCommentsList(mdl, _database!, 2601);}
  Future<CommentsListingModel>   loadCommentsListInfo1(String searchKey) async{
   return await                loadCommentsListInfo( searchKey, _database!, 2601);}
  Future<void>  saveOrUpdateCommentsListInfo1(CommentsListingModel mdl) async{
   return await        saveOrUpdateCommentsListInfo(mdl, _database!, 2601);}
  Future<int>   listCommentsAge1() async {
   return await listCommentsAge(_database!, 2601);}
  Future<List<ItemCommentsModel>> loadCommentsList1(String searchKey) async{
   return await loadCommentsList(searchKey,_database!,2601);}
  Future<void>  deleteAllCommentsList1() async{
   return await          deleteAllCommentsList(_database!,2601);}

  Future<void>  saveOrUpdateSalesList1(ItemSalesModel mdl) async{
   return await        saveOrUpdateSalesList(mdl, _database!, 2701);}
  Future<SalesListingModel>   loadSalesListInfo1(String searchKey) async{
   return await                loadSalesListInfo( searchKey, _database!, 2701);}
  Future<void>  saveOrUpdateSalesListInfo1(SalesListingModel mdl) async{
   return await        saveOrUpdateSalesListInfo(mdl, _database!, 2701);}
  Future<int>   listSalesAge1() async {
   return await listSalesAge(_database!, 2701);}
  Future<List<ItemSalesModel>> loadSalesList1(String searchKey) async{
   return await loadSalesList(searchKey,_database!,2701);}
  Future<void>  deleteAllSalesList1() async{
   return await          deleteAllSalesList(_database!,2701);}


  Future<void>  saveOrUpdateScreenshotsList3(ItemScreenshotsModel mdl) async{
   return await        saveOrUpdateScreenshotsList(mdl, _database!, 2801);}
  Future<ScreenshotsListingModel>   loadScreenshotsListInfo3(String searchKey) async{
   return await                loadScreenshotsListInfo( searchKey, _database!, 2801);}
  Future<void>  saveOrUpdateScreenshotsListInfo3(ScreenshotsListingModel mdl) async{
   return await        saveOrUpdateScreenshotsListInfo(mdl, _database!, 2801);}
  Future<int>   listScreenshotsAge3() async {
   return await listScreenshotsAge(_database!, 2801);}
  Future<List<ItemScreenshotsModel>> loadScreenshotsList3(String searchKey) async{
   return await loadScreenshotsList(searchKey,_database!,2801);}
  Future<void>  deleteAllScreenshotsList3() async{
   return await          deleteAllScreenshotsList(_database!,2801);}

// my profile
  Future<void>  saveOrUpdatePortofolioList2(ItemPortofolioModel mdl) async{
   return await        saveOrUpdatePortofolioList(mdl, _database!, 2901);}
  Future<PortofolioListingModel>   loadPortofolioListInfo2(String searchKey) async{
   return await                loadPortofolioListInfo( searchKey, _database!, 2901);}
  Future<void>  saveOrUpdatePortofolioListInfo2(PortofolioListingModel mdl) async{
   return await        saveOrUpdatePortofolioListInfo(mdl, _database!, 2901);}
  Future<int>   listPortofolioAge2() async {
   return await listPortofolioAge(_database!, 2901);}
  Future<List<ItemPortofolioModel>> loadPortofolioList2(String searchKey) async{
   return await loadPortofolioList(searchKey,_database!,2901);}
  Future<void>  deleteAllPortofolioList2() async{
   return await          deleteAllPortofolioList(_database!,2901);}
    
// my projects    

  Future<void>  saveOrUpdateShortlistedBidsList1(ItemShortlistedBidsModel mdl) async{
   return await        saveOrUpdateShortlistedBidsList(mdl, _database!, 3001);}
  Future<ShortlistedBidsListingModel>   loadShortlistedBidsListInfo1(String searchKey) async{
   return await                loadShortlistedBidsListInfo( searchKey, _database!, 3001);}
  Future<void>  saveOrUpdateShortlistedBidsListInfo1(ShortlistedBidsListingModel mdl) async{
   return await        saveOrUpdateShortlistedBidsListInfo(mdl, _database!, 3001);}
  Future<int>   listShortlistedBidsAge1() async {
   return await listShortlistedBidsAge(_database!, 3001);}
  Future<List<ItemShortlistedBidsModel>> loadShortlistedBidsList1(String searchKey) async{
   return await loadShortlistedBidsList(searchKey,_database!,3001);}
  Future<void>  deleteAllShortlistedBidsList1() async{
   return await          deleteAllShortlistedBidsList(_database!,3001);}


  Future<void>  saveOrUpdateShowBidsList1(ItemShowBidsModel mdl) async{
   return await        saveOrUpdateShowBidsList(mdl, _database!, 3101);}
  Future<ShowBidsListingModel>   loadShowBidsListInfo1(String searchKey) async{
   return await                loadShowBidsListInfo( searchKey, _database!, 3101);}
  Future<void>  saveOrUpdateShowBidsListInfo1(ShowBidsListingModel mdl) async{
   return await        saveOrUpdateShowBidsListInfo(mdl, _database!, 3101);}
  Future<int>   listShowBidsAge1() async {
   return await listShowBidsAge(_database!, 3101);}
  Future<List<ItemShowBidsModel>> loadShowBidsList1(String searchKey) async{
   return await loadShowBidsList(searchKey,_database!,3101);}
  Future<void>  deleteAllShowBidsList1() async{
   return await          deleteAllShowBidsList(_database!,3101);}


  Future<void>  saveOrUpdateShowConversationList2(ItemShowConversationModel mdl) async{
   return await        saveOrUpdateShowConversationList(mdl, _database!, 3201);}
  Future<ShowConversationListingModel>   loadShowConversationListInfo2(String searchKey) async{
   return await                loadShowConversationListInfo( searchKey, _database!, 3201);}
  Future<void>  saveOrUpdateShowConversationListInfo2(ShowConversationListingModel mdl) async{
   return await        saveOrUpdateShowConversationListInfo(mdl, _database!, 3201);}
  Future<int>   listShowConversationAge2() async {
   return await listShowConversationAge(_database!, 3201);}
  Future<List<ItemShowConversationModel>> loadShowConversationList2(String searchKey) async{
   return await loadShowConversationList(searchKey,_database!,3201);}
  Future<void>  deleteAllShowConversationList2() async{
   return await          deleteAllShowConversationList(_database!,3201);}

  Future<void>  saveOrUpdateShowFilesList1(ItemShowFilesModel mdl) async{
   return await        saveOrUpdateShowFilesList(mdl, _database!, 3301);}
  Future<ShowFilesListingModel>   loadShowFilesListInfo1(String searchKey) async{
   return await                loadShowFilesListInfo( searchKey, _database!, 3301);}
  Future<void>  saveOrUpdateShowFilesListInfo1(ShowFilesListingModel mdl) async{
   return await        saveOrUpdateShowFilesListInfo(mdl, _database!, 3301);}
  Future<int>   listShowFilesAge1() async {
   return await listShowFilesAge(_database!, 3301);}
  Future<List<ItemShowFilesModel>> loadShowFilesList1(String searchKey) async{
   return await loadShowFilesList(searchKey,_database!,3301);}
  Future<void>  deleteAllShowFilesList1() async{
   return await          deleteAllShowFilesList(_database!,3301);}

  Future<void>  saveOrUpdateShowThreadList1(ItemShowThreadModel mdl) async{
   return await        saveOrUpdateShowThreadList(mdl, _database!, 3401);}
  Future<ShowThreadListingModel>   loadShowThreadListInfo1(String searchKey) async{
   return await                loadShowThreadListInfo( searchKey, _database!, 3401);}
  Future<void>  saveOrUpdateShowThreadListInfo1(ShowThreadListingModel mdl) async{
   return await        saveOrUpdateShowThreadListInfo(mdl, _database!, 3401);}
  Future<int>   listShowThreadAge1() async {
   return await listShowThreadAge(_database!, 3401);}
  Future<List<ItemShowThreadModel>> loadShowThreadList1(String searchKey) async{
   return await loadShowThreadList(searchKey,_database!,3401);}
  Future<void>  deleteAllShowThreadList1() async{
   return await          deleteAllShowThreadList(_database!,3401);}

  Future<void>  saveOrUpdateReferalsList1(ItemReferalsModel mdl) async{
   return await        saveOrUpdateReferalsList(mdl, _database!, 3501);}
  Future<ReferalsListingModel>   loadReferalsListInfo1(String searchKey) async{
   return await                loadReferalsListInfo( searchKey, _database!, 3501);}
  Future<void>  saveOrUpdateReferalsListInfo1(ReferalsListingModel mdl) async{
   return await        saveOrUpdateReferalsListInfo(mdl, _database!, 3501);}
  Future<int>   listReferalsAge1() async {
   return await listReferalsAge(_database!, 3501);}
  Future<List<ItemReferalsModel>> loadReferalsList1(String searchKey) async{
   return await loadReferalsList(searchKey,_database!,3501);}
  Future<void>  deleteAllReferalsList1() async{
   return await          deleteAllReferalsList(_database!,3501);}


  Future<void>  saveOrUpdateCommentsList2(ItemCommentsModel mdl) async{
   return await        saveOrUpdateCommentsList(mdl, _database!, 3601);}
  Future<CommentsListingModel>   loadCommentsListInfo2(String searchKey) async{
   return await                loadCommentsListInfo( searchKey, _database!, 3601);}
  Future<void>  saveOrUpdateCommentsListInfo2(CommentsListingModel mdl) async{
   return await        saveOrUpdateCommentsListInfo(mdl, _database!, 3601);}
  Future<int>   listCommentsAge2() async {
   return await listCommentsAge(_database!, 3601);}
  Future<List<ItemCommentsModel>> loadCommentsList2(String searchKey) async{
   return await loadCommentsList(searchKey,_database!,3601);}
  Future<void>  deleteAllCommentsList2() async{
   return await          deleteAllCommentsList(_database!,3601);}


  Future<void>  saveOrUpdateSalesList2(ItemSalesModel mdl) async{
   return await        saveOrUpdateSalesList(mdl, _database!, 3701);}
  Future<SalesListingModel>   loadSalesListInfo2(String searchKey) async{
   return await                loadSalesListInfo( searchKey, _database!, 3701);}
  Future<void>  saveOrUpdateSalesListInfo2(SalesListingModel mdl) async{
   return await        saveOrUpdateSalesListInfo(mdl, _database!, 3701);}
  Future<int>   listSalesAge2() async {
   return await listSalesAge(_database!, 3701);}
  Future<List<ItemSalesModel>> loadSalesList2(String searchKey) async{
   return await loadSalesList(searchKey,_database!,3701);}
  Future<void>  deleteAllSalesList2() async{
   return await          deleteAllSalesList(_database!,3701);}


  Future<void>  saveOrUpdateScreenshotsList4(ItemScreenshotsModel mdl) async{
   return await        saveOrUpdateScreenshotsList(mdl, _database!, 3801);}
  Future<ScreenshotsListingModel>   loadScreenshotsListInfo4(String searchKey) async{
   return await                loadScreenshotsListInfo( searchKey, _database!, 3801);}
  Future<void>  saveOrUpdateScreenshotsListInfo4(ScreenshotsListingModel mdl) async{
   return await        saveOrUpdateScreenshotsListInfo(mdl, _database!, 3801);}
  Future<int>   listScreenshotsAge4() async {
   return await listScreenshotsAge(_database!, 3801);}
  Future<List<ItemScreenshotsModel>> loadScreenshotsList4(String searchKey) async{
   return await loadScreenshotsList(searchKey,_database!,3801);}
  Future<void>  deleteAllScreenshotsList4() async{
   return await          deleteAllScreenshotsList(_database!,3801);}

  Future<void>  saveOrUpdateUserBidsList2(ItemUserBidsModel mdl) async{
   return await        saveOrUpdateUserBidsList(mdl, _database!, 3901);}
  Future<UserBidsListingModel>   loadUserBidsListInfo2(String searchKey) async{
   return await                loadUserBidsListInfo( searchKey, _database!, 3901);}
  Future<void>  saveOrUpdateUserBidsListInfo2(UserBidsListingModel mdl) async{
   return await        saveOrUpdateUserBidsListInfo(mdl, _database!, 3901);}
  Future<int>   listUserBidsAge2() async {
   return await listUserBidsAge(_database!, 3901);}
  Future<List<ItemUserBidsModel>> loadUserBidsList2(String searchKey) async{
   return await loadUserBidsList(searchKey,_database!,3901);}
  Future<void>  deleteAllUserBidsList2() async{
   return await          deleteAllUserBidsList(_database!,3901);}
    


////////// end parent field   
    



}






