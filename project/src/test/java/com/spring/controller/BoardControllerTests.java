package com.spring.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

// Test for Controller
@WebAppConfiguration

@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
// Java Config
// @ContextConfiguration(classes = {
// org.zerock.config.RootConfig.class,
// org.zerock.config.ServletConfig.class} )
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	
	


	

	@Test
	public void testListPaging() throws Exception {

		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/main/main2")
				.param("pageNum", "0")
				.param("amount", "9"))
				.andReturn().getModelAndView().getModelMap());
	}

}


