function solveMatrix(obj,varargin)
% SOLVEMATRIX calculates the two possible solutions of a rotation matrix
  if strcmp(obj.Format,'euler')
    % send to correct solver
    if strcmp(obj.Order,'XYZ')
      [xyz1,xyz2,equiv] = solve_xyz(obj.Matrix);
    else
      error('Solving for the given euler axis rotation order is not yet implemented.');
    end
    if equiv
      set(obj,'X',xyz1(1),'Y',xyz1(2),'Z',xyz1(3));
    else
      error('Dont\"t have multiple solution handling implemented');
    end
  elseif strcmp(obj.Format,'quaternion')
    error('Quaternion rotation matrix solving not yet implemented');
  end
end


function [xyz1,xyz2,aresame] = solve_xyz(R)
  if all(R(3,1)~=[-1,1])
    y1 = -asin(R(3,1));
    x1 = atan2( R(3,2)/cos(y1) , R(3,3)/cos(y1) );
    z1 = atan2( R(2,1)/cos(y1) , R(1,1)/cos(y1) );
    xyz1 = [x1,y1,z1];
    y2 = pi - y1;
    x2 = atan2( R(3,2)/cos(y2) , R(3,3)/cos(y2) );
    z2 = atan2( R(2,1)/cos(y2) , R(1,1)/cos(y2) );
    xyz2 = [x2,y2,z2];
    aresame = false;
  else
    z = 0; % z = anything really.
    if R(3,1) == -1
      y = pi/2;
      x = z + atan2(R(1,2),R(1,3));
    else % R(3,1) == 1
      y = -pi/2;
      x = -z + atan2(-R(1,2),-R(1,3));
    end
    xyz1 = [x,y,z];
    xyz2 = zeros(1,3);
    aresame = true;
  end
end