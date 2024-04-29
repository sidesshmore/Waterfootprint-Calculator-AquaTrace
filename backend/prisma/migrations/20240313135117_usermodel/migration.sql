/*
  Warnings:

  - Added the required column `quantity` to the `userdata` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "userdata" ADD COLUMN     "quantity" DECIMAL(65,30) NOT NULL;
