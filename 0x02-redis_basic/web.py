#!/usr/bin/env python3
""" Implementing an expiring web cache and tracker"""
import redis
import requests


def get_page(url: str) -> str:
    """get page content

    Args:
        url: str

    Returns:
        str(the page content)
    """
    key = f"count:{url}"
    r = redis.Redis()
    
    r.incr('Count')
    content = requests.get(url).text
    r.setex(key, 10, content)

    return content
