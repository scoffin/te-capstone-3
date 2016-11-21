package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcSurveyResultDao implements SurveyResultDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcSurveyResultDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void saveSurveyResult(SurveyResult surveyResult) {
		Long id = getNextId();
		String sqlInsertSurveyResult = "INSERT INTO survey_result(surveyid, parkcode, emailaddress, state, activitylevel) " +
										"VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertSurveyResult, id, surveyResult.getParkCode(), surveyResult.getEmailAddress(), surveyResult.getState(), surveyResult.getActivityLevel());
		surveyResult.setSurveyId(id);
	}

	@Override
	public List<Park> getParkVoteNumber() {
		List<Park> parkVotes = new ArrayList<Park>();
		String sqlSelectParkVote = "SELECT park.*, COUNT(survey_result.parkcode)"
									+ " FROM survey_result"
									+ " FULL JOIN park ON park.parkcode = survey_result.parkcode"
									+ " GROUP BY park.parkcode"
									+ " ORDER BY count DESC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectParkVote);
		while(results.next()) {
			Park park = createPark(results);
			park.setVoteCount(results.getInt("count"));
			parkVotes.add(park);
		}

		return parkVotes;
	}
	
	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_surveyId')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if(results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
		}
		return id;
	}

	private SurveyResult createSurveyResult(SqlRowSet results) {
		SurveyResult surveyResult = new SurveyResult();
		surveyResult.setSurveyId(results.getLong("surveyid"));
		surveyResult.setParkCode(results.getString("parkcode"));
		surveyResult.setEmailAddress(results.getString("emailaddress"));
		surveyResult.setState(results.getString("state"));
		surveyResult.setActivityLevel(results.getString("activityLevel"));
		return surveyResult;
	}
	
	private Park createPark(SqlRowSet results) {
		Park park = new Park();
		park.setParkCode(results.getString("parkcode"));
		park.setParkName(results.getString("parkname"));
		park.setState(results.getString("state"));
		park.setAcreage(results.getInt("acreage"));
		park.setElevationInFeet(results.getInt("elevationinfeet"));
		park.setMilesOfTrail(results.getDouble("milesoftrail"));
		park.setNumberOfCampsites(results.getInt("numberofcampsites"));
		park.setClimate(results.getString("climate"));
		park.setYearFounded(results.getInt("yearfounded"));
		park.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
		park.setInspirationalQuote(results.getString("inspirationalquote"));
		park.setInspirationalQuoteSource(results.getString("inspirationalquotesource"));
		park.setParkDescription(results.getString("parkdescription"));
		park.setEntryFee(results.getInt("entryfee"));
		park.setNumberOfAnimalSpecies(results.getInt("numberofanimalspecies"));
		return park;
	}

}
