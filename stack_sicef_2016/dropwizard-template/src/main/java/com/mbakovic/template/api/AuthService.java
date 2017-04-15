package com.mbakovic.template.api;

import com.mbakovic.template.core.AuthRequest;
import com.mbakovic.template.core.StatusResponse;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/authenticate")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public interface AuthService {

    @POST
    StatusResponse authenticate(AuthRequest request);
}
