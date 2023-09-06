#!/usr/bin/env python3
"""update topic"""


def update_topics(mongo_collection, name, topics):
    """update topics based on the name"""
    school_name = {"name": name}
    update = {"$set": {"topics": topics}}
    mongo_collection.update_one(school_name, update)
