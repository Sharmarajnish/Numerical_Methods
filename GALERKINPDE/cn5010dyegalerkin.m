function [dzdt]=cn5010fingalerkin(t,a,BS,CS);

dzdt(1)=(-BS(1,1)*a(1))+(-BS(1,2)*a(2))+(-BS(1,3)*a(3))-CS(1);
dzdt(2)=(-BS(2,1)*a(1))+(-BS(2,2)*a(2))+(-BS(2,3)*a(3))-CS(2);
dzdt(3)=(-BS(3,1)*a(1))+(-BS(3,2)*a(2))+(-BS(3,3)*a(3))-CS(3);

dzdt=dzdt';