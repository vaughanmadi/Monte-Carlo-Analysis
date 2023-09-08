mu = 398600.4415;
rE = 6378.1363; %km 
J2 = 0.0010826267;
J3 = 0; % only looking at J2 for this 
lowlim = 150+rE;
uplim = 1000+rE;
rvec = (lowlim) + (uplim-lowlim)*rand(10000,3); %generate random LEO position, between 150 to 1000 km alt
avec = zeros(size(rvec));
for i = 1:length(rvec)
    r = rvec(i,:);
    avec(i,:) = J2J3accel(r,J2,J3,rE,mu);
end

maxi = max(rvec(:,1));
mini = min(rvec(:,1));
maxj = max(rvec(:,2));
minj = min(rvec(:,2));
maxk = max(rvec(:,3));
mink = min(rvec(:,3));

figure(1)
scatter3(avec(:,1),avec(:,2),avec(:,3),'.')
xlabel('Ai (km/s)')
ylabel('Aj (km/s)')
zlabel('Ak (km/s)')

meani = mean(avec(:,1));
meanj = mean(avec(:,2));
meank = mean(avec(:,3));
stdi = std(avec(:,1));
stdj = std(avec(:,2));
stdk = std(avec(:,3));

%%
figure(2)
subplot(1,2,1)
x = histogram(avec(:,1),25);
xlim([0e-6 1e-6])
xlabel('i Acceleration Perturbation (km/s^2)')
ylabel('Frequency')
title('PDF')

cfdi = cdf('Normal',avec(:,1),meani,stdi);
subplot(1,2,2)
plot(avec(:,1),cfdi,'.')
xlim([0e-6 1e-6])
xlabel('i Acceleration Perturbation (km/s^2)')
ylabel('Cumulative Frequency')
%yline(0.2,'--r','Linewidth',2)
%yline(0.8,'--r','Linewidth',2)
title('CDF')

%%
figure(3)
subplot(1,2,1)
y = histogram(avec(:,2),25);
xlim([0 1e-6])
xlabel('j Acceleration Perturbation (km/s^2)')
ylabel('Frequency')
title('PDF')

cfdj = cdf('Normal',avec(:,2),meanj,stdj);
subplot(1,2,2)
plot(avec(:,2),cfdj,'.')
xlim([0 1e-6])
xlabel('j Acceleration Perturbation (km/s^2)')
ylabel('Cumulative Frequency')
title('CDF')

%%
figure(4)
subplot(1,2,1)
z = histogram(avec(:,3),25);
xlim([-1.3e-6 -0.6e-6])
xlabel('k Acceleration Perturbation (km/s^2)')
ylabel('Frequency')
title('PDF')

cfdk = cdf('Normal',avec(:,3),meank,stdk);
subplot(1,2,2)
plot(avec(:,3),cfdk,'.')
xlim([-1.3e-6 -0.6e-6])
xlabel('k Acceleration Perturbation (km/s^2)')
ylabel('Cumulative Frequency')
title('CDF')

%%
figure(5)
subplot(3,1,1)
q = histogram(rvec(:,1),50);
xlabel('i Spacecraft Position (km)')
title('Random Input Uniform Distributions')
subplot(3,1,2)
w = histogram(rvec(:,2),50);
xlabel('j Spacecraft Position (km)')
subplot(3,1,3)
e = histogram(rvec(:,3),50);
xlabel('k Spacecraft Position (km)')

minx = min(rvec(:,1));
miny = min(rvec(:,2));
minz = min(rvec(:,3));
maxx = max(rvec(:,1));
maxy = max(rvec(:,2));
maxz = max(rvec(:,3));
