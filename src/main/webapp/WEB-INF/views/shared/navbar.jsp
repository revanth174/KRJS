<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">KRJS</a>
    </div>
   <ul class="nav navbar-nav">
      
      
      <li><a  class="btn" href="${contextRoot }/form">Application form</a></li>
      <li><a class="btn" href="${contextRoot }/ward/">ward</a></li>
       
       
        <li><a class="btn" href="${contextRoot }/show/all/members">view Members</a></li>
        <li><a class="btn" href="${contextRoot }/show/pending/all/members">Pending members</a></li>
        <li><a class="btn" href="${contextRoot }/report/">Report Generation</a></li>
        <li><a class="btn" href="${contextRoot }/show/deleted/all/members">Deleted Members</a></li>
        <li><a class="btn" href="${contextRoot }/update">update</a></li>
        <li><a class="btn" href="${contextRoot }/committeeMembers">CommitteMember</a></li>
		
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <c:if test="${pageContext.request.userPrincipal.name==null }">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      </c:if>
       <c:if test="${pageContext.request.userPrincipal.name!=null }">
       			<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> welcome  ${pageContext.request.userPrincipal.name} </a></li>
       			 <li><a href="<c:url value="/logout"></c:url>"><span class="glyphicon glyphicon-user"></span> logout</a></li>
       </c:if>
       <c:if test="${pageContext.request.userPrincipal.name==null }">
       			<li><a href="<c:url value="/login"></c:url>" ><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       </c:if>
      
      
    </ul>
  </div>
</nav>