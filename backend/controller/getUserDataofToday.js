const {PrismaClient}=require('@prisma/client')
const prisma=new PrismaClient()

const getUserDataofToday=async(req,res)=>{
    try {
    const uid=req.params.uid;
    const date=new Date()
    const result=await prisma.userdata.findMany({
        where:{
            uid:uid,
            date:date
        },  
    })
    const total=await prisma.userdata.aggregate({
        where:{
            uid:uid,
            date:date
        },
        _sum:{
            waterfootprint:true
        }
    })
    return res.status(200).json({success:true,result,total:total._sum.waterfootprint})
    } catch (error) {
        console.log(error);
        return res.status(400).json({success:false,message:"Internal Server Error"})
    }

    
}

module.exports=getUserDataofToday