f = @(u,t) 0.1*(1-u/5000)*u;
N_0 = 50;
dt = 10; 
T = 1000;
[u,t] = ode_FE(f, N_0, dt, T);
k = 1;
again = true;
while again == true
    dt_k = 2^(-k)*dt;
    [u_1, t_1] = ode_FE(f, N_0, dt_k, T);
    plot(t, u, 'k--', t_1, u_1, 'm-.')
    xlabel('Time t'); ylabel('Grow of N(t)'); 
    fprintf('Time-step is: %g\n', dt_k);
    answer = input('Do one more with finer dt (y/n)? ', 's')
    if strcmp(answer,'y')
        u=u_1;
        t=t_1;
    else
        again=false;
    end
    k=k+1;
end
%use function that was in the book
function [sol, time] = ode_FE(f, N_0, dt, T)
N_t=floor(T/dt);
u=zeros(N_t+1,1);t = linspace(0,N_t*dt,length(u));
u(1)=N_0;
for n=1:N_t
u(n+1)=u(n)+dt*f(u(n),t(n));
end
sol=u;
time=t;
end





