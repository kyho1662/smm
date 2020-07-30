package com.group.smm.controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.group.smm.daos.MusicDAO;
import com.group.smm.models.ArtistVO;
import com.group.smm.models.MusicVO;

/**
 * Servlet implementation class PlayServlet
 */
@WebServlet("/music")
public class MusicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**@desc get music
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Gson gson = new Gson();   
		
		int musicId = Integer.parseInt(request.getParameter("musicId"));
		
		//MusicVO music = new MusicVO("https://www.youtube.com/embed/TgOu00Mf3kI", "eight", "ÆË", "¾ÆÀÌÀ¯");
		MusicVO music = MusicDAO.getMusic(musicId);
		
		String json = gson.toJson(music);
		
		//String json = gson.toJson(music);
		
		
		//System.out.println(json);		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// @POST /smm/play
	// @desc post music
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Gson gson = new Gson();   
		
		System.out.println(getBody(request));
		
		response.getWriter().print("music posted");
		
	}

	public static String getBody(HttpServletRequest request) throws IOException {
		 
        String body = null;
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader bufferedReader = null;
 
        try {
            InputStream inputStream = request.getInputStream();
            if (inputStream != null) {
                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                char[] charBuffer = new char[128];
                int bytesRead = -1;
                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
                    stringBuilder.append(charBuffer, 0, bytesRead);
                }
            }
        } catch (IOException ex) {
            throw ex;
        } finally {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException ex) {
                    throw ex;
                }
            }
        }
 
        body = stringBuilder.toString();
        return body;
    }
}


