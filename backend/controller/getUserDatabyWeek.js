const {PrismaClient}=require('@prisma/client')
const prisma=new PrismaClient()

const getUserDatabyWeek=async(req,res)=>{
    try {
        const weekData=[];
        const date=new Date()
        const id=req.params.id
        for(var i=0;i<7;i++){
            
            const result=await prisma.userdata.aggregate({
                where:{
                    uid:id,
                    date:new Date(new Date().setDate(date.getDate() - i))
                },
                _sum:{
                    waterfootprint:true
                }
            })
            if(result._sum.waterfootprint!=null){
                weekData.push(result._sum.waterfootprint)
            }
            else{
                weekData.push(0)
            }
        }
        return res.status(200).json({success:true,weekData})
    } catch (error) {
        console.log(error);
        return res.status(400).json({success:false,message:"Internal Server Error"})
    }
}


module.exports=getUserDatabyWeek