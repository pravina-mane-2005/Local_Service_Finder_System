package com.rt.cntrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/")
    public String indexPage() {
        return "first"; 
    }

    @RequestMapping("/uregister") 
    public String showUserRegister() {
        return "uregister"; 
    }

    @GetMapping("/userLogin") 
    public String showUserLogin() {
        return "userLogin"; 
    }

    @RequestMapping("/usersFirst")
    public String usersFirstPage() {
        return "usersFirst";  
    }
    
    @GetMapping("/index")
    public String showIndex() {
        return "index";
    }

}

    

