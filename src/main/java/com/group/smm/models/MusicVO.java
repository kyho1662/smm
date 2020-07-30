package com.group.smm.models;

public class MusicVO {
	
	private int musicId;
	private String genre;
	private String title;
	private int artistId;
	private String url;
	
	
	
//	public MusicVO(String genre, String musicName, int artistId, String url) {
//		super();
//		this.genre = genre;
//		this.musicName = musicName;
//		this.artistId = artistId;
//		this.url = url;
//	}
	
	public int getMusicId() {
		return musicId;
	}
	public void setMusicId(int musicId) {
		this.musicId = musicId;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getArtistId() {
		return artistId;
	}
	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
