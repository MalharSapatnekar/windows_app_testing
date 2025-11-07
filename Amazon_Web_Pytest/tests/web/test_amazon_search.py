import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

def test_search_product(browser):
    # Step 1: Launch Amazon.in
    browser.get("https://www.amazon.in/")
    time.sleep(2)

    # Step 2: Locate the search bar and enter query
    search_box = browser.find_element(By.ID, "twotabsearchtextbox")
    search_box.send_keys("Apple iPhone 14")
    search_box.send_keys(Keys.RETURN)
    time.sleep(3)

    # Step 3: Validate that search results are shown
    results = browser.find_elements(By.CSS_SELECTOR, "div.s-main-slot div[data-component-type='s-search-result']")
    assert len(results) > 0, "No search results found for Apple iPhone 14"

    # Step 4: Print first product title for verification
    first_product = results[0].find_element(By.CSS_SELECTOR, "a h2 span").text
    print(f"First search result: {first_product}")
    assert "iPhone 14" in first_product or "Apple" in first_product
