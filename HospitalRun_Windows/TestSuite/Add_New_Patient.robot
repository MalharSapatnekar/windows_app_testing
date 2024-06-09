*** Settings ***
Resource    ${CURDIR}/../Resources/hospital.resource
Suite Setup       Start App
Test Teardown     Quit Application



*** Test Cases ***

Verify the patient info is entered and new patient is added
	[Tags]    TC_HOSP_RUN_WIN_1    HOSP_RUN_WIN_1
    Given user opens hospital run application
    When user adds a new patient with name John Doe
    Then the patient with name John Doe is added

