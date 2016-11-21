package com.techelevator.npgeek.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;

@Controller
public class HomePageController {

	private ParkDao parkDao;
	
	@Autowired
	public HomePageController(ParkDao parkDao) {
		this.parkDao = parkDao;
	}
	
	@RequestMapping("/")
	public String displayHomePage(ModelMap model) {
		List<Park> parkList = parkDao.getAllParks();
		model.addAttribute("parkList", parkList);
		return "homePage";
	}
	
	@RequestMapping("/parkDetail")
	public String displayParkDetailPage(@RequestParam String parkCode, ModelMap model) {
		Park park = parkDao.getParkByParkCode(parkCode);
		model.addAttribute("park", park);
		return "parkDetail";
	}
}
