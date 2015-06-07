classdef Gouverment_Input < handle
    properties (SetObservable = true)
        INPUTS
        HouseValue = 280000
        YourShare = 40; %percent
        Rent = 405
        OUTPUTS
        YourSharePounds
        GovSharePounds
        RentPerYear
        EstimatedAPR
    end
    methods 
        function Example(obj)
            %% 
            close all
            clear classes
            obj = Gouverment_Input
            ObjectInspector(obj)
        end
        function RUN(obj)
            obj.YourSharePounds = obj.HouseValue*obj.YourShare/100;
            obj.GovSharePounds = obj.HouseValue*(100-obj.YourShare)/100;
            obj.RentPerYear = obj.Rent*12;
            obj.EstimatedAPR = round(obj.RentPerYear/obj.GovSharePounds*10000)/100
        end
    end
    methods (Hidden = true)
        function obj = Gouverment_Input()
            
        end
    end
end
    