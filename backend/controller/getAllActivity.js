const {PrismaClient}=require('@prisma/client')
const prisma=new PrismaClient()

const getAllActivity=async(req,res)=>{
    try {
        const result=await prisma.activity.findMany({
            select:{
                activity:true
            }
        })
        return res.status(200).json({success:true,result})
    } catch (error) {
        return res.status(400).json({success:false,message:"Internal Server Error"})
    }
}

module.exports=getAllActivity