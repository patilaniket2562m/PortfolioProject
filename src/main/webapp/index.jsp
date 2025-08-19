<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title><%= request.getAttribute("name") %> - Portfolio</title>
    <link rel="stylesheet" href="portfolio.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar">
    <div class="nav-brand"><%= request.getAttribute("name") %></div>
    <div class="nav-toggle" onclick="toggleMenu()">☰</div>
    <ul class="nav-links" id="navMenu">
        <li><a href="#home">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#education">Education</a></li>
        <li><a href="#experience">Experience</a></li>
        <li><a href="#skills">Skills</a></li>
        <li><a href="#projects">Projects</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
</nav>

<div class="container">

    <!-- Header -->
    <header id="home">
        <img src="images/profile.jpg" alt="Profile Photo" class="profile-pic">
        <h1><%= request.getAttribute("name") %></h1>
        <h3><%= request.getAttribute("role") %></h3>
        <a href="resume.pdf" class="btn" download>📄 Download Resume</a>
    </header>

    <!-- About -->
    <section id="about" class="about section-card">
        <h2>About Me</h2>
        <p><%= request.getAttribute("about") %></p>
    </section>

    <!-- Contact -->
    <section id="contact" class="contact section-card">
        <h2>Contact</h2>
        <div class="contact-grid">
            <p><b>Email:</b> <%= request.getAttribute("email") %></p>
            <p><b>Phone:</b> <%= request.getAttribute("phone") %></p>
            <p><b>Location:</b> <%= request.getAttribute("location") %></p>
            <p><b>LinkedIn:</b> <a href="<%= request.getAttribute("linkedin") %>" target="_blank">Profile</a></p>
            <p><b>GitHub:</b> <a href="<%= request.getAttribute("github") %>" target="_blank">Repository</a></p>
        </div>
    </section>

    <!-- Education -->
    <section id="education" class="education section-card">
        <h2>Education</h2>
        <ul>
            <%
                List<String> edu = (List<String>) request.getAttribute("education");
                if (edu != null) {
                    for(String e : edu){ %>
                        <li><%= e %></li>
            <%      }
                } else { %>
                        <li>No education data available</li>
            <% } %>
        </ul>
    </section>

    <!-- Experience -->
    <section id="experience" class="experience section-card">
        <h2>Work Experience</h2>
        <%
            List<Map<String, String>> exp = (List<Map<String, String>>) request.getAttribute("experience");
            if (exp != null) {
                for(Map<String, String> job : exp){ %>
                    <div class="exp-card">
                        <h3><%= job.get("role") %> - <%= job.get("company") %></h3>
                        <p><b>Duration:</b> <%= job.get("duration") %></p>
                        <p><%= job.get("details") %></p>
                    </div>
        <%      }
            } else { %>
                <p>No work experience found</p>
        <% } %>
    </section>

    <!-- Skills -->
    <section id="skills" class="skills section-card">
        <h2>Skills</h2>
        <ul>
            <%
                List<String> skills = (List<String>) request.getAttribute("skills");
                if (skills != null) {
                    for(String s : skills){ %>
                        <li><%= s %></li>
            <%      }
                } else { %>
                        <li>No skills available</li>
            <% } %>
        </ul>
    </section>

    <!-- Projects -->
    <section id="projects" class="projects section-card">
        <h2>Projects</h2>
        <div class="project-list">
            <%
                List<String> projects = (List<String>) request.getAttribute("projects");
                if (projects != null) {
                    for(String p : projects){ %>
                        <div class="project-card"><%= p %></div>
            <%      }
                } else { %>
                        <div class="project-card">No projects available</div>
            <% } %>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 <%= request.getAttribute("name") %>. All Rights Reserved.</p>
    </footer>
</div>

<script>
    function toggleMenu() {
        document.getElementById("navMenu").classList.toggle("active");
    }
</script>
</body>
</html>
