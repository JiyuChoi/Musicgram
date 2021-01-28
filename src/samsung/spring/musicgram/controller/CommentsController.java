package samsung.spring.musicgram.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import samsung.spring.musicgram.dto.Comments;
import samsung.spring.musicgram.service.CommentsService;

@Controller 
@RequestMapping("/comment")
public class CommentsController {
	
		@Autowired
		CommentsService commentsService;
		
		// 댓글 리스트
		@GetMapping("/{content_no}")
		public String getComments(@PathVariable(name="content_no") int content_no, ModelMap model) {
			List<Comments> commentList = commentsService.getComments(content_no);
			model.addAttribute("comments", commentList);
			return "feed/commentfeed";
		}

			
		// 댓글 생성 
		@PostMapping("/create")
		public String createComment(Comments comment) {
			String res = "";
			res = commentsService.createComment(comment) == 1 ?  "redirect:/comment" : "feed/uploadFail";;
			return res;
		}
		
		
		// 댓글 삭제
		@GetMapping("/delete/{content_no}")
		public String deleteComment(@PathVariable("content_no") int content_no, ModelMap model) {
			String res = "";
			res = commentsService.deleteComments(content_no) == 1 ? "redirect:/comment" : "feed/uploadFail";
			return res;
		}
		


		
}