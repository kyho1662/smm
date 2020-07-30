package com.group.smm.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.group.smm.daos.MusicDAO;

/**
 * Servlet implementation class PlayListServlet
 */
@WebServlet("/playList")
public class PlayListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlayListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Gson gson = new Gson();  
		
		int playListId = Integer.parseInt(request.getParameter("playListId"));
		//int musicId = Integer.parseInt(request.getParameter("musicId"));
		
		String json = gson.toJson(MusicDAO.getPlayList(playListId));
		System.out.println(json);
		response.setContentType("application/json");
		response.setCharacterEncoding  ("UTF-8");
		response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
