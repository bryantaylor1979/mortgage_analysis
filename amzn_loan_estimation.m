function amzn_loan_estimation()
    %% 
    old_loan_amount = brcm_loan_estimation()
    
    Salary = 68000
    CashBonus = 14000; %Last year
    MySavings = 60000; % i gave 20,000 for deposit and i now have 40,000
    Loan_Parents = 50000;
    
    numberofshares_granted = 215; % dollars
    shares_bonus = shares_calc(numberofshares_granted)

    TotalBonus = CashBonus + shares_bonus
    YearlyIncome = Salary + TotalBonus
    loan_ammount = mortgageloan_calc(Salary,'bonus',TotalBonus)

    Loan2Value = 0.9; 
    SuggestedDeposit = round(loan_ammount*(1-Loan2Value))

    Deposit_Total = MySavings + Loan_Parents;
    EstimateProjectBudget = loan_ammount + Deposit_Total
    
    
   increase_in_budget = round(loan_ammount - old_loan_amount)
end
function shares_bonus = shares_calc(numberofshares_granted)  
    DATASET = getYahooQuery({'amzn'},{'a'});
    TotalSharePriceDollars = DATASET.a*numberofshares_granted
    USD_2_GBP = exchangerate('USD','GBP',datestr(today,'YYYY-mm-DD'));
    TotalSharePricePounds = TotalSharePriceDollars*USD_2_GBP
    shares_bonus = TotalSharePricePounds/2;
end