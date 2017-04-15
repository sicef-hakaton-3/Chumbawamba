package com.mbakovic.template.api;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Produces(MediaType.TEXT_PLAIN)
public interface BasicService {

    @GET
    @Path("/version")
    String version();

    @GET
    @Path("/ping")
    String ping();


}
