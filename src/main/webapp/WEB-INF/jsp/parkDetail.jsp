<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<section id="parkDetailSection">

	<div id="parkHeader">
		<c:url value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg" var="parkImgSrc" />
		<img id="parkDetailImg" src="${parkImgSrc}" alt="${park.parkName} Image" />
		
		<table id="titleTable">
			<tr><td id="parkName">${park.parkName}</td></tr>
			<tr><td id="inspirationalQuote">" ${park.inspirationalQuote} "</td></tr>
			<tr><td id="inspirationalQuoteSource">${park.inspirationalQuoteSource}</td></tr>
			<tr><td id="parkDescription">${park.parkDescription}</td></tr>
		</table>
	</div>
	
	<p id="parkDetails">Park Details</p>
	
	<table id="leftTable">
		<tr class="oddRow">
			<td class="parkDetailKey">State</td>
			<td class="parkDetailValue">${park.state}</td>
		</tr>
		<tr class="evenRow">
			<td class="parkDetailKey">Established</td>
			<td class="parkDetailValue">${park.yearFounded}</td>
		</tr>
		<tr class="oddRow">
			<td class="parkDetailKey">Climate</td>
			<td class="parkDetailValue">${park.climate}</td>
		</tr>
		<tr class="evenRow">
			<td class="parkDetailKey">Acreage</td>
			<td class="parkDetailValue">${park.acreage}</td>
		</tr>
		<tr class="oddRow">
			<td class="parkDetailKey">Trail</td>
			<td class="parkDetailValue">${park.milesOfTrail} miles</td>
		</tr>
	</table>
	
	<table id="rightTable">
		<tr class="oddRow">
			<td class="parkDetailKey">Elevation</td>
			<td class="parkDetailValue">${park.elevationInFeet} ft</td>
		</tr>
		<tr class="evenRow">
			<td class="parkDetailKey">Native Species</td>
			<td class="parkDetailValue">${park.numberOfAnimalSpecies}</td>
		</tr>
		<tr class="oddRow">
			<td class="parkDetailKey">Entry Fee</td>
			<td class="parkDetailValue">$${park.entryFee}</td>
		</tr>
		<tr class="evenRow">
			<td class="parkDetailKey">Annual Visitors</td>
			<td class="parkDetailValue">${park.annualVisitorCount}</td>
		</tr>
		<tr class="oddRow">
			<td class="parkDetailKey">Campsites</td>
			<td class="parkDetailValue">${park.numberOfCampsites}</td>
		</tr>
	
	</table>
	
	<c:url var="forecastHref" value="/fiveDayForecast" >
		<c:param name="parkCode" value="${park.parkCode}" />
		<c:param name="dayIndex" value="0" />
	</c:url>
	
	<a id="fiveDayForecastButton" href="${forecastHref}">See 5 Day Forecast</a>
	
	
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />