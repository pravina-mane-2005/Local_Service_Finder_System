package com.rt.cntrl;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rt.DTO.RequestDTO;
import com.rt.Login.ServiceProvider;
import com.rt.Login.ServiceRequest;
import com.rt.Login.User;
import com.rt.service.ServiceProviderService;

@Controller

public class ServiceProviderController {

    @Autowired
    private ServiceProviderService providerService;

    // Show registration page
    @GetMapping("/provider_register")
    public String showRegisterPage() {
        return "index"; // JSP name
    }

    // Register provider
    @PostMapping("/providerRegister")
    public String register(ServiceProvider sp, RedirectAttributes redirectAttributes) {
        boolean success = providerService.registerProvider(sp);
        if(success) {
            redirectAttributes.addFlashAttribute("msg", "Registration Successful! Please Login.");
            return "redirect:/provider_login";  // go to login page
        } else {
            return "provider_register"; // stay on registration page
        }
    }
    // Show login page
    @GetMapping("/provider_login")
    public String showLoginPage() {
        return "provider_login";
    }

    // Login provider
    @PostMapping("/providerLogin")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        ServiceProvider sp = providerService.loginProvider(email, password);

        if(sp != null) {
            session.setAttribute("provider", sp);
            session.setAttribute("role", "provider");  
            return "index";
        } else {
            model.addAttribute("error", "Invalid Email or Password");
            return "provider_login";
        }
    }
    
    @PostMapping("/findServices")
    public String findServices(
            @RequestParam String service,
            @RequestParam String area,
            Model m) {

    	List<ServiceProvider> list =providerService.findProviders(service, area);

        if(list != null && !list.isEmpty()) {
            m.addAttribute("providers", list);
        } else {
            m.addAttribute("msg", "No Service Providers Found");
        }

        return "serviceResults";
    }
    @PostMapping("/sendRequest")
    @ResponseBody
    public String sendRequest(@RequestParam int providerId,
                              HttpSession session) {

        Object uidObj = session.getAttribute("loggedInUserId");
        Object emailObj = session.getAttribute("loggedInUserEmail");

        System.out.println("Session UserId Object: " + uidObj);
        System.out.println("Session Email Object: " + emailObj);

        if(uidObj == null) {
            return "User not logged in!";
        }

        Integer userId = (Integer) uidObj;
        String userEmail = (String) emailObj;

        int status = providerService.sendRequest(providerId, userId, userEmail);

        return "Inserted: " + status;
    }
    @GetMapping("/provider_dashboard")
    public String providerDashboard(HttpSession session, Model model) {

        String role = (String) session.getAttribute("role");
        ServiceProvider sp = (ServiceProvider) session.getAttribute("provider");
        Integer providerId = (sp != null) ? sp.getProviderId() : null;

        List<ServiceRequest> requests = providerService.getRequestsByRole(role, providerId);

        model.addAttribute("requests", requests);

        return "provider_dashboard_fragment";
    }


    @PostMapping("/updateRequestStatus")
    @ResponseBody
    public String updateRequestStatus(@RequestParam int requestId,
                                      @RequestParam String status) {

        providerService.updateRequestStatus(requestId, status);
        return "Request " + status + " Successfully";
    }
    // ---------------- User clicks bell ----------------
    @GetMapping("/userNotifications")
    @ResponseBody
    public List<RequestDTO> getUserNotifications(HttpSession session) {

        String email = (String) session.getAttribute("loggedInUserEmail");

        if(email == null) {
            System.out.println("User not logged in or session expired");
            return List.of();
        }

        return providerService.getNotificationsForUser(email);
    }

        @GetMapping("/providerProfile")
        public String viewProviderProfile(HttpSession session, Model model) {
            ServiceProvider provider = (ServiceProvider) session.getAttribute("provider");
            if(provider == null) return "redirect:/provider_login";
            model.addAttribute("provider", provider);
            return "provider_profile";
        }

        @PostMapping("/updateProviderProfile")
        public String updateProviderProfile(ServiceProvider updatedProvider, HttpSession session, Model model) {

            ServiceProvider loggedInProvider = (ServiceProvider) session.getAttribute("provider");

            if(loggedInProvider == null) return "redirect:/provider_login";

            // Only allow logged-in provider to update their profile
            if(loggedInProvider.getProviderId() != updatedProvider.getProviderId()) {
                model.addAttribute("error", "Cannot update another provider's profile!");
                model.addAttribute("provider", loggedInProvider);
                return "provider_profile";
            }

            boolean success = providerService.updateProvider(updatedProvider);

            if(success) {
                session.setAttribute("provider", updatedProvider); // update session
                model.addAttribute("msg", "Profile updated successfully!");
            } else {
                model.addAttribute("error", "Failed to update profile. Try again!");
            }

            model.addAttribute("provider", updatedProvider);
            return "provider_profile";
        }
        @GetMapping("/viewProfile")
        public String viewProfile(HttpSession session, Model model) {

            ServiceProvider provider =
                    (ServiceProvider) session.getAttribute("provider");

            if (provider == null) {
                return "provider_login";
            }

            model.addAttribute("provider", provider);

            return "provider_profile";   // JSP name correct
        }
        
		/*
		 * //ADmin panel
		 * 
		 * @GetMapping("/adminDashboard") public String adminDashboard(HttpSession
		 * session, Model model){
		 * 
		 * String role = (String) session.getAttribute("role");
		 * if(!"admin".equals(role)){ return "redirect:/accessDenied"; }
		 * 
		 * // 1️⃣ Users list List<User> users = userService.getAllUsers();
		 * model.addAttribute("users", users);
		 * 
		 * // 2️⃣ Service requests List<ServiceRequest> requests =
		 * providerService.getAllRequests(); model.addAttribute("requests", requests);
		 * 
		 * // 3️⃣ Dashboard stats int totalUsers = users.size(); int totalProviders =
		 * serviceProviderService.getAllProviders().size();
		 * model.addAttribute("totalUsers", totalUsers);
		 * model.addAttribute("totalProviders", totalProviders);
		 * 
		 * // JSP fragment for dynamic load (no full page reload return
		 * "admin_dashboard_fragment"; }
		 */

}






