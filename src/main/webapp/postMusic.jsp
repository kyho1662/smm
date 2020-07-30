<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
          crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<header id="main-header" class="bg-dark text-white p-4 mb-3">
    <div class="container">
        <h1 id="header-title">Music</h1>
        <tr id="button-group">
            <a href="login" id="login-btn" class="btn btn-dark" >Login</a>
            <a href="signup" id="signup-btn" class="btn btn-dark" >Sign Up</a>
            <a href="write" id="write-btn" class="btn btn-dark" >List</a>
        </tr>
    </div>

</header>
 <div class="container">
        <div id="main" class="card card-body">
            <form id="music-post-form">
                <div class="form-group">
                    <label for="title">타이틀:</label>
                    <input type="text" id="title" class="form-control">
                </div>
                <div class="form-group">
                    <label for="genre">장르:</label>
                    <input type="text" id="genre" class="form-control">
                </div>
                <div class="form-group">
                    <label for="artist">아티스트:</label>
                    <input type="text" id="artist" class="form-control">
                </div>
                <div class="form-group">
                    <label for="url">유튜브 URL:</label>
                    <input type="text" id="url" class="form-control">
                </div>
                <input type="submit" value="음악 등록" class="btn btn-primary btn-block">
            </form>
        </div>
    </div>
<!--<button id="button">Load Posts</button>-->
<br><br>
<div id="text"></div>
<script>

	// Music Class
	class Music {
		constructor(title, genre, artistName, url) {
			this.title = title;
			this.genre = genre;
			this.artistName = artistName;
			this.url = url;
		}
	};
	
	
	 class UI {
	        static showAlert(message, className) {
	            const div = document.createElement('div');
	            div.className = `alert alert-${className}`;
	            div.appendChild(document.createTextNode(message));
	            const container = document.querySelector('.container');
	            const form = document.querySelector('#register-form');
	            container.insertBefore(div, form);
	            // Vanish in 3 seconds
	            setTimeout(() => document.querySelector('.alert').remove(),3000);
	        }
	    }
	 
	 
	 document.querySelector('#music-post-form').addEventListener('submit', postMusic);
  	
  	
 // @desc Post playlist by playlist id
function postMusic(e) {
		e.preventDefault();
		
		 let musicInfo = {"title":document.querySelector('#title').value,
		            "genre":document.querySelector('#genre').value,
		            "artistName":document.querySelector('#artist').value,
		            "url":document.querySelector('#url').value};
		
		 
		 if(musicInfo.title === '' || musicInfo.genre === '' || musicInfo.artistName === ''
	            || musicInfo.url === '' ) {
	            UI.showAlert('Please fill in all fields', 'danger');
	            console.log(musicInfo);
	        } else {
		
		
  		// Create XHR Object
  		let xhr = new XMLHttpRequest();

  		// OPEN - type, url/file, async

  		console.log(xhr);

  		xhr.open('POST', 'http://localhost:8080/smm/music', true);
		xhr.setRequestHeader('Content-type', 'application/json');
  		xhr.onload = function() {
  			if(this.status == 200) {
  				console.log(this.responsText);
  				};
  							
  			}
  		

      // Sends request
  		xhr.send(JSON.stringify(musicInfo));
  	}
  };
  	// HTTP Statuses
  	// 200 : "OK"
  	// 403 : "Forbidden"
  	// 303 : "Not Found"
  	
</script>
	

</body>
</html>