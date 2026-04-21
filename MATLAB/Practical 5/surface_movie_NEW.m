function M=surface_movie_NEW
%creates a movie of time-dependent suface (x,y,u(x,y,t))
[u,x,y,t]=Heat_2D_ADI_NEWER(0.2,0.2,30,50);
for ppp=1:41
%    ppp
        surf(x,y,u(:,:,ppp)');
    axis([0 1 0 1 -2 2]);
    M(ppp) = getframe;
end