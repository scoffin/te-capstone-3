<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<section id="rankingsSection">

	<br>
	<h2 id="parkRankingsHeading">How Does Your Favorite Park Rank Amongst Other National Park
		Geeks'?</h2>
		<br>
		<br>
		
		<c:url var="trophy1Href" value="/img/trophy1.jpg" />
		<c:url var="trophy2Href" value="/img/trophy2.jpg" />
		<c:url var="trophy3Href" value="/img/trophy3.jpg" />
		<c:url var="podiumHref" value="/img/geek-podium.gif" />
		
		<div id="trophiesAndRankingParks">
		<div id="trophyDiv1" >
			<p id="rankingPark">${parkVotes[1].parkName}</p><br>
			<img class="trophy" id="trophy2" src="${trophy2Href}"/>
		</div>
		
		<div id="trophyDiv2" >
			<p id="rankingPark">${parkVotes[0].parkName}</p><br>
			<img class="trophy" id="trophy1" src="${trophy1Href}"/>
		</div>
		
		<div id="trophyDiv3" >
			<p id="rankingPark">${parkVotes[2].parkName}</p><br>
			<img class="trophy" id="trophy3" src="${trophy3Href}"/>
		</div>
		</div>
		
		<div id="podiumDiv" >
		<img id="podium" src="${podiumHref}"/>
		</div>
		

	<table id="parkRankings">

		<c:set value="0" var="counter" />
		
		<th>Vote Ranking</th>
		<th>Park Name</th>
		<th>Number of Votes</th>
		
		<c:forEach var="park" items="${parkVotes}">
			<c:set value="${counter + 1}" var="counter" />
			<c:set value="odd" var="row" />
			<c:if test="${counter % 2 == 0}">
				<c:set value="even" var="row" />
			</c:if>
			<tr class="${row}Row">
				<td>${counter}</td>
				<td>${park.parkName}</td>
				<td>${park.voteCount}</td>
			</tr>
		</c:forEach>

	</table>

</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />