package kr.co.jboard.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.jboard.service.UserService;


@WebServlet("/user/check.do")
public class CheckController extends HttpServlet {

	private static final long serialVersionUID = -8567214395021632366L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 수신 (아이디, 별명, 이메일, 휴대폰 중복 체크)
		String type = req.getParameter("type");
		String value = req.getParameter("value");
	
		// 수신된 데이터 반드시 출력해보기
		System.out.println("type : " + type + ", value : " + value); // 시스템 콘솔 이용
		logger.debug("type : " + type + ", value : " + value); // 로거 이용
		
		// 카운트 조회하기
		int count = service.countUser(type, value); //count 값 반환
		logger.debug("count : " + count);
		
		// 이메일 인증번호 발송
		if(type.equals("email") && count == 0) { // type이 이메일이고 중복되지 않으면 인증번호 발송
			String code = service.sendEmailCode(value); // 사용자 email 전송 후 서버가 만든 인증번호 반환
			
			// 세션 저장 - 클라이언트가 보낸 인증번호와 비교를 위해서 서버에 인증번호가 저장되어야 한다.
			HttpSession session = req.getSession(); // 서버에 세션을 생성
			session.setAttribute("sessAuthCode", code); // session에 인증번호(code)를 sessAuthoCode라는 이름으로 저장
		}
		
		// JSON 생성
		JsonObject json = new JsonObject(); // 클라이언트에 응답할 JSON 생성
		json.addProperty("count", count); // JSON 객체에 count를 count라는 이름의 프로퍼티로 추가
		logger.debug("json : " + json);
		
		// JSON 출력
		PrintWriter writer = resp.getWriter(); // 문자 출력 스트림
		writer.println(json); // 클라이언트에게 전송
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 전송 데이터 수신처리
		String authCode = req.getParameter("authCode"); // formData의 authCode 값을 받음
		logger.debug("authCode : " + authCode);
		
		// 세션에 저장된 코드와 비교 후 JSON 출력
		HttpSession session = req.getSession();
		String sessAuthCode = (String) session.getAttribute("sessAuthCode"); // session의 sessAuthCode를 가져옴
		logger.debug("sessAuthCode : " + sessAuthCode);
		
		if(authCode.equals(sessAuthCode)){ // 사용자가 입력한 authCode와 session의 sessAuthcode가 같은지 확인
			// 인증 성공
			JsonObject json = new JsonObject(); 
			json.addProperty("result", 1); // 1을 result라는 이름의 프로퍼티 추가
			resp.getWriter().println(json);	// 클라이언트에게 전송		
			
		}else {
			// 인증 실패
			JsonObject json = new JsonObject();
			json.addProperty("result", 0); // 0을 result라는 이름의 프로퍼티 추가
			resp.getWriter().println(json); // 클라이언트에게 전송
		}
	
	}
}







