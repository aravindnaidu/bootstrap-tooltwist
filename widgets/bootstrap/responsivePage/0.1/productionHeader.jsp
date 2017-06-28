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

    <!-- [ CSS from cssContainer widget ] -->
	%%headerCode%%
	<!-- [ CSS from cssContainer widget END ] -->

    <!-- [ Cloudmall Essentials - Bootstrap and Font Awesome ] -->
		<link href="%%URL(/ttsvr/bootstrap/dist/css/bootstrap.min.css)%%" rel="stylesheet" media="screen">
		<link href="%%URL(/ttsvr/font-awesome/css/font-awesome.min.css)%%" rel="stylesheet" media="screen">
			<%-- These are from the "css/src" folder --%>
		<link href="%%URL(/ttsvr/bootstrap/css/build/20160412.css)%%" rel="stylesheet" media="screen">
	<!-- [ Cloudmall Essentials END ] -->

    <!-- [ Favicon ] -->
    <link rel="icon" href="/ttsvr/cropImage/<%=WbdCache.getProperty("store.name") %>.images.favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/ttsvr/cropImage/<%=WbdCache.getProperty("store.name") %>.images.favicon.ico" type="image/x-icon">
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

  			<script>
  			var page = "";
  				if(window.location.pathname == '/au/' || window.location.pathname == '/us/'){
  					page = "home";
  				} else if (window.location.pathname == '/au/car-mats') {
  					page = "car mats";
  				} else if (window.location.pathname == '/us/floor-mats'){
  					page = "floor mats";
  				} else if (window.location.pathname == '/au/dash-mats') {
  					page = "dash mats";
  				} else if (window.location.pathname == '/us/dash-covers'){
  					page = "dash covers";
  				} else if (window.location.pathname == '/au/ute-mats') {
  					page = "ute mats";
  				} else if (window.location.pathname == '/us/trunk-mats'){
  					page = "trunk mats";
  				} else if (window.location.pathname == '/au/boot-liners') {
  					page = "boot liners";
  				} else if (window.location.pathname == '/us/trunk-liners'){
  					page = "trunk liners";
  				} else if (window.location.pathname.endsWith("plastics")) {
  					page = "plastics";
  				} else if (window.location.pathname.endsWith("accessories")){
  					page = "accessories";
  				}
  				
  				dataLayer = [{
				 	'event': 'remarketing_home',
				    'google_tag_params': {
				            'ecomm_pagetype': page,
				 	}
				}];
			</script>
  			
  			<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
			new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
			j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
			'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
			})(window,document,'script','dataLayer',<%=googleTagManager %>);
  			</script>
  			
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
