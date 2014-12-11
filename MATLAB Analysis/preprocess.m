% this script loads the datafile and performs filtering

fn = ['data/',filename];
load(fn);

switch filename
    case 'Dataset1'
        tsart =5.5;
        tinitpos = 8.5;
        tend = 150;
    case 'Dataset2'
        tsart = 2.5;
        tinitpos = 4.5;
        tend = 73;
    case 'Dataset3'
        tsart = 4.5;
        tinitpos = 6;
        tend = 113;
    case 'Dataset4'
        tsart = 12;
        tinitpos = 14.5;
        tend = 135;
    case 'Subj2_1'
        tsart = 4;
        tinitpos = 8;
        tend = 144;
    case 'Subj2_2'
        tsart = 6;
        tinitpos = 7;
        tend = 86;
        
    case 'Subj3_1'
        tsart = 7;
        tinitpos = 8;
        tend = 100000;
    case 'Subj3_2'
        tsart = 7;
        tinitpos = 8;
        tend = 94;
        
    case 'Subj5_1'
        tsart = 5;
        tinitpos = 6;
        tend = 100000;
    case 'Subj5_2'
        tsart = 2;
        tinitpos = 3;
        tend = 86;
    
    case 'Subj6_1'
        tsart = 4.5;
        tinitpos = 5;
        tend = 100000;
    case 'Subj6_2'
        tsart = 5;
        tinitpos = 6;
        tend = 96;
end


%median filter
win = 3;
p_med = p;
q_med = q;
for i = 1:size(p,2)
   for j = 1:size(p,1)
       winind = max([1, j-win]):min([size(p,1), j+win]);
       p_med(j,i) = median(p(winind,i));
       
   end
    
end

%deal with dropped points
for i = 1:size(p,2)-1
   for j = 2:size(p,1)
        if abs(p_med(j,i) - p_med(j-1,i)) > 500
            p_med(j,i) = p_med(j-1,i);
        end
   end
end
tp = p_med(:,end) - min(p_med(:,end));
tq = q_med(:,end) - min(p_med(:,end));
tp = tp/1000000;
tq = tq/1000000;
p_alt = p_med;
q_alt = q_med;

%trim off beginning
p_alt(tp<tsart,:) = [];
q_alt(tq<tsart,:) = [];
tp(tp<tsart) = [];
tq(tq<tsart) = [];

%trim end
p_alt(tp>tend,:) = [];
q_alt(tq>tend,:) = [];
tp(tp>tend) = [];
tq(tq>tend) = [];

%trim time
p_alt(:,end) = [];
q_alt(:,end) = [];


%sliding window and interpolation
q_at_p = zeros(size(p_alt,1),3);
for i = 1:size(p_alt,1)
    q_at_p(i,:) = getInterpValue(tp(i),q_alt,tq);
    
end

%subtract off init position
if 1
    ind = find(tp<tinitpos);
    temp = mean(p_alt(ind,:));
    p_alt = p_alt - repmat(temp,size(p_alt,1),1);

    temp = mean(q_at_p(ind,:));
    q_at_p = q_at_p - repmat(temp,size(q_at_p,1),1);
end