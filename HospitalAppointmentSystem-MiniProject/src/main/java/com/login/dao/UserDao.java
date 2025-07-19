package com.login.dao;

import com.login.model.User;

public interface UserDao {
    User getUserByCredentials(String username, String password);
}
