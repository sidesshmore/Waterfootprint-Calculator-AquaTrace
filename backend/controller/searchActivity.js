const {PrismaClient}=require('@prisma/client')
const prisma=new PrismaClient()

const searchActivity=async(req,res)=>{
    try {
        const {activity}=req.body;
        const result=await prisma.activity.findMany(
            {
                where:{
                    activity:{
                        search:activity
                    }
                }
            }
        )
        return res.status(200).json({success:true,length:result.length,result})
    } catch (error) {
        console.log(error);
        res.status(400).json({success:false,message:"Internal Server Error"})
    }
}

module.exports=searchActivity;