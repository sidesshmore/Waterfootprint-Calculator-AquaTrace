const {PrismaClient}=require('@prisma/client')
const prisma=new PrismaClient()

const getxpbyuseruid=async(req,res)=>{
    try {
        const uid=req.params.uid;
        const results=await prisma.newxp.findFirst({
            where:{
                uid:uid,
                date:new Date()
            }
        })
        if(results!=null){
            return res.status(200).json({success:true,xp:results.totalxp})
        }else{
            return res.status(200).json({success:true,xp:0})
        }
    } catch (error) {
        console.log(error);
        return res.status(400).json({success:false,message:"Internal Server Error"})
    }
}

module.exports=getxpbyuseruid