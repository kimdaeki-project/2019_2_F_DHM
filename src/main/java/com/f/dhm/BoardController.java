package com.f.dhm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/**")
public class BoardController {

	@GetMapping("board2")
	public String board() {
		return "board/board2";
	}
}
