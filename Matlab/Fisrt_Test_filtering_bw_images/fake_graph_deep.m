function feature_hist = fake_graph_deep(images) 
   k = 0;
   mean_hist_h = [];
   mean_hist_v = [];
   std_hist_h  = [];
   std_hist_v  = [];
   skw_hist_v  = [];
   skw_hist_h  = [];
   kur_hist_h  = [];
   kur_hist_v  = [];
   mon_3_hist_v =  [];
   mon_3_hist_h =  [];
   mon_2_hist_v =  [];
   mon_2_hist_h =  [];
   test_h = [];
   test_v = [];
   
   for z = 1:size(images,1)
    %disp(z);
    k = k +1;
    %% Assign a vectors for line measures
    count_h = [];
    count_v = [];
    count_h = zeros(1,size(images{z},1)+1);
    count_v = zeros(1,size(images{z},1)+1);

    %% Measure line in horizontal direction
    for i = 1:size(images{z},1)
        %fprintf("%d\n",i)
        aux=0;
        for j = 1:size(images{z},2)
          if images{z}(j,i) == 1
            aux = aux + 1 ;    
          elseif images{z}(j,i) == 0
            count_h(aux+1) = count_h(aux+1) + 1;
            aux = 0;
          end
        end
        count_h(aux+1) = count_h(aux+1) + 1;
        %fprintf('\n');
    end
    %% Measure line in vertical direction
    for i = 1:size(images{z},1)
        %fprintf("%d\n",i)
        aux=0;
        for j = 1:size(images{z},2)
          if images{z}(i,j) == 1
            aux = aux + 1 ;    
          elseif images{z}(i,j) == 0
            count_v(aux+1) = count_v(aux+1) + 1;
            aux = 0;
          end
          %fprintf("%d",img_pb{1}(i,j))
        end
        count_v(aux+1) = count_v(aux+1) + 1;
        %fprintf('\n');
    end
    %% Removing the firsts values on the vectors
    %count_h(1) = [];
    %count_v(1) = [];
    
    hist_h{k}    =  count_h;
    mean_hist_h  =  [mean_hist_h mean(hist_h{k}.*hist_h{k})];
    std_hist_h   =  [std_hist_h  std(hist_h{k})];
    kur_hist_h   =  [kur_hist_h  kurtosis(hist_h{k})];
    skw_hist_h   =  [skw_hist_h  skewness(hist_h{k})];
    mon_3_hist_h =  [mon_3_hist_h  moment(hist_h{k},3)];

    hist_v{k}    =  count_v;
    mean_hist_v  =  [mean_hist_v mean(hist_v{k}.*hist_v{k})];
    std_hist_v   =  [std_hist_v  std(hist_v{k})];
    kur_hist_v   =  [kur_hist_v  kurtosis(hist_v{k})];
    skw_hist_v   =  [skw_hist_v  skewness(hist_v{k})];
    mon_3_hist_v =  [mon_3_hist_v  moment(hist_v{k},3)];

    %% Ploting the results
%     f = figure(1);
%     clf(f);
%     subplot(2,2,1)
%     histogram(count_h)
%     title('Horizontal direction')
%     subplot(2,2,2)
%     histogram(count_v)
%     title('Vertical direction')
%     subplot(2,2,3)
%     imshow(images{z})
%     title(['image ',num2str(z)])    
end
   
   feature_hist = [];
   feature_hist = [feature_hist mean_hist_h'];
   feature_hist = [feature_hist mean_hist_v'];
   
   feature_hist = [feature_hist std_hist_h'];
   feature_hist = [feature_hist std_hist_v'];
   
   feature_hist = [feature_hist skw_hist_h'];
   feature_hist = [feature_hist skw_hist_v'];
   
   feature_hist = [feature_hist kur_hist_h'];
   feature_hist = [feature_hist kur_hist_v'];
   
   feature_hist = [feature_hist mon_3_hist_h'];
   feature_hist = [feature_hist mon_3_hist_v'];
   
end