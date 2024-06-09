*** Settings ***
Resource    ${CURDIR}/../Resources/hospital.resource
Suite Setup       Start App
Test Teardown     Quit Application



*** Test Cases ***
Verify the patient list is displayed and request is made for x-ray imaging
	[Tags]    TC_HOSP_RUN_WIN_3    HOSP_RUN_WIN_3
    Given user opens hospital run application
    When user modifies details of patient with ID P00002 for imaging
    And user adds imaging Type as X-Ray  
    Then the X-Ray imaging is requested for patient
