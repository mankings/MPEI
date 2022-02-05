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
## @deftypefn {} {@var{retval} =} jaccardDistance (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: DS <ds@OmenDS>
## Created: 2018-11-29

function J = jaccardDistance (users,Set)
  
  Nu= length(users); %Total Number of users
  
  J=zeros(Nu,Nu); % Distances Array
  h= waitbar(0,'Calculating');

  for n1= 1:Nu,
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu,
      i = intersect(Set{n1},Set{n2});
      u = union(Set{n1},Set{n2});
      J(n1,n2) = 1 - (length(i) / length(u));
    endfor
  endfor

  delete (h)
endfunction
