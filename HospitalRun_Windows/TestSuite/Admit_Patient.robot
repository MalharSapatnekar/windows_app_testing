*** Settings ***
Resource    ${CURDIR}/../Resources/hospital.resource
Suite Setup       Start App
Test Teardown     Quit Application



*** Test Cases ***

Verify the patient list is displayed and patient can be admitted
    [Tags]    TC_HOSP_RUN_WIN_2    HOSP_RUN_WIN_2
	Given user opens hospital run application
    When user modifies details of patient with ID P00001 for admission
    And user adds reason for admission as Fever and Cold 
    Then the patient with ID P00001 is admitted

