package com.portfolio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet("/portfolio")
public class PortfolioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Basic Info
        request.setAttribute("name", "Aniket Patil");
        request.setAttribute("role", "Passionate Full Stack Developer");
        request.setAttribute("about", "Full Stack Developer with hands-on experience in Java, Spring Boot, MySQL, and React.js. "
                + "Eager to contribute to impactful projects and grow in a dynamic tech environment.");

        // Contact Info
        request.setAttribute("email", "patilaniket2562m@gmail.com");
        request.setAttribute("phone", "9112261074");
        request.setAttribute("location", "Kolhapur, India");
        request.setAttribute("linkedin", "https://linkedin.com/Aniket-patil-5b6a78260");
        request.setAttribute("github", "https://github.com/patilaniket2562m");

        // Education
        List<String> education = new ArrayList<>();
        education.add("MCA - KIT’s Institute Of Management Education And Research (2023 - 2025), 66.09%");
        education.add("BCA - New College Kolhapur (2021 - 2023), 78.82%");
        education.add("HSC - L.T.D.P. Junior College Kalkundri (2018 - 2020), 59.23%");
        request.setAttribute("education", education);

        // Work Experience
        List<Map<String, String>> experience = new ArrayList<>();

        Map<String, String> exp1 = new LinkedHashMap<>();
        exp1.put("company", "Technoworld Software");
        exp1.put("role", "Full Stack Development Intern");
        exp1.put("duration", "07/2025 - 01/2026");
        exp1.put("details", "Expanded RESTful APIs using Spring Boot, built full CRUD operations, created responsive frontend and API integration.");
        experience.add(exp1);

        Map<String, String> exp2 = new LinkedHashMap<>();
        exp2.put("company", "Revolution IT Solution Pvt. Ltd.");
        exp2.put("role", "Web Development Intern");
        exp2.put("duration", "06/2024 - 08/2024");
        exp2.put("details", "Designed responsive web interfaces, implemented dynamic features, optimized performance, and ensured mobile responsiveness.");
        experience.add(exp2);

        request.setAttribute("experience", experience);

        // Skills
        List<String> skills = Arrays.asList(
                "Java", "Spring Boot", "Hibernate", "Servlet", "JSP", 
                "React.js", "JavaScript", "HTML", "CSS", "Bootstrap", "MySQL", "SQL Server"
        );
        request.setAttribute("skills", skills);

        // Projects
        List<String> projects = new ArrayList<>();
        projects.add("Online Auction System – Dual-user platform for real-time bidding using Java, JSP, Servlet, and MySQL.");
        projects.add("Online Attendance System – Role-based attendance management using ASP.NET, SQL Server, and MySQL.");
        request.setAttribute("projects", projects);

        // Forward to JSP
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
