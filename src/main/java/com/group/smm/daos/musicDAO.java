package com.group.smm.daos;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.group.smm.models.MusicVO;
import com.group.smm.mybatis.DBService;

public class musicDAO {
	
	public static List<MusicVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<MusicVO> list = ss.selectList("musicMapper.getAllMusic");
		ss.close();
		return list;
	}

}
