package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcWeatherDao implements WeatherDao {
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcWeatherDao(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Weather> getParkWeather(String parkCode) {
		List<Weather> fiveDayForecast = new ArrayList<Weather>();
		String sqlSelectAllWeather = "SELECT *"
						+ " FROM weather"
						+ " WHERE parkcode = ?"
						+ " ORDER BY fivedayforecastvalue ASC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllWeather, parkCode);
		while(results.next()) {
			Weather weather = new Weather();
			weather.setParkCode(results.getString("parkcode"));
			weather.setDayInt(results.getInt("fivedayforecastvalue"));
			weather.setLowTemp(results.getInt("low"));
			weather.setHighTemp(results.getInt("high"));
			weather.setForecast(results.getString("forecast"));
			fiveDayForecast.add(weather);
		}
		return fiveDayForecast;
	}

}
