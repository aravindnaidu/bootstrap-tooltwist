<html>

	<head>
	</head>

	<body>

      	<hr>

    	</div>

		<!-- [ Should be called first and cannot be mixed into the unified Js file. ] -->
		<script src="/ttsvr/cloudmall/js/jquery-2.1.4.min.js"></script>
		<script src="/ttsvr/cloudmall/js/jquery-ui.js"></script>
		<script src="/ttsvr/cloudmall/js/jquery.blockUI.js"></script>
		<script src="/ttsvr/cloudmall/js/d3.min.js"></script>
		<script src="/ttsvr/cloudmall/js/dropzone.js"></script>

		<!-- [ Cloudmall Project ] -->
		<script src="/ttsvr/cloudmall/js/build/c201015.js"></script>

		<!-- [ Bootstrap Project ] -->
		<script src="/ttsvr/bootstrap/dist/js/bootstrap.min.js"></script>
		<%-- These are from the "js/src" folder --%>
		<script src="/ttsvr/bootstrap/js/build/c120416.js"></script>

	<!-- 		<!-- [Justice, remove/comment out on production] -->
<!-- 		<script src="/ttsvr/bootstrap/js/src/justice.min.js"></script> -->
<!-- 		<script src="/ttsvr/bootstrap/js/src/justice.config.js"></script> -->

		<!-- Google Customer Review -->
		<script src="https://apis.google.com/js/platform.js" async defer></script>
		
		<script>
		  window.renderBadge = function() {
		    var ratingBadgeContainer = document.createElement("div");
		      document.body.appendChild(ratingBadgeContainer);
		      window.gapi.load('ratingbadge', function() {
		        window.gapi.ratingbadge.render(
		          ratingBadgeContainer, {
		            // REQUIRED
		            "merchant_id": 113000332
		          });           
		     });
		  }
		</script>

		<script>
		  window.___gcfg = {
		    lang: 'en_AU'
		  };
		</script>

		%%bottomCode%%

	</body>

</html>
