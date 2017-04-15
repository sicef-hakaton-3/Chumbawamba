package com.mbakovic.template.resources;

import com.mbakovic.template.api.AuthService;
import com.mbakovic.template.core.AuthRequest;
import com.mbakovic.template.core.StatusResponse;
import com.mbakovic.template.model.User;
import com.mbakovic.template.db.UserDAO;

public final class AuthResource implements AuthService {

    private final UserDAO userDAO;

    public AuthResource(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public StatusResponse authenticate(AuthRequest request) {
        User user = userDAO.findByEmail(request.getEmail());
        if (user == null) {
            return new StatusResponse("email_not_found");
        }
        String password = userDAO.getPasswordById(user.getId());
        if (!password.equals(request.getPassword())) {
            return new StatusResponse("incorrect_password");
        }
        return new StatusResponse("ok");
    }
}
