package com.rt.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.rt.Login.User;

@Repository
public class UserDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public boolean saveUser(User user) {

        try {
        	Object args[] = { user.getName(),user.getEmail(),user.getMobile(),user.getPassword(),user.getRole()};

            int rs = jdbcTemplate.update("insert into newuser(name,email,mobile,password,role) values(?,?,?,?,?)",args);

            if (rs >= 1) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
   
    public User loginUser(String email, String password) {

        String sql = "select * from newuser where email=? and password=?";

        return jdbcTemplate.queryForObject(sql, new Object[]{email, password},
            (rs, rowNum) -> {
                User u = new User();
                u.setUserId(rs.getInt("userid")); 
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                return u;
            }
        );
    }
}
