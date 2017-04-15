package com.mbakovic.template.resources;

import com.mbakovic.template.api.BasicService;

public final class BasicResource implements BasicService {

    private final String version;

    public BasicResource(String version) {
        this.version = version;
    }

    @Override
    public String version() {
        return version;
    }

    @Override
    public String ping() {
        return "pong";
    }
}
