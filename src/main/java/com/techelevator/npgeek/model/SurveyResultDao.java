package com.techelevator.npgeek.model;

import java.util.List;

public interface SurveyResultDao {

	public void saveSurveyResult(SurveyResult surveyResult);
	public List<Park> getParkVoteNumber();
	
}
