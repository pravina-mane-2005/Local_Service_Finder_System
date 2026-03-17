package com.rt.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.dao.ServiceProviderDao;
import com.fasterxml.jackson.databind.introspect.AccessorNamingStrategy.Provider;
import com.rt.DTO.RequestDTO;
import com.rt.Login.ServiceProvider;
import com.rt.Login.ServiceRequest;
import com.rt.Login.User;

@Service
public class ServiceProviderService {

    @Autowired
    private ServiceProviderDao providerDao;

    // Register provider
    public boolean registerProvider(ServiceProvider sp) {
        int result = providerDao.register(sp);
        return result > 0;
    }

    // Login check
    public ServiceProvider loginProvider(String email, String password) {
        return providerDao.login(email, password);
    }
 //  Find Services
    public List<ServiceProvider> findProviders(String serviceType, String city) {
        return providerDao.findByServiceAndCity(serviceType, city);
    }
    

    public int sendRequest(int providerId, int userId, String userEmail) {
        return providerDao.sendRequest(providerId, userId, userEmail);
    }
    public List<ServiceRequest> getRequestsByProviderId(int providerId) {
        return providerDao.getRequestsByProviderId(providerId);
    }

    public void updateRequestStatus(int requestId, String status) {
        providerDao.updateRequestStatus(requestId, status);
    }
    public List<ServiceRequest> getRequestsByEmail(String email) {

        return providerDao.getRequestsByUserEmail(email);

}
    // Fetch all requests for a user (by email)
    public List<RequestDTO> getNotificationsForUser(String userEmail) {
        return providerDao.getNotificationsForUser(userEmail);
    }
    public boolean updateProvider(ServiceProvider sp) {
        // Use DAO / repository to update DB
        try {
            return providerDao.update(sp); // implement DAO update
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public ServiceProvider getProviderById(int id) {
        return providerDao.getProviderById(id);
    }
    public List<ServiceRequest> getRequestsByRole(String role, Integer providerId) {

        if(role == null) {
            return List.of();
        }

        if("admin".equalsIgnoreCase(role)) {
            return providerDao.getAllRequests();
        } 
        else if("provider".equalsIgnoreCase(role) && providerId != null) {
            return providerDao.getRequestsByProviderId(providerId);
        } 
        else {
            return List.of();
        }
    }
    }
	/*
	 * //Admin methods
	 * 
	 * public List<User> getAllUsers() { return providerDao.getAllUsers(); }
	 * 
	 * public List<ServiceProvider> getAllProviders() { return
	 * providerDao.getAllProviders(); }
	 * 
	 * public List<ServiceRequest> getAllRequests() { return
	 * providerDao.getAllRequests(); }
	 * 
	 * public int getTotalUsers() { return getAllUsers().size(); }
	 * 
	 * public int getTotalProviders() { return getAllProviders().size(); }
	 * 
	 * public int getTotalRequests() { return getAllRequests().size(); }
	 */
    

    






