	<%
	if (isHomePage) {
	%>
	    <!-- [ jQuery ] -->
		<!--[if lt IE 9]>
			<script src="<%=Cloudfront.getDNS() %>/freemium/script/jquery.1.11.1.min.js.gz"></script>
		<![endif]-->
		<!--[if gte IE 9]><!-->
	    	<script src="<%=Cloudfront.getDNS() %>/freemium/script/jquery-2.1.4.min.js.gz"></script>
		<!--<![endif]-->

		<script>$.ajaxSetup({ cache: false });</script>
	<%
	}
	%>

		<script src="<%=Cloudfront.getDNS() %>/freemium/script/bootstrap.min.v3.3.1.js.gz"></script> <!-- version used by Simple Machines -->
		<!-- [ myrp_t ] -->
		<script src="<%=Cloudfront.getDNS() %>/freemium/script/allfreemium.<%=Config.getValue("allFreemium.version")%>.min.js.gz"></script>
		<script type="text/javascript">
		function recordKissmetricsEvent (eventAction) {
			try {	_kmq.push(['record', eventAction]); } catch (e) {
				console.log(e);
			}
		}
		</script>

		%%bottomCode%%
		
		<script type="text/javascript">
		$(document).ready(function() { 
			setTimeout(function() { 
				try { _kmq.push(['identify', '<%=LoginUser.getData(request).getEmail() %>']); } catch (e) {
					console.log(e);
				} 
			}, 1000); 
		});
		
		$('[data-toggle="tooltip"]').on('shown.bs.tooltip', function () {
			var _this = this;
			$(_this).unbind('click').click(function() {
				$(_this).tooltip('hide');
			});
		});
		
		$('[data-toggle="tooltip"]').on('hidden.bs.tooltip', function () {
			var _this = this;
			$(_this).unbind('click').click(function() {
				$(_this).tooltip('show');
			});
		});
		
		dataLayer.push({
			'logged_in' : '<%=LoginUser.isLoggedIn(request)%>'
		});
		</script>
		 <%if (FreemiumErrorCatchUtil.isPageError(request)=="true"){ %>
		<script type="text/javascript">
		   jQuery('#errorModal').modal();
		</script>
		<%}%>

		<% if (showPVNotification) { %>
		<script>jQuery('#redirectNotification').modal();</script>
		<% } %>
		
		<% if (showUnregisterSubscriptionNotification) { %>
		<script>jQuery(document).ready(function() {jQuery('#emailSubscriptionNotification').modal();});</script>
		<% } %>
		
		<%
		if (FreemiumUtil.isJusticeMetricsShown(request)) {
		%>
			<script type="text/javascript" src="https://rawgit.com/okor/justice/master/build/justice.min.js"></script>
			<script type="text/javascript">
				Justice.init();
			</script>
		<%}	%>
</html><!-- This should be the end -->

<%
	session.removeAttribute("bsg3SuburbSalesPropetySearchSession");
	session.removeAttribute("bsg3ForSaleAdvertisementUrlSession");
	
	// for Jay
	session.removeAttribute("myrpErrorMessages");
	session.removeAttribute("freemiumErrorCatch");
	session.removeAttribute("freemiumPageCall");
%>