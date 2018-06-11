<!--START-->
<%@page import="com.myrp.util.MD5Utils"%>
<%@page import="com.myrp.util.StringUtil"%>
<%@page import="tooltwist.myrp.util.FreemiumUtil"%>
<%@page import="tooltwist.myrp.util.FreemiumErrorCatchUtil"%>
<%@page import="tooltwist.myrp.util.Config"%>
<%@page import="tooltwist.myrp.util.LoginUser"%>
<%@page import="tooltwist.myrp.util.IPAddressUtil"%>
<%@page import="java.util.Map"%>
<%@page import="com.myrp.util.WebUtil"%>
<%@page import="com.myrp.util.CookiesUtil"%>
<%@page import="com.myrp.util.Cloudfront"%>
<%@page import="tooltwist.wbd.Navpoint"%>
<%@page import="com.dinaa.misc.AltLang"%>
<%@page import="tooltwist.wbd.WbdProductionHelper"%>
<%@page import="com.dinaa.data.XData"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.AutomaticUrlParametersMode"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>
<%@page import="tooltwist.wbd.WbdSession"%>
<%@page errorPage="../tooltwist/basic/error.jsp"%>
<%@page import="java.text.DateFormat"%>
<%@page import="tooltwist.misc.DateUtils"%>
<%@page import="tooltwist.misc.JspHelper"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Properties"%>
<%@page import="com.dinaa.data.XData"%>
<%@page import="com.dinaa.ui.UimData"%>
<%@page import="com.dinaa.xpc.XpcSecurity"%>
<%@page import="tooltwist.ecommerce.RoutingUIM"%>
<%@page import="tooltwist.wbd.SnippetParam"%>
<%@page import="tooltwist.wbd.WbdException"%>
<%@page import="tooltwist.wbd.WbdRadioTextProperty"%>
<%@page import="tooltwist.wbd.WbdRenderHelper"%>
<%@page import="tooltwist.wbd.WbdSizeInfo"%>
<%@page import="tooltwist.wbd.WbdStringProperty"%>
<%@page import="tooltwist.wbd.WbdSession"%>
<%@page import="tooltwist.wbd.WbdProductionHelper"%>
<%@page import="tooltwist.wbd.WbdCache"%>
<%@page import="tooltwist.chinese.enumerated.LanguageEnum"%>
<%@page import="org.owasp.esapi.ESAPI"%>
<%@page import="org.owasp.encoder.Encode"%>
<%@page contentType="text/html; charset=UTF-8" %>
<% session.removeAttribute("freemiumErrorCatch"); %>
<% session.removeAttribute("freemiumPageCall"); %>

	%%importCode%%
	<%
		String jspName = "%%navpointId%%";
		JspHelper jh = JspHelper.getJspHelper(pageContext, jspName);
		FreemiumUtil.saveUsersAddressSearch(jh);
		FreemiumUtil.checkAddressParameter(request, response, jh, jspName);
		FreemiumUtil.redirectToPVSubDomain(request, response);
		FreemiumUtil.checkLanguageUrlPrefix(jh);
		%%preFetchCode%%
	%>
	
	<%
	boolean isRedirectFromMyrpToPV = !StringUtil.isEmpty(CookiesUtil.getCookie(jh, "redirect_to_pv"));
	boolean isPVRedirectNotified = !StringUtil.isEmpty(CookiesUtil.getCookie(jh, "redirect_to_pv_noti"));
	
	boolean showPVNotification = false;
	if (isRedirectFromMyrpToPV && !isPVRedirectNotified) {
		CookiesUtil.setCookie(jh, "redirect_to_pv_noti", MD5Utils.to_MD5("true"), 17280000);
		showPVNotification = true;	
	}
	
	CookiesUtil.deleteCookie(jh, "redirect_to_pv");
	if ("true".equals(request.getParameter("redirect")) && !StringUtil.isEmpty(request.getParameter("pvUrl"))) {
		CookiesUtil.setCookie(jh, "redirect_to_pv", "1");
		FreemiumUtil.accessPVURL(request, response);
		return;
	}
	
	boolean showUnregisterSubscriptionNotification = !LoginUser.isLoggedIn(request) && !StringUtil.isEmpty(CookiesUtil.getCookie(request, "unregister_email_with_subscription")) && !jspName.equals("myrp-1318") && !jspName.equals("myrp-1311") && !jspName.equals(CookiesUtil.getCookie(request, "unregister_subscription"));
	if (showUnregisterSubscriptionNotification) {
		CookiesUtil.setCookie(response, "unregister_subscription", jspName);
	}

	String map_navpoints_enabled_tmp = Config.getValue("maps.navpoint.enabled");
	String [] map_navpoints_enabled = map_navpoints_enabled_tmp.split(",");
	Map<String, String> properties = new HashMap<String, String>();
	String currentNavpointId = "";
	try {
		String uri = request.getRequestURI();
		currentNavpointId = uri.substring(uri.lastIndexOf("/")+1, uri.length()-4);
		Navpoint currentNavpoint = WbdCache.findNavpointInAnyLoadedProject(currentNavpointId, true);
		properties = currentNavpoint.getProperties();
	} catch(Exception e) {
		currentNavpointId = "";
	}

	boolean isHomePage = currentNavpointId.equals("myrp-1282");
	
	boolean displayBanners = !LoginUser.getData(request).isFreemiumUser() && !IPAddressUtil.isChineseIP(request);
	String bannerSection = "";
	String bannerPageType = "details";
	if (currentNavpointId.equals("myrp-1284")) {
		bannerSection = "explore";
		bannerPageType = "index";
	} else if (currentNavpointId.equals("myrp-1293")) {
		bannerSection = "suburb";
	} else if (currentNavpointId.equals("myrp-1296")) {
		bannerSection = "property";
	} else {
		bannerPageType = "";
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>%%pageTitle%%</title>
		<meta name="description" content="%%descriptionMetatag%%">
		<meta name="generator" content="ToolTwist" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="author" content="tooltwist"/>
		<meta name="web_author" content="tooltwist"/>

		<%if(currentNavpointId.equals("myrp-1327")){%>
		<meta name="googlebot" content="nofollow, noindex" />
		<% } %>
		<%if(isHomePage){%>
		<meta name="google-site-verification" content="yFbd-YGWTkGOW-6CQL4pOJ6d-A9hxYk0ZvXHKkL97UI" />

		<% } %>
	
		<!-- [ Styles ] -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300" rel="stylesheet" type="text/css">
		<link href="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/bootstrap/css/font-awesome.<%=ESAPI.encoder().encodeForHTML(Config.getValue("font-awesome.version"))%>.css.gz" type="text/css" rel="stylesheet" media="screen">
		<link href="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/bootstrap/css/bootstrap.min.<%=ESAPI.encoder().encodeForHTML(Config.getValue("bootstrap.version"))%>.css.gz" type="text/css" rel="stylesheet" media="screen">
		<link href="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/freemium/css/pv/cl-bootstrap_z-adjustments.<%=ESAPI.encoder().encodeForHTML(Config.getValue("cl-bootstrap.z-adjustments.version"))%>.min.css.gz" type="text/css" rel="stylesheet" media="screen">

		<!-- [ Favicon ] -->
		<link rel="shortcut icon" href="/ttsvr/freemium/images/pv/favicon.ico" type="image/x-icon">
		<link rel="icon" href="/ttsvr/freemium/images/pv/favicon.ico" type="image/x-icon">

		<!-- hreflangs -->
		<link rel="alternate" href="<%=Encode.forHtmlAttribute(FreemiumUtil.getURLForHrefLanguage(request, LanguageEnum.DEFAULT_ENGLISH.getIdx())) %>" hreflang="en-au" />
		<link rel="alternate" href="<%=Encode.forHtmlAttribute(FreemiumUtil.getURLForHrefLanguage(request, LanguageEnum.DEFAULT_ENGLISH.getIdx())) %>" hreflang="en-cn" />
		<link rel="alternate" href="<%=Encode.forHtmlAttribute(FreemiumUtil.getURLForHrefLanguage(request, LanguageEnum.DEFAULT_ENGLISH.getIdx())) %>" hreflang="en-hk" />
		<link rel="alternate" href="<%=Encode.forHtmlAttribute(FreemiumUtil.getURLForHrefLanguage(request, LanguageEnum.DEFAULT_ENGLISH.getIdx())) %>" hreflang="en-tw" />
		<link rel="alternate" href="<%=Encode.forHtmlAttribute(FreemiumUtil.getURLForHrefLanguage(request, LanguageEnum.CHINESE_SIMPLIFIED.getIdx())) %>" hreflang="zh-au" />
		<link rel="alternate" href="<%=Encode.forHtmlAttribute(FreemiumUtil.getURLForHrefLanguage(request, LanguageEnum.CHINESE_SIMPLIFIED.getIdx())) %>" hreflang="zh-cn" />
		<link rel="alternate" href="<%=Encode.forHtmlAttribute(FreemiumUtil.getURLForHrefLanguage(request, LanguageEnum.CHINESE_SIMPLIFIED.getIdx())) %>" hreflang="zh-hk" />
		<link rel="alternate" href="<%=Encode.forHtmlAttribute(FreemiumUtil.getURLForHrefLanguage(request, LanguageEnum.CHINESE_SIMPLIFIED.getIdx())) %>" hreflang="zh-tw" />

		%%headerCode%%

		<%
		if (!isHomePage) {
		%>
		    <!-- [ jQuery ] -->
			<!--[if lt IE 9]>
				<script src="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/freemium/script/jquery.1.11.1.min.js.gz"></script>
			<![endif]-->
			<!--[if gte IE 9]><!-->
		    	<script src="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/freemium/script/jquery-2.1.4.min.js.gz"></script>
			<!--<![endif]-->
	
			<script>$.ajaxSetup({ cache: false });</script>
		<%
		}
		%>
	
	    <!-- [ CSS from cssContainer widget ] -->
		<%
			for(String map_navpoint_enabled : map_navpoints_enabled) {
				if(map_navpoint_enabled.equals(currentNavpointId)) {
		%>
		<script src="https://maps.googleapis.com/maps/api/js?v=3&client=gme-corelogicsolutions&signature=7Js3Ymvq0Ye7IbvSJ6FaXh-9FVs=&sensor=false&channel=freemium&libraries=places"></script>
		<script src="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/freemium/script/markerwithlabel.min.js.gz"></script>
		<%
				}	
			} 
		%>
		
		<!-- BEGIN Krux ControlTag for "propertyvalue.com.au" -->
		<script class="kxct" data-id="sm9r9llxh" data-timing="async" data-version="3.0" type="text/javascript">
		  window.Krux||((Krux=function(){Krux.q.push(arguments)}).q=[]);
		  (function(){
		    var k=document.createElement('script');k.type='text/javascript';k.async=true;
		    k.src=(location.protocol==='https:'?'https:':'http:')+'//cdn.krxd.net/controltag/sm9r9llxh.js';
		    var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(k,s);
		  }());
		</script>
		<!-- END Krux ControlTag -->
		
		<% if (displayBanners) { %>
		<!--- Start: Targeting variables --->
		<script type="text/javascript">
		    window.dfpData = {"dfpAdUnits":{"net":"89850847","site":"PropertyValue","sect":"<%=Encode.forJavaScriptAttribute(bannerSection) %>","subsect":""},"dfpKV":{"pagetype":"<%=Encode.forJavaScriptAttribute(bannerPageType) %>","state":"<%=Encode.forJavaScriptAttribute(freemiumKeyword.getState().trim()) %>","suburb":"<%=Encode.forJavaScriptAttribute(freemiumKeyword.getSuburbAddress().trim()) %>","postcode":"<%=Encode.forJavaScriptAttribute(freemiumKeyword.getPostcodeAddress().trim()) %>"}}
		</script>
		<!--- End: Targeting variables --->
		<!-- START DFP GPT Banners Header Script -->
		<script src="http://pagead2.googlesyndication.com/pagead/osd.js"></script>
		<script src="https://securepubads.g.doubleclick.net/gpt/pubads_impl_rendering_213.js"></script>
		<script async="async" src="https://www.googletagservices.com/tag/js/gpt.js"></script>
		<script>
	        var googletag = googletag || {};
	        googletag.cmd = googletag.cmd || [];
	    </script>
	    <script type="text/javascript">
	 		// Prepare DFP targeting variables
        	var dfpNet = window.dfpData.dfpAdUnits.net
        	var dfpSite = '/' + window.dfpData.dfpAdUnits.site
        	
        	if (window.dfpData.dfpAdUnits.sect) {
	            var dfpSect = '/' + window.dfpData.dfpAdUnits.sect
	        } else {
	            dfpSect = "";
	        }
	 		
        	if (window.dfpData.dfpAdUnits.subsect) {
	            var dfpSubsect = '/' + window.dfpData.dfpAdUnits.subsect
	        } else {
	            dfpSubsect = "";
	        }
        	
        	var dfpAdUnitPath = dfpNet + dfpSite + dfpSect + dfpSubsect
	        // Ad Tester (add "?adtest=testvalue" to url, inserts KV for targeting)
	        function getQueryVariable(variable) {
	            var query = window.location.search.substring(1);
	            var vars = query.split("&");
	
	            for (var i = 0; i < vars.length; i++) {
	                var pair = vars[i].split("=");
	                if (pair[0] == variable) {
	                    return pair[1];
	                }
	            }
	            return (false);
	        }
        	
        	var kvAdTest = getQueryVariable("adtest");
	        // Extract article title from url
	        pageURL = window.location.pathname;
	        pageURLArray = pageURL.split('/');
	        articleURL = '';
	        
	        while (pageURLArray.length > 0 && articleURL == '') {
	            articleURL = pageURLArray.pop();
	        }
	        
	     // Define responsive ad size mapping and declare ad slots
	        googletag.cmd.push(function() {
	            var mapBanner = googletag.sizeMapping().addSize([0, 0], [[320, 50],[320, 100],[300, 50]]).addSize([768, 0], [728, 90]).build();
	            var mapHeader = googletag.sizeMapping().addSize([0, 0], []).addSize([992, 0], [728, 90]).build();
	            // Banners
	            var adslot1 = googletag.defineSlot(dfpAdUnitPath, [728, 90], 'dfp-ad-slot-1').defineSizeMapping(mapHeader).addService(googletag.pubads()).setTargeting('pos', '1')
	            var adslot2 = googletag.defineSlot(dfpAdUnitPath, [728, 90], 'dfp-ad-slot-2').defineSizeMapping(mapBanner).addService(googletag.pubads()).setTargeting('pos', '2')
	            var adslot3 = googletag.defineSlot(dfpAdUnitPath, [728, 90], 'dfp-ad-slot-3').defineSizeMapping(mapBanner).addService(googletag.pubads()).setTargeting('pos', '3')

            	// Links
            	var adslot4 = googletag.defineSlot(dfpAdUnitPath, 'fluid', 'dfp-ad-slot-4').addService(googletag.pubads()).setTargeting('pos', '1')

				// Set page-level key-values
	            googletag.pubads().setTargeting("pageURL", [articleURL]).setTargeting("adtest", [kvAdTest]);
	            if (dfpData.dfpKV) {
	                Object.keys(dfpData.dfpKV).forEach(function(key) {
	                    googletag.pubads().setTargeting(key, dfpData.dfpKV[key]);
	                })
	            }
	            googletag.pubads().enableAsyncRendering();
	            googletag.pubads().collapseEmptyDivs(true);
	            googletag.pubads().setCentering(true);
	            googletag.pubads().enableSingleRequest();
	            googletag.enableServices();
	        });
	    </script>
		<!-- END DFP GPT Banners Header Script -->
		<% } %>
	</head>

	<body>
		<!-- Google Tag Manager -->
		<noscript>
			<iframe src="//www.googletagmanager.com/ns.html?id=<%=ESAPI.encoder().encodeForHTML(Config.getValue("fgtm.containerId"))%>" height="0" width="0" style="display:none;visibility:hidden"></iframe>
		</noscript>

		<script>
			(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','<%=ESAPI.encoder().encodeForHTML(Config.getValue("fgtm.containerId"))%>');
		</script>
		<!-- End Google Tag Manager -->

		%%topCode%%
		
		<!--  Provides a common fixed-width (and optionally responsive) layout with only <div class="container"> required. -->
		<div class="container">
			<!--  Create a fluid-->
			<!-- <div class="container-fluid" -->

			<!--END-->
			<hr>
			<footer>
			<p>&copy; Company 2013</p>
			</footer>
		</div> <!-- /container -->
		
	</body>
</html>
