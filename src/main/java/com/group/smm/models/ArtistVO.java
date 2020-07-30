package com.group.smm.models;

public class ArtistVO {
	
	private int artistId;
	private String artistName;
	
	public ArtistVO(String artistName) {
		super();
		this.artistName = artistName;
	}
	
	public int getArtistId() {
		return artistId;
	}
	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	
	
}
