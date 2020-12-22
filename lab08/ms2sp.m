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
## @deftypefn {} {@var{retval} =} ms2sp (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: kostas lazaros <kostas@kostas-t420>
## Created: 2020-12-07

function retval = ms2sp (mnt, secs, fs, rng, tm, sig)
  plot(tm(ms2s(mnt, secs, fs):ms2s(mnt, secs+rng, fs))/60, sig(ms2s(mnt, secs, fs):ms2s(mnt, secs+rng, fs)));

endfunction
