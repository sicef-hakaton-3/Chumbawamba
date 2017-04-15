package com.mbakovic.template.api;

import com.mbakovic.template.core.UserCreateRequest;
import com.mbakovic.template.core.StatusResponse;
import com.mbakovic.template.model.User;
import com.mbakovic.template.model.UserCategory;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/users")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public interface UserService {

    @GET
    @Path("/")
    List<User> getAll();

    @GET
    @Path("/id/{id}")
    User getById(@PathParam("id") Integer id) throws NotFoundException;

    @GET
    @Path("/email/{email}")
    User getByEmail(@PathParam("email") String email) throws NotFoundException;

    @GET
    @Path("/categories/{id}")
    List<UserCategory> getCategories(@PathParam("id") int id) throws NotFoundException;

    @POST
    @Path("/")
    StatusResponse create(UserCreateRequest request);

}
