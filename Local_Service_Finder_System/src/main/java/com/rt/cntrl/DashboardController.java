package com.rt.cntrl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rt.dao.ServiceProviderDao;

@Controller
public class DashboardController {

    @Autowired
    private ServiceProviderDao serviceProviderDao;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        int totalUsers = serviceProviderDao.countUsers();
        int totalProviders = serviceProviderDao.countProviders();
        int pendingRequests = serviceProviderDao.countRequestsByStatus("Pending");
        int completedRequests = serviceProviderDao.countRequestsByStatus("Completed");
        List<Map<String,Object>> recentRequests = serviceProviderDao.getRecentRequests(5);

        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalProviders", totalProviders);
        model.addAttribute("pendingRequests", pendingRequests);
        model.addAttribute("completedRequests", completedRequests);
        model.addAttribute("recentRequests", recentRequests);

        return "dashboard"; // dashboard.jsp
    }
}