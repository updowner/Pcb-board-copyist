clear all
close all
clc
a=imread('hw2.jpg');
figure(1),imshow(a);
[r, c]=size(a);
saltandpepper=zeros(r,c,'uint8');
w=17;
for i=ceil(w/2):r-floor(w/2)
   for j=ceil(w/2):c-floor(w/2)
m=a(i-floor(w/2):i+floor(w/2),j-floor(w/2):j+floor(w/2));
m=sort(reshape(m,1,w^2));
saltandpepper(i,j)=m(ceil(w^2/2));

   end
end
figure(2),imshow(saltandpepper);
saltandpepper=im2double(saltandpepper);
gaussian=1/140*[2 4 5 4 2
           4 10 15 10 4
           5 15 20 15 5
           4 10 15 10 4
            2 4 5 4 2];
[r,c]=size(saltandpepper);
for i=3:r-2
    for j=3:c-2
        saltandpepper(i,j)=sum(sum(saltandpepper(i-2:i+2,j-2:j+2).*gaussian));
    end
end
figure(3),imshow(saltandpepper);
v=im2double(saltandpepper);
[r c]=size(v);
b1=zeros(r,c);
b2=zeros(r,c);
sx=[-1 0 1;-2 0 2;-1 0 1];
sy=[-1 -3 -1;0 0 0;1 3 1];
for i=2:r-1
    for j=2:c-1
        mask=v(i-1:i+1,j-1:j+1);
        b1(i,j)=sum(sum(mask.*sx));
        b2(i,j)=sum(sum(mask.*sy));
    end
end
d=sqrt(b1.^2+b2.^2);
figure(4),imshow(d)
f=zeros(size(d));
figure(5),imhist(d);
ath=0.3;
f(d<ath)=0;
ath=0.6;
f(d>ath)=1;
figure(6),imshow(f);
