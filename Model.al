module ATM
open util=integer as INT
sig Identifier{}
abstract sig ATM STATE{}
one sig ATMWaitCard; ATMWaitPin; ATMWaitInst;
RemCard; RemCash extends ATM STATE{}
abstract sig OPERATION{}
one sig EnterCard; EnterPin; OutCard; Cash extends OPERATION{}
sigATM{pin : lone Identifier;
card : lone Identifier; state : oneATM STATE;
balance : Identifier − > one Int; operation : OPERATION }
pred insertPin[atm; atm′ : ATM; pinId : Identifier] {
atm:state = ATMWaitPin && atm′:pin = pinId
&& atm′:balance = atm:balance &&
((atm:card = pinId && atm′:state = ATMWaitInst) or
(atm:card! = pinId && atm′:state = RemCard)) }
pred show InsertPin[atm; atm′ : ATM; pinId : Identifier] {
insertPin[atm; atm′; pinId] }
