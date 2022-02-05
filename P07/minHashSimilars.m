## Copyright (C) 2018 DS
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} minHashSimilarities (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: DS <ds@OmenDS>
## Created: 2018-11-29

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
    endfor
  endfor

  delete(h)

endfunction
