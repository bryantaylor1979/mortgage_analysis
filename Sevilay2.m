%%
Salary = 37577; % new
% Salary = 35450  % old
Factor = 4.65

MaxLoanAmount = round(Salary*Factor);
Deposit = 35000;
MaxHouseValue  = MaxLoanAmount + Deposit;
LTV = 0.8;
round(MaxHouseValue*(1-LTV));

disp(['Salary: ',num2str(Salary)])
disp(['MaxLoanAmount: ',num2str(MaxLoanAmount)])
disp(['Assumed Multipler: ',num2str(Factor)])
disp(['Deposit: ',num2str(Deposit)])
disp(['MaxHouseValue: ',num2str(MaxHouseValue)])

%% interset only
obj = mortgage_calculator
obj.annual_rate = 0.0499
obj.house_value = MaxLoanAmount;
obj.downpayment = 0
obj.RUN()
MonthlyPayments25years = obj.MonthlyPayments
MonthlyPayment = round(MaxLoanAmount*obj.annual_rate/12)
disp(['InterestOnlyMortgage: ',num2str(MonthlyPayment)])
disp(['25YearsMortgage: ',num2str(round(MonthlyPayments25years))])

%%
% This cheapest flat is at 315,000
Price = 320000
Share = 0.48 % min is 30%
Deposit = 40000
APR = 2.5 %without this scheme 4.99 and with 2.5%
AssumedAPRonRent = 0.0275
MonthlyServiceCharge = 110;

% calcs
ShareValue = Price*Share
TheirShare = Price - ShareValue
MortgageLoan = ShareValue-Deposit
obj = mortgage_calculator
obj.annual_rate = APR/100
obj.house_value = MortgageLoan;
obj.downpayment = 0
obj.RUN()
MonthlyPayments25years = obj.MonthlyPayments;
Rent = TheirShare*AssumedAPRonRent/12;
TotalMonthlyCost = MonthlyPayments25years+Rent+MonthlyServiceCharge;
LTV = (MortgageLoan - Deposit)/MortgageLoan;

% print
disp(['Full Value of Property: ',num2str(Price)])
disp(['Your Stake (%): ',num2str(Share)])
disp(['Value of your Stake (%): ',num2str(ShareValue)])
disp(['Deposit: ',num2str(Deposit)])
disp(['25YearsMortgagePayments: ',num2str(round(MonthlyPayments25years))])
disp(['AssumedAPRonRent: ',num2str(AssumedAPRonRent*100)])
disp(['Mortgage APR: ',num2str(APR)])
disp(['Monthly Rent: ',num2str(Rent)])
disp(['MonthlyServiceCharge: ',num2str(MonthlyServiceCharge)])
disp(['TotalMonthlyCost: ',num2str(TotalMonthlyCost)])
disp(['LTV: ',num2str(LTV)])