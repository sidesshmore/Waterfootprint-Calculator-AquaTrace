const calcXp=(waterfootprint)=>{
    if(waterfootprint<=200){
        return 9;
    }
    else if(waterfootprint>200 && waterfootprint<500){
        return 6;
    }
    else{
        return 3;
    }
}

module.exports=calcXp;