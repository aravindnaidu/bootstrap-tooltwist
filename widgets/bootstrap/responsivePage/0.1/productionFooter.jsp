<hr>
</div>
<% if (gtm != null) { %>
<% if (pageName != "" && event != "") { %>
<script>
   dataLayer = [{
    'event': "<%=event%>",
    'google_tag_params': {
           'ecomm_pagetype': "<%=pageName%>",
           'ecomm_category': "<%=category%>"
    }
   }];
</script>
<% } %>
<!-- [ Exclude GTM for factory pages ] -->	
<% if (!excludeGTM) { %>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
   new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
   j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
   'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
   })(window,document,'script','dataLayer',<%=gtm%>);
</script>
<% } %>
<% } %>
<!-- [ Bootstrap Project ] -->
<%	if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp") ||
   StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")) { %>
<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/bootstrap.min.js.gz"></script>
<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/product_details_plugin_v1.min.js.gz"></script>
<% } %>
<!-- [ Should be called first and cannot be mixed into the unified Js file. ] -->
<%	if (!StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp") &&
   !StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")) { %>
<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/jquery-2.1.4.min.js.gz"></script>
<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/jquery-ui.min.js.gz"></script>
<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/jquery.blockUI.min.js.gz"></script>
<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/d3.min.js.gz"></script>
<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/dropzone.min.js.gz"></script>
<% } %>
<!-- [ Cloudmall Project ] -->
<%	if (!StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp") &&
   !StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")) { %>
<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/c201015.min.js.gz"></script>
<% } %>
<%	if (!StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp") &&
   !StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")) { %>
<%-- These are from the "js/src" folder --%>
<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/c120416.min.js.gz"></script>
<!-- Google Customer Review -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<% } %>
<!-- [ Exclude this for shopping cart and checkout pages ] -->		
<%	if (!StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-86.jsp") &&
   !StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-276.jsp") && 
   !StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-291.jsp") &&
   !StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-275.jsp")) { %>
<script type="text/javascript" src="https://cdn.ywxi.net/js/1.js" async></script>
<% } %>
<script>
   window.___gcfg = {
     lang: 'en_AU'
   };
</script>
%%bottomCode%%
</body>
</html>