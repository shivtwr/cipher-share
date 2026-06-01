-- CreateEnum
CREATE TYPE "FileState" AS ENUM ('ACTIVE', 'EXPIRED');

-- CreateEnum
CREATE TYPE "AuthType" AS ENUM ('GOOGLE', 'EMAIL');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "authType" "AuthType" NOT NULL,
    "publicKey" TEXT,
    "privateKey" TEXT,
    "password" TEXT,
    "picture" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "File" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "size" TEXT NOT NULL,
    "senderEmail" TEXT NOT NULL,
    "recipientEmail" TEXT NOT NULL,
    "currentStatus" "FileState" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "File_id_key" ON "File"("id");

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_senderEmail_fkey" FOREIGN KEY ("senderEmail") REFERENCES "User"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_recipientEmail_fkey" FOREIGN KEY ("recipientEmail") REFERENCES "User"("email") ON DELETE RESTRICT ON UPDATE CASCADE;
