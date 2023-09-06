#!/usr/bin/env python
"""select by topic"""


def schools_by_topic(mongo_collection, topic):
    """find by topic"""
    school = {"topics": topic}
    result = mongo_collection.find(school)
    return list(result)
