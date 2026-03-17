package com.rt.cntrl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rt.Login.User;
import com.rt.service.UserService;

@Controller
public class UserLoginController {


    @Autowired
    private UserService userService;
    @PostMapping("/userLogin")
    public String loginUser(@RequestParam String email,
                            @RequestParam String password,
                            HttpSession session,
                            Model m) {

        User user = userService.loginUser(email, password);

        if(user != null) {

         	session.setAttribute("loggedInUserEmail", user.getEmail());
            session.setAttribute("loggedInUserPhone", user.getMobile());
            session.setAttribute("loggedInUserId", user.getUserId()); 
            return "redirect:/index";   

        } else {

            m.addAttribute("error", "Invalid Email or Password");
            return "userLogin";
        }
    }

  
    @PostMapping("/uregister")
    public String saveUser(@ModelAttribute User user, Model m){
		boolean isAdded =userService.saveUser(user);
		if(isAdded) {
			m.addAttribute("done","User Added Successfully..");
		}else {
			m.addAttribute("undone","Unable To Add User");
		}
		return "uregister";
		
	}
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();   // session destroy
        return "redirect:/userLogin";    // login page la redirect
    }
}



