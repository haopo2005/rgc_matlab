classdef rotation < handle
% ROTATION provides information about a transformation from one frame to
% another.

properties % Public Properties

  % MATRIX may be used to transform a 3x1 vector from frame.from to
  % frame.to
  matrix = eye(3)

  % FORMAT may be either 'euler' or 'quaternion'
  format = 'euler'

  % ORDER is used for Eulerian rotations. Order in which to carry out single
  % axis rotations. 
  order = ['x','y','z']

  % FRAMES contains names of the coordinate frames with which the object is
  % assosciated
  frames = struct('from','', 'to','')

  % Actual rotation parameters. `x`, `y`, and `z` are common to both quaternion
  % and Euler roations

  % X used for both Euler and quaternion formats
  x = 0
  % Y used for both Euler and quaternion formats
  y = 0
  % Z used for both Euler and quaternion formats
  z = 0
  % W used only for quaternion format 
  w = 0

end

methods % Public Methods

  function obj = rotation(varargin)
    % ROTATION Constructor for the ROTATION class
    % Usage:
    %
    %
    if nargin == 1
      obj.matrix = varargin{1};
    end
    if nargin >= 3
      obj.x=varargin{1}; obj.y=varargin{2}; obj.z=varargin{3};
      
    end
    if nargin >= 4
      obj.w = varargin{4};
      obj.format = 'quaternion';
    end

  end

  function varargout = setEuler(x,y,z,varargin)
    % SETEULER sets the constituent Euler angles and computes the matrix.
    if nargin>3
      if strcmp(varargin{1},'deg')
        
      end
    end
    obj.x=x; obj.y=y; obj.z=z;
    varargout = obj.getMatrix();
  end

  function varargout = setQuaternion(x,y,z,w,varargin)
    % SETQUATERNION sets the rotation axis and rotation about that axis.
    % It computes the rotation matrix and returns it if requested
    if nargin>4
      
    end
    obj.x=x; obj.y=y; obj.z=z; obj.w=w;
    varargout = obj.getMatrix();
  end

  function varargout = setMatrix(varargin)
    % SETMATRIX 
    varargout = cell();
  end

  function varargout = getMatrix(varargin)
    % GETMATRIX populates the matrix property using 
    % It computes the rotation matrix and returns it if requested

    if strcmp(obj.format,'euler')
      warning('X,Y,Z is the only Euler rotation order currently supported');
      obj.matrix = rotutil.rotate3(
    elseif strcmp(obj.format,'quaternion')
      warning('Quaternion format not yet implemented');
    end
    if nargout==1, varargout{1}=obj.matrix; end
  end

end
  
end