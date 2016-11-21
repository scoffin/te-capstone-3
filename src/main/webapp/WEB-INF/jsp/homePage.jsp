<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<section id="homePageSection">

	<c:forEach items="${parkList}" var="park" >
		<c:url value="/parkDetail" var="parkDetailHref">
				<c:param name="parkCode" value="${park.parkCode}" />
		</c:url>
		
		<div class="parkContainer">
		
			<div id="parkTop">
				<a class="parkName" href="${parkDetailHref}">${park.parkName}</a>
				<p class="parkState">-${park.state}-</p>
			</div>
		
			<a href="${parkDetailHref}">
				<c:url value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg" var="parkImgSrc" />
				<img class="parkImg" src="${parkImgSrc}" alt="${park.parkName} Image" />
			</a>
		
			<div id="parkBottom">
				<p class="parkDescription">${park.parkDescription}</p>
			</div>
		</div>
	</c:forEach>
	
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />