/*
  Warnings:

  - You are about to drop the column `cityId` on the `activity` table. All the data in the column will be lost.
  - You are about to drop the column `resumeId` on the `activity` table. All the data in the column will be lost.
  - You are about to drop the column `resumeId` on the `avatar` table. All the data in the column will be lost.
  - You are about to drop the column `countryId` on the `city` table. All the data in the column will be lost.
  - You are about to drop the column `cityId` on the `education` table. All the data in the column will be lost.
  - You are about to drop the column `resumeId` on the `education` table. All the data in the column will be lost.
  - You are about to drop the column `jobId` on the `job_skill` table. All the data in the column will be lost.
  - You are about to drop the column `cityId` on the `resume` table. All the data in the column will be lost.
  - You are about to drop the column `jobId` on the `resume` table. All the data in the column will be lost.
  - You are about to drop the column `resumeId` on the `skill` table. All the data in the column will be lost.
  - You are about to drop the column `templateId` on the `template_section` table. All the data in the column will be lost.
  - You are about to drop the column `subscriptionId` on the `user_subscription` table. All the data in the column will be lost.
  - You are about to drop the column `cityId` on the `work_experience` table. All the data in the column will be lost.
  - You are about to drop the column `resumeId` on the `work_experience` table. All the data in the column will be lost.
  - Added the required column `city_id` to the `activity` table without a default value. This is not possible if the table is not empty.
  - Added the required column `resume_id` to the `activity` table without a default value. This is not possible if the table is not empty.
  - Added the required column `resume_id` to the `education` table without a default value. This is not possible if the table is not empty.
  - Added the required column `job_id` to the `job_skill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `city_id` to the `resume` table without a default value. This is not possible if the table is not empty.
  - Added the required column `job_id` to the `resume` table without a default value. This is not possible if the table is not empty.
  - Added the required column `city_id` to the `work_experience` table without a default value. This is not possible if the table is not empty.
  - Added the required column `resume_id` to the `work_experience` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `activity` DROP FOREIGN KEY `activity_cityId_fkey`;

-- DropForeignKey
ALTER TABLE `activity` DROP FOREIGN KEY `activity_resumeId_fkey`;

-- DropForeignKey
ALTER TABLE `avatar` DROP FOREIGN KEY `avatar_resumeId_fkey`;

-- DropForeignKey
ALTER TABLE `city` DROP FOREIGN KEY `city_countryId_fkey`;

-- DropForeignKey
ALTER TABLE `education` DROP FOREIGN KEY `education_cityId_fkey`;

-- DropForeignKey
ALTER TABLE `education` DROP FOREIGN KEY `education_resumeId_fkey`;

-- DropForeignKey
ALTER TABLE `job_skill` DROP FOREIGN KEY `job_skill_jobId_fkey`;

-- DropForeignKey
ALTER TABLE `resume` DROP FOREIGN KEY `resume_cityId_fkey`;

-- DropForeignKey
ALTER TABLE `resume` DROP FOREIGN KEY `resume_jobId_fkey`;

-- DropForeignKey
ALTER TABLE `skill` DROP FOREIGN KEY `skill_resumeId_fkey`;

-- DropForeignKey
ALTER TABLE `template_section` DROP FOREIGN KEY `template_section_templateId_fkey`;

-- DropForeignKey
ALTER TABLE `user_subscription` DROP FOREIGN KEY `user_subscription_subscriptionId_fkey`;

-- DropForeignKey
ALTER TABLE `work_experience` DROP FOREIGN KEY `work_experience_cityId_fkey`;

-- DropForeignKey
ALTER TABLE `work_experience` DROP FOREIGN KEY `work_experience_resumeId_fkey`;

-- AlterTable
ALTER TABLE `activity` DROP COLUMN `cityId`,
    DROP COLUMN `resumeId`,
    ADD COLUMN `city_id` INTEGER NOT NULL,
    ADD COLUMN `resume_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `avatar` DROP COLUMN `resumeId`,
    ADD COLUMN `resume_id` INTEGER NULL;

-- AlterTable
ALTER TABLE `city` DROP COLUMN `countryId`,
    ADD COLUMN `country_id` INTEGER NULL;

-- AlterTable
ALTER TABLE `education` DROP COLUMN `cityId`,
    DROP COLUMN `resumeId`,
    ADD COLUMN `city_id` INTEGER NULL,
    ADD COLUMN `resume_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `job_skill` DROP COLUMN `jobId`,
    ADD COLUMN `job_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `resume` DROP COLUMN `cityId`,
    DROP COLUMN `jobId`,
    ADD COLUMN `city_id` INTEGER NOT NULL,
    ADD COLUMN `job_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `skill` DROP COLUMN `resumeId`,
    ADD COLUMN `resume_id` INTEGER NULL;

-- AlterTable
ALTER TABLE `template_section` DROP COLUMN `templateId`,
    ADD COLUMN `template_id` INTEGER NULL;

-- AlterTable
ALTER TABLE `user_subscription` DROP COLUMN `subscriptionId`;

-- AlterTable
ALTER TABLE `work_experience` DROP COLUMN `cityId`,
    DROP COLUMN `resumeId`,
    ADD COLUMN `city_id` INTEGER NOT NULL,
    ADD COLUMN `resume_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `user_subscription` ADD CONSTRAINT `user_subscription_subscription_id_fkey` FOREIGN KEY (`subscription_id`) REFERENCES `Subscription`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resume` ADD CONSTRAINT `resume_job_id_fkey` FOREIGN KEY (`job_id`) REFERENCES `job`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `resume` ADD CONSTRAINT `resume_city_id_fkey` FOREIGN KEY (`city_id`) REFERENCES `city`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `job_skill` ADD CONSTRAINT `job_skill_job_id_fkey` FOREIGN KEY (`job_id`) REFERENCES `job`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `city` ADD CONSTRAINT `city_country_id_fkey` FOREIGN KEY (`country_id`) REFERENCES `country`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `template_section` ADD CONSTRAINT `template_section_template_id_fkey` FOREIGN KEY (`template_id`) REFERENCES `template`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `skill` ADD CONSTRAINT `skill_resume_id_fkey` FOREIGN KEY (`resume_id`) REFERENCES `resume`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `avatar` ADD CONSTRAINT `avatar_resume_id_fkey` FOREIGN KEY (`resume_id`) REFERENCES `resume`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `education` ADD CONSTRAINT `education_city_id_fkey` FOREIGN KEY (`city_id`) REFERENCES `city`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `education` ADD CONSTRAINT `education_resume_id_fkey` FOREIGN KEY (`resume_id`) REFERENCES `resume`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `activity` ADD CONSTRAINT `activity_resume_id_fkey` FOREIGN KEY (`resume_id`) REFERENCES `resume`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `activity` ADD CONSTRAINT `activity_city_id_fkey` FOREIGN KEY (`city_id`) REFERENCES `city`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `work_experience` ADD CONSTRAINT `work_experience_resume_id_fkey` FOREIGN KEY (`resume_id`) REFERENCES `resume`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `work_experience` ADD CONSTRAINT `work_experience_city_id_fkey` FOREIGN KEY (`city_id`) REFERENCES `city`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
