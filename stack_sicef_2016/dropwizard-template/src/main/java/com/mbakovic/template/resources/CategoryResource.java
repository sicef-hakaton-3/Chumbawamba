package com.mbakovic.template.resources;

import com.mbakovic.template.api.CategoryService;
import com.mbakovic.template.db.CategoryDAO;
import com.mbakovic.template.model.Category;

import javax.ws.rs.NotFoundException;
import javax.ws.rs.PathParam;
import java.util.List;

/**
 * Created by DuX on 11/6/16.
 */
public class CategoryResource implements CategoryService {

    private final CategoryDAO categoryDAO;

    public CategoryResource(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    @Override
    public List<Category> getAll() {
        return categoryDAO.getAll();
    }

    @Override
    public Category getById(int id) throws NotFoundException {
        return categoryDAO.findById(id);
    }
}
