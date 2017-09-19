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

	  	<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
			ga('create', '<%=WbdCache.getProperty("uaCode")%>', '<%=WbdCache.getProperty("uaDomainName")%>');
			ga('require', 'linkid', 'linkid.js');
			ga('require', 'displayfeatures');
			ga('send', 'pageview');
		</script>
	<% } %>
	<!-- [ Google Analytics END ] -->
	
	<!-- Facebook Pixel Code (Initial Code for Stage) -->
	<script>
		!function(f,b,e,v,n,t,s)
		{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
		n.callMethod.apply(n,arguments):n.queue.push(arguments)};
		if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
		n.queue=[];t=b.createElement(e);t.async=!0;
		t.src=v;s=b.getElementsByTagName(e)[0];
		s.parentNode.insertBefore(t,s)}(window,document,'script',
		'https://connect.facebook.net/en_US/fbevents.js');
		 fbq('init', '282296572267911'); 
		fbq('track', 'PageView');
	</script>
	
	<noscript>
		<img height="1" width="1" src="https://www.facebook.com/tr?id=282296572267911&ev=PageView&noscript=1"/>
	</noscript>
	<!-- End Facebook Pixel Code (Initial Code for Stage) -->

  </head>
  <body>
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
