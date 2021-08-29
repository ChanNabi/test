***Settings***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections
Library         HttpLibrary.HTTP
Library         String
Library         BuiltIn
***Variables***
${Test_URL}  https://jsonplaceholder.typicode.com



***Test Cases***
TC_Get_005
    create session  Get_Details  ${Test_URL}
    ${resp}     Get Request   Get_Details     /users
  #  ${resp}=  get request  Get_Details  ${Test_URL}
    ${header}=  create dictionary  Content-Type=application/json
    Should Be Equal As Integers    ${resp.status_code}     200
   ${resp_content}   To JSON    ${resp.text}
   # ${resp_content}=  ${resp.json()}  ${resp.text}
    ${length}  get length      ${resp_content}


    log to console  ${resp.status_code}
    