const {PrismaClient}=require('@prisma/client')
const calcXp = require('../utils/calcXp')
const prisma=new PrismaClient()

const xpreduction=async(id)=>{
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
                    id:results.id
                },
                data:{
                    totalxp:totalxp
                }
            })
        }else{
            await prisma.newxp.update({
                where:{
                    id:results.id
                },
                data:{
                    totalxp:0
                }
            })
        }
        
    }
}
}

module.exports=xpreduction