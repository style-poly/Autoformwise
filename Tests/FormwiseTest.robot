*** Settings ***
Documentation    This is the test for auto-fill formwise
Resource       ../Input/Input.robot

Library    SeleniumLibrary
Library    ExcelLibrary
Library    Collections
#robot -d result Tests/*robot

*** Test Cases ***
TC01
    Test1

*** Keywords ***
Test1
    open browser    about:blank      chrome
    maximize browser window
#    set selenium speed    0
    FOR     ${index}     IN RANGE    1   4
    #This forloop is to collect number of rows from my excel sheet
        open excel document    Input/TestData.xlsx      useTempDir=False
        ${index} =  evaluate    ${index}+1
        ${rowdata}  read excel row    row_num=${index}     col_offset=1    max_num=13       sheet_name=FormData
        close all excel documents
        go to    https://demoqa.com/automation-practice-form
        wait until element is visible   ${first_name}   timeout=10s
        input text    ${first_name}     ${rowdata}[0]
        input text    ${last_name}      ${rowdata}[1]
        input text    ${email_id}       ${rowdata}[2]
#        Radio button for Gender with if else
        IF      '${rowdata}[3]' == '${listgender}[0]'
        click element   //label[contains(text(),'Male')]
        ELSE IF     '${rowdata}[3]' == '${listgender}[1]'
        click element    //label[contains(text(),'Female')]
        ELSE
        click element    //label[contains(text(),'Other')]
        END
        input text    ${mobile_num}     ${rowdata}[4]
        click element    ${adclose}
        scroll element into view    ${submit}
        click element    ${dob}
        select from list by value    ${yearselector}    ${rowdata}[5]
        select from list by value    ${monthselector}   ${rowdata}[6]
        click element    ${datepicker}/div[text()='${rowdata}[7]']
        click element    ${subject}
        press keys    ${subject}        ${rowdata}[8]     RETURN
#        click element     ${hobbies}
        IF      '${rowdata}[9]' == '${listhobbies}[0]'
        click element    //label[contains(text(),'Sports')]
        ELSE IF         '${rowdata}[9]' == '${listhobbies}[1]'
        click element    //label[contains(text(),'Reading')]
        ELSE
        click element    //label[contains(text(),'Music')]
        END
        input text      ${currentAddress}       ${rowdata}[10]
        click element    ${state}
        press keys    ${state}          ${rowdata}[11]       RETURN
        set selenium speed    0.5
        click element    ${city}
        press keys    ${city}     ${rowdata}[12]        RETURN
        set selenium speed    0
        click button    ${submit}
#        sleep    2s
        # Add pop up checking code here
        wait until element is visible    ${modal}      timeout=10s
        click element    css=#closeLargeModal
        sleep    5s
        # Write data to excel
        open excel document    Input/TestData.xlsx      useTempDir=True
        write excel column    col_num=15    col_data=${rowdata}    row_offset=1  sheet_name=FormData
        close all excel documents
    END
    close browser
