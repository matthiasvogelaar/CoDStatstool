///scr_merge_sort_sub(keys, values,from,to, ascending)
var list = argument0;
var values = argument1;
var from = argument2;
var to = argument3;
var asc = argument4;

if( (to - from) == 1 || to == from)
    return true;

if( (to - from) > 2)
{
    var length = to - from;
    scr_merge_sort_sub(list, values,from, from + ceil(length/2),asc);
    scr_merge_sort_sub(list, values,from + ceil(length/2), to,asc);
    var temp_keys, temp_values;
    for(var i = length-1; i >= 0; i--){
        temp_keys[i] = list[from + i];
        temp_values[i] = values[from + i];   
    }
    var index1, index2;
    index1 = 0;
    index2 = ceil(length/2);
    for(var i = 0; i < length; i++)
    {
        var res;
        if(index2 < length && index1 < ceil(length/2)){
            res = 0;
            if( temp_keys[index1] > temp_keys[index2] )
                res = 1;    
        }
        else if(index2 >= length)
        {
            list[@from+i] = temp_keys[index1];
            values[@from+i] = temp_values[index1];
            index1++;
            continue;
        }
        else
        {
            list[@from+i] = temp_keys[index2];
            values[@from+i] = temp_values[index2];
            index2++;
            continue;
        }
        if(!asc)
            res = abs(res-1);
        if(res == 0)
        {
            list[@from+i] = temp_keys[index1];
            values[@from+i] = temp_values[index1];
            index1++;
        }
        else
        {
            list[@from+i] = temp_keys[index2];
            values[@from+i] = temp_values[index2];
            index2++;
        }  
    }
}
else
{
    var res = 0;
    if( list[from] > list[to-1] )
        res = 1;
    if(!asc)
        res = abs(res-1);
    if(res == 1)
    {
        var temp = list[from];
        list[@from] = list[to-1];
        list[@to-1] = temp;
        temp = values[from];
        values[@from] = values[to-1];
        values[@to-1] = temp;
    }
}
