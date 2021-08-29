*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     BuiltIn
Library     String

*** Variables ***
${url}      https://jsonplaceholder.typicode.com

*** Test Cases ***
TC_Post_006
    Create Session    Inquiry    ${url}
    ${accept_type}=    Set Variable    application/json; charset=utf-8
    ${header}=  create dictionary  Content-Type=application/json
    ${body}=  create dictionary   userId=15   id=101   title=Testdata   body=quia et suscipi\nsuscipit recusand
    ${response}  Post Request   Inquiry  /posts   data=${body}   headers=${header}
   # ${response}  POST On Session   alias=Inquiry  url=/posts   data=${body}   headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

   #Validate
    ${res_body}=  Convert to String  ${response.content}
    ${status_code}=  Convert to String  ${response.status_code}
    Should Be Equal As Integers   ${response.status_code}     201
    ${data}=  Get Value From Json  ${response.json()}  $..userId
    Should Be Equal As Strings   ${data}[0]  15
    should Contain  ${res_body}  Testdata
  
    ${content_type_response}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${accept_type}    ${content_type_response}
