function varargout = tireforces(simulation,vehicle,varargin)
% <filename> <VERY short description of the function>
% Author: <your name>
% Date: <development date>
%
% Usage: Changes depending on the input parameters.  If simulation.tmodel 
% indicates that the desired tire model is linear, then the syntax for calling
% this function should be: latForceVariable =
% tireforces(simulation,vehicle,varargin) which returns a linear tire force
% Fy = -Ca*alpha.  However, if simulation.tmodel indicates a nonlinear model,
% possibly including coupled lateral and longitudinal forces, then the usage
% could change to something like: [latForceVariable,longForceVariable] =
% tireforces(simulation,vehicle,varargin) which returns both lateral and
% longitudinal nonlinear tire forces according to the Fiala tire model.

% Enumerate the wheels (this should appear in all of your files)
lf = 1; rf = 2; lr = 3; rr = 4;

function %Fx = tireforces(k,Cx,Fz,D)

mu=0.9;
mus=0.9;

if D=='p'; %parabolic
    display('parabolic');
    if abs(k/(1+k)) < 3*mu*Fz/Cx
        Fx = Cx*(k/(1+k))-((Cx^2)/(3*mu*Fz))*(2-(mus/mu))*(k/(1+k))*abs(k/(1+k))+((Cx^3)/(9*(mu^2)*(Fz^2)))*((k/(1+k))^3)*(1-(2*mus)/(3*mu));
    else
        Fx = mu*Fz*sign(k/(1+k));
    end
    
elseif D=='u'; %uniform
    display('uniform');
    if abs(k/(1+k)) < (mu*Fz)/(2*Cx)
        Fx = (k/(1+k))^3*(mu*Fz)^2/(4*Cx);
    else
        Fx = mu*Fz*sign(k)-((1+k)/k)*mu^2*Fz^2/(4*Cx);
    end
end
