<html>

	<head>
	</head>

	<body>

      	<hr>

    	</div>

		<!-- [ Should be called first and cannot be mixed into the unified Js file. ] -->
		<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/jquery-2.1.4.min.js.gz"></script>
		<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/jquery-ui.min.js.gz"></script>
		<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/jquery.blockUI.min.js.gz"></script>
		<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/d3.min.js.gz"></script>
		<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/dropzone.min.js.gz"></script>
		<!--exclude this for shopping cart and checkout pages -->		
		<%	if (!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-86.jsp") &&
				!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-276.jsp") && 
				!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-291.jsp") &&
				!org.apache.commons.lang3.StringUtils.contains(headerRequest.getRequestURL(), "fitmycar-webdesign-275.jsp")) { %>
		<script type="text/javascript" src="https://cdn.ywxi.net/js/1.js" async></script>
	    <% } %>
		<!-- [ Cloudmall Project ] -->
		<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/c201015.min.js.gz"></script>

		<!-- [ Bootstrap Project ] -->
		<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/bootstrap.min.js.gz"></script>
		<%-- These are from the "js/src" folder --%>
		<script src="https://d3v52uw9mwsoe.cloudfront.net/fitmycar/static-assets/js/c120416.min.js.gz"></script>

	<!-- 		<!-- [Justice, remove/comment out on production] -->
<!-- 		<script src="/ttsvr/bootstrap/js/src/justice.min.js"></script> -->
<!-- 		<script src="/ttsvr/bootstrap/js/src/justice.config.js"></script> -->

		<!-- Google Customer Review -->
		<script src="https://apis.google.com/js/platform.js" async defer></script>
		<script>
		  window.___gcfg = {
		    lang: 'en_AU'
		  };
		</script>

		%%bottomCode%%

	</body>

</html>
