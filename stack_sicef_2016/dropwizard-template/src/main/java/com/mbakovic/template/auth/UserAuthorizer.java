package com.mbakovic.template.auth;

import io.dropwizard.auth.Authorizer;

public final class UserAuthorizer implements Authorizer<AuthUser> {
    @Override
    public boolean authorize(AuthUser authUser, String role) {
        return authUser.getRoles() != null && authUser.getRoles().contains(role);
    }
}
