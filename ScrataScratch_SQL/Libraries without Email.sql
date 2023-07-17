/**
Link: https://platform.stratascratch.com/coding/9924-find-libraries-who-havent-provided-the-email-address-in-2016-but-their-notice-preference-definition-is-set-to-email?code_type=1
Level of Difficulty: Easy
Company: City of San Francisco

Question: 
Find libraries who haven't provided the email address in circulation year 2016 but their notice preference definition is set to email.
Output the library code.

Thought Process:
1. the result set should only include 1 column - library code
2. we can use the WHERE statement to filter by these conditions: 
   (1) circulation year = 2016
   (2) provided_email_address = FALSE
   (3) notice_preference_definition = 'email'

**/

Answer:
select distinct home_library_code
from library_usage
where circulation_active_year = 2016
and provided_email_address = FALSE 
and notice_preference_definition = 'email'












