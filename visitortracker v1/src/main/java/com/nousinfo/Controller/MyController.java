
package com.nousinfo.Controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.nousinfo.bean.Item;
import com.nousinfo.bean.Visitor;
import com.nousinfo.service.ItemService;
import com.nousinfo.service.VisitorService;

@Controller
public class MyController {
	@Autowired
	VisitorService visitorService;
	@Autowired
	ItemService itemService;

	@RequestMapping(value = "/saveVisitor", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<?> saveItem(@RequestBody Visitor visitorDetails, Model model) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		Visitor visitor = visitorService.saveVisitor(visitorDetails);
		model.addAttribute("message", "Deafult Message");
		if (visitor != null) {
			model.addAttribute("visitor", visitor);
			map.put("StatusCode", 200);
			map.put("IsSuccessful", true);
			map.put("Result", "success");
			System.out.println("In saveVisitor:  saved data");
			return new ResponseEntity<HashMap>(map, HttpStatus.OK);
		} else {
			map.put("StatusCode", 403);
			map.put("IsSuccessful", false);
			map.put("Result", "failed");
			System.out.println("In saveVisitor: failed to save data");
			return new ResponseEntity<HashMap>(map, HttpStatus.BAD_REQUEST);
		}

		// return status.length() != 0 ? status : "redirect:visitorHome";

	}

	private String message = "welcome page";

	@RequestMapping(value = "/visitorHome")
	public String home(Model model) {

		System.out.println("In visitorHome");
		model.addAttribute("todaysVisitors", visitorService.getAllVisitor());
		return "visitorHome";
	}

	@RequestMapping(value = "/visitorCheckin")
	public String visitorCheckIn(Model model) {
		System.out.println("Home method");
		model.addAttribute("todaysVisitors", visitorService.getAllVisitor());
		return "visitorCheckin";
	}

	@RequestMapping(value = "/")
	public String doDefault(Model model) {
		System.out.println("Default method");
		model.addAttribute("todaysVisitors", visitorService.getAllVisitor());
		return "visitorHome";
	}

	@RequestMapping(value = "/showImage")
	public void showImage(@RequestParam("visitorId") int visitorId, @RequestParam("signRequired") int signRequired,
			HttpServletResponse response) throws IOException {

		try {
			Visitor visitorObj = visitorService.getVisitor(visitorId);

			if (signRequired == 1) {
				byte[] contentOfImage = visitorObj.getVisitorSign();
				System.out.println(contentOfImage);
				if (contentOfImage != null) {
					response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
					response.getOutputStream().write(contentOfImage);
					response.getOutputStream().flush();
					response.getOutputStream().close();
					System.out.println("Visitor Sign Image Data sent");
				} else {
					System.out.println("Data of image(Visitor Sign) is null");

				}

			} else {
				byte[] contentOfImage = visitorObj.getVisitorPic();
				System.out.println(contentOfImage);
				if (contentOfImage != null) {
					response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
					response.getOutputStream().write(contentOfImage);
					response.getOutputStream().flush();
					response.getOutputStream().close();

					System.out.println("Visitor Pic Image Data sent");
				} else {
					System.out.println("Data of image(Visitor Pic) is null");
				}
			}

		} catch (IOException e) {
			System.out.println("IOException :" + e);

		}
	}

	@RequestMapping(value = "/visitorCheckOut")
	public String visitorCheckOut(@RequestParam("visitorId") int visitorId) {

		try {
			Visitor visitorObj = visitorService.getVisitor(visitorId);
			visitorObj.setCheckOutTime(new Date());
			visitorObj.setCheckedOut(true);
			visitorService.saveVisitor(visitorObj);
			System.out.println("In visitorCheckOut" + visitorObj);

		} catch (Exception e) {
			System.out.println("IOException :" + e);

		}
		return "redirect:visitorHome";
	}

	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/getCarriedItems")
	public ResponseEntity<?> getCarriedItems(@RequestParam("visitorId") int visitorId) {
		List<Item> carriedItems = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			
			Visitor visitorObj = visitorService.getVisitor(visitorId);
			System.out.println("In getCarriedItems,visitorId: " + visitorId + " " + visitorObj.getItems());
			carriedItems = visitorObj.getItems();
			map.put("StatusCode", 200);
			map.put("IsSuccessful", true);
			map.put("Result", "success");
			map.put("carriedItems", carriedItems);
			if (carriedItems != null) {
				return new ResponseEntity<HashMap>(map, HttpStatus.OK);
			}else{
				map.put("StatusCode", 403);
				map.put("IsSuccessful", false);
				map.put("Result", "failed");
				return new ResponseEntity<HashMap>(map, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			System.out.println("IOException :" + e);
		}
		map.put("StatusCode", 403);
		map.put("IsSuccessful", false);
		map.put("Result", "failed");
		return new ResponseEntity<HashMap>(map, HttpStatus.BAD_REQUEST);
		

	}
}
