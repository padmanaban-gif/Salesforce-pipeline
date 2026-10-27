const getBmi = function(height,weight){
    try{
    return weight/(height*height);
    }catch(error){
        return undefined;
    }
}
export{getBmi};