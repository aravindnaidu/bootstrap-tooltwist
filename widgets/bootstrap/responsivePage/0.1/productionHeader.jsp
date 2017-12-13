<!--START-->
<!-- header for responsivePage -->
<%@page import="org.apache.commons.lang.WordUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="tooltwist.cloudmall.utils.StringUtil"%>
<%@page import="tooltwist.cloudmall.utils.CloudMallUtils"%>
<%@page import="tooltwist.wbd.Navpoint"%>
<%@page import="com.dinaa.misc.AltLang"%>
<%@page import="tooltwist.cloudmall.utils.WebUtils"%>
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
  <%-- <%
  String categoryName = jh.getRequest().getParameter("categoryName");
  String domainName = jh.getRequest().getServerName();
  if (StringUtil.isNullOrEmpty(categoryName)) {
	  categoryName = "%%pageTitle%%" + " - " + domainName;
  } else {
	  if(StringUtils.contains(categoryName, "/")){
		categoryName = StringUtil.substringAfterLast(categoryName, "/");
	  }
	  categoryName = "%%pageTitle%%" + " " + WordUtils.capitalize((StringUtil.replaceAll(categoryName, "-", " "))) + " - " + domainName;
  }
  %>
    <title><%=categoryName %></title> --%>

    <title>%%pageTitle%%</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="description" content="%%descriptionMetatag%%">
	<meta name="keywords" content="%%keywordMetatag%%">
	<meta name="generator" content="ToolTwist" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Old Bootstrap & Font Awesome Libraries (remove this if the site is stable after the optimization 
	    <!-- [ Cloudmall Essentials - Bootstrap and Font Awesome ]
			<link href="%%URL(/ttsvr/bootstrap/dist/css/bootstrap.min.css)%%" rel="stylesheet" media="screen">
			<link href="%%URL(/ttsvr/font-awesome/css/font-awesome.min.css)%%" rel="stylesheet" media="screen">
				<%-- These are from the "css/src" folder --%>
			<link href="%%URL(/ttsvr/bootstrap/css/build/20160412.css)%%" rel="stylesheet" media="screen">
		<!-- [ Cloudmall Essentials END ]
	-->
	
	<!-- Title: New Bootstrap, Icons & Fonts (Optimization)
	---- Date: December 2017 -->
	
		<!-- Bootstrap -->
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<!-- Icons -->
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
		<!-- Font: Montserrat -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600" rel="stylesheet">
		
    <!-- [ CSS from cssContainer widget ] -->
	%%headerCode%%
	<!-- [ CSS from cssContainer widget END ] -->

    <!-- [ Favicon ] -->
    <link rel="icon" href="https://s3-ap-southeast-2.amazonaws.com/cloudmall-webassets/fitmycar/favicon.ico" type="image/x-icon">
	<!-- [ Favicon END ] -->

	<%
	Navpoint navpoint = WbdCache.findNavpointInAnyLoadedProject(jspName, true);
	boolean requiresLogin = navpoint.requiresLogin();
	%>

	<!-- [ Google Analytics ] -->
		<% if (!navpoint.getParent().getId().equals(WbdCache.getProperty("store.name") + "-176")) { %>
		  	<% if (navpoint.getLabel().equalsIgnoreCase("home")) { %>
			  	<meta name="google-site-verification" content="AhLcdFsg980gnZh8k4dzSkYUiLzwgnDapP8c80WM_-A" />
			  	<meta name="msvalidate.01" content="4017B989E703CFA096F76AF5F42A2293" />
		  	<% } %>
		<% } %>
	<!-- [ Google Analytics END ] -->

  </head>
  <body>
  
  <% String googleTagManager = WbdCache.getProperty("google.tag.manager"); %>
  <% if (googleTagManager != null) { %> 
  <% HttpServletRequest headerRequest = jh.getRequest(); %>
  
  			<% String pageName = ""; 
  			 String event = ""; 
  			 String category = ""; 
  				 if(org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-111.jsp")  ||  org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-181.jsp") ){ 
  					 event = "remarketing_home"; 
  					 pageName = "home"; 
  				 } else if ( org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-125.jsp") ||  org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-300.jsp")) { 
  					 event = "remarketing_category"; 
  					 category = "car mats"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-184.jsp") ||  org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-301.jsp")){ 
  					 event = "remarketing_category"; 
  					 category = "floor mats"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-123.jsp")) { 
  					 event = "remarketing_category"; 
  					 category = "dash mats"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-186.jsp")){ 
  					 event = "remarketing_category"; 
  					 category = "dash covers"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-121.jsp")) { 
  					 event = "remarketing_category"; 
  					 category = "ute mats"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-188.jsp")){ 
  					 event = "remarketing_category"; 
  					 category = "trunk mats"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-124.jsp")) { 
  					 event = "remarketing_category"; 
  					 category = "boot liners"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-185.jsp")){ 
  					 event = "remarketing_category"; 
  					 category = "trunk liners"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-122.jsp") || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-187.jsp")) { 
  					 event = "remarketing_category"; 
  					 category = "plastics"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-126.jsp") || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-183.jsp")){ 
  					 event = "remarketing_category"; 
  					 category = "accessories"; 
  					 pageName = "category"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-291.jsp") || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-275.jsp")){ 
  					 event = "remarketing_checkout"; 
  					 pageName = "checkout"; 
  				 } else if (org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-89.jsp") || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-273.jsp")  
  								 || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-275.jsp") 
  								 || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-73.jsp") || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-280.jsp")  
  								 || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-86.jsp") || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-276.jsp")  
  								 || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp") || org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")){ 
  					 event = ""; 
  					 pageName = ""; 
  				 } else { 
  					 event = "remarketing_other"; 
  					 pageName = "other"; 
  				 } %>
  				 
  			<script>
  			<%if (pageName!="" && event!="") { %>
  				dataLayer = [{
				 	'event': "<%=event%>",
				    'google_tag_params': {
				            'ecomm_pagetype': "<%=pageName%>",
				            'ecomm_category':  "<%=category%>"
				 	}
				}];
	  		<%}%>
			</script>
  			
  			<!--exclude GTM for factory pages -->
  			<%if (!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-109.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-96.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-95.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-94.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-92.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-91.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-308.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-307.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-299.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-298.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-294.jsp") &&
  					!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-293.jsp")) { %>
	  			<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
				new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
				j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
				'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
				})(window,document,'script','dataLayer',<%=googleTagManager %>);
	  			</script>
  			<% } %>
  			
  <% } %>
  
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
