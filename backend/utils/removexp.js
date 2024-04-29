const {PrismaClient}=require('@prisma/client')
const calcXp = require('./calcXp')
const prisma=new PrismaClient()

const removexp=async(id)=>{
    console.log('entered')
    const date=new Date()

    const result=await prisma.userdata.findFirst({
        where:{
            id:parseInt(id),
            date:date
        }
    })

    console.log(result);

    if(result!=null){
    const results=await prisma.newxp.findFirst({
        where:{
            uid:result.uid,
            date:date
        }
    })

    console.log(results);

    if(results!=null){
        const totalxp=parseFloat(results.totalxp)-parseFloat(calcXp(result.waterfootprint))
        if(totalxp>0){
            await prisma.newxp.update({
                where:{
                    id:result.id
                },
                data:{
                    totalxp:totalxp
                }
            })
        }else{
            await prisma.newxp.update({
                where:{
                    id:result.id
                },
                data:{
                    totalxp:0
                }
            })
        }
        
    }
}
}

module.exports=removexp