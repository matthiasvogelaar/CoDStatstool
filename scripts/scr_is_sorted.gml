///scr_is_sorted(array, ascending)
var arr = argument0;

var size = array_length_1d(arr);

for(var i = 0; i < size-1; i++)
{
    if((argument1 && arr[i] > arr[i+1]) ||
       (!argument1 && arr[i] < arr[i+1]) )
        return false;
}
return true;
