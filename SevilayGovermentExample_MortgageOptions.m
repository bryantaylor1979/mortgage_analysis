classdef SevilayMortgageOptions < handle
    properties (SetObservable = true)
        INPUTS
        Years = 25
        Annual_Rate = 0.04
        Salary = 35450
        MortgageFactor = 4.5;
        Deposit = 30000
        PercentageStake = 40;
        
        STATUS
        EstimatedGovIntereset
        
        OUTPUTS
        Max_Loan_Value = 160000
        Max_HouseValue
        MonthlyPayments_To_Loan
        
        OBJECTS
        MortgageCalc
        GovCalc
    end
    methods
        function Example(obj)
            %% 
            close all
            clear classes
            obj = SevilayMortgageOptions()
            ObjectInspector(obj)
        end
        function RUN(obj)
            %%
            obj.Max_Loan_Value = obj.Salary*obj.MortgageFactor;
            obj.Max_HouseValue = obj.Max_Loan_Value +  obj.Deposit;
            
            %%
            obj.MortgageCalc.years = obj.Years;
            obj.MortgageCalc.annual_rate = obj.Annual_Rate;
            obj.MortgageCalc.downpayment = 0;
            obj.MortgageCalc.house_value = obj.Max_Loan_Value;
            obj.MortgageCalc.RUN();
            obj.MonthlyPayments_To_Loan = obj.MortgageCalc.MonthlyPayments;
        end
    end
    methods (Hidden = true)
        function obj = SevilayMortgageOptions()
            %% 
            obj.MortgageCalc = mortgage_calculator();
            obj.GovCalc = Gouverment_Input;
            obj.GovCalc.RUN();
            
            obj.EstimatedGovIntereset = obj.GovCalc.EstimatedAPR;
        end
    end
end