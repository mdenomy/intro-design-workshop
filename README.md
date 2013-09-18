# Incremental Design and SOLID Design Principles
This is the code for a workshop on incremental design and SOLID design principles, primarily
Single Responsibility (S) and Dependency Inversion (D).

*Note: all the iterations are available as separate git branches, except iteration-2 and iteration-9, which are git tags due to the author experiencing a brain cramp and not creating a feature branches for those iterations*

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

## Iteration 7
Checking account has a dependency on MinimumBalanceFee.  Instead of depending on a minimum balance fee, and needing to know how it is constructed, what if we just depended on something more abstract that has an apply method that knows how to calculate a fee based on the account.

We have inverted the dependency, now the high level module (CheckingAccount) is no longer dependent on a lower level module (LowBalanceFee).  In fact both are dependent on abstractions
CheckingAccount depends on something that can *apply* a fee
MinimumBalanceFee depends on something that can provide a *balance*

The mechanism that we used to do this was *dependency injection*.  We injected the low level dependency into the high level module.

This has the added benefit of making our tests less brittle, and in fact even renders some of the tests obsolete, which we will address in the next iteration

## Iteration 8
The tests in CheckingAccount for student account and big spender don't add any value that isn't addressed by the default case, since the CheckingAccount now doesn't need to know about MinimumBalanceFee.

Deleting code should feel good.

## Iteration 9
Bank still isn't making enough money.  Decides to charge an online banking fee.

Decide to use a generic flat fee, since nothing really special about the online banking fee, i.e. doesn't check that we used it or how often we used it

## Iteration 10
Before we get into integrating more fees, something has been bugging me.  I don't like the name 'apply' on the Fees.  It isn't really applying anything.  Naming things is important, especially when defining your interfaces.  How about calculate, that suits me better.
 
## Iteration 11
Noticed that the fees have different calculate signatures.  One takes an argument (account) one takes no arguments.

Are these the same interface....I think they are.  My intention is that these are fees that know how to calculate the penalty given an account.  The fact that the flat fee doesn't need any account into may make it something of an outlier, but I am going to argue that adding the account to the signature is not a big deal.  You are free to disagree, but that is how I am going to handle it.

So I changed the signature of FlatFee's calculate to take an account.
 
## Iteration 12
Now we can change account to take multiple fees on creation.

Notice that account now doesn't need to require any fee files

## Iteration 13
No reason to include any concrete fees in the checking account test class.  Having them there unnecessarily couples them and makes them more brittle.

Now we are using mocks, is that better or worse.  In this case I think it is better, but understand what you are getting into.  In this case I want to not be coupled to particular fees, but I have also lost some "integration" test coverage.

## Iteration 14
Can create a sample application that shows accounts for different clients.

All the logic for what fees are applied is outside of the CheckingAccount, can use a factory to construct the accounts.





