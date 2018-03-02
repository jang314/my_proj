package com.javalec.ex.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.ex.model.MemberVO;
import com.javalec.ex.model.PagingList;
import com.javalec.ex.model.UploadComment;
import com.javalec.ex.model.UploadFileVO;
import com.javalec.ex.model.UploadVO;
import com.javalec.ex.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private ServletContext context;

	private static final Logger logger = Logger.getLogger(MemberController.class);

	/* 게시판 목록 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardList(HttpSession session, Model model, @RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue="all") String searchOption, @RequestParam(defaultValue="") String item) {

		if (session.getAttribute("loginUser") == null) {
			return "redirect:/member/login";
		}
		
		// 검색옵션
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("searchOption", searchOption);
		hmap.put("item", item);
		
		//	페이지
		int pageSize = 10;
		int totalCount = boardService.boardCount(hmap);
		PagingList list = new PagingList(pageSize, totalCount, currentPage);
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		
		//	공지글
		ArrayList<UploadVO> notice = boardService.selectNotice();
		ArrayList<UploadVO> uploadlist = boardService.selectList(hmap);
		
		for(UploadVO uploadno : notice) {
			uploadno.setCommentCount(boardService.commentCount(uploadno.getUploadno()));
		}
		//	글 목록
		for(UploadVO uploadvo : uploadlist) {
			uploadvo.setCommentCount(boardService.commentCount(uploadvo.getUploadno()));
		}
		list.setList(uploadlist);
		model.addAttribute("hmap", hmap);
		model.addAttribute("notice", notice);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		return "board/list";
	}

	/*글 상세보기*/
	@RequestMapping(value = "/detail", method=RequestMethod.GET)
	public String detailView(HttpSession session, Model model, @RequestParam int uploadno,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/member/login";
		}
		
		UploadComment comment = new UploadComment();
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		int pageSize = 10;
		//	댓글 갯수
		int totalCount = boardService.commentCount(uploadno);
		PagingList list = new PagingList(pageSize, totalCount, currentPage);
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		hmap.put("uploadno", uploadno);
		
		//	댓글 목록
		ArrayList<UploadComment> commentlist = boardService.commentList(hmap);
		list.setCommentList(commentlist);
		logger.info(commentlist);
		//	조회수 증가
		int readCount = boardService.readCount(uploadno);
		UploadVO upload = boardService.selectByUploadNo(uploadno);
		if(readCount==1) {
				List<UploadFileVO> uploadFiles = boardService.selectUploadFilesByUploadNo(uploadno);
				session.setAttribute("loginUser", session.getAttribute("loginUser"));
				model.addAttribute("upload", upload);
				model.addAttribute("files", uploadFiles);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("commentForm", comment);
				model.addAttribute("list", list);
				return "board/detail";
		}else {
				return "board/list";
		}
	}
	
	@RequestMapping(value = "/detail", method=RequestMethod.POST)
	public String Comment(Model model, HttpSession session, @ModelAttribute("commentForm") UploadComment comment,
												@RequestParam("currentPage") int currentPage, @RequestParam("mode") int mode) {
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/member/login";
		}
		
		System.out.println(mode);
		
		switch (mode) {
		case 1:
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			comment.setMembervo(loginUser);
			boardService.insertComment(comment);
			break;
		case 2:
			boardService.updateComment(comment);
			break;
		case 3:
			boardService.deleteComment(comment);
			break;
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("uploadno", comment.getUploadno());
		return "redirect:/board/detail";
	}
	
	/*	다운로드	*/
	@RequestMapping("/download")
	public void download(HttpSession session, @RequestParam("uploadfileno") int uploadfileno, 
			Model model, HttpServletResponse response) throws Exception {
		
		UploadFileVO uploadFile = boardService.selectUploadFileByUploadFileNo(uploadfileno);
		String filename = "C:\\upload\\springupload" + "/" +uploadFile.getSavedfilename();
		
		File file = new File(filename);
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=\""+uploadFile.getUserfilename()+"\"");
		response.setContentLength((int) file.length());
		
		InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
		FileCopyUtils.copy(inputStream, response.getOutputStream());
		
		boardService.updateDownloadCount(uploadfileno);
	}

	/* 글쓰기 & 업로드 폼*/
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) {
		
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/member/login";
		}
		
		UploadVO upload = new UploadVO();
		model.addAttribute("uploadForm", upload);
		return "board/write";
	}

	/*DB등록, 파일업로드*/
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeProcess(HttpSession session, @ModelAttribute("uploadForm") UploadVO uploadvo,
			@RequestParam("attach") MultipartFile file, Model model) throws IllegalStateException, IOException {

		if (uploadvo.getNotice() == null)
			uploadvo.setNotice("0");
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser"); 
		uploadvo.setMembervo(loginUser);
		
//		logger.info(uploadvo);
		
		File uploadFile = null;
		if (!file.getOriginalFilename().isEmpty() && !file.isEmpty()) {
			String relativeWebPath = "C:\\upload\\springupload";
			// String absFilePath = context.getRealPath(relativeWebPath);
			uploadFile = new File(relativeWebPath, System.currentTimeMillis() + "-" + file.getOriginalFilename());
			file.transferTo(uploadFile);
		}
		
		int count = boardService.insertUpload(uploadvo);
		if (count == 1 && uploadFile != null) {
			UploadFileVO uploadfile = new UploadFileVO();
			uploadfile.setUploadno(uploadvo.getUploadno());
			uploadfile.setSavedfilename(uploadFile.getName());
			uploadfile.setUserfilename(file.getOriginalFilename());
			boardService.insertUploadFile(uploadfile);
		}
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateForm(HttpSession session, Model model, @RequestParam int uploadno, 
																												@RequestParam int currentPage) {
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/member/login";
		}

		UploadVO uploadvo = boardService.selectByUploadNo(uploadno);
		List<UploadFileVO> uploadFiles = boardService.selectUploadFilesByUploadNo(uploadno);
		model.addAttribute("uploadForm", uploadvo);
		model.addAttribute("files", uploadFiles);
		model.addAttribute("currentPage", currentPage);
		
		return "board/update";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateProces(HttpSession session, Model model, @ModelAttribute UploadVO upload,
	@RequestParam("existFile") String existFile ,@RequestParam("attach") MultipartFile file) throws IllegalStateException, IOException {
	
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/member/login";
		}
		
		if (upload.getNotice() == null)
			upload.setNotice("0");
		File uploadFile = null;
		
		//	파일업로드
		if(!file.getOriginalFilename().isEmpty()&& !file.isEmpty()) {
			String path = "C:\\upload\\springupload";
			String existpath="C:\\upload\\springupload"+"/"+existFile;
			File existFile2 = new File(existpath);
			uploadFile = new File(path, 
					System.currentTimeMillis() + "-" + file.getOriginalFilename());
			existFile2.delete();
			file.transferTo(uploadFile);
		}
		
		int count = boardService.updateUpload(upload);
		if(count == 1 && uploadFile != null) {
			UploadFileVO file2 = new UploadFileVO();
			file2.setUploadno(upload.getUploadno());
			file2.setSavedfilename(uploadFile.getName());
			file2.setUserfilename(file.getOriginalFilename());
			List<UploadFileVO> files = boardService.selectUploadFilesByUploadNo(upload.getUploadno());
			if(files.isEmpty()) {
				boardService.insertUploadFile(file2);
			}else {
				int uploadfileno = files.get(0).getUploadfileno();
				file2.setUploadfileno(uploadfileno);
				boardService.updateUploadFile(file2);
			}
		}
//		controller를 거쳐서 간다.
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(HttpSession session, Model model, @RequestParam int uploadno, 
																										@RequestParam int currentPage) {
		
		if(session.getAttribute("loginUser")==null) {
			return "redirect:/member/login";
		}
		UploadFileVO filebean = new UploadFileVO();
		filebean.setUploadno(uploadno);
		List<UploadFileVO> files = boardService.selectUploadFilesByUploadNo(uploadno);
		int uploadfileno = files.get(0).getUploadfileno();
		UploadFileVO uploadFile = boardService.selectUploadFileByUploadFileNo(uploadfileno);
		String filename = "C:\\upload\\springupload" + "/" +uploadFile.getSavedfilename();
		File file = new File(filename);
		if(files.isEmpty()) {
			boardService.deleteUplaod(uploadno);
			return "redirect:/board/list";
		}else {
			System.out.println(uploadno);
			boardService.deleteUploadFile(uploadfileno);
			boardService.deleteUplaod(uploadno);
			System.out.println("2");
			if(file.exists()) {
				file.delete();
			}
			return "redirect:/board/list";
		}
	}
}
