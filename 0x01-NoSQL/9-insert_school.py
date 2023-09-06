#!/usr/bin/env python3
"""insert new thing in a collection"""


def insert_school(mongo_collection, **kwargs):
    """insert in mongo_collection"""
    doc_ = {}
    for key, value in kwargs.items():
        doc_[key] = value
    result = mongo_collection.insert_one(doc_)
    _id = result.inserted_id
    return _id
