package com.group.smm.models;

import java.util.List;

public class PlayListVO {
	
	private int playListId;
	private String playListName;
	private int userId;
	
	private List<MusicVO> musics;
	
	public PlayListVO(String playListName, List<MusicVO> musics) {
		super();
		this.playListName = playListName;
		this.musics = musics;

	}
	
	public PlayListVO() {
		super();
	}

	public int getPlayListId() {
		return playListId;
	}

	public void setPlayListId(int playListId) {
		this.playListId = playListId;
	}

	public String getPlayListName() {
		return playListName;
	}

	public void setPlayListName(String playListName) {
		this.playListName = playListName;
	}

	public List<MusicVO> getMusics() {
		return musics;
	}

	public void setMusics(List<MusicVO> musics) {
		this.musics = musics;
	}
	
}
