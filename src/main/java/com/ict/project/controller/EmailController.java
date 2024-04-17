package com.ict.project.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.dao.MemberVO;
import com.ict.project.service.MailService;
import com.ict.project.service.MemberService;

@Controller
public class EmailController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("find_user_pwd.do")
	public ModelAndView getFindUserAndPwd() {
		try {
			ModelAndView mv = new ModelAndView("hu/findUserPwd");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("error");
	}
	
	//비번 찾기
	@PostMapping("email_send_ok.do")
    public ModelAndView findUserPW(String member_id, String email, HttpServletRequest request) {
        try {
            MemberVO mvo = memberService.getLostPwd(member_id);
            System.out.println(mvo);
       
            if (mvo != null) {
                Random random = new Random();
                String randomNumber = String.valueOf(random.nextInt(1000000) % 1000000);
                if(randomNumber.length() < 6) {
                    int substract = 6 - randomNumber.length();
                    StringBuffer sb = new StringBuffer();
                    for(int i=0; i<substract; i++) {
                        sb.append("0");
                    }
                    sb.append(randomNumber);
                    randomNumber = sb.toString();
                }
                System.out.println("임시번호 : " + randomNumber);

                // 임시번호를 DB에 저장 해야 한다. 
                String pwd = passwordEncoder.encode(randomNumber);
                mvo.setMember_pwd(pwd);
                mvo.setMember_id(mvo.getMember_id());

                int result = memberService.tempPwdUpdate(mvo);
                System.out.println(result);
                if(result>0) {
                // 사용자메일에 임시번호 보내기 => service 가필요함 + handler
                mailService.sendEmail(randomNumber, email);
                return new ModelAndView("hu/login_Form");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return new ModelAndView("hu/error");
    }
	
	//아이디 찾기
	@PostMapping("id_send_ok.do")
    public ModelAndView findUserId(String member_name, String email,  HttpServletRequest request) {
        try {   
            MemberVO mvo = memberService.getLostMyID(member_name);
            if (mvo != null) {
                String userId = mvo.getMember_id();
                mailService.sendMyIDEmail(userId, email);
                return new ModelAndView("hu/login_Form");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return new ModelAndView("hu/error");
    }
}