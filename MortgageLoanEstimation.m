classdef MortgageLoanEstimation < handle
    properties (SetObservable = true)
        ESPP_Sacrifice_Per = 0.15;
        ESPP_Discount = 0.3;
        Salary = 48410
        CashBonus = 3000; %Last year
        Grant_RSU = 25000 + 10300;
        PercentageIncreasebyRSUs
        USD_2_GBP = 0.6355
        RSU_per_Year = 5250;
        Salary_Multiple = 4.5
        Bonus_Multiple = 0.5
        Deposit_Total
        Deposit_Me = 20000;
        Deposit_Parents = 0;
        Loan_Parents = 50000;
        Loan2Value = 0.9;
        GuareenteedEquivalentSalary
        
        ESPP_Profit
        TotalEquivalentBonus
        EstimateLoanAmount
        EstimateProjectBudget
        SuggestedDeposit
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            obj = MortgageLoanEstimation;
            ObjectInspector(obj)
        end
        function RUN(obj)
            %%
            obj.RSU_per_Year = obj.Grant_RSU/4*obj.USD_2_GBP;
            obj.PercentageIncreasebyRSUs = round(obj.RSU_per_Year/obj.Salary*100)
            obj.CalculateESPP_Profit();
            obj.TotalEquivalentBonus = obj.CashBonus + obj.RSU_per_Year + obj.ESPP_Profit;
            obj.GuareenteedEquivalentSalary = obj.Salary + obj.RSU_per_Year + obj.ESPP_Profit;
            obj.EstimateLoanAmount = (obj.Salary + obj.TotalEquivalentBonus*obj.Bonus_Multiple)*obj.Salary_Multiple;
             
            obj.SuggestedDeposit = round(obj.EstimateLoanAmount*(1-obj.Loan2Value));
            obj.Deposit_Parents = obj.SuggestedDeposit - obj.Deposit_Me;
            obj.Deposit_Total = obj.Deposit_Me + obj.Loan_Parents;
            obj.EstimateProjectBudget = obj.EstimateLoanAmount + obj.Deposit_Total;   
        end
    end
    methods (Hidden = true)
        function obj = MortgageLoanEstimation();
        end
        function CalculateESPP_Profit(obj)
           %%
           obj.ESPP_Profit = obj.Salary*obj.ESPP_Sacrifice_Per*obj.ESPP_Discount;
        end
    end
end