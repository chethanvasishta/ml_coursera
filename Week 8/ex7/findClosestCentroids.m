function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

%hold off;
%plot(X(:,1),X(:,2),'+');
%hold on;
%plot(centroids(:,1), centroids(:,2), '*', 'markersize',10);
%pause;

m = size(X,1);
numIter = 5;
tempK = size(centroids, 1);
for iter=1:numIter,
	oldIdx = idx;
	for i=1:m, % for each example
		x = X(i,:);
		for j=1:K, % for each mean point
			tempK(j) = sum((x - centroids(j,:)).^2);
		end;
		[min_val, min_idx] = min(tempK);
		idx(i) = min_idx;
	end;
			
	% assign average of points to centroids
	centroidSum = zeros(size(centroids));
	groupCount = zeros(size(centroids, 1));
	for i=1:m, % for each example			
		centroidSum(idx(i),:) = centroidSum(idx(i),:) + X(i,:);
		groupCount(idx(i)) += 1;
	end;
	
	for i=1:K,
		centroidSum(i) = centroidSum(i)/groupCount(i);
	end;
	
	group1 = [0 0];
	group2 = [0 0];
	group3 = [0 0];
	for i=1:m, % for each example			
		if (idx(i) == 1)
			group1 = [group1 ; X(i,:)];
		elseif (idx(i) == 2)
			group2 = [group2 ; X(i,:)];
		else
			group3 = [group3 ; X(i,:)];
		endif
	end;
	
	
	hold off;
	%plot(X(:,1),X(:,2),'+');
	plot(group1(:,1),group1(:,2),'+');
	hold on;
	plot(group2(:,1),group2(:,2),'p');
	hold on;
	plot(group3(:,1),group3(:,2),'s');
	hold on;
	plot(centroids(:,1), centroids(:,2), '*', 'markersize',10);
	
	fprintf('%d ', iter);
	
	pause;
end;

% =============================================================

end

