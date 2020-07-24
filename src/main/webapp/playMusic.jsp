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
<header id="main-header" class="bg-success text-white p-4 mb-3">
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
        <button id="button">Get Music</button>
        <ul id="music-list" class="list-group"></ul>
    </div>
</div>
<!--<button id="button">Load Posts</button>-->
<br><br>
<div id="text"></div>
<script>

	// Music Class
	class Music {
		constructor(url, title, genre, singer) {
			this.url = url;
			this.title = title;
			this.genre = genre;
			this.singer = singer;
		}
	};
  	// Create event listener
  	document.getElementById('button').addEventListener('click', loadText);

  	function loadText() {
  		console.log('button clicked');
  		// Create XHR Object
  		let xhr = new XMLHttpRequest();

  		// OPEN - type, url/file, async

  		console.log(xhr);

  		xhr.open('GET', 'http://localhost:8080/smm/play', true);

  		xhr.onload = function() {
  			if(this.status == 200) {
  				rt = this.responseText;
  				console.log(rt);
  				
  				const music = JSON.parse(rt);
  				
  				console.log(music);
  				
  				const list = document.querySelector('#music-list');

  	            const row = document.createElement('li');

  	            row.className = 'list-group-item';

  	            row.innerHTML = `<iframe width="500" height="300" src=${music[0].url} frameborder="0" allowfullscreen></iframe><br>
  				<span>${music[0].title}</span>
  				<span>${music[0].singer}</span>
  				<span>${music[0].genre}</span>`;

  	            list.appendChild(row);
  				

  				
  			}
  		}

      // Sends request
  		xhr.send();
  	}

  	// HTTP Statuses
  	// 200 : "OK"
  	// 403 : "Forbidden"
  	// 303 : "Not Found"
  	
</script>
	

</body>
</html>