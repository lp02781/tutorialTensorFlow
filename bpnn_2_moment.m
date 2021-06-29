irismod = xlsread("irismod.xlsx");
x = zeros(1,4);
z = zeros(1,8);
y = zeros(1,8);
p = zeros(1,3);

err = zeros(1);
err = 10;
alpha = 0.1;
max_epoch = 4000;
error_tot=zeros(1,max_epoch);
epoch=0;
error_target = 0.58;
status = 1;

%variable
input = irismod(:,[1 2 3 4]);
target = irismod(:, [6 7 8]);

[len_in_rows, len_in_cols] = size(input);
[len_out_rows, len_out_cols] = size(target);

%karena input outputnya nggak ternormalisasi, maka harus dinormalisasi.
%metode : minmaxing
%input
for m = 1 : len_in_rows
    for n = 1 : len_in_cols
       input(m,n) = (input(m,n) - min(input(:,n)))/(max(input(:,n)) - min(input(:,n)));
    end
end
%output
for m = 1 : len_out_rows
    for n = 1 : len_out_cols
       target(m,n) = (target(m,n) - min(target(:,n)))/(max(target(:,n)) - min(target(:,n)));
    end
end

v = rand(4,8);
w = rand(8,8);
k = rand(8,3);

%proses inisialisasi bobot input dgn Nguyen-Widrow
beta = 0.7*(8).^(1/4);
a = -0.5;
b = 0.5;
v = (b-a).*rand(4, 8) +a;
norm_vj = zeros(1, 4);
for j = 1:4
    norm_vj(j) = sqrt(sum(v(:,j).^2));
    v(:,j) = (beta.*v(:,j))/norm_vj(j);
end

%inisialisasi bias
bias = (2*beta).*rand(1, 1) -beta;
%bias = 0

miu = 0.0001;
derrdw_old = 0;
derrdv_old = 0;
derrdk_old = 0;

while(status == 1)
    for i = 1:75;
        x = input(i,:);
        zin = x*v+bias;
        z = sigmoid(zin);
        yin = z*w;
        y = sigmoid(yin);
        pin = y*k;
        p = sigmoid(pin);
        
        derrdp = 2*(pin-target(i,:));
        dpdpin = p.* (1-p);
        dpindk = y;
        derrdk = (derrdp.*dpdpin)'*dpindk;
    
        dpindy = k;
        dydyin = y.* (1-y);
        dyindw = z;
        derrdw = ((derrdp .* dpdpin * dpindy') .*dydyin)' * dyindw;
        
        dyindz = w;
        dzdzin = z.* (1-z);
        dzindv = x;
        derrdv = (((derrdp .* dpdpin * dpindy') .*dydyin * dyindz') .* dzdzin)' * dzindv;
        
                      
        %momentum update
        momentum_k = miu*alpha*derrdk_old';
        momentum_w = miu*alpha*derrdw_old';
        momentum_v = miu*alpha*derrdv_old';
        
         %bias update
        bias = bias - alpha*bias;

        k = k - alpha * derrdk' + momentum_k;
        w = w - alpha * derrdw' + momentum_w;
        v = v - alpha * derrdv' + momentum_v;   
        
        derrdw_old = derrdw;
        derrdv_old = derrdv;
        derrdk_old = derrdk;    
    end
    
    epoch = epoch+1;
    err = sum((p - target(i,:)).^2)
    error_tot(1,epoch) = err;
    if epoch > max_epoch 
        status = 0;
    end
end

real = target(76:end,:);
x = input(76:end,:);
zin = x*v;
z = sigmoid(zin);
yin = z*w;
y = sigmoid(yin);
pin = y*k;
p = sigmoid(pin);

err_real = sum((p - target(76:end, :)).^2);
    
%find accuracy
pred = p;
for i = 1:75
    mymax = max(pred(i,:));
    for j = 1:3
        if pred(i,j) == mymax
            pred(i,:) = zeros(1,3);
            pred(i,j) = 1;
        end
    end
end
true = 0;
total = 75;
for i = 1:75
    if real(i,:) == pred(i,:)
        true = true+1;
    end
end
acc = true/total *100