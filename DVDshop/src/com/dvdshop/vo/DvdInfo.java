package com.dvdshop.vo;

import java.util.Date;

public class DvdInfo {
	
	private String dvd_num;
	private String dvd_title;
	private String dvd_director;
	private String dvd_actor;
	private Date dvd_year;
	private String dvd_country;
	private String dvd_grade;
	private String dvd_story;
	private String dvd_genre;
	private int dvd_stock;
	private String dvd_photo;
	
	
	
	
	
	public DvdInfo() {
		
	}
	
	
	public DvdInfo(String dvd_num, String dvd_title, String dvd_director, String dvd_actor, Date dvd_year,
			String dvd_country, String dvd_grade, String dvd_story, String dvd_genre, int dvd_stock, String dvd_photo) {
		super();
		this.dvd_num = dvd_num;
		this.dvd_title = dvd_title;
		this.dvd_director = dvd_director;
		this.dvd_actor = dvd_actor;
		this.dvd_year = dvd_year;
		this.dvd_country = dvd_country;
		this.dvd_grade = dvd_grade;
		this.dvd_story = dvd_story;
		this.dvd_genre = dvd_genre;
		this.dvd_stock = dvd_stock;
		this.dvd_photo = dvd_photo;
	}
	@Override
	public String toString() {
		return "DvdInfo [dvd_num=" + dvd_num + ", dvd_title=" + dvd_title + ", dvd_director=" + dvd_director
				+ ", dvd_actor=" + dvd_actor + ", dvd_year=" + dvd_year + ", dvd_country=" + dvd_country
				+ ", dvd_grade=" + dvd_grade + ", dvd_story=" + dvd_story + ", dvd_genre=" + dvd_genre + ", dvd_stock="
				+ dvd_stock + ", dvd_photo=" + dvd_photo + "]";
	}
	public String getDvd_num() {
		return dvd_num;
	}
	public void setDvd_num(String dvd_num) {
		this.dvd_num = dvd_num;
	}
	public String getDvd_title() {
		return dvd_title;
	}
	public void setDvd_title(String dvd_title) {
		this.dvd_title = dvd_title;
	}
	public String getDvd_director() {
		return dvd_director;
	}
	public void setDvd_director(String dvd_director) {
		this.dvd_director = dvd_director;
	}
	public String getDvd_actor() {
		return dvd_actor;
	}
	public void setDvd_actor(String dvd_actor) {
		this.dvd_actor = dvd_actor;
	}
	public Date getDvd_year() {
		return dvd_year;
	}
	public void setDvd_year(Date dvd_year) {
		this.dvd_year = dvd_year;
	}
	public String getDvd_country() {
		return dvd_country;
	}
	public void setDvd_country(String dvd_country) {
		this.dvd_country = dvd_country;
	}
	public String getDvd_grade() {
		return dvd_grade;
	}
	public void setDvd_grade(String dvd_grade) {
		this.dvd_grade = dvd_grade;
	}
	public String getDvd_story() {
		return dvd_story;
	}
	public void setDvd_story(String dvd_story) {
		this.dvd_story = dvd_story;
	}
	public String getDvd_genre() {
		return dvd_genre;
	}
	public void setDvd_genre(String dvd_genre) {
		this.dvd_genre = dvd_genre;
	}
	public int getDvd_stock() {
		return dvd_stock;
	}
	public void setDvd_stock(int dvd_stock) {
		this.dvd_stock = dvd_stock;
	}
	public String getDvd_photo() {
		return dvd_photo;
	}
	public void setDvd_photo(String dvd_photo) {
		this.dvd_photo = dvd_photo;
	}
	
	
	

}
