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
   String countryCode = WbdCache.getProperty("project.store.locale");
   String siteUrl = WbdCache.getProperty("siteUrl");
   %>
<!DOCTYPE html>
<% if (countryCode.equalsIgnoreCase("AU")) { %>
  <html lang="en-AU">
<% } else { %>
  <html lang="en-US">
<% } %>
   <head>
      <% 
         // initialize variables
         HttpServletRequest headerRequest = jh.getRequest();
         Navpoint navpoint = WbdCache.findNavpointInAnyLoadedProject(jspName, true);
         String gtm = WbdCache.getProperty("google.tag.manager");
         String uaCode = WbdCache.getProperty("uaCode");
         String pageName = StringUtils.EMPTY; 
         String event = StringUtils.EMPTY; 
         String category = StringUtils.EMPTY;
         boolean isHomePage = false;
         boolean isChrome = false;
         boolean excludeGTM = true;
         
         // phone number in schema
         String phoneNumber = "+61 1300 299 922";
         if (countryCode.equalsIgnoreCase("US")) {
        	 phoneNumber = "+1 (800) 240-8107";
         }
         
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
         
         // check google tag manager script if not nulll
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
        <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp") ||
        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")) { %>
       <script type="application/ld+json">
            {
              "@context": "http://schema.org/",
              "@type": "Product",
              "name": "${productDetails.product.productName}",
              "image": ${productDetails.schemaImages},
              "description": "${productDetails.parentProductType.description}",
              "mpn": "${productDetails.product.partNumber}",
			  "sku": "${productDetails.product.productId}"${productDetails.rating},
              "brand": {
                  "@type": "Thing",
                  "name": "FitMyCar"
              },
              "offers": {
                "@type": "Offer",
                "priceCurrency": "${productDetails.gtmCurrencyCode}",
                "price": ${productDetails.price},
				"url": "<%=siteUrl%>${requestScope['javax.servlet.forward.request_uri']}",
                "itemCondition": "http://schema.org/NewCondition",
                "availability": "${productDetails.schemaAvailability}",
                "seller": {
                  "@type": "Organization",
                  "name": "FitMyCar"
                  }
              },
			  "review": ${productDetails.review}
            }
        </script>
      <% if (!WebUtils.isGeneralAccessory()) { %>
        <script type="application/ld+json">
      {
          "@context": "http://schema.org",
          "@type": "BreadcrumbList",
          "itemListElement": [{
            "@type": "ListItem",
            "position": 1,
          "item": {
              "@id": "<%=siteUrl%>/<%=countryCode%>",
              "name": "shop"
          }
        },{
            "@type": "ListItem",
            "position": 2,
            "item": {
            "@id": "<%=siteUrl%>/<%=countryCode%>/${productDetails.parentProductType.categoryUrl}/",
            "name": "${productDetails.categoryName}"
            }
        },{
            "@type": "ListItem",
            "position": 3,
            "item": {
              "@id": "<%=siteUrl%>/<%=countryCode%>/${productDetails.parentProductType.categoryUrl}/${productDetails.makeUrlString}",
              "name": "${productDetails.makeValue}"
            }
        },{
            "@type": "ListItem",
            "position": 4,
            "item": {
              "@id": "<%=siteUrl%>/<%=countryCode%>/${productDetails.parentProductType.categoryUrl}/${productDetails.modelUrlString}",
              "name": "${productDetails.modelValue}"
          }
        }]
    }
    </script>
    <% } %>
    
      <% } %>
      
      <%if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-125.jsp") ||
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-184.jsp") ||
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-123.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-316.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-186.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-121.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-188.jsp") ||
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-124.jsp") ||
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-185.jsp") ||
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-122.jsp") ||
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-126.jsp") ||
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-320.jsp") ||
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-329.jsp")) { %>
          
          	<script type="application/ld+json">
				{
  				"@context": "http://schema.org",
  				"@type": "BreadcrumbList",
  				"itemListElement": [{
    				"@type": "ListItem",
    				"position": 1,
    				"item": {
      				"@id": "${categoryDetails.homeUrl}",
      				"name": "shop"
    				}
  				},{
    				"@type": "ListItem",
    				"position": 2,
    				"item": {
      					"@id": "${categoryDetails.categoryUrl}",
      					"name": "${categoryDetails.categoryName}"
    				}
  				}]
				}
			</script>
					          
          
      <%}%>
      
      <%if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-300.jsp") ||
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-314.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-317.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-318.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-325.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-301.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-315.jsp") || 
              StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-330.jsp")) { %>
          
          	<script type="application/ld+json">
				{
  				"@context": "http://schema.org",
  				"@type": "BreadcrumbList",
  				"itemListElement": [{
    				"@type": "ListItem",
    				"position": 1,
    				"item": {
      				"@id": "${categoryDetails.homeUrl}",
      				"name": "shop"
    				}
  				},{
    				"@type": "ListItem",
    				"position": 2,
    				"item": {
      					"@id": "${categoryDetails.categoryUrl}",
      					"name": "${categoryDetails.categoryName}"
    				}
  				},{
    				"@type": "ListItem",
    				"position": 3,
    				"item": {
      					"@id": "${categoryDetails.makeUrl}",
      					"name": "${categoryDetails.make}"
    				}
  				}]
				}
			</script>
					          
          
      <%}%>
      
      <%if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-160.jsp")) { %>
          
          	<script type="application/ld+json">
				{
  				"@context": "http://schema.org",
  				"@type": "BreadcrumbList",
  				"itemListElement": [{
    				"@type": "ListItem",
    				"position": 1,
    				"item": {
      				"@id": "${categoryDetails.homeUrl}",
      				"name": "shop"
    				}
  				},{
    				"@type": "ListItem",
    				"position": 2,
    				"item": {
      					"@id": "${categoryDetails.siteMapUrl}",
      					"name": "vehicles"
    				}
  				}]
				}
			</script>
					          
          
      <%}%>
      
      <%if (StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-161.jsp") ||
    		  StringUtils.contains(request.getRequestURL(), "fitmycar-webdesign-162.jsp")) { %>
          
          	<script type="application/ld+json">
				{
  				"@context": "http://schema.org",
  				"@type": "BreadcrumbList",
  				"itemListElement": [{
    				"@type": "ListItem",
    				"position": 1,
    				"item": {
      				"@id": "${categoryDetails.homeUrl}",
      				"name": "shop"
    				}
  				},{
    				"@type": "ListItem",
    				"position": 2,
    				"item": {
      					"@id": "${categoryDetails.siteMapUrl}",
      					"name": "vehicles"
						}
    			},{
    				"@type": "ListItem",
    				"position": 3,
    				"item": {
      					"@id": "${categoryDetails.makeUrl}",
      					"name": "${categoryDetails.make}"
    				}
  				}]
				}
			</script>
					          
          
      <%}%>
      
      <% if (isHomePage) { %>
      <script type="application/ld+json">
    {   "@context" : "http://schema.org",
        "@type" : "Organization",
		"name" : "FitMyCar",
        "legalName" : "FitMyCar",
        "url" : "https://fitmycar.com/<%=countryCode%>",
        "contactPoint" : [{
            "@type" : "ContactPoint",
            "telephone" : "<%=phoneNumber%>",
            "contactType" : "customer service"
        }],
        "logo" : "${homeDetails.homeUrl}cropImage/fitmycar.images.fmc_img_logo_new.png",
        "sameAs" : 
				[
					  "https://www.facebook.com/FitMyCar",
                      "https://twitter.com/FitMyCar/",
                      "https://www.instagram.com/FitMyCar/",
                      "https://www.pinterest.com.au/FitMyCar/"
					  "https://www.youtube.com/channel/UCl_J4HQ-c496fj7bDgiau1w"
				]${homeDetails.rating}
    }
  </script>
      <% } %>
       <%
       	String pageMetaTitle = "toyota";
       %>
      <title>%%pageTitle%%</title>
      <!-- <meta charset="UTF-8">   -->
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="description" content="%%descriptionMetatag%%">
      <meta name="keywords" content="%%keywordMetatag%%">
      <meta name="generator" content="ToolTwist" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="google-signin-scope" content="profile email">
	  <script src="https://apis.google.com/js/api:client.js"></script>
	  <link rel="stylesheet" href="https://use.typekit.net/obm4fnx.css">
	  <!-- Zip Pay -->
	  <script src="https://static.zipmoney.com.au/checkout/checkout-v1.min.js"></script>
	  <!-- Zip Pay USP bar and Product Details-->
	  <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
	  <script type="text/javascript" src="https://d3k1w8lx8mqizo.cloudfront.net/lib/js/zm-widget-js/dist/zipmoney-widgets-v1.min.js"></script>
	  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/lozad/dist/lozad.min.js"></script>
	  <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp")||
    		  StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")) { %>
	  <!-- PRODUCT DETAILS PAGES -->
		<meta name="twitter:card" content="summary" />
	  	<meta name="twitter:site" content="@FitMyCar" />
		<meta name="twitter:title" content="${productDetails.product.productName}" />
		<meta name="twitter:description" content="%%descriptionMetatag%%" />
		<meta name="twitter:image" content="https:${productDetails.firstImage}" />
		<meta property="og:title" content="${productDetails.product.productName}" />
		<meta property="og:description" content="%%descriptionMetatag%%" />
		<meta property="og:image" content="https:${productDetails.firstImage}" />
		<meta property="og:type" content="product" />
		<meta property="og:url" content="<%=siteUrl%>${productDetails.product.url}" />	
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-111.jsp")||
    		  StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-181.jsp")) { %>
      <!-- HOMEPAGE -->
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@FitMyCar" />
		<meta name="twitter:title" content="%%pageTitle%%" />
		<meta name="twitter:description" content="%%descriptionMetatag%%" />
		<meta name="twitter:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_homepage.jpg" />
		<meta property="og:title" content="%%pageTitle%%" />
		<meta property="og:description" content="%%descriptionMetatag%%" />
		<meta property="og:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_homepage.jpg" />
		<meta property="og:type" content="website" />
		<meta property="og:url" content="https://www.fitmycar.com/<%=countryCode%>" />
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-125.jsp") ||
    		  StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-184.jsp") ||
    		  StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-301.jsp")) { %>
      <!-- CAR MATS / FLOOR MATS -->
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@FitMyCar" />
		<meta name="twitter:title" content="%%pageTitle%%" />
		<meta name="twitter:description" content="%%descriptionMetatag%%" />
		<meta name="twitter:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_car-mat_<%=countryCode%>.jpg" />
		<meta property="og:title" content="%%pageTitle%%" />
		<meta property="og:description" content="%%descriptionMetatag%%" />
		<meta property="og:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_car-mat_<%=countryCode%>.jpg" />
		<meta property="og:type" content="product.group" />
		<meta property="og:url" content="<%=siteUrl%>/<%=countryCode%>/<%=category.replace(" ", "-")%>/" />
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-123.jsp") ||
    		  StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-186.jsp")) { %>
      <!-- DASH MATS / DASH COVERS -->
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@FitMyCar" />
		<meta name="twitter:title" content="%%pageTitle%%" />
		<meta name="twitter:description" content="%%descriptionMetatag%%" />
		<meta name="twitter:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_dash-mats_<%=countryCode%>.jpg" />
		<meta property="og:title" content="%%pageTitle%%" />
		<meta property="og:description" content="%%descriptionMetatag%%" />
		<meta property="og:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_dash-mats_<%=countryCode%>.jpg" />
		<meta property="og:type" content="product.group" />
		<meta property="og:url" content="<%=siteUrl%>/<%=countryCode%>/<%=category.replace(" ", "-")%>/" />
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-320.jsp")) { %>
      <!-- FLOOR LINERS -->
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@FitMyCar" />
		<meta name="twitter:title" content="%%pageTitle%%" />
		<meta name="twitter:description" content="%%descriptionMetatag%%" />
		<meta name="twitter:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_floor-liners.jpg" />
		<meta property="og:title" content="%%pageTitle%%" />
		<meta property="og:description" content="%%descriptionMetatag%%" />
		<meta property="og:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_floor-liners.jpg" />
		<meta property="og:type" content="product.group" />
		<meta property="og:url" content="<%=siteUrl%>/<%=countryCode%>/floor-liners/" />
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-124.jsp") ||
    		  StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-185.jsp")) { %>
      <!-- BOOT LINERS / TRUNK LINERS -->
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@FitMyCar" />
		<meta name="twitter:title" content="%%pageTitle%%" />
		<meta name="twitter:description" content="%%descriptionMetatag%%" />
		<meta name="twitter:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_boot-liner.jpg" />
		<meta property="og:title" content="%%pageTitle%%" />
		<meta property="og:description" content="%%descriptionMetatag%%" />
		<meta property="og:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_boot-liner.jpg" />
		<meta property="og:type" content="product.group" />
		<meta property="og:url" content="<%=siteUrl%>/<%=countryCode%>/<%=category.replace(" ", "-")%>/" />
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-121.jsp") ||
    		  StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-188.jsp")) { %>
      <!-- UTE MATS -->
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@FitMyCar" />
		<meta name="twitter:title" content="%%pageTitle%%" />
		<meta name="twitter:description" content="%%descriptionMetatag%%" />
		<meta name="twitter:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_ute-mats.jpg" />
		<meta property="og:title" content="%%pageTitle%%" />
		<meta property="og:description" content="%%descriptionMetatag%%" />
		<meta property="og:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_ute-mats.jpg" />
		<meta property="og:type" content="product.group" />
		<meta property="og:url" content="<%=siteUrl%>/<%=countryCode%>/<%=category.replace(" ", "-")%>/" />
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-316.jsp")) { %>
      <!-- SEAT COVERS -->
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@FitMyCar" />
		<meta name="twitter:title" content="%%pageTitle%%" />
		<meta name="twitter:description" content="%%descriptionMetatag%%" />
		<meta name="twitter:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_seat-covers.jpg" />
		<meta property="og:title" content="%%pageTitle%%" />
		<meta property="og:description" content="%%descriptionMetatag%%" />
		<meta property="og:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_seat-covers.jpg" />
		<meta property="og:type" content="product.group" />
		<meta property="og:url" content="<%=siteUrl%>/<%=countryCode%>/<%=category.replace(" ", "-")%>/" />
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-126.jsp") ||
    		  StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-183.jsp")) { %>
      <!-- ACCESSORIES -->
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@FitMyCar" />
		<meta name="twitter:title" content="%%pageTitle%%" />
		<meta name="twitter:description" content="%%descriptionMetatag%%" />
		<meta name="twitter:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_accessories_<%=countryCode%>.jpg" />
		<meta property="og:title" content="%%pageTitle%%" />
		<meta property="og:description" content="%%descriptionMetatag%%" />
		<meta property="og:image" content="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/meta_accessories_<%=countryCode%>.jpg" />
		<meta property="og:type" content="product.group" />
		<meta property="og:url" content="<%=siteUrl%>/<%=countryCode%>/<%=category.replace(" ", "-")%>/" />
      <% } %>
      
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
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-321.jsp")) { %>
      <meta property="og:url"           content="https://www.fitmycar.com/au/competition" />
	  <meta property="og:type"          content="website" />
	  <meta property="og:title"         content="Win Aussie Made Floor Liners & More" />
	  <meta property="og:description"   content="Enter the draw to win a set of BEDROCK Floor Liners and other made-to-fit gear by FitMyCar. Hurry, draw closes soon." />
	  <meta property="og:image"         content="<image TBC>" />
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
      <link rel="preload" href="https://cloudmall-webassets.s3-ap-southeast-2.amazonaws.com/fitmycar/static-assets/css/global_css_v1.10.0.min.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
      <% } else { %>
      <link rel="stylesheet" href="https://cloudmall-webassets.s3-ap-southeast-2.amazonaws.com/fitmycar/static-assets/css/global_css_v1.10.0.min.css" media="screen">
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
      <!-- [ Cloudmall Essentials ENDD ] -->
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
      <link rel="icon" href="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/fitmycar_favicon.ico" type="image/x-icon">
      <link rel="shortcut icon" href="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/images/fitmycar_favicon.ico" type="image/x-icon">
      <!-- [ Favicon END ] -->
      <!-- [ Google Analytics ] -->
      <% if (!navpoint.getParent().getId().equals(WbdCache.getProperty("store.name") + "-176")) { %>
      <meta name="google-site-verification" content="VQnOwhh8_0ex8WQozJ14jOZvFK0tRlfVeMEECJ2hOtc" />
      <meta name="msvalidate.01" content="4017B989E703CFA096F76AF5F42A2293" />
      <% } %>
      <!-- [ Google Analytics END ] -->
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp") ||
        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")) { %>
      <script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/jquery-2.1.4.min.js.gz"></script>
      <% } %>
   </head>
   <body>
      %%topCode%%
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-73.jsp") || // gtm for search product List AU
          StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-280.jsp") || // gtm for search product List US
          StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-304.jsp") || // gtm for product details AU
          StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-179.jsp")) { // gtm for product details US %>
      <% if (WebUtils.isGtmIncludeDataLayer()) { %>
      <script>
        var dataLayer  = window.dataLayer || [];
        dataLayer.push({
        "ecommerce": <%=WebUtils.getGtmDataLayer() %>
      });
      </script>
      <% } %>
      <% } %>
      <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-89.jsp") || // gtm for payment success AU
          StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-273.jsp")) {// gtm for payment success US %>
      <% if (WebUtils.isGtmIncludeDataLayer()) { %>
      <script>
        var dataLayer  = window.dataLayer || [];
        dataLayer.push({
        "ecommerce": <%=WebUtils.getGtmPaymentSummaryDataLayer() %>
      });
      </script>
      <% } %>
      <% } %>
      <% if (gtm != null) { %>
      <!-- [ Exclude GTM for factory pages ] -->  
      <% if (!excludeGTM) { %>
      <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer',<%=gtm%>);
      </script>
      <% } %>
      
      <% if (pageName != "" && event != "") { %>
      <script>
      	var dataLayer  = window.dataLayer || [];
      	dataLayer.push({
    	  	'event': "<%=event%>",
    	  	'google_tag_params': {
            'ecomm_pagetype': "<%=pageName%>",
           	'ecomm_category': "<%=category%>"
          	}
      	});
      </script>
      <% } %>
    
    <% } %>
    <% if (StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-86.jsp") || // gtm for shopping cart AU
        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-276.jsp")) { // gtm for shopping cart US %>
      <% if (WebUtils.isGtmIncludeDataLayer()) { %>
      <script>
        var dataLayer  = window.dataLayer || [];
        dataLayer.push({
          "event": "EE_checkout",
          "ecommerce": <%=WebUtils.getGtmDataLayer() %>
      });
      </script>
      <% } %>
      <% } %>
      <style>.async-hide { opacity: 0 !important} </style>
		<script>
			(function(a,s,y,n,c,h,i,d,e){s.className+=' '+y;h.start=1*new Date;
			h.end=i=function(){s.className=s.className.replace(RegExp(' ?'+y),'')};
			(a[n]=a[n]||[]).hide=h;setTimeout(function(){i();h.end=null},c);h.timeout=c;
			})(window,document.documentElement,'async-hide','dataLayer',4000,
			{'GTM-TWDS64H':true});
		</script>
		<script>
  			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  			})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  			ga('create', '<%=uaCode%>', 'auto');
  			ga('require', 'GTM-TWDS64H');
	  </script>
      <% if (
    		StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-125.jsp") || // Car Mats Static - AU
	        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-300.jsp") || // Car Mats Dynamic - AU
	        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-184.jsp") || // Car Mats Static - US
	        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-301.jsp") || // Car Mats Dynamic - US
	        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-314.jsp") || // Dash Mats Dynamic - AU
	        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-315.jsp") || // Dash Mats Dynamic - US
	        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-317.jsp") || // Seat Covers Dynamic - AU
	        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-325.jsp") || // Seat Covers Dynamic - AU
	        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-318.jsp") || // Boot Liners Dynamic - AU
	        StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-330.jsp")) { // Car Covers Dynamic - AU %>
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