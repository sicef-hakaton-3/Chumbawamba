package com.mbakovic.template.api;

import com.mbakovic.template.model.News;
import com.mbakovic.template.model.NewsLink;
import com.mbakovic.template.model.Source;

import javax.annotation.security.RolesAllowed;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * Created by DuX on 11/6/16.
 */
@Path("/source")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public interface SourceService {

    @GET
    @Path("/")
    List<Source> getAll();

    @GET
    @Path("/id/{id}")
    Source getById(@PathParam("id") int id) throws NotFoundException;
}