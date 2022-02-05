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
## @deftypefn {} {@var{retval} =} createSet (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: DS <ds@OmenDS>
## Created: 2018-11-29

function [users,Set] = createSet (file)
  udata=load(file); % Load File

  %u= udata(1:end,1:2); clear udata;
  %u = unique(u(:,1));
  %p = randperm(length(u),100);

  %users=zeros(100,1);
  %for i=1 : 100
  %  users(i) = u(p(i),1);
  %endfor
 
  % Get first 2 rows
  u= udata(1:end,1:2); clear udata; %Get only 100 users (dont know how to do this randomly!!)

  % Users list
  users = unique(u(:,1)); % Get users IDs
  Nu= length(users);  % Total ammount of users

  % Make list of films per user
  Set= cell(Nu,1); 

  for n = 1:Nu, % For each user
    % Get users films
    ind = find(u(:,1) == users(n));
    %And store in Set
    Set{n} = [Set{n} u(ind,2)];
  endfor
endfunction
