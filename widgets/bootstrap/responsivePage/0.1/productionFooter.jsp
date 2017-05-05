<html>
	<head>
	</head>
	<body>
<!--START-->

<!-- SCRIPTS BASED ON HOST -->
	
	<script type="text/javascript">
	
	<% if ("true".equals(request.getSession(false).getAttribute("isStudylane"))) { %>

			/*Zopim Live Chat Script*/
			window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
			d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
			_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
			$.src="//v2.zopim.com/?3IARwigMUmpWmHZdJv29GqCgiFh3Hf2H";z.t=+new Date;$.
			type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
	
	<% } else { %>
	
		/*Google Analytics */
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
			ga('create', 'UA-56123383-1', 'auto');
			ga('send', 'pageview');
			
			/*Zopim Live Chat Script*/
			window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
			d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
			_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
			$.src="//v2.zopim.com/?3OWnOZVcMF3ZjG5cnItVbWqnxUv4S8bq";z.t=+new Date;$.
			type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
	
	<% } %>    
	</script>
    
	<!-- JAVASCRIPTS -->    
    
	<!--[if lte IE 9]>
	<script src="https://d2hpwmayxrmlo8.cloudfront.net/public/libraries/jquery/1.11.0/jquery-1.11.0.min.js"></script>
	<![endif]-->
	<!--[if gt IE 9]><!-->
		<script src="https://d2hpwmayxrmlo8.cloudfront.net/public/libraries/jquery/2.1.0/jquery-2.1.0.min.js"></script>
	<!--<![endif]-->
	
	<script src="https://d2hpwmayxrmlo8.cloudfront.net/public/libraries/bootstrap/js/bootstrap.min.js?v=3.0.0" type="text/javascript"></script>
	<script type="text/javascript">if (typeof console == "undefined" || typeof console.log == "undefined") var console = { log: function() {} };</script>
    
  %%bottomCode%%</body>
</html>
<!--END-->
