const {PrismaClient}=require('@prisma/client')
const prisma=new PrismaClient()

const xpleaderboard=async(req,res)=>{
    try {
        const results=await prisma.newxp.findMany({
            where:{
                date:new Date()
            },
            orderBy:{
                totalxp: 'desc'
        }
    })
        return res.status(200).json({success:true,results})
    } catch (error) {
        console.log(error);
        return res.status(400).json({success:false,message:"Internal Server Error"})
    }
}

module.exports=xpleaderboard