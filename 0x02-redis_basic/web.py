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
    r = redis.Redis()

    content = requests.get(url).text
    r.setex(f"count:{url}", 10, f"{content}")

    return content
