package com.techelevator.npgeek.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.SurveyResult;
import com.techelevator.npgeek.model.SurveyResultDao;

@Controller
public class SurveyResultController {

	private SurveyResultDao surveyResultDao;
	private ParkDao parkDao;

	@Autowired
	public SurveyResultController(SurveyResultDao surveyResultDao, ParkDao parkDao) {
		this.surveyResultDao = surveyResultDao;
		this.parkDao = parkDao;
	}

	@RequestMapping(path="/surveyInput", method=RequestMethod.GET)
	public String displaySurveyInputPage(ModelMap model) {
		List<Park> allParks = parkDao.getAllParks();
		model.addAttribute("allParks", allParks);
		return "surveyInput";
	}

	@RequestMapping(path="/surveyInput", method=RequestMethod.POST)
	public String submitSurveyResult(SurveyResult surveyResult) {
		surveyResultDao.saveSurveyResult(surveyResult);
		return "redirect:/surveyResult";
	}
	
	@RequestMapping(path="/surveyResult", method=RequestMethod.GET)
	public String displaySurveyResultsPage(ModelMap model) {
		List<Park> parkVotes = surveyResultDao.getParkVoteNumber();
		model.addAttribute("parkVotes", parkVotes);
		return "surveyResult";
	}
}
