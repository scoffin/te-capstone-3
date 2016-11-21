<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<section>

	<h2>Five Day Forecast for ${park.parkName}</h2>
	
	<br>
	
	<c:url value="/temperature" var="fiveDayHref"/>
	<form action="${fiveDayHref}" method="GET">
		
		<input type="hidden" name="dayIndex" value ="${dayIndex}" />
		<input type="hidden" name="parkCode" value ="${park.parkCode}" />
		<label for="tempUnit">Temperature Unit</label>
		<br>
		<span id="temperatureToggle">
			<input id="fahrenheitSubmit" type="submit" name="tempUnit" value="Fahrenheit"/>
			<input id="celsiusSubmit" type="submit" name="tempUnit" value="Celsius"/>
		</span>
		
	</form>
	
	
	<br>
	

	<c:url value="/fiveDayForcast" var="fiveDayForecastHref">
		<c:param name="parkCode" value="${park.parkCode}"></c:param>
	</c:url>

	<table id="fiveDayForcastTable">
		<th>Today</th>
		<th>${daysOfWeek[1]}</th>
		<th>${daysOfWeek[2]}</th>
		<th>${daysOfWeek[3]}</th>
		<th>${daysOfWeek[4]}</th>
		<tr>
			<c:forEach var="dailyForecast" items="${fiveDayForecast}">
				<c:url var="fiveDayForecastHref" value="/fiveDayForecast">
					<c:param name="parkCode" value="${park.parkCode}" />
					<c:param name="dayIndex" value="${dailyForecast.dayInt - 1}" />
				</c:url>
				<c:url var="weatherSrc" value="/img/weather/${fn:replace(dailyForecast.forecast,' ', '')}.png" />
				<td><a href="${fiveDayForecastHref}"><img class="weatherImgForDay" src="${weatherSrc}" alt="Weather Image" /></a></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="dailyForecast" items="${fiveDayForecast}">
				<td>
					<c:choose>
						<c:when test="${celsius==true}">
							<fmt:parseNumber var="highInt" integerOnly="true" value="${((dailyForecast.highTemp-32)/1.8)}" />
							<fmt:parseNumber var="lowInt" integerOnly="true" value="${(dailyForecast.lowTemp-32)/1.8}" />
							<p id="temperatureP">
								<span id="highTemp"><c:out value="${highInt}" /></span> |
								<span id="lowTemp"><c:out value="${lowInt}" /></span>
							</p>
						</c:when>
						<c:otherwise>
							<p id="temperatureP">
								<span id="highTemp"><c:out value="${dailyForecast.highTemp}" /></span> |
								<span id="lowTemp"><c:out value="${dailyForecast.lowTemp}" /></span>
							</p>
						</c:otherwise>
					</c:choose>
					
				</td>
			</c:forEach>
		</tr>
	</table>
	



	
	
	
	<br>






	<div id="dailyWeatherDetailsContainer">
		<p id="dayOfWeekDetail">${daysOfWeek[dayIndex]}</p><br>
		<c:choose>
			<c:when test="${celsius==true}">
				<fmt:parseNumber var="highInt" integerOnly="true" value="${(fiveDayForecast[dayIndex].highTemp-32)/1.8}" />
				<fmt:parseNumber var="lowInt" integerOnly="true" value="${(fiveDayForecast[dayIndex].lowTemp-32)/1.8}" />
				<p id="tempDetail">
					<b>daily high:</b>
					<span id="highTemp"> <c:out value="${highInt}" /></span> <span id="highDegree">°C </span> |
					<b>daily low:</b>
					<span id="lowTemp"><c:out value="${lowInt}" /></span> <span id="lowDegree"> °C</span>
				</p>
			</c:when>	
			<c:otherwise>
				<p id="tempDetail">
					<b>daily high:</b>
					<span id="highTemp"><c:out value="${fiveDayForecast[dayIndex].highTemp}" /></span> <span id="highDegree">°F </span> |
					<b>daily low:</b>
					<span id="lowTemp"><c:out value="${fiveDayForecast[dayIndex].lowTemp}" /></span> <span id="lowDegree"> °F</span>
				</p>
			</c:otherwise>
		</c:choose><br>


		<c:url var="weatherSrc" value="/img/weather/${fn:replace(fiveDayForecast[dayIndex].forecast,' ', '')}.png" />
		<p id="forecastDetail">${fiveDayForecast[dayIndex].forecast}<img id="imgDetail" src="${weatherSrc}"/></p><br>



		<c:if test="${fiveDayForecast[dayIndex].forecast == 'sunny'}">
			<c:url var="weatherGeekSrc" value="/img/weather/npgeek-verysunny.gif" />
			<img id="weatherImgDetail" src="${weatherGeekSrc}" />
			<p id="speechForecastText">Be sure to pack some sunblock and a pair of shades!</p>
		</c:if>

		<c:if test="${fiveDayForecast[dayIndex].forecast == 'partly cloudy'}">
			<c:url var="weatherGeekSrc" value="/img/weather/npgeek-sunny.gif" />
			<img id="weatherImgDetail" src="${weatherGeekSrc}" />
			<p id="speechForecastText">It's partly cloudy... I don't have much to say about that.</p>
		</c:if>

		<c:if test="${fiveDayForecast[dayIndex].forecast == 'cloudy'}">
			<c:url var="weatherGeekSrc" value="/img/weather/npgeek-sunny.gif" />
			<img id="weatherImgDetail" src="${weatherGeekSrc}" />
			<p id="speechForecastText">It's cloudy now, but still a good day to hike.</p>
		</c:if>

		<c:if test="${fiveDayForecast[dayIndex].forecast == 'snow'}">
			<c:url var="weatherGeekSrc" value="/img/weather/npgeek-snowy.gif" />
			<img id="weatherImgDetail" src="${weatherGeekSrc}" />
			<p id="speechForecastText">BURRR! Be sure to pack your snowshoes!</p>
		</c:if>

		<c:if test="${fiveDayForecast[dayIndex].forecast == 'rain'}">
			<c:url var="weatherGeekSrc" value="/img/weather/npgeek-rainy.gif" />
			<img id="weatherImgDetail" src="${weatherGeekSrc}" />
			<p id="speechForecastText">Pack your rain gear and wear waterproof shoes to avoid getting drenched!</p>
		</c:if>

		<c:if test="${fiveDayForecast[dayIndex].forecast == 'thunderstorms'}">
			<c:url var="weatherGeekSrc" value="/img/weather/npgeek-pjs.png" />
			<img id="weatherImgDetail" src="${weatherGeekSrc}" />
			<p id="speechForecastText">It's a good day to stay comfy inside. If you are out, seek shelter and avoid hiking on exposed ridges!</p>
		</c:if>



		<c:if test="${fiveDayForecast[dayIndex].highTemp > 75}">
			<p id="speechTempText">Also, WOW, it's a HOT one! Bring an extra gallon of water to stay hydrated!</p>
			<c:url var="weatherGeekSrc" value="/img/weather/npgeek-waterbottle.gif" />
			<img id="specialHotDay" src="${weatherGeekSrc}" />
		</c:if>

		<c:if test="${fiveDayForecast[dayIndex].lowTemp < 20}">
			<p id="speechTempText">Also, be sure to dress warm, and remember the dangers of exposure to frigid temperatures!</p>
			<c:url var="weatherGeekSrc" value="/img/weather/npgeek-snowman.png" />
			<img id="specialColdDay" src="${weatherGeekSrc}" />
		</c:if>

		<c:if test="${(fiveDayForecast[dayIndex].highTemp - fiveDayForecast[dayIndex].lowTemp) > 20}">
			<p id="speechTempText">Also, temperatures are likely to flux throughout the day. Make sure to wear breathable layers!</p>
		</c:if>
	</div>
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />