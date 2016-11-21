package com.techelevator.npgeek.controllers;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDao;

@Controller
@SessionAttributes("celsius")
public class WeatherController {
	
	private WeatherDao weatherDao;
	private ParkDao parkDao;
	private boolean celsius;
	
	@Autowired
	public WeatherController(WeatherDao weatherDao, ParkDao parkDao) {
		this.weatherDao = weatherDao;
		this.parkDao = parkDao;
	}

	@RequestMapping(path="/fiveDayForecast", method=RequestMethod.GET) 
	public String displayFiveDayForecast(@RequestParam String parkCode, @RequestParam int dayIndex, ModelMap model) {
		List<Weather> fiveDayForecast = weatherDao.getParkWeather(parkCode);
		model.addAttribute("fiveDayForecast", fiveDayForecast);
		
		Park park = parkDao.getParkByParkCode(parkCode);
		model.addAttribute("park", park);
		
		model.addAttribute("daysOfWeek", getDaysOfWeek());
		model.addAttribute("dayIndex", dayIndex);
		model.addAttribute("celsius", celsius);
		return "fiveDayForecast";
	}
	
	@RequestMapping(path="/temperature", method=RequestMethod.GET) 
	public String setFahrenheitCelsius(@RequestParam String parkCode, @RequestParam int dayIndex, @RequestParam String tempUnit, ModelMap model) {
		model.addAttribute("parkCode", parkCode);
		model.addAttribute("daysOfWeek", getDaysOfWeek());
		model.addAttribute("dayIndex", dayIndex);
		
		
		if(tempUnit.equals("Fahrenheit")) {
			celsius = false;
		} else {
			celsius = true;
		}
		model.addAttribute("celsius", celsius);
		return "redirect:/fiveDayForecast";
	}
	
	private List<String> getDaysOfWeek() {
		List<String> daysOfWeek = new ArrayList<String>();
		LocalDate localDate = LocalDate.now();
		DayOfWeek dayOfWeek = localDate.getDayOfWeek();
		for(int i = 0; i < 5; i++) {
			daysOfWeek.add(dayOfWeek.getDisplayName(TextStyle.FULL, Locale.getDefault()));
			dayOfWeek = dayOfWeek.plus(1l);
		}
		return daysOfWeek;
	}
	
	
	
}