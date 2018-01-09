 classdef snoopingClass < handle

   properties
      snoopOn;
   end

    methods

        function obj snoopingClass(dateObj)
        % class constructor
           obj.snoopOn = dateObj;

           y2kListener = addlistener(dateObj,'y2k',@(src,evnt)fixY2Kbugs(obj,src,evnt));
           olympicsListener = addlistener(dateObj,'olympicsStart',@(src,evnt)gossip(obj,src,evnt));
        end

        function fixY2Kbugs(obj,src,evnt)
        % This will be executed when a y2k event is fired by the date object.
           display(evnt.EventName);
        end

        function gossip(obj,src,evnt)
        % This will be executed when a olympicsStart event is fired by the date object
           display(evnt.EventName);
        end
    end
