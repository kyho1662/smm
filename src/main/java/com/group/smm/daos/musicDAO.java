package com.group.smm.daos;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.group.smm.models.ArtistVO;
import com.group.smm.models.MusicVO;
import com.group.smm.models.PlayListVO;
import com.group.smm.mybatis.DBService;

public class MusicDAO {
	
	// @desc 모든 음악 select
	public static List<MusicVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<MusicVO> list = ss.selectList("musicMapper.getAllMusic");
		ss.close();
		return list;
	}
	
	// @desc musicId로 select
	public static MusicVO getMusic(int musicId) {
		SqlSession ss = DBService.getFactory().openSession();
		
		MusicVO music = ss.selectOne("musicMapper.getMusic", musicId);

		return music;

	}
	
	// @desc artistId로 select
	public static ArtistVO getArtist(int artistId) {
		SqlSession ss = DBService.getFactory().openSession();
		
		ArtistVO artist = ss.selectOne("musicMapper.getArtist", artistId);
			
		return artist;

	}
	
	// @desc playListId로 playlist select
	public static PlayListVO getPlayList(int playListId) {
		SqlSession ss = DBService.getFactory().openSession();
		PlayListVO playList = new PlayListVO();
		List<MusicVO> musics = new ArrayList<MusicVO>();
		
		playList = ss.selectOne("musicMapper.getPlayList", playListId);
		System.out.println("playlist name : " + playList.getPlayListName());
	    musics = ss.selectList("musicMapper.getListedMusics", playListId);
		playList.setMusics(musics);
		ss.close();
		return playList;
	}

	
	
	

}
