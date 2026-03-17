package com.rt.cntrl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.rt.Login.Login;
import com.rt.service.LoginService;

@Controller
public class LoginController {

    @Autowired
   LoginService loginService;

    @GetMapping("/login")
    public String showLoginPage(Model model) {
        model.addAttribute("login", new Login());
        return "login";
    }
    
   @PostMapping("/login")
    public String loginUser( @ModelAttribute("login") Login login, Model model) {

        boolean status = loginService.loginUser(login);

        if (status) {
            return "index";
        } else {
            model.addAttribute("error", "Invalid Username or Password");
            return "login";
        }
    }
   
   
}
