/*
  Warnings:

  - You are about to drop the column `employr` on the `activity` table. All the data in the column will be lost.
  - Added the required column `employer` to the `activity` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `activity` DROP COLUMN `employr`,
    ADD COLUMN `employer` VARCHAR(191) NOT NULL;
