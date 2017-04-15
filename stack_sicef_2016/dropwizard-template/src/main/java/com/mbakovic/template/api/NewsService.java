package com.mbakovic.template.api;

import com.mbakovic.template.auth.AuthUser;
import com.mbakovic.template.model.Category;
import com.mbakovic.template.model.News;
import com.mbakovic.template.model.NewsLinkSource;
import io.dropwizard.auth.Auth;

import javax.annotation.security.RolesAllowed;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/news")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public interface NewsService {

    @GET
    @Path("/")
    List<News> getAll();

    @GET
    @Path("/category")
    List<Category> getAllCategories();

    @GET
    @Path("/id/{id}")
    News getById(@PathParam("id") int id) throws NotFoundException;

    @GET
    @Path("/title/{title}")
    News getByTitle(@PathParam("title") String title) throws NotFoundException;

    @GET
    @Path("/category/{category}")
    List<News> getByCategory(@PathParam("category") int category_id) throws NotFoundException;

    @GET
    @Path("/links/{id}")
    List<NewsLinkSource> getNewsLinks(@PathParam("id") int id) throws NotFoundException;

    @GET
    @Path("/recommendedForUser/{id}")
    List<News> getRecommendedNewsForUser(@PathParam("id") int id) throws NotFoundException;

    @GET
    @Path("/recommendedForUser/{id}/{numNews}")
    List<News> getRecommendedNewsForUser(@PathParam("id") int id,
                                         @PathParam("numNews") int numNews) throws NotFoundException;

    @GET
    @Path("/similar/{id}")
    List<News> getSimilarNews(@PathParam("id") int id) throws NotFoundException;

    @GET
    @Path("/vote/plus/{id}")
    void votePlus(@Auth AuthUser authUser, @PathParam("id") int id) throws NotFoundException;

    @GET
    @Path("/vote/minus/{id}")
    void voteMinus(@Auth AuthUser authUser, @PathParam("id") int id) throws NotFoundException;

    @GET
    @Path("/vote/visited/{id}")
    void voteVisited(@Auth AuthUser authUser, @PathParam("id") int id) throws NotFoundException;

    @DELETE
    @Path("/{id}")
    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML, MediaType.TEXT_PLAIN})
    @RolesAllowed("role:admin")
    void delete(@PathParam("id") int id);

    @GET
    @Path("/fb/")
    News getNewsForFacebook() throws NotFoundException;

    @GET
    @Path("/fb/{category_id}")
    News getNewsForFacebook(@PathParam("category_id") int category_id) throws NotFoundException;
}