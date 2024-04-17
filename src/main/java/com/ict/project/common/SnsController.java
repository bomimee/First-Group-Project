package com.ict.project.common;

import java.io.BufferedReader;

import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ict.project.dao.AddrDAO;
import com.ict.project.dao.AddrVO;
import com.ict.project.common.KakaoVO;


@Controller
public class SnsController {

	@Autowired
	private AddrDAO addrDAO ;
	
	@RequestMapping("spring_sns_go.do")
	public ModelAndView getSpringSnsGo() {
		return new ModelAndView("hu/login_Form");
	}

	@RequestMapping("kakaologin.do")
	public ModelAndView KakaoLogIn(HttpServletRequest request) {
		// 1. �씤利앹퐫�뱶 諛쏄린
		String code = request.getParameter("code");
		// System.out.println("code : " + code);

		// 2. �넗�겙 諛쏄린 (�씤利앹퐫�뱶�븘�슂)
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST �슂泥�
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// �뿤�뜑 �슂泥�
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

			// 蹂몃Ц
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=4a601447a1662d2919cfc432b342bc38");
			sb.append("&redirect_uri=http://localhost:8090/kakaologin.do");
			sb.append("&code="+code);
			bw.write(sb.toString());
			bw.flush();

			// 寃곌낵 肄붾뱶媛� 200�씠硫� �꽦怨�
			int responseCode = conn.getResponseCode();

			if (responseCode == HttpURLConnection.HTTP_OK) {
				// �넗�겙�슂泥��쓣 �넻�븳 寃곌낵瑜� �뼸�뒗�뜲 JSON ���엯
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

				String line = "";
				StringBuffer sb2 = new StringBuffer();
				while ((line = br.readLine()) != null) {
					sb2.append(line);
				}
				String result = sb2.toString();
				// System.out.println(result);

				// 諛쏅뒗 �젙蹂대뒗 session ���옣 ( ajax瑜� �궗�슜�빐�꽌 �궗�슜�옄�젙蹂대�� 媛��졇�삩�떎.)
				Gson gson = new Gson();
				KakaoVO kvo = gson.fromJson(result, KakaoVO.class);
				// System.out.println(kvo.getAccess_token());
				// System.out.println(kvo.getRefresh_token());
				// System.out.println(kvo.getToken_type());
				request.getSession().setAttribute("access_token", kvo.getAccess_token());
				request.getSession().setAttribute("refresh_token", kvo.getRefresh_token());
				request.getSession().setAttribute("token_type", kvo.getToken_type());
				
				
				
				
				

				return new ModelAndView("hu/result");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return new ModelAndView("hu/error");

	}

	// 移댁뭅�삤 濡쒓렇�븘�썐
	@RequestMapping("kakaologout.do")
	public ModelAndView getKakaoLogout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("hu/login_Form");
	}

	
}















