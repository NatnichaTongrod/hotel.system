<div class="wrapper" style="margin-top:-18px">
  <div id="slider">
    <div id="slide-wrapper" class="rounded clear"> 
      <!-- ################################################################################################ 
      <figure id="slide-1"><a class="view" href="#"><img src="images/demo/slider/6.png" alt=""></a>
      </figure>-->
      <div class="w3-content w3-section" >
        <img class="mySlides w3-animate-fading" src="images/demo/slider/1.jpg" >
        <img class="mySlides w3-animate-fading" src="images/demo/slider/5.jpg" >
        <img class="mySlides w3-animate-fading" src="images/demo/slider/06.png" >
      </div>
      <script>
        var myIndex = 0;
        carousel();
        
        function carousel() {
          var i;
          var x = document.getElementsByClassName("mySlides");
          for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";  
          }
          myIndex++;
          if (myIndex > x.length) {myIndex = 1}    
          x[myIndex-1].style.display = "block";  
          setTimeout(carousel, 2000); // Change image every 3 seconds
        }
        </script>
    </div>
  </div>
</div>
