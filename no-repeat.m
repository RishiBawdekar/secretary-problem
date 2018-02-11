clc
close all
clear all
n = 5; % number of candidates
perm = perms(1:n); % permutations of n candidates
ps = zeros(n-1,1); % assign probabilities for each strategy
for i=1:n-1
    p = zeros(factorial(n),1); % bernoulli random variable
    for j=1:factorial(n)
        permi = perm(j,:); % instance of permutation
        %disp(permi);
        % maxno will alway be n!!!!!
        ni = find(permi == n); % find index of max number or n
        ne = permi(1:i); % take till ith element of permutation
        maxp = max(ne); % find maximum till ith element
        mindex = permi > maxp;
        gindex = find(mindex,1,'first'); % find index of first element greater than maxp
        if ~isempty(gindex)
            if (ni <= gindex) && (ni > i)
                p(j) = 1;
            %permi
            end
        end
    end
    %disp(p);
    ps(i) = mean(p);
end
p1 = 1 / n;
newp = [p1 ps']';
[~,pi] = max(newp);
fprintf('Sample first %d persons\n', pi-1);
disp(newp);
