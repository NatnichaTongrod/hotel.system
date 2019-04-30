<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	String yearOption = "<option value=''>Year</option>";
	int startYear = 2015;
	for(int i=0;i<=20;i++)
	{
		String sel = "";
		yearOption+="<option value='"+(startYear+i)+"' "+sel+">"+(startYear+i)+"</option>";
	}
	
%>

<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Make Payment</h2>
        <form action="model/booking.jsp" method="post" id="Form">
          <div>
          <img src="images/pic_visa.jpg" style="width:300px;">
          </div>
		  <div class="half_width">
            <label for="email">Credit Card Number<span>*</span></label>
            <!--<input type="text" name="credit_number" id="credit_number" size="22" style="width:300px;" required onkeypress="return IsNumeric(event);"  maxlength="16">-->
            <input type="text" name="credit_number" id="credit_number" size="22" style="width:300px;" onkeypress="return valid_numbers(event);"  maxlength="16">
            <script>
              function valid_numbers(e)
              {
                      var key=e.which || e.KeyCode;
                      if  ( key >=48 && key <= 57)
                       // to check whether pressed key is number or not 
                              return true; 
                       else return false;
              }
              </script>
            <span id="error" style="color: Red; display: none">* Input digits (0 - 9)</span>
          </div>
          <div class="half_width">
            <label for="email">Name on Credit Card<span>*</span></label>
            <input type="text" name="name_credit_card" id="name_credit_card" size="22" style="width:300px;" onkeypress = "return valid_chars(event);" >
            <script>
              function valid_chars(e)
              {
                      var key=e.which || e.KeyCode;
                      if  ( key >=65 && key <= 90 || key >= 97 && key <= 122 || key == 32)
                       // to check whether pressed key is number or not 
                              return true; 
                       else return false;
              }
              </script>
          </div>
		  <div class="half_width">
            <label for="email">Credit Card Type<span>*</span></label>
            <select style="height: 40px; width:300px" name = "credit_card_type" required>
            	<option value="">Please Select</option>
            	<option>MasterCard</option>
            	<option>Visa Card</option>
            	<option>American Expresss</option>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Expiry Date<span>*</span></label>
            <select style="height: 40px; width:100px; float:left; margin-right:5px;">
                <option>Month</option>
                <option>January</option>
                <option>February</option>
                <option>March</option>
                <option>April</option>
                <option>May</option>
                <option>June</option>
                <option>July</option>
                <option>August</option>
                <option>September</option>
                <option>October</option>
                <option>November</option>
                <option>December</option>
            </select>
            <select style="height: 40px; width:100px; float:left;" name = "exp_year" required>
            	<% out.print(yearOption); %>
            </select>
          </div>
          <div style="clear:both"></div>
          <div>
            <label for="email">CVV No.<span>*</span></label>
            <input type="text" name="cvv" id="cvv" size="22" style="width:300px;" required maxlength="4" onkeypress="return valid_numbers(event);">
          </div>
          <div>
            <label for="email">Total Amount.<span>*(This section is for the booking only.)</span></label>
            <input type="text" name="total_amount" id="total_amount" size="22" style="width:300px;" readonly value="100">
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Make Payment">
            &nbsp;
            <input name="reset" type="reset" value="Cancel Payment">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="sal_id" />
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
<%@ include file="includes/footer.jsp" %>
