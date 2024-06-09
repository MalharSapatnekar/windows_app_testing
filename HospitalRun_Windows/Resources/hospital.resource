*** Settings ***
Documentation     ApplicationLibrary Desktop Library Tests.
Library           ApplicationLibrary.DesktopLibrary
Resource		 ${CURDIR}/../Variables/Variables.resource



*** Keywords ***
Start App
    [Documentation]     Sets up the application for quick launching through 'Launch Application' and starts the winappdriver
    Driver Setup
    Open Application    ${REMOTE_URL}     platformName=Windows    deviceName=Windows   app=${HospitalRunApp}    alias=Main
    Maximize Window
    Quit Application


user opens hospital run application
    Launch Application
    Maximize Window



When user adds a new patient with name ${first_name} ${last_name}

    Wait For And Click Element       accessibility_id=ember498
    Wait For And Click Element       accessibility_id=ember950
    Wait For And Click Element       xpath=//Edit[@Name="First Name *"]
    Send Keys        ${first_name}
    Wait For And Click Element       xpath=//Edit[@Name="Last Name *"]
    Send Keys        ${last_name}
    # Mouse Over Element     xpath=//Edit[@Name="Last Name *"]
    # Click A Point    1220    550
    # Click A Point    -50    50  
    Wait For And Click Element    xpath=//Edit[@Name="Phone"]
    Send Keys        123
    FOR    ${index}    IN RANGE    5
         Send Keys    \ue004
    END    
    Send Keys    \ue007



the patient with name ${first_name} ${last_name} is added
    Wait Until Element Is Visible    name=${first_name} ${last_name}

user modifies details of patient with ID ${ID} for admission
    Wait For And Click Element       accessibility_id=ember498
    Wait For And Click Element       accessibility_id=ember906
    Wait For And Click Element       xpath=//Table//Custom//DataItem//Text[@Name="${ID}"]
    Wait For And Click Element       xpath=//Tab//TabItem[@Name="Visits"]
    Wait For And Click Element       xpath=//Button[@Name=" New Visit"]
    Wait For And Click Element       xpath=//Edit[@Name="Reason For Visit"]
   

user adds reason for admission as ${Reason}
    Send Keys        ${Reason}
    FOR    ${index}    IN RANGE    2
         Send Keys    \ue004
    END    
    Send Keys    \ue007
    Click A Point    

the patient with ID ${ID} is admitted
    Wait For And Click Element       accessibility_id=ember909
    Wait Until Element Is Visible    name=${ID}



user modifies details of patient with ID ${ID} for imaging
    Wait For And Click Element       accessibility_id=ember498
    Wait For And Click Element       accessibility_id=ember906
    Wait For And Click Element       xpath=//Table//Custom//DataItem//Text[@Name="${ID}"]
    Wait For And Click Element       xpath=//Tab//TabItem[@Name="Imaging"]
    Wait For And Click Element       xpath=//Button[@Name=" New Imaging"]
    Wait For And Click Element       accessibility_id=imagingTypeName-ember1985

user adds imaging Type as ${type}  
    Send Keys        ${type}  
    FOR    ${index}    IN RANGE    5
         Send Keys    \ue004
    END    
    Send Keys    \ue007
  
the ${type} imaging is requested for patient
   Wait For And Click Element       accessibility_id=ember560
   Wait Until Element Is Visible    name=${type}




