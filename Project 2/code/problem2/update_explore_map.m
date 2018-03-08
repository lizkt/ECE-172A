function explore_map = update_explore_map(dest, route, explore_map, PLANNED, UNMAPPED)
% Write this function so that all the locations specified in route and dest
% are marked as PLANNED only if it was previous UNMAPPED in the explore_map
% variable.

for i=1:size(route,1)
    if (explore_map(route(i,1),route(i,2))==UNMAPPED)  
    explore_map(route(i,1),route(i,2)) = PLANNED;
    end
end



end