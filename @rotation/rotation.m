classdef rotation < hgsetget
% ROTATION provides information about an orientation transformation from one 
% coordinate frame to another. Both Euler and quaternion formats are
% supported.

properties % Public Properties

  % MATRIX may be used to transform a 3x1 vector from frame.from to
  % frame.to
  Matrix = eye(3)

  % FORMAT may be either 'euler' or 'quaternion'
  Format = 'euler'

  % ORDER is used for Eulerian rotations. Order in which to carry out single
  % axis rotations. Must be length 3 string consisting of upper case,
  % non-repeated characters X, Y, Z
  Order = 'XYZ'

  % FRAME_FROM contains name of the coordinate system input
  FrameFrom =''
  % FRAME_TO contains the name of the coordinate system output
  FrameTo = ''

  % X used for both Euler and quaternion formats. In euler format, it
  % specifies the rotation about the x-axis.
  X = 0
  % Y used for both Euler and quaternion formats. In euler format, it
  % specifies the rotation about the y-axis.
  Y = 0
  % Z used for both Euler and quaternion formats. In euler format, it
  % specifies the rotation about the z-axis.
  Z = 0
  % W used only for quaternion format. It is the rotation about the vector
  % specified by [x,y,z] in radians.
  W = 0

end

methods % Public Methods

  function obj = rotation(varargin)
    % ROTATION Constructor for the ROTATION class
    % Usage:
    %   C = rotation(C_mat_3x3)
    %   C = rotation(C_mat_4x4) --> quaternion
    %   C = rotation(x,y,z)
    %   C = rotation(x,y,z,w) --> quaternion
    %   C = rotation([x,y,z])
    %   C = rotation([x,y,z,w]) --> quaternion
    %
    if nargin == 0
      %
    elseif nargin == 1
        obj.Matrix = varargin{1};
      if length(varargin{1}) == 4
        obj.Format = 'quaternion';
      end
    elseif nargin == 3 % x,y,z
      obj.x=varargin{1}; obj.y=varargin{2}; obj.z=varargin{3};
    elseif nargin == 4
      if ischar(varargin{4}) % x,y,z,'deg'
        if ~strcmp(varargin{4},'deg')
          error('Specify "deg" for degree inputs');
        end
        obj.x=deg2rad(varargin{1}); obj.y=deg2rad(varargin{2}); obj.z=deg2rad(varargin{3});
      else % x,y,z,w
        obj.x=varargin{1}; obj.y=varargin{2}; obj.z=varargin{3}; obj.w=varargin{4};
        obj.Format = 'quaternion';
      end
    elseif nargin == 5
      if ~strcmp(varargin{5},'deg')
        error('Specify "deg" for degree inputs');
      end
      obj.x=varargin{1}; obj.y=varargin{2}; obj.z=varargin{3};
      obj.w = deg2rad(varargin{4});
      obj.Format = 'quaternion';
    else
      error('Incorrect number of input arguments');
    end
  end
  
  %%%%%%%%%%%
  % Setters %
  %%%%%%%%%%%
  
  function obj = set.Matrix(obj,m)
    % Do input checking here
    obj.Matrix = m;
  end
  
  function obj = set.Format(obj,f)
    % Do input checking here
    obj.Format = f;
  end

  function obj = set.X(obj,x)
    % Do input checking here - possibly degree conversions
    obj.X = x;
  end
  
  function obj = set.Y(obj,y)
    % Do input checking here - possibly degree conversions
    obj.Y = y;
  end
  
  function obj = set.Z(obj,z)
    % Do input checking here - possibly degree conversions
    obj.Z = z;
  end
  
  function obj = set.W(obj,w)
    % Do input checking here - possibly degree conversions
    obj.W = mod(w,2*pi);
  end
  
  %%%%%%%%%%%%%%%%
  % Set Wrappers %
  %%%%%%%%%%%%%%%%
  
  function setEuler(obj,varargin)
    % SETEULER sets the constituent Euler angles and computes the matrix.
    % Usage:
    %   rot.setEuler([x,y,z])
    %   rot.setEuler(x,y,z)
    if nargin == 2
      set(obj,'X',varargin{1}(1),'Y',varargin{1}(2),'Z',varargin{1}(3));
    elseif nargin == 4
      set(obj,'X',varargin{1},'Y',varargin{2},'Z',varargin{3});
    else
      error('Incorrect number of inputs');
    end
    obj.calcMatrix();
  end

  function setQuaternion(obj,varargin)
    % SETQUATERNION sets the rotation axis and rotation about that axis.
    % It computes the rotation matrix and returns it if requested
    % Usage:
    %   rot.setQuaternion(x,y,z,w)
    if nargin == 2
      set(obj,'X',varargin{1}(1),'Y',varargin{1}(2),'Z',varargin{1}(3),'W',varargin{1}(4));
    elseif nargin == 5
      set(obj,'X',varargin{1},'Y',varargin{2},'Z',varargin{3},'W',varargin{4});
    else
      error('Incorrect number of inputs');
    end
    obj.calcMatrix();
  end

end % methods
  
end % class