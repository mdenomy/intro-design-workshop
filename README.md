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

> A private method is a class waiting to happen - Corey Hanes?

IMO, this private method isn't interesting enough yet…but sit tight

## Iteration 3
Bank needs to make money.  Interest rates are low, so how can the bank get money....fees

Add a method to apply_fees to the bank account and charge a fee of $5 if the balance is less than 500 dollars

Also refactored it a bit to add another private method.  

Questions: What is our checking account doing now, deposit, processing checks, and applying fees.  What happens if fee algorithm changes....we need to change the CheckingAccount.

Let's tackle that in our next few iterations.

## Iteration 4
Now we have a CheckingAccount that manages a balance AND applies balance.

Single responsibility says a class should only have 1 reason to change.  If we decide that the way we calculate fees changes the checking account will change as well.

Things are a *little* better, but CheckingAccount is still tightly coupled to Fees, it defines the minimum balance and penalty.  What if we had 2 levels of accounts, e.g. a Student account with a minimum balance of $100 and a BigDeal account with a minimum balance of $1000.  How would we do that

## Iteration 5
We decided to have the checking account initialize method take a level, the tests pass, it works...but YUCK.

## Iteration 6
We cleaned things up a little, and maybe we think things are "better" but we haven't solved the fundamental issue.  

*  Checking account still knows too much about things that are not about a checking account.
*  Tests are brittle
*  Things are only going to get worse





