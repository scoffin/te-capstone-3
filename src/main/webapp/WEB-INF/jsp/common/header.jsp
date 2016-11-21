<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
	    <title>National Park Geek</title>
	    <c:url value="/css/npgeek.css" var="cssHref" />
	    <link rel="stylesheet" href="${cssHref}">
	    <link href="https://fonts.googleapis.com/css?family=Merriweather|Oswald|PT+Sans+Narrow|Roboto|Lobster|Dosis|Loved+by+the+King" rel="stylesheet">
	</head>
	
	<body>
		<header>
			<c:url value="/img/logo.png" var="logoSrc" />
			<c:url value="/img/npgeek-banner-4.jpg" var="altLogoSrc" />
			<c:url value="/" var="homePageHref" />
			<a href="${homePageHref}" >
				<img id="headerImg" alt="National Park Geek Logo" src="${altLogoSrc}"/>
			</a>
			
			<c:url value="/surveyInput" var="surveyHref" />
			<p id="surveyRibbon">
				<a href="${surveyHref}" id="surveyLink">Complete our Daily Survey!</a>
			</p>
		</header>