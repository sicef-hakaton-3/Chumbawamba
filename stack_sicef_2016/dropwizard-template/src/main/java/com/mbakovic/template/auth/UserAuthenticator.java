package com.mbakovic.template.auth;

import com.google.common.base.Optional;
import com.google.common.collect.ImmutableSet;
import com.mbakovic.template.model.User;
import com.mbakovic.template.db.UserDAO;
import io.dropwizard.auth.AuthenticationException;
import io.dropwizard.auth.Authenticator;
import io.dropwizard.auth.basic.BasicCredentials;

import java.util.Set;

public final class UserAuthenticator implements Authenticator<BasicCredentials, AuthUser> {

    private final UserDAO userDAO;

    public UserAuthenticator(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    private Set<String> getRoles(String email) {
        return ImmutableSet.of("role:admin");
    }

    @Override
    public Optional<AuthUser> authenticate(BasicCredentials credentials) throws AuthenticationException {
        User user = userDAO.findByEmail(credentials.getUsername());
        if (user == null) {
            return Optional.absent();
        }
        String password = userDAO.getPasswordById(user.getId());
        if (password.equals(credentials.getPassword())) {
            return Optional.of(new AuthUser(user.getEmail(), getRoles(user.getEmail())));
        } else {
            return Optional.absent();
        }
    }
}
