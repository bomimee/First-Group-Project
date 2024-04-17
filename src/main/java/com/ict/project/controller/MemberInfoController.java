package com.ict.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ict.project.service.MemberInfoService;

@Controller
public class MemberInfoController {
	@Autowired
	private MemberInfoService memberInfoService;
	
	
}
