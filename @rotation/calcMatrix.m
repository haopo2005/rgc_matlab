function calcMatrix(obj)
  % GETMATRIX populates the matrix property using 
  % It computes the rotation matrix and returns it if requested.
  if strcmp(obj.Format,'euler')
    components = cell(1,3);
    for n=1:3
      components{n} = get_single_axis_euler_rotation_matrix( obj.Order(n), get(obj, obj.Order(n)) );
    end
    obj.Matrix = components{1}*components{2}*components{3};
  elseif strcmp(obj.Format,'quaternion')
    error('Quaternion format not yet implemented');
  end
end


function out = get_single_axis_euler_rotation_matrix(axis,angle)
  if strcmp(axis,'X')
    out = [1 0 0; 0 cos(angle) -sin(angle); 0 sin(angle) cos(angle)];
  elseif strcmp(axis,'Y')
    out = [cos(angle) 0 sin(angle); 0 1 0; -sin(angle) 0 cos(angle)];
  elseif strcmp(axis,'Z')
    out = [cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0; 0 0 1];
  else
    error('Incorrect axis specification');
  end
end