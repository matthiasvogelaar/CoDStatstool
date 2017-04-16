///scr_ds_list_compare(list_a, list_b)
var list_a = argument0;
var list_b = argument1;

var size_a = ds_list_size(list_a);

if(size_a != ds_list_size(list_b))
    return false;
    
for(var i = 0; i < size_a; i++){
    if( list_a[| i] != list_b[| i] )
        return false;
}
return true;
