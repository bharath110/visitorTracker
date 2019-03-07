
package com.nousinfo.Controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.data.jpa.repository.Query;
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
			return new ResponseEntity<HashMap>(map, HttpStatus.OK);
		} else {
			map.put("StatusCode", 403);
			map.put("IsSuccessful", false);
			map.put("Result", "failed");
			return new ResponseEntity<HashMap>(map, HttpStatus.BAD_REQUEST);
		}

		// return status.length() != 0 ? status : "redirect:visitorHome";

	}

	private String message = "welcome page";

	@RequestMapping(value = "/visitorHome")
	public String home(Model model) {

		List<Visitor> visitorList = visitorService.getAllVisitor();
		// Collections.reverse(visitorList);
		Collections.sort(visitorList, new Comparator<Visitor>() {
			public int compare(Visitor visitorObj1, Visitor visitorObj2) {
				return visitorObj2.getCheckInTime().compareTo(visitorObj1.getCheckInTime());
			}
		});
		Iterator<Visitor> vIt = visitorList.iterator();
		while (vIt.hasNext()) {
			Visitor vObj = vIt.next();
			System.out.println(vObj.getName() + " has checked In at :" + vObj.getCheckInTime());

		}
		model.addAttribute("todaysVisitors", visitorList);
		return "visitorHome";
	}

	@RequestMapping(value = "/visitorCheckin")
	public String visitorCheckIn(Model model) {
		model.addAttribute("todaysVisitors", visitorService.getAllVisitor());
		return "visitorCheckin";
	}

	@RequestMapping(value = "/")
	public String doDefault(Model model) {
		List<Visitor> visitorList = visitorService.getAllVisitor();
		// Collections.reverse(visitorList);
		Collections.sort(visitorList, new Comparator<Visitor>() {
			public int compare(Visitor visitorObj1, Visitor visitorObj2) {
				return visitorObj2.getCheckInTime().compareTo(visitorObj1.getCheckInTime());
			}
		});
		Iterator<Visitor> vIt = visitorList.iterator();
		while (vIt.hasNext()) {
			Visitor vObj = vIt.next();
			System.out.println(vObj.getName() + " has checked In at :" + vObj.getCheckInTime());

		}
		model.addAttribute("todaysVisitors", visitorList);
		return "visitorHome";
	}

	@RequestMapping(value = "/showImage")
	public void showImage(@RequestParam("visitorId") int visitorId, @RequestParam("signRequired") int signRequired,
			HttpServletResponse response) throws IOException {

		try {
			Visitor visitorObj = visitorService.getVisitor(visitorId);

			if (signRequired == 1) {
				byte[] contentOfImage = visitorObj.getVisitorSign();
				if (contentOfImage != null) {
					response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
					response.getOutputStream().write(contentOfImage);
					response.getOutputStream().flush();
					response.getOutputStream().close();
				} else {
					System.out.println("Data of image(Visitor Sign) is null");

				}

			} else {
				byte[] contentOfImage = visitorObj.getVisitorPic();
				if (contentOfImage != null) {
					response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
					response.getOutputStream().write(contentOfImage);
					response.getOutputStream().flush();
					response.getOutputStream().close();

				} else {
				}
			}

		} catch (IOException e) {

		}
	}
	/*
	 * @RequestMapping(value = "/visitorCheckOut") public String
	 * visitorCheckOut(@RequestParam("visitorId") int visitorId) {
	 * 
	 * try { Visitor visitorObj = visitorService.getVisitor(visitorId);
	 * visitorObj.setCheckOutTime(new Date()); visitorObj.setCheckedOut(true);
	 * visitorService.saveVisitor(visitorObj);
	 * System.out.println("In visitorCheckOut" + visitorObj);
	 * 
	 * } catch (Exception e) { System.out.println("IOException :" + e);
	 * 
	 * } return "redirect:visitorHome"; }
	 */

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/getCarriedItems")
	public ResponseEntity<?> getCarriedItems(@RequestParam("visitorId") int visitorId) {
		List<Item> carriedItems = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {

			Visitor visitorObj = visitorService.getVisitor(visitorId);
			carriedItems = visitorObj.getItems();
			map.put("StatusCode", 200);
			map.put("IsSuccessful", true);
			map.put("Result", "success");
			map.put("carriedItems", carriedItems);
			if (carriedItems != null) {
				return new ResponseEntity<HashMap>(map, HttpStatus.OK);
			} else {
				map.put("StatusCode", 403);
				map.put("IsSuccessful", false);
				map.put("Result", "failed");
				return new ResponseEntity<HashMap>(map, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
		}
		map.put("StatusCode", 403);
		map.put("IsSuccessful", false);
		map.put("Result", "failed");
		return new ResponseEntity<HashMap>(map, HttpStatus.BAD_REQUEST);

	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/visitorCheckOut")
	public ResponseEntity<?> visitorCheckOut(@RequestParam("visitorId") int visitorId,
			@RequestParam("remark") String remark) {
		List<Item> carriedItems = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			Visitor visitorObj = visitorService.getVisitor(visitorId);
			visitorObj.setCheckOutTime(new Date());
			visitorObj.setCheckedOut(true);
			visitorObj.setRemark(remark);
			visitorService.saveVisitor(visitorObj);
			Visitor checkedOuVisitor = visitorService.getVisitor(visitorId);
			String visitorInfo = checkedOuVisitor.getName() + " has been checked out at "
					+ checkedOuVisitor.getCheckOutTime().getHours() + ":"
					+ checkedOuVisitor.getCheckOutTime().getMinutes() + " with remark :" + visitorObj.getRemark() + ".";
			map.put("StatusCode", 200);
			map.put("IsSuccessful", true);
			map.put("Result", "success");
			map.put("message", visitorInfo);
			if (visitorInfo != null) {
				return new ResponseEntity<HashMap>(map, HttpStatus.OK);
			} else {
				map.put("StatusCode", 403);
				map.put("IsSuccessful", false);
				map.put("Result", "failed");
				return new ResponseEntity<HashMap>(map, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {

		}
		map.put("StatusCode", 403);
		map.put("IsSuccessful", false);
		map.put("Result", "failed");
		return new ResponseEntity<HashMap>(map, HttpStatus.BAD_REQUEST);

	}

	@RequestMapping(value = "/generateVisitorIdCard")
	public String generateVisitorIdCard(@RequestParam("visitorId") int visitorId, Model model) {
		int noOfVisitors = visitorId + 1000;
		Visitor visitorObj = visitorService.getVisitor(visitorId);
		visitorObj.setVisitorIdCardNo("VID0" + noOfVisitors);
		visitorService.saveVisitor(visitorObj);
		model.addAttribute("visitorObj", visitorObj);
		model.addAttribute("visitorId", visitorObj.getVisitorIdCardNo());
		return "showVisitorIdCard";
	}
}
