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
	
	//��� ã��
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
                System.out.println("�ӽù�ȣ : " + randomNumber);

                // �ӽù�ȣ�� DB�� ���� �ؾ� �Ѵ�. 
                String pwd = passwordEncoder.encode(randomNumber);
                mvo.setMember_pwd(pwd);
                mvo.setMember_id(mvo.getMember_id());

                int result = memberService.tempPwdUpdate(mvo);
                System.out.println(result);
                if(result>0) {
                // ����ڸ��Ͽ� �ӽù�ȣ ������ => service ���ʿ��� + handler
                mailService.sendEmail(randomNumber, email);
                return new ModelAndView("hu/login_Form");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return new ModelAndView("hu/error");
    }
	
	//���̵� ã��
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