import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:projectscoid/app/signin.dart';
import 'package:projectscoid/app/root.dart';
import 'package:projectscoid/app/splashpage.dart';
import 'package:projectscoid/app/register.dart';
import 'package:projectscoid/app/intro.dart';
import 'package:projectscoid/app/setting.dart';




var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String?>?> params) {
      return  Root();
    });

var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String?>?> params) {
      String? login = params["login"]?.first;
      bool isLogin = false;
      if(login == '1'){
        isLogin = true;
      }
      return  Login(application: context, isLogin: isLogin);
    });

var registerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String?>?> params) {
      return  Register();
    });

var introHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String?>?> params) {
      return  IntroScreen();
    });

var settingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String?>?> params) {
      return  Setting();
    });


var splashHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return  SplashPage();
    });

var puProjectscoidHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return  Projectscoid();
    });



	

var viewHomeUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserHomeView( id : id,
          title:  title );
    });

var viewHomePublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicHomeView();
    });


var listingHomeUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return  UserHomeListing();
    });
	

var viewPagePublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? title = params["title"]?.first;
      return PublicPageView(
          title:  title );
    });
	
//-------------------------------------------------------------------	   
//-------------------------------------------------------------------    
	
	

var editTestPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicTestEdit( id : id,
                             title:  title );
    });
	
var addTestPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicTestAdd();
    });	

var viewTestPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicTestView( id : id,
          title:  title );
    });

var listingTestPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicTestListing(id : id);
    });
	

var editTestimonialPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicTestimonialEdit( id : id,
                             title:  title );
    });
	
var addTestimonialPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicTestimonialAdd();
    });	

var viewTestimonialPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicTestimonialView( id : id,
          title:  title );
    });

var listingTestimonialPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicTestimonialListing(id : id);
    });
	

var editCeritaSuksesPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicCeritaSuksesEdit( id : id,
                             title:  title );
    });
	
var addCeritaSuksesPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicCeritaSuksesAdd();
    });	

var viewCeritaSuksesPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicCeritaSuksesView( id : id,
          title:  title );
    });

var listingCeritaSuksesPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicCeritaSuksesListing(id : id);
    });
	

var editTipsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicTipsEdit( id : id,
                             title:  title );
    });
	
var addTipsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicTipsAdd();
    });	

var viewTipsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicTipsView( id : id,
          title:  title );
    });

var listingTipsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicTipsListing(id : id);
    });
	

var editBrowseProjectsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBrowseProjectsEdit( id : id,
                             title:  title );
    });
	
var addBrowseProjectsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicBrowseProjectsAdd();
    });	

var viewBrowseProjectsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBrowseProjectsView( id : id,
          title:  title );
    });

var listingBrowseProjectsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicBrowseProjectsListing(id : id);
    });
	

var PlaceNewBidBrowseProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PlaceNewBidBrowseProjects( id : id,
          title:  title );	 
    });


var AskOwnerBrowseProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return AskOwnerBrowseProjects( id : id,
          title:  title );	 
    });



var GuestCreateProjectBrowseProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return GuestCreateProjectBrowseProjects( id : id,
          title:  title );	 
    });



var editPastProjectsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicPastProjectsEdit( id : id,
                             title:  title );
    });
	
var addPastProjectsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicPastProjectsAdd();
    });	

var viewPastProjectsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicPastProjectsView( id : id,
          title:  title );
    });

var listingPastProjectsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicPastProjectsListing(id : id);
    });
	

var editNewUserPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicNewUserEdit( id : id,
                             title:  title );
    });
	
var addNewUserPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicNewUserAdd();
    });	

var viewNewUserPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicNewUserView( id : id,
          title:  title );
    });

var listingNewUserPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicNewUserListing(id : id);
    });
	
var RegisterNewUserHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return RegisterNewUser( id : id,
          title:  title );	 
    });


var VerifyNewUserHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return VerifyNewUser( id : id,
          title:  title );	 
    });



var editProgramPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicProgramEdit( id : id,
                             title:  title );
    });
	
var addProgramPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicProgramAdd();
    });	

var viewProgramPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicProgramView( id : id,
          title:  title );
    });

var listingProgramPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicProgramListing(id : id);
    });
	
var PromoProgramHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PromoProgram( id : id,
          title:  title );	 
    });



var editExistingUserPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicExistingUserEdit( id : id,
                             title:  title );
    });
	
var addExistingUserPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicExistingUserAdd();
    });	

var viewExistingUserPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicExistingUserView( id : id,
          title:  title );
    });

var listingExistingUserPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicExistingUserListing(id : id);
    });
	
var ForgotPasswordExistingUserHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ForgotPasswordExistingUser( id : id,
          title:  title );	 
    });


var ResetPasswordExistingUserHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ResetPasswordExistingUser( id : id,
          title:  title );	 
    });



var editSupportPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicSupportEdit( id : id,
                             title:  title );
    });
	
var addSupportPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicSupportAdd();
    });	

var viewSupportPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicSupportView( id : id,
          title:  title );
    });

var listingSupportPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicSupportListing(id : id);
    });
	
var ContactFormSupportHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ContactFormSupport( id : id,
          title:  title );	 
    });



var editBrowseServicesPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBrowseServicesEdit( id : id,
                             title:  title );
    });
	
var addBrowseServicesPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicBrowseServicesAdd();
    });	

var viewBrowseServicesPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBrowseServicesView( id : id,
          title:  title );
    });

var listingBrowseServicesPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicBrowseServicesListing(id : id);
    });
	


var PlaceOrderBrowseServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PlaceOrderBrowseServices( id : id,
          title:  title );	 
    });



var editBrowseUsersPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBrowseUsersEdit( id : id,
                             title:  title );
    });
	
var addBrowseUsersPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicBrowseUsersAdd();
    });	

var viewBrowseUsersPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBrowseUsersView( id : id,
          title:  title );
    });

var listingBrowseUsersPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicBrowseUsersListing(id : id);
    });
	
var InviteToBidBrowseUsersHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return InviteToBidBrowseUsers( id : id,
          title:  title );	 
    });


var HireMeBrowseUsersHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return HireMeBrowseUsers( id : id,
          title:  title );	 
    });




var editBrowseProductsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBrowseProductsEdit( id : id,
                             title:  title );
    });
	
var addBrowseProductsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicBrowseProductsAdd();
    });	

var viewBrowseProductsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBrowseProductsView( id : id,
          title:  title );
    });

var listingBrowseProductsPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicBrowseProductsListing(id : id);
    });
	


var AddToCartBrowseProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return AddToCartBrowseProducts( id : id,
          title:  title );	 
    });



var editCartUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserCartEdit( id : id,
                             title:  title );
    });
	
var addCartUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserCartAdd();
    });	

var viewCartUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserCartView( id : id,
          title:  title );
    });

var listingCartUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserCartListing(id : id);
    });
	
var EmptyCartCartHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return EmptyCartCart( id : id,
          title:  title );	 
    });


var ApplyCouponCartHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ApplyCouponCart( id : id,
          title:  title );	 
    });




var editCheckoutUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserCheckoutEdit( id : id,
                             title:  title );
    });
	
var addCheckoutUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserCheckoutAdd();
    });	

var viewCheckoutUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserCheckoutView( id : id,
          title:  title );
    });

var listingCheckoutUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserCheckoutListing(id : id);
    });
	
var PayWithAvailableBalanceCheckoutHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PayWithAvailableBalanceCheckout( id : id,
          title:  title );	 
    });


var PayViaBankTransferCheckoutHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PayViaBankTransferCheckout( id : id,
          title:  title );	 
    });


var PayWithCreditCardCheckoutHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PayWithCreditCardCheckout( id : id,
          title:  title );	 
    });


var PayWithCimbClicksCheckoutHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PayWithCimbClicksCheckout( id : id,
          title:  title );	 
    });


var PayWithBcaKlikpayCheckoutHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PayWithBcaKlikpayCheckout( id : id,
          title:  title );	 
    });


var PayWithMandiriClickpayCheckoutHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PayWithMandiriClickpayCheckout( id : id,
          title:  title );	 
    });


var PayWithQrisCheckoutHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PayWithQrisCheckout( id : id,
          title:  title );	 
    });


var PayWithPaypalCheckoutHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PayWithPaypalCheckout( id : id,
          title:  title );	 
    });



var editBlogPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBlogEdit( id : id,
                             title:  title );
    });
	
var addBlogPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicBlogAdd();
    });	

var viewBlogPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicBlogView( id : id,
          title:  title );
    });

var listingBlogPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicBlogListing(id : id);
    });
	

var editMyProjectsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyProjectsEdit( id : id,
                             title:  title );
    });
	
var addMyProjectsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyProjectsAdd();
    });	

var viewMyProjectsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserMyProjectsView( id : id,
          title:  title );
    });

var listingMyProjectsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyProjectsListing(id : id);
    });
	
var BumpUpMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return BumpUpMyProjects( id : id,
          title:  title );	 
    });


var BroadcastMessageMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return BroadcastMessageMyProjects( id : id,
          title:  title );	 
    });


var ShowBidsMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ShowBidsMyProjects( id : id,
          title:  title );	 
    });


var ShowThreadMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ShowThreadMyProjects( id : id,
          title:  title );	 
    });


var ShowFilesMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ShowFilesMyProjects( id : id,
          title:  title );	 
    });


var ShowConversationMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      String? title = params["title"]?.first;
	  String? id1 = params["id1"]?.first;
      return ShowConversationMyProjects( id : id,
          title:  title, id1: id1);	 
    });


var CreateProjectMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return CreateProjectMyProjects( id : id,
          title:  title );	 
    });


var EditDraftMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return EditDraftMyProjects( id : id,
          title:  title );	 
    });


var PublishProjectMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PublishProjectMyProjects( id : id,
          title:  title );	 
    });


var CancelProjectMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return CancelProjectMyProjects( id : id,
          title:  title );	 
    });


var AcceptOrRejectWorkMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return AcceptOrRejectWorkMyProjects( id : id,
          title:  title );	 
    });


var RateWorkerMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return RateWorkerMyProjects( id : id,
          title:  title );	 
    });


var ReportProgressMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ReportProgressMyProjects( id : id,
          title:  title );	 
    });


var WeeklyReportMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return WeeklyReportMyProjects( id : id,
          title:  title );	 
    });


var ReportDoneMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ReportDoneMyProjects( id : id,
          title:  title );	 
    });


var RateOwnerMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return RateOwnerMyProjects( id : id,
          title:  title );	 
    });


var FileArbitrationMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return FileArbitrationMyProjects( id : id,
          title:  title );	 
    });


var NewOfferMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return NewOfferMyProjects( id : id,
          title:  title );	 
    });


var AcceptOfferMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return AcceptOfferMyProjects( id : id,
          title:  title );	 
    });


var RespondArbitrationMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return RespondArbitrationMyProjects( id : id,
          title:  title );	 
    });


var CancelArbitrationMyProjectsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return CancelArbitrationMyProjects( id : id,
          title:  title );	 
    });



var editMyBidsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyBidsEdit( id : id,
                             title:  title );
    });
	
var addMyBidsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyBidsAdd();
    });	

var viewMyBidsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserMyBidsView( id : id,
          title:  title );
    });

var listingMyBidsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyBidsListing(id : id);
    });
	
var ShowConversationMyBidsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      String? title = params["title"]?.first;
	  String? id1 = params["id1"]?.first;
      return ShowConversationMyBids( id : id,
          title:  title, id1: id1);	 
    });



var CancelBidMyBidsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return CancelBidMyBids( id : id,
          title:  title );	 
    });



var editMyProductsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyProductsEdit( id : id,
                             title:  title );
    });
	
var addMyProductsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyProductsAdd();
    });	

var viewMyProductsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserMyProductsView( id : id,
          title:  title );
    });

var listingMyProductsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyProductsListing(id : id);
    });
	

var SalesMyProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return SalesMyProducts( id : id,
          title:  title );	 
    });


var CommentsMyProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return CommentsMyProducts( id : id,
          title:  title );	 
    });


var AddNewProductMyProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return AddNewProductMyProducts( id : id,
          title:  title );	 
    });


var PublishProductMyProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PublishProductMyProducts( id : id,
          title:  title );	 
    });


var EditProductMyProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return EditProductMyProducts( id : id,
          title:  title );	 
    });


var BumpUpMyProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return BumpUpMyProducts( id : id,
          title:  title );	 
    });


var ScreenshotsMyProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ScreenshotsMyProducts( id : id,
          title:  title );	 
    });


var UnlistMyProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return UnlistMyProducts( id : id,
          title:  title );	 
    });


var ReactivateProductMyProductsHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ReactivateProductMyProducts( id : id,
          title:  title );	 
    });



var editMyServicesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyServicesEdit( id : id,
                             title:  title );
    });
	
var addMyServicesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyServicesAdd();
    });	

var viewMyServicesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserMyServicesView( id : id,
          title:  title );
    });

var listingMyServicesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyServicesListing(id : id);
    });
	

var SalesMyServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return SalesMyServices( id : id,
          title:  title );	 
    });


var CommentsMyServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return CommentsMyServices( id : id,
          title:  title );	 
    });


var AddNewServiceMyServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return AddNewServiceMyServices( id : id,
          title:  title );	 
    });


var PublishServiceMyServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PublishServiceMyServices( id : id,
          title:  title );	 
    });


var BumpUpMyServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return BumpUpMyServices( id : id,
          title:  title );	 
    });


var EditServiceMyServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return EditServiceMyServices( id : id,
          title:  title );	 
    });


var ScreenshotsMyServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ScreenshotsMyServices( id : id,
          title:  title );	 
    });


var UnlistMyServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return UnlistMyServices( id : id,
          title:  title );	 
    });


var ReactivateServiceMyServicesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ReactivateServiceMyServices( id : id,
          title:  title );	 
    });



var editMySalesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMySalesEdit( id : id,
                             title:  title );
    });
	
var addMySalesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMySalesAdd();
    });	

var viewMySalesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserMySalesView( id : id,
          title:  title );
    });

var listingMySalesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMySalesListing(id : id);
    });
    var indexMySalesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMySalesIndex(id : id);
    });
	

var editMyOrdersUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyOrdersEdit( id : id,
                             title:  title );
    });
	
var addMyOrdersUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyOrdersAdd();
    });	

var viewMyOrdersUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserMyOrdersView( id : id,
          title:  title );
    });

var listingMyOrdersUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyOrdersListing(id : id);
    });
    var indexMyOrdersUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyOrdersIndex(id : id);
    });
	
var ConfirmPaymentMyOrdersHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ConfirmPaymentMyOrders( id : id,
          title:  title );	 
    });



var editMyPurchasesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyPurchasesEdit( id : id,
                             title:  title );
    });
	
var addMyPurchasesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyPurchasesAdd();
    });	

var viewMyPurchasesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserMyPurchasesView( id : id,
          title:  title );
    });

var listingMyPurchasesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyPurchasesListing(id : id);
    });
    var indexMyPurchasesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyPurchasesIndex(id : id);
    });
	
var DownloadMyPurchasesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return DownloadMyPurchases( id : id,
          title:  title );	 
    });


var RateProductMyPurchasesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return RateProductMyPurchases( id : id,
          title:  title );	 
    });



var editMyReferalsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyReferalsEdit( id : id,
                             title:  title );
    });
	
var addMyReferalsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyReferalsAdd();
    });	

var viewMyReferalsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	      return UserMyReferalsView();
    });

var listingMyReferalsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyReferalsListing(id : id);
    });
	

var editMyFinanceUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyFinanceEdit( id : id,
                             title:  title );
    });
	
var addMyFinanceUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyFinanceAdd();
    });	

var viewMyFinanceUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	      return UserMyFinanceView();
    });

var listingMyFinanceUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyFinanceListing(id : id);
    });
	
var ChangePaymentSettingsMyFinanceHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ChangePaymentSettingsMyFinance( id : id,
          title:  title );	 
    });


var WithdrawPaymentMyFinanceHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return WithdrawPaymentMyFinance( id : id,
          title:  title );	 
    });


var DepositBalanceMyFinanceHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return DepositBalanceMyFinance( id : id,
          title:  title );	 
    });



var editMyPointsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyPointsEdit( id : id,
                             title:  title );
    });
	
var addMyPointsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyPointsAdd();
    });	

var viewMyPointsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	      return UserMyPointsView();
    });

var listingMyPointsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyPointsListing(id : id);
    });
	

var editMyProfileUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyProfileEdit( id : id,
                             title:  title );
    });
	
var addMyProfileUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyProfileAdd();
    });	

var viewMyProfileUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	      return UserMyProfileView();
    });

var listingMyProfileUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyProfileListing(id : id);
    });
	

var EditProfileMyProfileHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return EditProfileMyProfile( id : id,
          title:  title );	 
    });


var PortofolioMyProfileHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return PortofolioMyProfile( id : id,
          title:  title );	 
    });


var ChangePasswordMyProfileHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ChangePasswordMyProfile( id : id,
          title:  title );	 
    });


var ChangeEmailMyProfileHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ChangeEmailMyProfile( id : id,
          title:  title );	 
    });


var ChangeHandphoneMyProfileHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return ChangeHandphoneMyProfile( id : id,
          title:  title );	 
    });



var editKelurahanPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicKelurahanEdit( id : id,
                             title:  title );
    });
	
var addKelurahanPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return PublicKelurahanAdd();
    });	

var viewKelurahanPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return PublicKelurahanView( id : id,
          title:  title );
    });

var listingKelurahanPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  PublicKelurahanListing(id : id);
    });
	

var editMyBookmarksUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyBookmarksEdit( id : id,
                             title:  title );
    });
	
var addMyBookmarksUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyBookmarksAdd();
    });	

var viewMyBookmarksUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserMyBookmarksView( id : id,
          title:  title );
    });

var listingMyBookmarksUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyBookmarksListing(id : id);
    });
	

var editMyBuddiesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      return UserMyBuddiesEdit( id : id,
                             title:  title );
    });
	
var addMyBuddiesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      return UserMyBuddiesAdd();
    });	

var viewMyBuddiesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
		  String? id = params["id"]?.first;
          String? title = params["title"]?.first;
          return UserMyBuddiesView( id : id,
          title:  title );
    });

var listingMyBuddiesUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
      return  UserMyBuddiesListing(id : id);
    });
	
var RemoveMyBuddiesHandler = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = '';
	  if(params["id"]?.first == ''){
	  id = '';
	  }else{
	  id = params["id"]?.first;
	  }
      String? title = params["title"]?.first;
	  if(params["title"]?.first == ''){
	  title = '';
	  }else{
	  title = params["title"]?.first;
	  }
      return RemoveMyBuddies( id : id,
          title:  title );	 
    });



	
    
    
//-------------------------------------------------------------------	
//-------------------------------------------------------------------	

var MyProjectsShortlistedBidsAcceptBidUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/shortlisted_bids_accept_bid/' + id! + '/' + title!;
      return MyProjectsShortlistedBidsAcceptBid( id : id,
          title:  title , url : url);
    });

var MyProjectsShortlistedBidsRemoveFromShortlistUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/shortlisted_bids_remove_from_shortlist/' + id! + '/' + title!;
      return MyProjectsShortlistedBidsRemoveFromShortlist( id : id,
          title:  title , url : url);
    });

//mulai
var MyProjectsShortlistedBidsShowConversationUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/shortlisted_bids_show_conversation/' + id! + '/' + title!;
      return MyProjectsShortlistedBidsShowConversation( id : id,
          title:  title , url : url);
    });
var MyProjectsShortlistedBidsViewProfileUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/shortlisted_bids_view_profile/' + id! + '/' + title!;
      return MyProjectsShortlistedBidsViewProfile( id : id,
          title:  title , url : url);
    });
var MyProjectsShowBidsAcceptBidUser = Handler(
	handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
	  String? id = params["id"]?.first;
	  String? title = params["title"]?.first;
	  String? id1 = params["id1"]?.first;
	  String? title1 = params["title1"]?.first;
	  String? url = '/user/my_projects/show_bids_accept_bid/' + id! + '/' + title! +'/' + id1! + '/' + title1!;
	  return MyProjectsShowBidsAcceptBid( id : id,
		  title:  title , url : url);
	});
var MyProjectsShowBidsAddToShortlistUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_bids_add_to_shortlist/' + id! + '/' + title!;
      return MyProjectsShowBidsAddToShortlist( id : id,
          title:  title , url : url);
    });
var MyProjectsShowBidsShowConversationUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_bids_show_conversation/' + id! + '/' + title!;
      return MyProjectsShowBidsShowConversation( id : id,
          title:  title , url : url);
    });
var MyProjectsShowBidsViewProfileUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_bids_view_profile/' + id! + '/' + title!;
      return MyProjectsShowBidsViewProfile( id : id,
          title:  title , url : url);
    });
var MyProjectsShowConversationAcceptBidUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_conversation_accept_bid/' + id! + '/' + title!;
      return MyProjectsShowConversationAcceptBid( id : id,
          title:  title , url : url);
    });
var MyProjectsShowConversationAddToShortlistUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_conversation_add_to_shortlist/' + id! + '/' + title!;
      return MyProjectsShowConversationAddToShortlist( id : id,
          title:  title , url : url);
    });
var MyProjectsShowConversationNewReplyUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? id1 = params["id1"]?.first;
      String? title1 = params["title1"]?.first;
      String? url = '/user/my_projects/show_conversation_new_reply/' + id! + '/' + title! + '/' + id1! + '/' + title1!;
      return MyProjectsShowConversationNewReply( id : id,
          title:  title , url : url);
    });
var MyProjectsShowConversationReplyUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_conversation_reply/' + id! + '/' + title!;
      return MyProjectsShowConversationReply( id : id,
          title:  title , url : url);
    });
var MyProjectsShowConversationShowBidsUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_conversation_show_bids/' + id! + '/' + title!;
      return MyProjectsShowConversationShowBids( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadAcceptOfferUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_accept_offer/' + id! + '/' + title!;
      return MyProjectsShowThreadAcceptOffer( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadAcceptOrRejectWorkUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_accept_or_reject_work/' + id! + '/' + title!;
      return MyProjectsShowThreadAcceptOrRejectWork( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadBroadcastMessageUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_broadcast_message/' + id! + '/' + title!;
      return MyProjectsShowThreadBroadcastMessage( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadCancelArbitrationUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_cancel_arbitration/' + id! + '/' + title!;
      return MyProjectsShowThreadCancelArbitration( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadFileArbitrationUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_file_arbitration/' + id! + '/' + title!;
      return MyProjectsShowThreadFileArbitration( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadNewOfferUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_new_offer/' + id! + '/' + title!;
      return MyProjectsShowThreadNewOffer( id : id,
          title:  title , url : url);
    });

var MyProjectsShowThreadNewReplyUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_new_reply/' + id! + '/' + title!;
      return MyProjectsShowThreadNewReply( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadRateOwnerUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_rate_owner/' + id! + '/' + title!;
      return MyProjectsShowThreadRateOwner( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadRateWorkerUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_rate_worker/' + id! + '/' + title!;
      return MyProjectsShowThreadRateWorker( id : id,
          title:  title , url : url);
    });

var MyProjectsShowThreadReplyUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_reply/' + id! + '/' + title!;
      return MyProjectsShowThreadReply( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadReportDoneUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_report_done/' + id! + '/' + title!;
      return MyProjectsShowThreadReportDone( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadReportProgressUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_report_progress/' + id! + '/' + title!;
      return MyProjectsShowThreadReportProgress( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadRespondArbitrationUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_respond_arbitration/' + id! + '/' + title!;
      return MyProjectsShowThreadRespondArbitration( id : id,
          title:  title , url : url);
    });
var MyProjectsShowThreadWeeklyReportUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_projects/show_thread_weekly_report/' + id! + '/' + title!;
      return MyProjectsShowThreadWeeklyReport( id : id,
          title:  title , url : url);
    });

var CartCartItemsDecreaseUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/cart/cart_items_decrease/' + id! + '/' + title!;
      return CartCartItemsDecrease( id : id,
          title:  title , url : url);
    });
var CartCartItemsIncreaseUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/cart/cart_items_increase/' + id! + '/' + title!;
      return CartCartItemsIncrease( id : id,
          title:  title , url : url);
    });
var CartCartItemsRemoveUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/cart/cart_items_remove/' + id! + '/' + title!;
      return CartCartItemsRemove( id : id,
          title:  title , url : url);
    });
var MyBidsShowConversationNewReplyUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_bids/show_conversation_new_reply/' + id! + '/' + title!;
      return MyBidsShowConversationNewReply( id : id,
          title:  title , url : url);
    });
var MyBidsShowConversationPlaceNewBidUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_bids/show_conversation_place_new_bid/' + id! + '/' + title!;
      return MyBidsShowConversationPlaceNewBid( id : id,
          title:  title , url : url);
    });

var MyBidsShowConversationReplyUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_bids/show_conversation_reply/' + id! + '/' + title!;
      return MyBidsShowConversationReply( id : id,
          title:  title , url : url);
    });


var MyProductsCommentsNewReplyPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/public/my_products/comments_new_reply/' + id! + '/' + title!;
      return MyProductsCommentsNewReply( id : id,
          title:  title , url : url);
    });
var MyProductsScreenshotsAddImageUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_products/screenshots_add_image/' + id! + '/' + title!;
      return MyProductsScreenshotsAddImage( id : id,
          title:  title , url : url);
    });

var MyProductsScreenshotsEditImageUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_products/screenshots_edit_image/' + id! + '/' + title!;
      return MyProductsScreenshotsEditImage( id : id,
          title:  title , url : url);
    });
var MyServicesCommentsNewReplyPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/public/my_services/comments_new_reply/' + id! + '/' + title!;
      return MyServicesCommentsNewReply( id : id,
          title:  title , url : url);
    });
var MyServicesScreenshotsAddImageUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_services/screenshots_add_image/' + id! + '/' + title!;
      return MyServicesScreenshotsAddImage( id : id,
          title:  title , url : url);
    });
var MyServicesScreenshotsEditImageUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_services/screenshots_edit_image/' + id! + '/' + title!;
      return MyServicesScreenshotsEditImage( id : id,
          title:  title , url : url);
    });
var MyProfilePortofolioAddPortofolioUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_profile/portofolio_add_portofolio/' + id! + '/' + title!;
      return MyProfilePortofolioAddPortofolio( id : id,
          title:  title , url : url);
    });
var MyProfilePortofolioEditUser = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/user/my_profile/portofolio_edit/' + id! + '/' + title!;
      return MyProfilePortofolioEdit( id : id,
          title:  title , url : url);
    });



var BrowseProductsProductCommentsNewReplyPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/public/browse_products/product_comments_new_reply/' + id! + '/' + title!;
      return BrowseProductsProductCommentsNewReply( id : id,
          title:  title , url : url);
    });
var BrowseServicesServiceCommentsNewReplyPublic = Handler(
    handlerFunc: (BuildContext?context, Map<String, List<String?>?> params) {
      String? id = params["id"]?.first;
      String? title = params["title"]?.first;
      String? url = '/public/browse_services/service_comments_new_reply/' + id! + '/' + title!;
      return BrowseServicesServiceCommentsNewReply( id : id,
          title:  title , url : url);
    });


//-------------------------------------------------------------------   
