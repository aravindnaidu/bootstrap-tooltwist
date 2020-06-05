
	<div class="modal fade" id="accept_cookies_modal" data-backdrop="" tabindex="-1" role="dialog" aria-labelledby="acceptCookies" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<p class="text-justify">Our website uses cookies to improve our website and your online experience, to tailor content and
					adverts, and to analyse visitor use of this site. We may share cookie information with third parties
					for the purposes of advertising. By clicking "Accept", you consent to cookies being used. You can
					opt-out at any time by adjusting your browser settings. 
					See our <a target="_blank" href="https://www.corelogic.com.au/about-us/privacy-policy">Privacy Policy</a> 
					to find out more.</p>
					<button 
            id="acceptCookieButton"
            data-dismiss="modal" 
            type="button" 
            style="color:#fff;border:0;margin:0;" 
            class="btn orange-btn" 
            onclick="setCookie('cookies_accepted',true,1000)">
              Accept
          </button>
				</div>
			</div>
		</div>
	</div>
	<%
	if (isHomePage) {
	%>
	    <!-- [ jQuery ] -->
		<!--[if lt IE 9]>
			<script src="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/freemium/script/jquery.1.11.1.min.js.gz"></script>
		<![endif]-->
		<!--[if gte IE 9]><!-->
	    	<script src="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/freemium/script/jquery-2.1.4.min.js.gz"></script>
		<!--<![endif]-->

		<script>$.ajaxSetup({ cache: false });</script>
	<%
	}
	%>

		<script src="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/freemium/script/bootstrap.min.v3.3.1.js.gz"></script> <!-- version used by Simple Machines -->
		<!-- [ myrp_t ] -->
		<script src="<%=ESAPI.encoder().encodeForHTML(Cloudfront.getDNS()) %>/freemium/script/allfreemium.<%=ESAPI.encoder().encodeForHTML(Config.getValue("allFreemium.version"))%>.min.js.gz"></script>
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
				try { _kmq.push(['identify', '<%=Encode.forJavaScriptAttribute(LoginUser.getData(request).getEmail()) %>']); } catch (e) {
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
			'logged_in' : '<%=LoginUser.isLoggedIn(request)%>',
			'paying_subscriber': '<%=LoginUser.isPremiumUser(request)%>'
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
		
		<script>
			jQuery(document).ready(function() { 
				var serverUrl = '<%=Encode.forJavaScriptBlock(Config.getValue("freemium.server.url"))%>';
				var locationOrigin = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port: '');
				if(!getCookie('cookies_accepted') && serverUrl === locationOrigin){
					jQuery('#accept_cookies_modal').modal();
				};
			});
		</script>
</html><!-- This should be the end -->

<%
	session.removeAttribute("bsg3SuburbSalesPropetySearchSession");
	session.removeAttribute("bsg3ForSaleAdvertisementUrlSession");
	
	// for Jay
	session.removeAttribute("myrpErrorMessages");
	session.removeAttribute("freemiumErrorCatch");
	session.removeAttribute("freemiumPageCall");
%>