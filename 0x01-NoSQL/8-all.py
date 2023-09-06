#!/usr/bin/env python3
"""list all documents in python"""


def list_all(mongo_collection):
    """all mongo collection"""
    docs = []
    if not mongo_collection.find():
        return []
    docs = mongo_collection.find()
    return docs
