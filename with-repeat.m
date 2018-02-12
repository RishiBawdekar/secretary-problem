clc
close all
clear all
n = 4; % number of candidates
perm = perms(1:n+1); % permutations of n candidates
for i=1:factorial(n+1)
    permt = perm(i,:); % take a row of perm
    nt = find(permt == n+1); % find index of n+1 item
    perm(i,nt) = n;
end
permnew = unique(perm, 'rows');
[rows, ~] = size(permnew);
ps = zeros(n,1); % assign probabilities for each strategy
for i=1:n
    p = zeros(rows,1); % bernoulli random variable
    for j=1:rows
        permi = permnew(j,:); % instance of permutation
        %disp(permi);
        % maxno will alway be n!!!!!
        ni = find(permi == n); % find indices of max number or 
        ne = permi(1:i); % take till ith element of permutation
        maxp = max(ne); % find maximum till ith element
        mindex = permi >= maxp;
        mindex(1:i) = 0;
        gindex = find(mindex,1,'first'); % find index of first element greater than maxp
        if ~isempty(gindex)
            if (ismember(gindex,ni))
                p(j) = 1;
            %permi
            end
        end
    end
    %disp(p);
    ps(i) = mean(p);
end
pr = zeros(rows,1);
for i=1:rows
    permrow = permnew(i,:);
    if (permrow(1) == n)
        pr(i) = 1;
    end
end
p1 = mean(pr);
newp = [p1 ps']';
[~,pi] = max(newp);
fprintf('Sample first %d persons\n', pi-1);
disp(newp);
