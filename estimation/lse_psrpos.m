genutil.ccc

%% Truth data and params

x_true = [5;5;5];

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
  psr_true(k,1) = norm(svpos(k,:)-x_true', 2);
end

svpos_meas = svpos;
psr_meas = psr_true;


%% Estimate

x0 = [5;6;4];
x_est = x0;
x_hist = [x0];

tol = .1;
maxit = 10;

mv = 2;
ct = 1;
while mv > tol
  
  x0 = x_est;
  
  G = gps.calc_geometry_matrix(x0,svpos_meas);
  for k=1:nsv
    psr0(k,1) = norm( svpos_meas(k,:)-x0' ,2);
  end
  dpsr = psr_meas - psr0;
  dx = inv(G'*G)*G'*dpsr;
  x_est = x0 + dx;  
  
  x_hist(:,end+1) = x_est;
  mv = norm(x_est-x0, 2);
  fprintf('%i:         %10f  %10f  %10f    (%10f)\n',ct,x_est,mv)
  ct = ct+1;
  if ct > maxit
    break;
  end
  
end

%% Plot

figutil.namefig('Least Squares PSR Position Estimation');
plot3(x_true(1),x_true(2),x_true(3), 'k.', 'MarkerSize',8); hold on
plot3(svpos_meas(:,1),svpos_meas(:,2),svpos_meas(:,3), 'g.')
plot3(x_hist(1,:),x_hist(2,:),x_hist(3,:), '-b.')
figutil.xyzlabel; grid on
title('Positions')
legend('True Pos','SV Pos','Est')







