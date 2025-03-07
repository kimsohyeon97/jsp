package kr.co.farmstory.controller.user;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.farmstory.dto.TermsDTO;
import kr.co.farmstory.service.TermsService;

@WebServlet("/user/term.do")
public class TermsController extends HttpServlet{

	private static final long serialVersionUID = -2512370264040084172L;
	
	private TermsService service = TermsService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TermsDTO dto = service.findTerms(1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/users/terms.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
