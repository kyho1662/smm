package com.group.smm.models;

public class MusicVO {
	
	String url;
	String title;
	String genre;
	String singer;
	
	
	public MusicVO(String url, String title, String genre, String singer) {
		super();
		this.url = url;
		this.title = title;
		this.genre = genre;
		this.singer = singer;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
}
