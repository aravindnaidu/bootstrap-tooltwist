<!--START-->
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
<%@page contentType="text/html; charset=UTF-8" %>
%%importCode%%
<%
	String jspName = "%%navpointId%%";
	JspHelper jh = JspHelper.getJspHelper(pageContext, jspName);
%%preFetchCode%%

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

  <head>
    <title>%%pageTitle%%</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="%%descriptionMetatag%%">
	<meta name="keywords" content="%%keywordMetatag%%">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- <link rel="shortcut icon" href="/ttsvr/favicon.ico?v=0.2" type="image/x-icon">/ttsvr/studylane_t/images/icons/back.png -->
	
	<% Object isHostStudylane = request.getSession(false).getAttribute("isStudylane");
		if ("true".equals(isHostStudylane) ) { %>
		
		<link rel="shortcut icon" href="https://d2hpwmayxrmlo8.cloudfront.net/public/images/icons/favicon/studylane/favicon.ico?v0.1" type="image/x-icon">	
		
		<!-- Facebook Pixel Code -->
		<script>
			!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
			n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
			n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
			t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
			document,'script','//connect.facebook.net/en_US/fbevents.js');
			fbq('init', '1621979274729114');
			fbq('track', "PageView");</script>
		<noscript>
		<img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=1621979274729114&ev=PageView&noscript=1"/></noscript>
		<!-- End Facebook Pixel Code -->		
		
	<% } else { %>
		<link rel="shortcut icon" href="https://d2hpwmayxrmlo8.cloudfront.net/public/images/icons/favicon/gsp/favicon.ico?v0.1" type="image/x-icon">
	<% } %>
	
%%headerCode%%
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
<!--     <link href="https://d2hpwmayxrmlo8.cloudfront.net/public/libraries/bootstrap/css/bootstrap.min.css?v=3.0.0" rel="stylesheet" media="screen" /> -->
    <link href="%%URL(/ttsvr/bootstrap/css/bootstrap.min.css?v=3.0.0)%%" rel="stylesheet" media="screen" />
    <% 
    	String currentUri = (String)request.getAttribute("javax.servlet.forward.request_uri");
    	if ( null != currentUri && currentUri.indexOf("successfully-submitted") > -1 && "true".equals(isHostStudylane)){ %>
			<!-- Google Code for Register Conversion Page -->
			<script type="text/javascript">
			/* <![CDATA[ */
			var google_conversion_id = 1041844223;
			var google_conversion_language = "en";
			var google_conversion_format = "3";
			var google_conversion_color = "ffffff";
			var google_conversion_label = "hLpDCJmPqWEQ_4_l8AM";
			var google_remarketing_only = false;
			/* ]]> */
			</script>
			<noscript>
			<div style="display:inline;">
			<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/1041844223/?label=hLpDCJmPqWEQ_4_l8AM&amp;guid=ON&amp;script=0"/>
			</div>
			</noscript>
    <% }else if("true".equals(isHostStudylane)) { %>
    		<!-- Google Code for Remarketing Tag -->
			<!--
				Remarketing tags may not be associated with personally 
				identifiable information or placed on pages related to 
				sensitive categories. See more information and instructions 
				on how to setup the tag on: http://google.com/ads/remarketingsetup
			-->
			<script type="text/javascript">
			/* <![CDATA[ */
			var google_conversion_id = 1041844223;
			var google_custom_params = window.google_tag_params;
			var google_remarketing_only = true;
			/* ]]> */
			</script>	
			<noscript>
			<div style="display:inline;">
			<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1041844223/?value=0&amp;guid=ON&amp;script=0"/>
			</div>
			</noscript>
    <% } %>
    
    <%if("true".equals(isHostStudylane)){ %>
    	 <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>
    <% } %>
    
  </head>
  <body>
  
	<!--
		 Google Tag Manager
		 note : why after body tag : https://developers.google.com/tag-manager/quickstart 
	-->
	<% if ("true".equals(request.getSession(false).getAttribute("isStudylane"))) { %>
		<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-M8T384" 
		height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
		<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
		'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-M8T384');</script>
	<%} else { %>
		<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-PWQBNF" 
		height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
		<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
		new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
		j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
		'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-PWQBNF');</script>
	<%} %>    
	<!-- End Google Tag Manager -->    
  
%%topCode%%

<!--  Provides a common fixed-width (and optionally responsive) layout with only <div class="container"> required. -->
<div class="divForFixedFooter">
<!--  Create a fluid-->
<!-- <div class="container-fluid" -->
 
<!--END-->
      <hr>

      <footer>
        <p>&copy; Company 2013</p>
      </footer>
</div>
</body>
</html>