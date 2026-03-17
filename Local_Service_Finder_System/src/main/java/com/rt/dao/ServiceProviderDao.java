package com.rt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.rt.DTO.RequestDTO;
import com.rt.Login.ServiceProvider;
import com.rt.Login.ServiceRequest;
import com.rt.Login.User;

@Repository
public class ServiceProviderDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Register
    public int register(ServiceProvider sp) {

        String sql ="INSERT INTO service_provider " +
                "(name,email,password,service_type,city,phone,experience,status) " +
                "VALUES (?,?,?,?,?,?,?,?)";

        return jdbcTemplate.update(sql,
                sp.getName(),
                sp.getEmail(),
                sp.getPassword(),
                sp.getServiceType(),
                sp.getCity(),
                sp.getPhone(),
                sp.getExperience(),
                1);
    }

    // Login
    public ServiceProvider login(String email, String password) {

        String sql = "SELECT * FROM service_provider WHERE email=? AND password=? AND status=1";

        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{email, password},
                    (rs, rowNum) -> {
                        ServiceProvider sp = new ServiceProvider();
                        sp.setProviderId(rs.getInt("provider_id"));
                        sp.setName(rs.getString("name"));
                        sp.setEmail(rs.getString("email"));
                        sp.setServiceType(rs.getString("service_type"));
                        sp.setCity(rs.getString("city"));
                        sp.setPhone(rs.getString("phone"));
                        return sp;
                    });
        } catch (Exception e) {
            return null;
        }
    }
 // Find Providers
    public List<ServiceProvider> findByServiceAndCity(String service, String city) {

        String sql = "SELECT * FROM service_provider " +
                     "WHERE service_type=? AND city=? AND status=1";

        return jdbcTemplate.query(sql,
                new Object[]{service, city},
                (rs, rowNum) -> {

                    ServiceProvider sp = new ServiceProvider();
                    sp.setProviderId(rs.getInt("provider_id"));
                    sp.setName(rs.getString("name"));
                    sp.setEmail(rs.getString("email"));
                    sp.setServiceType(rs.getString("service_type"));
                    sp.setCity(rs.getString("city"));
                    sp.setPhone(rs.getString("phone"));
                    sp.setExperience(rs.getInt("experience"));
                    sp.setStatus(rs.getInt("status"));

                    return sp;
                });
    }
    public int sendRequest(int providerId, int userId, String userEmail) {

        String sql = "INSERT INTO service_request (provider_id, user_id, user_email, status) " +
                     "VALUES (?, ?, ?, ?)";

        return jdbcTemplate.update(sql, providerId, userId, userEmail, "Pending");
    }

    public List<ServiceRequest> getRequestsByProviderId(int providerId) {

        String sql = "SELECT * FROM service_request WHERE provider_id=?";

        return jdbcTemplate.query(sql,
                new BeanPropertyRowMapper<>(ServiceRequest.class),
                providerId);
    }

    public void updateRequestStatus(int requestId, String status) {

        String sql = "UPDATE service_request SET status=? WHERE id=?";

        jdbcTemplate.update(sql, status, requestId);
    }
    public List<ServiceRequest> getRequestsByUserEmail(String email) {

        String sql = "SELECT * FROM service_request WHERE user_email=? ORDER BY id DESC";

        return jdbcTemplate.query(sql,
                new BeanPropertyRowMapper<>(ServiceRequest.class),
                email);
    }

    public boolean update(ServiceProvider sp) {
        String sql = "UPDATE service_provider SET name=?, email=?, phone=?, service_type=?, city=?, experience=?, status=? WHERE provider_id=?";
        try {
            int rows = jdbcTemplate.update(sql,
                    sp.getName(),
                    sp.getEmail(),
                    sp.getPhone(),
                    sp.getServiceType(),
                    sp.getCity(),
                    sp.getExperience(), // integer
                    sp.getStatus(),     // string
                    sp.getProviderId()); // id column in your DB
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    // 🔥 Get Provider By ID
    public ServiceProvider getProviderById(int id) {

        String sql = "SELECT * FROM service_provider WHERE id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                new Object[]{id},
                (rs, rowNum) -> {

                    ServiceProvider sp = new ServiceProvider();

                    sp.setProviderId(rs.getInt("id"));
                    sp.setName(rs.getString("name"));
                    sp.setEmail(rs.getString("email"));
                    sp.setPhone(rs.getString("phone"));
                    sp.setCity(rs.getString("city"));
                    sp.setServiceType(rs.getString("service_type"));
                    sp.setExperience(rs.getInt("experience"));
                    sp.setStatus(rs.getInt("status"));

                    return sp;
                }
        );
    }
 // 🔔 Notification sathi provider email gheun
    public List<RequestDTO> getNotificationsForUser(String userEmail) {

        String sql =
            "SELECT r.id, r.status, p.email AS provider_email " +
            "FROM service_request r " +
            "JOIN service_provider p ON r.provider_id = p.provider_id " +
            "WHERE r.user_email = ? " +
            "ORDER BY r.id DESC";

        return jdbcTemplate.query(
                sql,
                new Object[]{userEmail},
                (rs, rowNum) ->
                    new RequestDTO(
                            rs.getInt("id"),
                            rs.getString("status"),
                            rs.getString("provider_email")
                    )
        );
    }
    public List<ServiceRequest> getAllRequests() {
        String sql = "SELECT * FROM service_request";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ServiceRequest.class));
    }
    
    //Admin methods
    // 🔹 Get all users
    public List<User> getAllUsers() {
        String sql = "SELECT * FROM users"; // user table as per your DB
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    // 🔹 Get all service providers
    public List<ServiceProvider> getAllProviders() {
        String sql = "SELECT * FROM service_provider WHERE status=1";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ServiceProvider.class));
    }
	/*
	 * // 🔹 Get all service requests public List<ServiceRequest> getAllRequests1()
	 * { String sql = "SELECT * FROM service_request ORDER BY id DESC"; return
	 * jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ServiceRequest.class)); }
	 */
    


        // Total Users
        public int countUsers() {
            String sql = "SELECT COUNT(*) FROM users";
            return jdbcTemplate.queryForObject(sql, Integer.class);
        }

        // Total Service Providers
        public int countProviders() {
            String sql = "SELECT COUNT(*) FROM service_providers";
            return jdbcTemplate.queryForObject(sql, Integer.class);
        }

        // Requests count by status
        public int countRequestsByStatus(String status) {
            String sql = "SELECT COUNT(*) FROM service_requests WHERE status = ?";
            return jdbcTemplate.queryForObject(sql, new Object[]{status}, Integer.class);
        }

        // Recent requests (limit)
        public List<Map<String,Object>> getRecentRequests(int limit) {
            String sql = "SELECT sr.id, u.name as userName, sr.service, sp.name as providerName, sr.status, sr.request_date " +
                         "FROM service_requests sr " +
                         "JOIN users u ON sr.user_id = u.id " +
                         "JOIN service_providers sp ON sr.provider_id = sp.id " +
                         "ORDER BY sr.request_date DESC LIMIT ?";
            return jdbcTemplate.queryForList(sql, limit);
        }
    }






	


