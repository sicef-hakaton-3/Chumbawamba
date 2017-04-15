package com.mbakovic.template.resources;

import com.mbakovic.template.api.SourceService;
import com.mbakovic.template.db.NewsDAO;
import com.mbakovic.template.db.NewsLinkDAO;
import com.mbakovic.template.db.SourceDAO;
import com.mbakovic.template.model.News;
import com.mbakovic.template.model.Source;

import javax.ws.rs.NotFoundException;
import javax.ws.rs.PathParam;
import java.util.List;

/**
 * Created by DuX on 11/6/16.
 */
public class SourceResource implements SourceService {

    private final SourceDAO sourceDAO;

    public SourceResource(SourceDAO sourceDAO) {
        this.sourceDAO = sourceDAO;
    }

    @Override
    public List<Source> getAll() {
        return sourceDAO.getAll();
    }

    @Override
    public Source getById(int id) throws NotFoundException {
        return sourceDAO.getById(id);
    }
}
