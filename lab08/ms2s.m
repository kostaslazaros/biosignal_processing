## Copyright (C) 2020 kostas lazaros
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
## @deftypefn {} {@var{retval} =} minsec2samples (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: kostas lazaros <kostas@kostas-t420>
## Created: 2020-12-07

function sample_no = ms2s (minutes, seconds, fs)
  sample_no =  (minutes*60 + seconds) * fs + 1;

endfunction
