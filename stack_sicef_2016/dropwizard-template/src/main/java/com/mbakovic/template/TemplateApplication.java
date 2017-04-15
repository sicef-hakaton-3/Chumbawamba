package com.mbakovic.template;

import com.mbakovic.template.auth.AuthUser;
import com.mbakovic.template.auth.UserAuthenticator;
import com.mbakovic.template.auth.UserAuthorizer;
import com.mbakovic.template.db.*;
import com.mbakovic.template.resources.AuthResource;
import com.mbakovic.template.resources.BasicResource;
import com.mbakovic.template.resources.NewsResource;
import com.mbakovic.template.resources.UserResource;
import io.dropwizard.Application;
import io.dropwizard.assets.AssetsBundle;
import io.dropwizard.auth.AuthDynamicFeature;
import io.dropwizard.auth.AuthValueFactoryProvider;
import io.dropwizard.auth.basic.BasicCredentialAuthFilter;
import io.dropwizard.bundles.assets.ConfiguredAssetsBundle;
import io.dropwizard.jdbi.DBIFactory;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import org.glassfish.jersey.server.filter.RolesAllowedDynamicFeature;
import org.skife.jdbi.v2.DBI;

public final class TemplateApplication extends Application<TemplateConfiguration> {

    public static void main(final String[] args) throws Exception {
        new TemplateApplication().run(args);
    }

    @Override
    public String getName() {
        return "template";
    }

    @Override
    public void initialize(final Bootstrap<TemplateConfiguration> bootstrap) {
        bootstrap.addBundle(new ConfiguredAssetsBundle("/assets", "/", "index.html"));
    }

    @Override
    public void run(final TemplateConfiguration configuration,
                    final Environment environment) throws ClassNotFoundException {
        // Database
        final DBIFactory factory = new DBIFactory();
        final DBI jdbi = factory.build(environment, configuration.getDataSourceFactory(), "mysql");
        final UserDAO userDAO = jdbi.onDemand(UserDAO.class);
        final NewsDAO newsDAO = jdbi.onDemand(NewsDAO.class);
        final SourceDAO sourceDAO = jdbi.onDemand(SourceDAO.class);
        final NewsLinkDAO newsLinkDAO = jdbi.onDemand(NewsLinkDAO.class);
        final UserCategoryDAO userCategoryDAO = jdbi.onDemand(UserCategoryDAO.class);


        // Auth
        environment.jersey().register(new AuthDynamicFeature(new BasicCredentialAuthFilter.Builder<AuthUser>()
                .setAuthenticator(new UserAuthenticator(userDAO))
                .setAuthorizer(new UserAuthorizer())
                .buildAuthFilter()));
        environment.jersey().register(new AuthValueFactoryProvider.Binder<>(AuthUser.class));
        environment.jersey().register(RolesAllowedDynamicFeature.class);

        // API
        final BasicResource basicResource = new BasicResource(configuration.getVersion());
        environment.jersey().register(basicResource);
        final UserResource userResource = new UserResource(userDAO, userCategoryDAO);
        environment.jersey().register(userResource);
        final AuthResource authResource = new AuthResource(userDAO);
        environment.jersey().register(authResource);
        final NewsResource newsResource = new NewsResource(newsDAO, newsLinkDAO, sourceDAO, userDAO, userCategoryDAO);
        environment.jersey().register(newsResource);
    }

}
