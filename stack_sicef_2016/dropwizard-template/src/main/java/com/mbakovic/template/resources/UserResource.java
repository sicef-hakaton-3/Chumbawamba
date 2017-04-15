package com.mbakovic.template.resources;

import com.mbakovic.template.api.UserService;
import com.mbakovic.template.core.UserCreateRequest;
import com.mbakovic.template.core.StatusResponse;
import com.mbakovic.template.db.UserCategoryDAO;
import com.mbakovic.template.model.User;
import com.mbakovic.template.db.UserDAO;
import com.mbakovic.template.model.UserCategory;

import javax.jws.soap.SOAPBinding;
import javax.ws.rs.NotFoundException;
import java.util.List;

public final class UserResource implements UserService {

    private final UserDAO userDAO;
    private final UserCategoryDAO userCategeryDAO;

    public UserResource(UserDAO userDAO, UserCategoryDAO userCategoryDAO) {
        this.userDAO = userDAO;
        this.userCategeryDAO = userCategoryDAO;
    }

    @Override
    public List<User> getAll() {
        return userDAO.getAll();
    }

    @Override
    public User getById(Integer id) throws NotFoundException {
        User user = userDAO.findById(id);
        if (user == null) {
            throw new NotFoundException();
        }
        return user;
    }

    @Override
    public User getByEmail(String email) throws NotFoundException {
        User user = userDAO.findByEmail(email);
        if (user == null) {
            throw new NotFoundException();
        }
        return user;
    }

    @Override
    public List<UserCategory> getCategories(int id) throws NotFoundException {
        List<UserCategory> categories = userCategeryDAO.getAllByUser(id);
        if (categories == null) {
            throw new NullPointerException();
        }
        return categories;
    }

    @Override
    public StatusResponse create(UserCreateRequest request) {
        if (userDAO.findByEmail(request.getEmail()) != null) {
            return new StatusResponse("email_exists");
        }
        Integer id = userDAO.insert(request.getEmail(), request.getPassword());

        List<UserCategory> allCategories = userCategeryDAO.getAll();
        for(UserCategory userCategory : allCategories) {
            userCategeryDAO.insert(id, userCategory.getCategory_id());
        }

        for (Integer categoryId : request.getCategories()) {
            userCategeryDAO.updateScoreCategory(id, categoryId, (float) 0.5);
        }

        return new StatusResponse("ok");
    }
}
