<!--START-->
<!-- header for responsivePage -->
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
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>%%pageTitle%%</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="%%descriptionMetatag%%">
    <meta name="keywords" content="%%keywordMetatag%%">
    <meta name="generator" content="ToolTwist" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- [ Bootstrap ] -->
    <link href="%%URL(/ttsvr/bootstrap/css/bootstrap.min.css)%%" rel="stylesheet" media="screen">
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
    <link href="%%URL(/ttsvr/bootstrap/css/jquery-ui.min.css)%%" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href="%%URL(/ttsvr/bootstrap/css/pagination.min.css)%%" rel="stylesheet" media="screen">

    %%headerCode%%

    <!-- [ Favicon ] -->
    <link rel="icon" href="/ttsvr/formsexpress/resources/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/ttsvr/formsexpress/resources/favicon.ico" type="image/x-icon">




    <script>
    var browser = get_browser_info();
    if ( ( browser.name == 'Chrome' && browser.version < 22 ) ||
         ( browser.name == 'Firefox' && browser.version < 21 ) ||
         ( browser.name == 'Safari' && browser.version < 5 ) ||
         ( browser.name == 'IE' && browser.version < 9 ) ){
      var url = window.location.href;
      if (url.indexOf("browser-support") <= -1){
        window.location.href="/ttsvr/browser-support";
      }
    }

    function get_browser_info(){
        var ua=navigator.userAgent,tem,M=ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
        if(/trident/i.test(M[1])){
            tem=/\brv[ :]+(\d+)/g.exec(ua) || [];
            return {name:'IE', VERSION:(tem[1]||'')};
            }
        if(M[1]==='Chrome'){
            tem=ua.match(/\bOPR\/(\d+)/)
            if(tem!=null)   {return {name:'Opera', version:tem[1]};}
            }
        M=M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
        if((tem=ua.match(/version\/(\d+)/i))!=null) {M.splice(1,1,tem[1]);}
        return {
          name: M[0],
          version: M[1]
        };
     }
    </script>
  </head>
  <body>
%%topCode%%

 <div class="container">
 <input type="hidden" name="serverUrl" value="<%=WbdCache.getProperty("server.url")%>">
 <input type="hidden" name="siteVersion" value="<%=WbdCache.getProperty("site.version")%>">
<!--END-->
      <hr>
      <footer>
        <p>&copy; Company 2013</p>
      </footer>
    </div> <!-- /container -->
</body>
</html>
