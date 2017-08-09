classdef mheaderobj
    % someClass one_line_description
    %
    % Detailed explanation of the object goes here. Add specifics for
    % each method and property below.
    %
    % For additional information, search for "Create Help for Classes" in Matlab documentation.
    %
    % Copyright (c) 2016 Leidos
    % Author: Mike Hamilton
    % 2016-09-20
    
    properties
        propOne     % description of property
        propTwo     % description of property
    end
    
    properties (Access=private)
        propThree   % description of property (not shown)
    end
    
    %% Public Methods
    methods
        
        function obj = someClass(inparam1)
            % Summary of constructor
            %
            % INPUTS
            %   inParam1 - description of param
            
        end
        
        
        function [out1] = myMethod(obj, in1)
            % myMethod One_line_description
            %
            % Additional details about myMethod.
            % see also myStaticMethod is an example of crossreferencing.
            %
            % INPUTS
            %   in1 - description
            % OUTPUTS
            %   out1 - descrption of output (if any)
            % POSTCONDITIONS
            %   Describe any mutation to the object, changes to properties,
            %   etc.
            
            propOne = in1;
            disp(obj)
        end
        
    end % methods
    
    %% Static Methods - remove if not used
    methods (Static)
        
        function [out1] = myStaticMethod(in1)
            % myMethod One_line_description
            %
            % Additional details about myMethod.
            %
            % INPUTS
            %   in1 - description
            % OUTPUTS
            %   out1 - descrption of output (if any)
            % POSTCONDITIONS
            %   Describe any mutation to the object, changes to properties,
            %   etc.
            
            disp(obj)
        end
        
    end % static methods
    
end


