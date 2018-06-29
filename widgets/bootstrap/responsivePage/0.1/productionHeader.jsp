<!--START-->
<!-- header for responsivePage -->
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="tooltwist.wbd.Navpoint"%>
<%@page import="com.dinaa.misc.AltLang"%>
<%@page import="tooltwist.cloudmall.utils.WebUtils"%>
<%@page import="tooltwist.wbd.WbdProductionHelper"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page errorPage="../tooltwist/basic/error.jsp"%>
<%@page import="java.util.Properties"%>
<%@page import="tooltwist.wbd.WbdCache"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page contentType="text/html; charset=UTF-8" %>
%%importCode%%
<%
   String jspName = "%%navpointId%%";
   JspHelper jh = JspHelper.getJspHelper(pageContext, jspName);
   %%preFetchCode%%
   AltLang lang = WebUtils.getAltLang(jh);
   %>
<!DOCTYPE html>
   <html lang="en">
   <head>
      <% 
         // initialize variables
         HttpServletRequest headerRequest = jh.getRequest();
      	 Navpoint navpoint = WbdCache.findNavpointInAnyLoadedProject(jspName, true);
         String gtm = WbdCache.getProperty("google.tag.manager");
         String pageName = StringUtils.EMPTY; 
         String event = StringUtils.EMPTY; 
         String category = StringUtils.EMPTY;
         boolean isHomePage = false;
         boolean isChrome = false;
         boolean excludeGTM = true;
         
         // get user agent
         String userAgent = headerRequest.getHeader("user-agent");
         
         // check if chrome browser
         if (userAgent.contains("Chrome")) {
         	// get browser details
          	String bd = userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0];
         	
         	// get browser version
         	String ver = bd.split("/")[1];
         	ver = ver.substring(0, ver.indexOf("."));
         	
         	// check if chrome version is valid for "preload"
         	if (Integer.parseInt(ver) == 41 || Integer.parseInt(ver) > 49) {
         		isChrome = true;
         	}
         }
         
         // check if page is home page of au and us
         if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-111.jsp") ||
         	StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-181.jsp")) {
         	isHomePage = true;
         }
         
         // check google tag manager script if not null
         if (gtm != null) {
         	// set page name, event and category base from pages
          	if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-111.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-181.jsp")) { 
          		event = "remarketing_home"; 
          	 	pageName = "home"; 
         	} else if ( StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-125.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-300.jsp")) { 
          		event = "remarketing_category"; 
          	 	category = "car mats"; 
          	 	pageName = "category"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-184.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-301.jsp")) { 
          		event = "remarketing_category"; 
          		category = "floor mats"; 
          		pageName = "category"; 
         	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-123.jsp")) { 
          	 	event = "remarketing_category"; 
          	 	category = "dash mats"; 
          	 	pageName = "category"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-186.jsp")) { 
          	 	event = "remarketing_category"; 
          	 	category = "dash covers"; 
          		pageName = "category"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-121.jsp")) { 
          	 	event = "remarketing_category"; 
          	 	category = "ute mats"; 
          	 	pageName = "category"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-188.jsp")){ 
          	 	event = "remarketing_category"; 
          	 	category = "trunk mats"; 
          	 	pageName = "category"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-124.jsp")) { 
          	 	event = "remarketing_category"; 
          	 	category = "boot liners"; 
          	 	pageName = "category"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-185.jsp")){ 
          	 	event = "remarketing_category"; 
          	 	category = "trunk liners"; 
          	 	pageName = "category"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-122.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-187.jsp")) { 
          	 	event = "remarketing_category"; 
          	 	category = "plastics"; 
          	 	pageName = "category"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-126.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-183.jsp")) { 
          	 	event = "remarketing_category"; 
          	 	category = "accessories"; 
          	 	pageName = "category"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-291.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-275.jsp")) { 
          	 	event = "remarketing_checkout"; 
          	 	pageName = "checkout"; 
          	} else if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-89.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-273.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-275.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-73.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-280.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-86.jsp") ||
          		StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-276.jsp") ||
          	    StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-304.jsp") ||
          	    StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-179.jsp")) { 
          	 	event = ""; 
          	 	pageName = ""; 
          	} else { 
          	 	event = "remarketing_other"; 
          	 	pageName = "other"; 
          	}
         
         	// check if factory pages then exclude GTM
          	if (!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-91.jsp") &&
          		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-92.jsp") &&
          		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-94.jsp") &&
           		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-95.jsp") &&
           		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-96.jsp") &&
           		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-109.jsp") &&
           		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-293.jsp") &&
           		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-294.jsp") && 
           		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-298.jsp") &&
          		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-299.jsp") &&
           		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-307.jsp") &&
           		!StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-308.jsp")) {
           		excludeGTM = false;
          	}
         }
         %>
      <title>%%pageTitle%%</title>
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="description" content="%%descriptionMetatag%%">
      <meta name="keywords" content="%%keywordMetatag%%">
      <meta name="generator" content="ToolTwist" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-70.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-286.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-86.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-276.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-291.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-275.jsp") || 
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-120.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-191.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-119.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-192.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-80.jsp") ||
         StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-278.jsp")) { %>
      <meta name="robots" content="noindex, follow">
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-111.jsp")) { %>
      <meta property="og:url" content="https://www.fitmycar.com/au/" />
      <meta property="og:type" content="website" />
      <meta property="og:title" content="Shop Online for Car Accessories That Fit" />
      <meta property="og:description" content="Save yourself the hassle of shopping at the car dealer for car accessories. Shop online. Fitment is guaranteed, and delivery is free right to your door." />
      <meta property="og:image" content="https://s3-ap-southeast-2.amazonaws.com/cloudmall-webassets/fitmycar/images/seo-images/fitmycar-shop-accessories-online.jpg" />
      <% } else if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-181.jsp")) { %>
      <meta property="og:url" content="https://www.fitmycar.com/us/" />
      <meta property="og:type" content="website" />
      <meta property="og:title" content="Shop Online for Car Accessories That Fit" />
      <meta property="og:description" content="Save yourself the hassle of shopping at the car dealer for car accessories. Shop online. Fitment is guaranteed, and delivery is free right to your door." />
      <meta property="og:image" content="https://s3-ap-southeast-2.amazonaws.com/cloudmall-webassets/fitmycar/images/seo-images/fitmycar-shop-accessories-online.jpg" />
      <% } %>
      <% if (!WbdCache.getProperty("siteUrl").equalsIgnoreCase("www.fitmycar.com")) { %>
      <meta name="robots" content="noindex, nofollow">
      <% } %>
      <!-- [ Cloudmall Essentials - Bootstrap and Fonts ] -->
      <% if (isChrome && isHomePage) { %>
      <link rel="preload" href="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/css/bootstrap.min.css.gz" as="style" onload="this.onload=null;this.rel='stylesheet'">
      <% } else { %>
      <link rel="stylesheet" href="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/css/bootstrap.min.css.gz" media="screen">
      <% } %>
      <% if (!navpoint.getLabel().contains("Admin") && !navpoint.getLabel().contains("Factory")) { %>
      <% if (isChrome && isHomePage) { %>
      <link rel="preload" href="//d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/css/global_css_v1.0.9.min.css.gz" as="style" onload="this.onload=null;this.rel='stylesheet'">
      <% } else { %>
      <link rel="stylesheet" href="//d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/css/global_css_v1.0.9.min.css.gz" media="screen">
      <% } %>
      <% } %>
      <% if (isChrome && isHomePage) { %>
      <link rel="preload" href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" as="style" onload="this.onload=null;this.rel='stylesheet'">
      <link rel="preload" href="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/css/20160412.min.css.gz" as="style" onload="this.onload=null;this.rel='stylesheet'">
      <link rel="preload" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous" as="style" onload="this.onload=null;this.rel='stylesheet'">
      <% } else { %>
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,500,700">
      <link rel="stylesheet" href="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/css/20160412.min.css.gz" media="screen">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">
      <% } %>
      <!-- [ Cloudmall Essentials END ] -->
      <!-- [ CSS from cssContainer widget ] -->
      %%headerCode%%
      <!-- [ CSS from cssContainer widget END ] -->
      <!-- Font Awesome -->
      <% if (isChrome && isHomePage) { %>
      <link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
      <% } else { %>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <% } %>
      <!-- [ Favicon ] -->
      <link rel="icon" href="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/fitmycar.images.favicon.ico" type="image/x-icon">
      <link rel="shortcut icon" href="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/fitmycar.images.favicon.ico" type="image/x-icon">
      <!-- [ Favicon END ] -->
      <!-- [ Google Analytics ] -->
      <% if (!navpoint.getParent().getId().equals(WbdCache.getProperty("store.name") + "-176")) { %>
      <meta name="google-site-verification" content="VQnOwhh8_0ex8WQozJ14jOZvFK0tRlfVeMEECJ2hOtc" />
      <meta name="msvalidate.01" content="4017B989E703CFA096F76AF5F42A2293" />
      <% } %>
      <!-- [ Google Analytics END ] -->
      <% if (gtm != null) { %>
      <script>var dataLayer  = window.dataLayer || [];</script>
      <% } %>
      <%if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp") ||
   				StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")) { %>
      <script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/jquery-2.1.4.min.js.gz"></script>
      <% } %>
   </head>
   <body>
      %%topCode%%
      <% if ( StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-125.jsp") ||  // Car Mats Static - AU
        	StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-300.jsp") || // Car Mats Dynamic - AU
        	StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-184.jsp") || // Car Mats Static - US
         	StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-301.jsp") || // Car Mats Static - US
         	StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-314.jsp") || // Dash Mats Dynamic - AU
         	StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-315.jsp") || // Dash Mats Dynamic - US
         	StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-317.jsp") || // Seat Covers Dynamic - AU
         	StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-318.jsp")) { // Boot Liners Dynamic - AU %>
      <script type="text/javascript" src="https://api.feefo.com/api/javascript/fitmycar" async></script>
      <% } %>
      <!--  Provides a common fixed-width (and optionally responsive) layout with only <div class="container"> required. -->
      <div class="container">
         <!--  Create a fluid-->
         <!-- <div class="container-fluid" -->
         <!--END-->
         <hr>
         <footer>
            <p>&copy; Company 2013</p>
         </footer>
      </div>
      <!-- /container -->