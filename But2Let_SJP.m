%% Taken from But2Let_Details.pdf on google drive
LoanAmount = 144000
Balance = 145505.05
InterestRate = 2.5
InterestPerYear = Balance*InterestRate/100
InterestPerMonth = InterestPerYear/12

% Assumed for the year
Fee = 723.90
FeePerMonth = Fee/12
EquivalentInterestPerMonth = InterestPerMonth + FeePerMonth
EquivalentInterestRate = round((InterestPerYear+Fee)/Balance*1000)/10
disp(['EquivalentInterestRate: ',num2str(EquivalentInterestRate),' %'])