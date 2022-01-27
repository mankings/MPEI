function minHashSimilars (users,signatures,threshold)
  Nu = length(users);
  threshold = 1-threshold;
  h= waitbar(0,'Getting similars');
  for n1 = 1:Nu
    waitbar(n1/Nu,h);

    for n2= n1+1:Nu
      dist = sum(signatures(:,n1) == signatures(:,n2))/100;
      if dist > threshold  
        printf("Distance: %f -> user 1: %d ; user 2: %d\n",dist,users(n1),users(n2));
      endif
      end
    end
  delete(h)
  end
end