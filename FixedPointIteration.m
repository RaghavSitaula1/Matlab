syms x;
close all
disp('Put @ (x) before writing a function')
f=input('Enter a function f(x) : ');
g=input('Enter a function g(x) : ');



for j=0:10
   
        if (f(j)>0 && f(j+1)<0 ) || (f(j)<0 &&  f(j+1)>0) 
            
            if f(j)==Inf || f(j+1)==Inf
                continue
            end
            p=j;
            q=j+1;
            break;

        end

end



disp("Root lies between : ")
A=sprintf("[%d,%d]",p,q);
disp(A);

n=input ('Enter no. of iterations : ');
x0=input ('Enter Your intial guess : ');
e=input('Enter Tolerance : ');

row=sprintf('Iterations    X                 Error');
disp(row);
for i=1:n
    DF=diff(g,x);
    values=subs(DF,x0);
    if (abs(values))>1
        errordlg("Iterative method is not convergent")
        return
    end
    x1=g(x0);
    print=sprintf('%3d          %11.10f       %11.10f',i,x1,abs(x1-x0));
    disp(print);
    if abs(x1-x0)<e
        disp('The Root of the equation is')
        z=sprintf("%.10f",x1);
        disp(z);

        break;
    end
    x0=x1;
   
end

Y=@(x) x;

hold on
fplot(g,[p,q],'b-','LineWidth',2)
fplot(Y ,[p,q],'r-','LineWidth',2)

title('Fixed Point Iteration Converging')

hold on
plot(x0,g(x0),'ko')
legend('g(x)','y=x')
hold off
