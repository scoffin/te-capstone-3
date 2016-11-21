<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<section>

	<c:url value="/surveyInput" var="formAction" />

	<h2>Welcome to the National Park Geek's Daily Survey!</h2>
	
	<form method="POST" action="${formAction}" id="surveyForm">
		
		<br>
		
		<table id="formTable">
			<tr>
				<td><label for="emailAddress">Email Address: </label></td>
				<td><input type="text" name="emailAddress" /><br></td>
			</tr>
			<tr>
				<td><label for="state">State of Residence:</label></td>
				<td><select name="state" id="state">
					<option value="AL">Alabama</option>
					<option value="AK">Alaska</option>
					<option value="AZ">Arizona</option>
					<option value="AR">Arkansas</option>
					<option value="CA">California</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DE">Delaware</option>
					<option value="DC">District Of Columbia</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="ID">Idaho</option>
					<option value="IL">Illinois</option>
					<option value="IN">Indiana</option>
					<option value="IA">Iowa</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="ME">Maine</option>
					<option value="MD">Maryland</option>
					<option value="MA">Massachusetts</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MS">Mississippi</option>
					<option value="MO">Missouri</option>
					<option value="MT">Montana</option>
					<option value="NE">Nebraska</option>
					<option value="NV">Nevada</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NY">New York</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VT">Vermont</option>
					<option value="VA">Virginia</option>
					<option value="WA">Washington</option>
					<option value="WV">West Virginia</option>
					<option value="WI">Wisconsin</option>
					<option value="WY">Wyoming</option>
				</select><br><td>
			</tr>
			
			<tr>
				<td><label for="activityLevel">Physical Activity Level: </label></td>
				<td><select id="activityLevel" name="activityLevel">
					<option value="inactive">Inactive</option>
					<option value="sedentary">Sedentary</option>
					<option value="active">Active</option>
					<option value="extremelyActive">Extremely Active</option>
					</select><br></td>
			</tr>
			
			<tr>
				<td><label for="parkCode">Please Select Your Favorite National Park: </label></td>
				<td>
					<select name="parkCode">
		    		<c:forEach var="park" items="${allParks}">
					<option value="${park.parkCode}"><c:out value="${park.parkName}" /></option>
					</c:forEach>
				</td>
			</tr>
			</select> 
			
			<br>
			</table>
			
			<input type="submit" name="submitSurvey" value="Sumbit Survey" /><br>
			
	</form>
	
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />