import pytest
from selenium import webdriver
from appium import webdriver as windriver
import yaml

@pytest.fixture(scope="session")
def web_config():
    with open("config/web_config.yaml") as f:
        return yaml.safe_load(f)

@pytest.fixture(scope="function")
def browser(web_config):
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.get(web_config["base_url"])
    yield driver
    driver.quit()

@pytest.fixture(scope="session")
def winapp_config():
    with open("config/win_config.yaml") as f:
        return yaml.safe_load(f)

@pytest.fixture(scope="function")
def win_driver(winapp_config):
    desired_caps = {
        "platformName": "Windows",
        "deviceName": "WindowsPC",
        "app": winapp_config["app_path"]
    }
    driver = windriver.Remote("http://127.0.0.1:4727", desired_caps)
    yield driver
    driver.quit()
