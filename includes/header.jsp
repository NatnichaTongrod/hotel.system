<html>
<head>
<title>Hotel Booking System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.validate.js"></script>
<style>
.ui-datepicker {
	font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
	font-size: 12px;
}
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
	float:left;
}
</style>
<script>
jQuery('document').ready(function() {
	jQuery("#Form").validate();
});
</script>
</head>
<body id="top">
<div class="wrapper row0">
  <div id="topbar" class="clear"> 
    <nav>
      <ul>
        <li>&nbsp;</li>
      </ul>
    </nav>
  </div>
</div>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <div id="logo" class="fl_left">
       <div style="float:left; margin-top:-11px;"><h1 style="font-size:27px;"><a href="index.jsp">Hotel Booking System</a></h1>
      <p style="color:#ffffff">THE CE HOTEL</p>
      </div>
      <!--<figure id="slide-1"><a class="view" href="#"><img src="images/demo/slider/logo.jpg" alt=""></a>
      </figure>-->
    </div>
  </header>
</div>
<div class="wrapper row2">
  <div class="rounded">
    <nav id="mainav" class="clear"> 
      <ul class="clear">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a href="about-us.jsp">About Us</a></li>
        
		<!-- Menu System for Customer Login Login -->
      <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("4")) { %>
        <li><a href="search.jsp">Book Room</a></li>	
        <li><a href="customer.jsp?customer_id=<%=session.getAttribute("customer_id")%>">My Account</a></li>
        <li><a href="report-booking.jsp">My Bookings</a></li>
      <% } %>
		<!-- End of the Super Admin Menu Section -->
		
		<% if(session.getAttribute("login_level") == null) { %>
			<li><a href="search.jsp">Search Room</a></li>
			<li><a href="customer.jsp?customer_id=0">Register</a></li>
			<li><a href="customer-login.jsp?title=Adminstrator ">User Login</a></li>
		<% } %>
        <li><a href="contact-us.jsp">Contact Us</a></li>
		<% if(session.getAttribute("login_level") != null) { %>
		<li><a href="model/customer.jsp?act=logout">Logout</a></li>
		<% } %>
      </ul>
    </nav>
  </div>
</div>
