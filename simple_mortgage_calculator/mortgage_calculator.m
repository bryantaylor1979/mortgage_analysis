classdef mortgage_calculator < handle
    properties (SetObservable = true)
        years = 25;
        annual_rate = 0.045; % 4% annual rate
        house_value = 160000;
        downpayment = 0.25; % 25% down
    end
    properties (SetObservable = true)
        LoanSize
        MonthlyPayments
        TotalInterest
        DATASET = dataset();
    end
    properties (Hidden = true)
        handles
    end
    methods
        function Example(obj)
           %%
           close all
           clear classes
           
           %% SJP Bank 20 Year re-payment plan
           close all
           clear classes
           
           % Var
           Years = 20;
           
           % Calc
           obj = mortgage_calculator;
           ObjectInspector(obj);
           obj.years = Years;
           obj.annual_rate = 0.03
           obj.downpayment = 0;
           obj.house_value = 145000
           obj.RUN()
           MonthlyPaymentsRequired = obj.MonthlyPayments
           FromTennants = 595
           Factors = 100
           Income = FromTennants-Factors
           ExtraMoneyRequired = MonthlyPaymentsRequired-Income
           
           
           %%
           obj = mortgage_calculator;
           ObjectInspector(obj);
        end
        function RUN(obj)
            obj.LoanSize=obj.house_value*(1-obj.downpayment);
            [obj.MonthlyPayments,InterestPayedEachMonth,RemainingBalance]=compute_mortgage(obj.LoanSize,obj.annual_rate,obj.years);
            % close all
            obj.TotalInterest = sum(InterestPayedEachMonth);
            CaptialPayedEachMonth = obj.MonthlyPayments-InterestPayedEachMonth;
            InterestFactor = InterestPayedEachMonth/obj.MonthlyPayments;
            CapitalFactor = CaptialPayedEachMonth/obj.MonthlyPayments;
            Year = (1:length(CaptialPayedEachMonth))/12;
            
            obj.DATASET = dataset(  {rot90(Year,3),                         'Year'}, ...
                                    {rot90(InterestPayedEachMonth,3),       'InterestPayedEachMonth'}, ...
                                    {rot90(round(RemainingBalance),3),      'RemainingBalance'}, ...
                                    {rot90(round(CaptialPayedEachMonth),3), 'CapitalPayedEachMonth'}, ...
                                    {rot90(InterestFactor,3),               'InterestFactor'}, ...
                                    {rot90(CapitalFactor,3),                'CapitalFactor'})

            %%
            try
                get(obj.handles.figure)
                set(obj.handles.interest,'XDATA',Year);
                set(obj.handles.interest,'YDATA',InterestFactor);
                
                set(obj.handles.capitial,'XDATA',Year);
                set(obj.handles.capitial,'YDATA',CapitalFactor);
                axes(obj.handles.axes)
                xlim([min(Year), max(Year)])
            catch
                obj.handles.figure = figure;
                obj.handles.axes = gca;
                obj.handles.interest = plot(    Year, ...
                                                InterestFactor,'b'); hold on
                obj.handles.capitial = plot(    Year, ...
                                                CapitalFactor,'g'); hold on
                title('Fractions of principal and interest paid at each period');
                xlabel('Year');
                ylabel('Fractions');
                legend('Principal fraction','interest fraction');
            end
            %%
            figure;
            plot(Year, RemainingBalance);
            title('Remaining loan');
            xlabel('Period');
            ylabel('Remaining loan');
        end
    end
    methods (Hidden = true)
        function obj = mortgage_calculator()
            
        end
    end
end




