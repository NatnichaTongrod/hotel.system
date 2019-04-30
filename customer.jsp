<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Customer customerDetails = new Customer();
	int customer_id = Integer.parseInt(request.getParameter ("customer_id"));
	HashMap Values =  customerDetails.getCustomerDetails(customer_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <% if(request.getParameter("msg") != null) { %>
	<div class="msg"><%=request.getParameter("msg") %></div>
	<% } %>
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Registration Form</h2>
		<h4>Personal Details</h4>
		<form name="Personal" method="post" action="model/customer.jsp" onsubmit="return checkmatch_password();">
          <div class="half_width">
            <label for="email">Name<span>*(Only upper or lower letter)</span></label>
            <input type="text" name="customer_name" id="customer_name" onkeypress="return valid_chars(event);" value="<% out.print(Values.get("customer_name")); %>" size="22" style="width:300px;" required>
            <script>
              function valid_numbers(e)
              {
                      var key=e.which || e.KeyCode;
                      if  ( key >=48 && key <= 57)
                       // to check whether pressed key is number or not 
                              return true; 
                       else return false;
              }
              function valid_chars(e)
              {
                        var key=e.which || e.KeyCode;
                        if  ( (key >=65 && key <= 90) || (key >= 97 && key <= 122) || key ==32)
                         // to check whether pressed key is number or not 
                                return true; 
                         else return false;
              }
              function valid_chars_nospace(e)
              {
                        var key=e.which || e.KeyCode;
                        if  ( (key >=65 && key <= 90) || (key >= 97 && key <= 122))
                         // to check whether pressed key is number or not 
                                return true; 
                         else return false;
              }  
              </script>
          </div>
          <div class="half_width">
            <label for="email">Mobile<span>*(Only numbers)</span></label>
            <input type="text" name="customer_mobile" id="customer_mobile" maxlength="10" onkeypress="return valid_numbers(event);" value="<% out.print(Values.get("customer_mobile")); %>" size="22" style="width:300px;" required>
          </div>
          <div id="password_row">
			  <div class="half_width">
				<label for="email">Password<span>*</span></label>
				<input type="password" name="customer_password" id="customer_password" value="" size="22" style="width:300px;" required>
			  </div>
			  <div class="half_width">
				<label for="email">Confirm Password<span>*</span></label>
				<input type="password" name="customer_confirm_password" id="customer_confirm_password" value="" size="22" style="width:300px;" required>
        </div>
        <script>
        function checkmatch_password()
        {
          if(document.Personal.customer_password.value != document.Personal.customer_confirm_password.value)
          {
            alert('Confirm password not match');
            document.Personal.customer_confirm_password.focus();
            return false;
          }
        }
        </script>
		  </div>
          <div class="half_width">
            <label for="email">Email<span>*</span></label>
            <input type="text" name="customer_email" id="customer_email" onkeypress="return check_email(event);" value="<% out.print(Values.get("customer_email")); %>" size="22" style="width:300px;" required>
            <script>
            var count=0;
            function check_email(e)
            {
              var key=e.which || e.KeyCode;
              if  ( (key >=65 && key <= 90) || (key >= 97 && key <= 122) || (key >= 48 && key <= 57) || key == 45 || key == 46 || key == 95 || key == 64)
              {
                if (key == 64 && count == 0)  
                  {
                    count = 1;
                    return true;
                  }
                if (key != 64)
                  return true; 
              }
              else return false;
            }
            </script>
          </div>
          <div style="clear:both"></div>
          <h4>Address Details</h4>
          <div class="half_width">
            <label for="email">Address<span>*</span></label>
            <textarea style="width:300px; height:100px;" name="customer_address" required><% out.print(Values.get("customer_address")); %></textarea>
          </div>
          
          <div class="half_width">
            <label for="email">District<span>*</span></label>
            <input type="text" name="customer_city" id="customer_city" onkeypress="return valid_chars_nospace(event);" value="<% out.print(Values.get("customer_city")); %>" size="22" style="width:300px;" required>
          </div>
          
          <div class="one_third">
            <label for="url">City</label>
            <select style="height: 40px; width:200px" name="customer_state" required>
				<% out.print(customerDetails.getStateOption((Integer) Values.get("customer_state"))); %>
            </select>
          </div>

          

          <div class="half_width">
            <label for="email">Pincode<span>*(Only numbers)</span></label>
            <input type="text" name="customer_pincode" id="customer_pincode" onkeypress="return valid_numbers(event);" maxlength="5" value="<% out.print(Values.get("customer_pincode")); %>" size="22" style="width:300px;" required >
            <script>
              function valid_numbers(e)
              {
                      var key=e.which || e.KeyCode;
                      if  ( key >=48 && key <= 57 ) 
                       // to check whether pressed key is number or not 
                              return true; 
                       else return false;
              }
              </script>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Customer">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("customer_image")); %>" />
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" id="customer_id" name="customer_id" value="<% out.print(Values.get("customer_id")); %>"/>
        </form>
        </div>
        <div style="float: left">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
 <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
	<script>
     jQuery('#password_row').hide();
     
  </script>
  
<% } %>

  
<%@ include file="includes/footer.jsp" %>
