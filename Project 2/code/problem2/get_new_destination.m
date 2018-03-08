function dest = get_new_destination(curPos, unexplored_areas)
% Write this function so that it will pick the closest unexplored area
% as the new destination dest. We will keep this function simple by
% ignoring any walls that may block our path to the new destination. Here
% we define "closest" using the euclidean distance measure,
% e.g. sqrt((x1-x2)^2 + (y1-y2)^2).

% The lines below are not part of the solution and are only written here
% so that runMe.m can actually run without having written the functions yet
% dest = unexplored_areas(randi(size(unexplored_areas,1)),:);



difference = sqrt((unexplored_areas(:,1)-curPos(1,1)).^2+(unexplored_areas(:,2)-curPos(1,2)).^2);
[row,col]=find(difference==min(difference));
row1 = row(1,1);
dest = unexplored_areas(row1,:);



end

