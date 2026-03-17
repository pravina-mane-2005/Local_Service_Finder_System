package com.rt.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.rt.Login.Login;

@Repository
public class LoginDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Login validateUser(String username, String password) {

        String sql =
            "select username, password from userinfo where username=? and password=?";

        Object[] args = { username, password };

        try {
            return jdbcTemplate.queryForObject(sql, args,new RowMapper<Login>() {
                        @Override
                        public Login mapRow(java.sql.ResultSet rs, int rowNum)
                                throws java.sql.SQLException {

                            Login login = new Login();
                            login.setUsername(rs.getString("username"));
                            login.setPassword(rs.getString("password"));
                            return login;
                        }
                    }
            );
        } catch (Exception e) {
            return null; 
        }
    }
    
}
