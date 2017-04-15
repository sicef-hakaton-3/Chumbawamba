package com.mbakovic.template.core;

import com.mbakovic.template.model.News;
import org.apache.commons.lang3.tuple.Pair;

import java.util.Comparator;

public class NewsComparator implements Comparator<Pair<News, Float>>
{
    @Override
    public int compare(Pair<News, Float> o1, Pair<News, Float> o2) {
        return (int) (o1.getRight() - o2.getRight());
    }
}