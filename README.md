# Incremental Design and SOLID Design Principles
This is the code for a workshop on incremental design and SOLID design principles, primarily
Single Responsibility (S) and Dependency Inversion (D).


## Iteration Zero
Get your development environment set up and make sure it works.  Added a simple passing and failing test.

## Iteration 1
Create a CheckingAccount that allows us to view our current balance

## Iteration 2
Allow checks to be written and deposits to be made.

Now time to start thinking about some design decisions, like what happens if not enoungh funds.

*   return true/false
*   return an object or hash with more info 
*   nil or a message
*   raise an exception

For now, since we don't know too much about our system, let's keep it simple and return true/false
 
