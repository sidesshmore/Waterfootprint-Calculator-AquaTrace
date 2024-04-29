const {PrismaClient}=require('@prisma/client')
const prisma=new PrismaClient()

const getUserDatabyDate=async(req,res)=>{
    try {
    const uid=req.params.uid;
    const {date}=req.body
    const result=await prisma.userdata.findMany({
        where:{
            uid:uid,
            date:date.concat('T00:00:00.000Z')
        },  
    })
    const total=await prisma.userdata.aggregate({
        where:{
            uid:uid,
            date:date.concat('T00:00:00.000Z')
        },
        _sum:{
            waterfootprint:true
        }
    })
    const waterfootprint=total._sum.waterfootprint
    if(waterfootprint==null){
        return res.status(204).json({success:false,result,total:0})
    }
    else{
        return res.status(200).json({success:true,result,total:total._sum.waterfootprint})
    }
    } catch (error) {
        console.log(error);
        return res.status(400).json({success:false,message:"Internal Server Error"})
    }

    
}

module.exports=getUserDatabyDate