genutil.ccc

%% Truth data and params

pos_true = [0;0;0];
bias_true = 1;

svpos = [...
  1 2 3; ...
  4 8 0; ...
  7 1 9; ...
  9 5 6; ...
  8 4 4; ...
  2 9 8; ...
  5 3 1; ...
];
nsv = size(svpos); nsv = nsv(1);

for k = 1:nsv
  psr_true(k,1) = norm(svpos(k,:)-pos_true', 2);
end

svpos_meas = svpos;
psr_meas = psr_true + bias_true;


%% Estimate

pos0 = [3;-7;-1];
bias0 = 0;
x_est = [pos0; bias0]; % initial
x_hist = x_est;

tol = .001;
maxit = 100;

mv = 2;
ct = 1;
while mv > tol
  
  x0 = x_est;
  pos0 = x0(1:3);
  bias0 = x0(4);
  
  G = [gps.calc_geometry_matrix(pos0,svpos_meas) , ones(nsv,1)];
  for k=1:nsv
    psr0(k,1) = norm( svpos_meas(k,:)-pos0' ,2) + bias0;
  end
  dpsr = psr_meas - psr0;
%   dx = inv(G'*G)*G'*dpsr;
  dx = pinv(G)*dpsr;
  x_est = x0 + dx;  
  
  x_hist(:,end+1) = x_est;
  mv = norm(dx(1:3), 2);
  fprintf('%i:   [ %10f  %10f  %10f ], %4f   (%6f)\n',ct,x_est(1:3),x_est(4),mv)
  ct = ct+1;
  if ct > maxit
    break;
  end
  
end

for k = 1:nsv
  psr_res(k,1) = norm(svpos_meas(k,:)-x_est(1:3)', 2) + x_est(4);
end


%% Plot

figutil.namefig('Least Squares PSR Position Estimation');
plot3(pos_true(1),pos_true(2),pos_true(3), 'k.', 'MarkerSize',12); hold on
plot3(svpos_meas(:,1),svpos_meas(:,2),svpos_meas(:,3), 'g.')
plot3(x_hist(1,:),x_hist(2,:),x_hist(3,:), '-b.')
figutil.xyzlabel; grid on
title('Positions')
legend('True Pos','SV Pos','Est')







