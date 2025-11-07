import pytest
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException

def wait_for_element(driver, by, value, timeout=10):
    return WebDriverWait(driver, timeout).until(
        lambda d: d.find_element(by, value)
    )

# @pytest.mark.sm
# @pytest.mark.metadata(requirement='REQ_1', testcase_id='TC_001')
def test_patient_entry(win_driver):

	try:
		patient_menu = wait_for_element(win_driver, "accessibility id", "ember498")
		patient_menu.click()

		new_patient_button = wait_for_element(win_driver, "accessibility id", "ember950")
		new_patient_button.click()

		# Patient entry
		first_name_field = wait_for_element(win_driver, "xpath", '//Edit[@Name="First Name *"]')
		first_name_field.send_keys("John")

		last_name_field = wait_for_element(win_driver, "xpath", '//Edit[@Name="Last Name *"]')
		last_name_field.send_keys("Doe")
	except TimeoutException:
		pytest.fail("Element not found within timeout")
