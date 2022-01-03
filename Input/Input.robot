*** Settings ***
Documentation    This is the input file for formwise

*** Variables ***
${mobile_num} =		xpath=//input[@placeholder='Mobile Number']
${first_name} =		css=#firstName
${last_name} =		css=#lastName
${email_id} =		css=#userEmail
${dob} =		    css=#dateOfBirthInput
${subject} =		css=.subjects-auto-complete__value-container
${currentAddress} =	    id=currentAddress
${state} =		xpath=//div[contains(text(),'Select State')]
${city} =		css=#city
${submit} =		css=#submit
${hobbies} =    //label[contains(text(),'Reading')]
${radio} =      //label[contains(text(),'Female')]
@{listgender} =     Male    Female  Other
@{listhobbies} =    Sports  Reading  Music
${yearselector} =   css=.react-datepicker__year-select
${monthselector} =  css=.react-datepicker__month-select
${datepicker} =     //div[@class='react-datepicker__week']
${adclose} =    css=#close-fixedban
${blank} =
${modal} =      xpath=//div[contains(text(),'Thanks for submitting the form')]
${flag} =       Success