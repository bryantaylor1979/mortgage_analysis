 function loan_ammount = brcm_loan_estimation()
    %%
    Salary = 48410
    CashBonus = 3000; %Last year
    MySavings = 20000;
    Loan_Parents = 50000;
    total_rsu_granted = 25000 + 10300; % dollars
    
    rsu_bonus = calc_rsu(total_rsu_granted)
    espp_bonus = calc_espp(Salary)
    
    PercentageIncreasebyRSUs = round(espp_bonus/Salary*100);


    TotalBonus = CashBonus + rsu_bonus + espp_bonus
    YearlyIncome = Salary + TotalBonus
    loan_ammount = mortgageloan_calc(Salary,'bonus',TotalBonus)

    Loan2Value = 0.9; 
    SuggestedDeposit = round(loan_ammount*(1-Loan2Value))

    Deposit_Parents = SuggestedDeposit - MySavings
    Deposit_Total = MySavings + Loan_Parents;
    EstimateProjectBudget = loan_ammount + Deposit_Total
 end
 function bonus = calc_espp(Salary)
    % Calc ESPP
    ESPP_Sacrifice_Per = 0.15;
    ESPP_Discount = 0.3;
    bonus = Salary*ESPP_Sacrifice_Per*ESPP_Discount;
 end
 function bonus = calc_rsu(total_rsu_granted)
    RSUs_per_Year_Dollars = total_rsu_granted/4; % dollars
    USD_2_GBP = exchangerate('USD','GBP',datestr(today,'YYYY-mm-DD'));
    bonus = RSUs_per_Year_Dollars*USD_2_GBP;
 end