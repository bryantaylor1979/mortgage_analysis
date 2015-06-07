function EstimateLoanAmount = mortgageloan_calc(varargin)
salary = varargin{1};

% defaults 
args.bonus = 0;
args.bonus_multiple = 0.5;
args.salary_multiple = 4.5;

varargin = varargin(2:end);
x = size(varargin,2);
for i = 1:2:x
   args.(varargin{i}) = varargin{i+1}; 
end

EstimateLoanAmount = (salary + args.bonus*args.bonus_multiple)*args.salary_multiple;

end