CREATE DATABASE  IF NOT EXISTS `admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `admin`;
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: admin
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `authority_menu`
--

DROP TABLE IF EXISTS `authority_menu`;
/*!50001 DROP VIEW IF EXISTS `authority_menu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `authority_menu` AS SELECT 
 1 AS `id`,
 1 AS `path`,
 1 AS `icon`,
 1 AS `name`,
 1 AS `sort`,
 1 AS `title`,
 1 AS `hidden`,
 1 AS `component`,
 1 AS `parent_id`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `deleted_at`,
 1 AS `keep_alive`,
 1 AS `menu_level`,
 1 AS `default_menu`,
 1 AS `close_tab`,
 1 AS `menu_id`,
 1 AS `authority_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auto_code_examples`
--

DROP TABLE IF EXISTS `auto_code_examples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_code_examples` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `auto_code_example_field` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仅作示例条目无实际作用',
  PRIMARY KEY (`id`),
  KEY `idx_auto_code_examples_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_code_examples`
--

LOCK TABLES `auto_code_examples` WRITE;
/*!40000 ALTER TABLE `auto_code_examples` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_code_examples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casbin_rule`
--

DROP TABLE IF EXISTS `casbin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casbin_rule` (
  `p_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;
INSERT INTO `casbin_rule` VALUES ('p','8881','/base/login','POST','','',''),('p','8881','/user/register','POST','','',''),('p','8881','/api/createApi','POST','','',''),('p','8881','/api/getApiList','POST','','',''),('p','8881','/api/getApiById','POST','','',''),('p','8881','/api/deleteApi','POST','','',''),('p','8881','/api/updateApi','POST','','',''),('p','8881','/api/getAllApis','POST','','',''),('p','8881','/authority/createAuthority','POST','','',''),('p','8881','/authority/deleteAuthority','POST','','',''),('p','8881','/authority/getAuthorityList','POST','','',''),('p','8881','/authority/setDataAuthority','POST','','',''),('p','8881','/menu/getMenu','POST','','',''),('p','8881','/menu/getMenuList','POST','','',''),('p','8881','/menu/addBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuTree','POST','','',''),('p','8881','/menu/addMenuAuthority','POST','','',''),('p','8881','/menu/getMenuAuthority','POST','','',''),('p','8881','/menu/deleteBaseMenu','POST','','',''),('p','8881','/menu/updateBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuById','POST','','',''),('p','8881','/user/changePassword','POST','','',''),('p','8881','/user/getUserList','POST','','',''),('p','8881','/user/setUserAuthority','POST','','',''),('p','8881','/fileUploadAndDownload/upload','POST','','',''),('p','8881','/fileUploadAndDownload/getFileList','POST','','',''),('p','8881','/fileUploadAndDownload/deleteFile','POST','','',''),('p','8881','/casbin/updateCasbin','POST','','',''),('p','8881','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','8881','/jwt/jsonInBlacklist','POST','','',''),('p','8881','/system/getSystemConfig','POST','','',''),('p','8881','/system/setSystemConfig','POST','','',''),('p','8881','/customer/customer','POST','','',''),('p','8881','/customer/customer','PUT','','',''),('p','8881','/customer/customer','DELETE','','',''),('p','8881','/customer/customer','GET','','',''),('p','8881','/customer/customerList','GET','','',''),('p','8881','/user/getUserInfo','GET','','',''),('p','9528','/base/login','POST','','',''),('p','9528','/user/register','POST','','',''),('p','9528','/api/createApi','POST','','',''),('p','9528','/api/getApiList','POST','','',''),('p','9528','/api/getApiById','POST','','',''),('p','9528','/api/deleteApi','POST','','',''),('p','9528','/api/updateApi','POST','','',''),('p','9528','/api/getAllApis','POST','','',''),('p','9528','/authority/createAuthority','POST','','',''),('p','9528','/authority/deleteAuthority','POST','','',''),('p','9528','/authority/getAuthorityList','POST','','',''),('p','9528','/authority/setDataAuthority','POST','','',''),('p','9528','/menu/getMenu','POST','','',''),('p','9528','/menu/getMenuList','POST','','',''),('p','9528','/menu/addBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuTree','POST','','',''),('p','9528','/menu/addMenuAuthority','POST','','',''),('p','9528','/menu/getMenuAuthority','POST','','',''),('p','9528','/menu/deleteBaseMenu','POST','','',''),('p','9528','/menu/updateBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuById','POST','','',''),('p','9528','/user/changePassword','POST','','',''),('p','9528','/user/getUserList','POST','','',''),('p','9528','/user/setUserAuthority','POST','','',''),('p','9528','/fileUploadAndDownload/upload','POST','','',''),('p','9528','/fileUploadAndDownload/getFileList','POST','','',''),('p','9528','/fileUploadAndDownload/deleteFile','POST','','',''),('p','9528','/casbin/updateCasbin','POST','','',''),('p','9528','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','9528','/jwt/jsonInBlacklist','POST','','',''),('p','9528','/system/getSystemConfig','POST','','',''),('p','9528','/system/setSystemConfig','POST','','',''),('p','9528','/customer/customer','PUT','','',''),('p','9528','/customer/customer','GET','','',''),('p','9528','/customer/customer','POST','','',''),('p','9528','/customer/customer','DELETE','','',''),('p','9528','/customer/customerList','GET','','',''),('p','9528','/autoCode/createTemp','POST','','',''),('p','9528','/user/getUserInfo','GET','','',''),('p','888','/base/login','POST','','',''),('p','888','/jwt/jsonInBlacklist','POST','','',''),('p','888','/user/deleteUser','DELETE','','',''),('p','888','/user/register','POST','','',''),('p','888','/user/getUserList','POST','','',''),('p','888','/user/setUserInfo','PUT','','',''),('p','888','/user/setSelfInfo','PUT','','',''),('p','888','/user/getUserInfo','GET','','',''),('p','888','/user/setUserAuthorities','POST','','',''),('p','888','/user/changePassword','POST','','',''),('p','888','/user/setUserAuthority','POST','','',''),('p','888','/user/resetPassword','POST','','',''),('p','888','/api/createApi','POST','','',''),('p','888','/api/deleteApi','POST','','',''),('p','888','/api/updateApi','POST','','',''),('p','888','/api/getApiList','POST','','',''),('p','888','/api/getAllApis','POST','','',''),('p','888','/api/getApiById','POST','','',''),('p','888','/api/deleteApisByIds','DELETE','','',''),('p','888','/authority/copyAuthority','POST','','',''),('p','888','/authority/createAuthority','POST','','',''),('p','888','/authority/deleteAuthority','POST','','',''),('p','888','/authority/updateAuthority','PUT','','',''),('p','888','/authority/getAuthorityList','POST','','',''),('p','888','/authority/setDataAuthority','POST','','',''),('p','888','/casbin/updateCasbin','POST','','',''),('p','888','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','888','/menu/addBaseMenu','POST','','',''),('p','888','/menu/getMenu','POST','','',''),('p','888','/menu/deleteBaseMenu','POST','','',''),('p','888','/menu/updateBaseMenu','POST','','',''),('p','888','/menu/getBaseMenuById','POST','','',''),('p','888','/menu/getMenuList','POST','','',''),('p','888','/menu/getBaseMenuTree','POST','','',''),('p','888','/menu/getMenuAuthority','POST','','',''),('p','888','/menu/addMenuAuthority','POST','','',''),('p','888','/fileUploadAndDownload/breakpointContinue','POST','','',''),('p','888','/fileUploadAndDownload/breakpointContinueFinish','POST','','',''),('p','888','/fileUploadAndDownload/removeChunk','POST','','',''),('p','888','/fileUploadAndDownload/upload','POST','','',''),('p','888','/fileUploadAndDownload/deleteFile','POST','','',''),('p','888','/fileUploadAndDownload/getFileList','POST','','',''),('p','888','/system/getServerInfo','POST','','',''),('p','888','/system/getSystemConfig','POST','','',''),('p','888','/system/setSystemConfig','POST','','',''),('p','888','/customer/customer','PUT','','',''),('p','888','/customer/customer','POST','','',''),('p','888','/customer/customer','DELETE','','',''),('p','888','/customer/customer','GET','','',''),('p','888','/customer/customerList','GET','','',''),('p','888','/autoCode/getDB','GET','','',''),('p','888','/autoCode/getTables','GET','','',''),('p','888','/autoCode/createTemp','POST','','',''),('p','888','/autoCode/preview','POST','','',''),('p','888','/autoCode/getColumn','GET','','',''),('p','888','/autoCode/getMeta','POST','','',''),('p','888','/autoCode/rollback','POST','','',''),('p','888','/autoCode/getSysHistory','POST','','',''),('p','888','/autoCode/delSysHistory','POST','','',''),('p','888','/sysDictionaryDetail/updateSysDictionaryDetail','PUT','','',''),('p','888','/sysDictionaryDetail/createSysDictionaryDetail','POST','','',''),('p','888','/sysDictionaryDetail/deleteSysDictionaryDetail','DELETE','','',''),('p','888','/sysDictionaryDetail/findSysDictionaryDetail','GET','','',''),('p','888','/sysDictionaryDetail/getSysDictionaryDetailList','GET','','',''),('p','888','/sysDictionary/createSysDictionary','POST','','',''),('p','888','/sysDictionary/deleteSysDictionary','DELETE','','',''),('p','888','/sysDictionary/updateSysDictionary','PUT','','',''),('p','888','/sysDictionary/findSysDictionary','GET','','',''),('p','888','/sysDictionary/getSysDictionaryList','GET','','',''),('p','888','/sysOperationRecord/createSysOperationRecord','POST','','',''),('p','888','/sysOperationRecord/findSysOperationRecord','GET','','',''),('p','888','/sysOperationRecord/getSysOperationRecordList','GET','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecord','DELETE','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','',''),('p','888','/simpleUploader/upload','POST','','',''),('p','888','/simpleUploader/checkFileMd5','GET','','',''),('p','888','/simpleUploader/mergeFileMd5','GET','','',''),('p','888','/email/emailTest','POST','','',''),('p','888','/excel/importExcel','POST','','',''),('p','888','/excel/loadExcel','GET','','',''),('p','888','/excel/exportExcel','POST','','',''),('p','888','/excel/downloadTemplate','GET','','',''),('p','888','/authorityBtn/setAuthorityBtn','POST','','',''),('p','888','/authorityBtn/getAuthorityBtn','POST','','',''),('p','888','/authorityBtn/canRemoveAuthorityBtn','POST','','',''),('p','888','/gateways/createGateways','POST','','',''),('p','888','/gateways/deleteGateways','DELETE','','',''),('p','888','/gateways/deleteGatewaysByIds','DELETE','','',''),('p','888','/gateways/updateGateways','PUT','','',''),('p','888','/gateways/findGateways','GET','','',''),('p','888','/gateways/getGatewaysList','GET','','',''),('p','888','/categories/createCategories','POST','','',''),('p','888','/categories/deleteCategories','DELETE','','',''),('p','888','/categories/deleteCategoriesByIds','DELETE','','',''),('p','888','/categories/updateCategories','PUT','','',''),('p','888','/categories/findCategories','GET','','',''),('p','888','/categories/getCategoriesList','GET','','',''),('p','888','/providers/createProviders','POST','','',''),('p','888','/providers/deleteProviders','DELETE','','',''),('p','888','/providers/deleteProvidersByIds','DELETE','','',''),('p','888','/providers/updateProviders','PUT','','',''),('p','888','/providers/findProviders','GET','','',''),('p','888','/providers/getProvidersList','GET','','',''),('p','888','/frontends/createVersions','POST','','',''),('p','888','/frontends/deleteVersions','DELETE','','',''),('p','888','/frontends/deleteVersionsByIds','DELETE','','',''),('p','888','/frontends/updateVersions','PUT','','',''),('p','888','/frontends/findVersions','GET','','',''),('p','888','/frontends/getVersionsList','GET','','',''),('p','888','/terminals/createTerminals','POST','','',''),('p','888','/terminals/deleteTerminals','DELETE','','',''),('p','888','/terminals/deleteTerminalsByIds','DELETE','','',''),('p','888','/terminals/updateTerminals','PUT','','',''),('p','888','/terminals/findTerminals','GET','','',''),('p','888','/terminals/getTerminalsList','GET','','',''),('p','888','/fields/createFields','POST','','',''),('p','888','/fields/deleteFields','DELETE','','',''),('p','888','/fields/deleteFieldsByIds','DELETE','','',''),('p','888','/fields/updateFields','PUT','','',''),('p','888','/fields/findFields','GET','','',''),('p','888','/fields/getFieldsList','GET','','',''),('p','888','/services/createServices','POST','','',''),('p','888','/services/deleteServices','DELETE','','',''),('p','888','/services/deleteServicesByIds','DELETE','','',''),('p','888','/services/updateServices','PUT','','',''),('p','888','/services/findServices','GET','','',''),('p','888','/services/getServicesList','GET','','',''),('p','888','/merchant/createMerchant','POST','','',''),('p','888','/merchant/deleteMerchant','DELETE','','',''),('p','888','/merchant/deleteMerchantByIds','DELETE','','',''),('p','888','/merchant/updateMerchant','PUT','','',''),('p','888','/merchant/findMerchant','GET','','',''),('p','888','/merchant/getMerchantList','GET','','',''),('p','888','/packages/createPackages','POST','','',''),('p','888','/packages/deletePackages','DELETE','','',''),('p','888','/packages/deletePackagesByIds','DELETE','','',''),('p','888','/packages/updatePackages','PUT','','',''),('p','888','/packages/findPackages','GET','','',''),('p','888','/packages/getPackagesList','GET','','',''),('p','888','/base/login','POST','','',''),('p','888','/user/register','POST','','',''),('p','888','/api/createApi','POST','','',''),('p','888','/api/getApiList','POST','','',''),('p','888','/api/getApiById','POST','','',''),('p','888','/api/deleteApi','POST','','',''),('p','888','/api/updateApi','POST','','',''),('p','888','/api/getAllApis','POST','','',''),('p','888','/api/deleteApisByIds','DELETE','','',''),('p','888','/authority/copyAuthority','POST','','',''),('p','888','/authority/updateAuthority','PUT','','',''),('p','888','/authority/createAuthority','POST','','',''),('p','888','/authority/deleteAuthority','POST','','',''),('p','888','/authority/getAuthorityList','POST','','',''),('p','888','/authority/setDataAuthority','POST','','',''),('p','888','/menu/getMenu','POST','','',''),('p','888','/menu/getMenuList','POST','','',''),('p','888','/menu/addBaseMenu','POST','','',''),('p','888','/menu/getBaseMenuTree','POST','','',''),('p','888','/menu/addMenuAuthority','POST','','',''),('p','888','/menu/getMenuAuthority','POST','','',''),('p','888','/menu/deleteBaseMenu','POST','','',''),('p','888','/menu/updateBaseMenu','POST','','',''),('p','888','/menu/getBaseMenuById','POST','','',''),('p','888','/user/getUserInfo','GET','','',''),('p','888','/user/setUserInfo','PUT','','',''),('p','888','/user/setSelfInfo','PUT','','',''),('p','888','/user/getUserList','POST','','',''),('p','888','/user/deleteUser','DELETE','','',''),('p','888','/user/changePassword','POST','','',''),('p','888','/user/setUserAuthority','POST','','',''),('p','888','/user/setUserAuthorities','POST','','',''),('p','888','/user/resetPassword','POST','','',''),('p','888','/fileUploadAndDownload/findFile','GET','','',''),('p','888','/fileUploadAndDownload/breakpointContinueFinish','POST','','',''),('p','888','/fileUploadAndDownload/breakpointContinue','POST','','',''),('p','888','/fileUploadAndDownload/removeChunk','POST','','',''),('p','888','/fileUploadAndDownload/upload','POST','','',''),('p','888','/fileUploadAndDownload/deleteFile','POST','','',''),('p','888','/fileUploadAndDownload/getFileList','POST','','',''),('p','888','/casbin/updateCasbin','POST','','',''),('p','888','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','888','/jwt/jsonInBlacklist','POST','','',''),('p','888','/system/getSystemConfig','POST','','',''),('p','888','/system/setSystemConfig','POST','','',''),('p','888','/system/getServerInfo','POST','','',''),('p','888','/customer/customer','GET','','',''),('p','888','/customer/customer','PUT','','',''),('p','888','/customer/customer','POST','','',''),('p','888','/customer/customer','DELETE','','',''),('p','888','/customer/customerList','GET','','',''),('p','888','/autoCode/getDB','GET','','',''),('p','888','/autoCode/getMeta','POST','','',''),('p','888','/autoCode/preview','POST','','',''),('p','888','/autoCode/getTables','GET','','',''),('p','888','/autoCode/getColumn','GET','','',''),('p','888','/autoCode/rollback','POST','','',''),('p','888','/autoCode/createTemp','POST','','',''),('p','888','/autoCode/delSysHistory','POST','','',''),('p','888','/autoCode/getSysHistory','POST','','',''),('p','888','/sysDictionaryDetail/findSysDictionaryDetail','GET','','',''),('p','888','/sysDictionaryDetail/updateSysDictionaryDetail','PUT','','',''),('p','888','/sysDictionaryDetail/createSysDictionaryDetail','POST','','',''),('p','888','/sysDictionaryDetail/getSysDictionaryDetailList','GET','','',''),('p','888','/sysDictionaryDetail/deleteSysDictionaryDetail','DELETE','','',''),('p','888','/sysDictionary/findSysDictionary','GET','','',''),('p','888','/sysDictionary/updateSysDictionary','PUT','','',''),('p','888','/sysDictionary/getSysDictionaryList','GET','','',''),('p','888','/sysDictionary/createSysDictionary','POST','','',''),('p','888','/sysDictionary/deleteSysDictionary','DELETE','','',''),('p','888','/sysOperationRecord/findSysOperationRecord','GET','','',''),('p','888','/sysOperationRecord/updateSysOperationRecord','PUT','','',''),('p','888','/sysOperationRecord/createSysOperationRecord','POST','','',''),('p','888','/sysOperationRecord/getSysOperationRecordList','GET','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecord','DELETE','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','',''),('p','888','/email/emailTest','POST','','',''),('p','888','/simpleUploader/upload','POST','','',''),('p','888','/simpleUploader/checkFileMd5','GET','','',''),('p','888','/simpleUploader/mergeFileMd5','GET','','',''),('p','888','/excel/importExcel','POST','','',''),('p','888','/excel/loadExcel','GET','','',''),('p','888','/excel/exportExcel','POST','','',''),('p','888','/excel/downloadTemplate','GET','','',''),('p','888','/authorityBtn/setAuthorityBtn','POST','','',''),('p','888','/authorityBtn/getAuthorityBtn','POST','','',''),('p','888','/authorityBtn/canRemoveAuthorityBtn','POST','','',''),('p','8881','/base/login','POST','','',''),('p','8881','/user/register','POST','','',''),('p','8881','/api/createApi','POST','','',''),('p','8881','/api/getApiList','POST','','',''),('p','8881','/api/getApiById','POST','','',''),('p','8881','/api/deleteApi','POST','','',''),('p','8881','/api/updateApi','POST','','',''),('p','8881','/api/getAllApis','POST','','',''),('p','8881','/authority/createAuthority','POST','','',''),('p','8881','/authority/deleteAuthority','POST','','',''),('p','8881','/authority/getAuthorityList','POST','','',''),('p','8881','/authority/setDataAuthority','POST','','',''),('p','8881','/menu/getMenu','POST','','',''),('p','8881','/menu/getMenuList','POST','','',''),('p','8881','/menu/addBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuTree','POST','','',''),('p','8881','/menu/addMenuAuthority','POST','','',''),('p','8881','/menu/getMenuAuthority','POST','','',''),('p','8881','/menu/deleteBaseMenu','POST','','',''),('p','8881','/menu/updateBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuById','POST','','',''),('p','8881','/user/changePassword','POST','','',''),('p','8881','/user/getUserList','POST','','',''),('p','8881','/user/setUserAuthority','POST','','',''),('p','8881','/fileUploadAndDownload/upload','POST','','',''),('p','8881','/fileUploadAndDownload/getFileList','POST','','',''),('p','8881','/fileUploadAndDownload/deleteFile','POST','','',''),('p','8881','/casbin/updateCasbin','POST','','',''),('p','8881','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','8881','/jwt/jsonInBlacklist','POST','','',''),('p','8881','/system/getSystemConfig','POST','','',''),('p','8881','/system/setSystemConfig','POST','','',''),('p','8881','/customer/customer','POST','','',''),('p','8881','/customer/customer','PUT','','',''),('p','8881','/customer/customer','DELETE','','',''),('p','8881','/customer/customer','GET','','',''),('p','8881','/customer/customerList','GET','','',''),('p','8881','/user/getUserInfo','GET','','',''),('p','9528','/base/login','POST','','',''),('p','9528','/user/register','POST','','',''),('p','9528','/api/createApi','POST','','',''),('p','9528','/api/getApiList','POST','','',''),('p','9528','/api/getApiById','POST','','',''),('p','9528','/api/deleteApi','POST','','',''),('p','9528','/api/updateApi','POST','','',''),('p','9528','/api/getAllApis','POST','','',''),('p','9528','/authority/createAuthority','POST','','',''),('p','9528','/authority/deleteAuthority','POST','','',''),('p','9528','/authority/getAuthorityList','POST','','',''),('p','9528','/authority/setDataAuthority','POST','','',''),('p','9528','/menu/getMenu','POST','','',''),('p','9528','/menu/getMenuList','POST','','',''),('p','9528','/menu/addBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuTree','POST','','',''),('p','9528','/menu/addMenuAuthority','POST','','',''),('p','9528','/menu/getMenuAuthority','POST','','',''),('p','9528','/menu/deleteBaseMenu','POST','','',''),('p','9528','/menu/updateBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuById','POST','','',''),('p','9528','/user/changePassword','POST','','',''),('p','9528','/user/getUserList','POST','','',''),('p','9528','/user/setUserAuthority','POST','','',''),('p','9528','/fileUploadAndDownload/upload','POST','','',''),('p','9528','/fileUploadAndDownload/getFileList','POST','','',''),('p','9528','/fileUploadAndDownload/deleteFile','POST','','',''),('p','9528','/casbin/updateCasbin','POST','','',''),('p','9528','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','9528','/jwt/jsonInBlacklist','POST','','',''),('p','9528','/system/getSystemConfig','POST','','',''),('p','9528','/system/setSystemConfig','POST','','',''),('p','9528','/customer/customer','PUT','','',''),('p','9528','/customer/customer','GET','','',''),('p','9528','/customer/customer','POST','','',''),('p','9528','/customer/customer','DELETE','','',''),('p','9528','/customer/customerList','GET','','',''),('p','9528','/autoCode/createTemp','POST','','',''),('p','9528','/user/getUserInfo','GET','','',''),('p','888','/base/login','POST','','',''),('p','888','/user/register','POST','','',''),('p','888','/api/createApi','POST','','',''),('p','888','/api/getApiList','POST','','',''),('p','888','/api/getApiById','POST','','',''),('p','888','/api/deleteApi','POST','','',''),('p','888','/api/updateApi','POST','','',''),('p','888','/api/getAllApis','POST','','',''),('p','888','/api/deleteApisByIds','DELETE','','',''),('p','888','/authority/copyAuthority','POST','','',''),('p','888','/authority/updateAuthority','PUT','','',''),('p','888','/authority/createAuthority','POST','','',''),('p','888','/authority/deleteAuthority','POST','','',''),('p','888','/authority/getAuthorityList','POST','','',''),('p','888','/authority/setDataAuthority','POST','','',''),('p','888','/menu/getMenu','POST','','',''),('p','888','/menu/getMenuList','POST','','',''),('p','888','/menu/addBaseMenu','POST','','',''),('p','888','/menu/getBaseMenuTree','POST','','',''),('p','888','/menu/addMenuAuthority','POST','','',''),('p','888','/menu/getMenuAuthority','POST','','',''),('p','888','/menu/deleteBaseMenu','POST','','',''),('p','888','/menu/updateBaseMenu','POST','','',''),('p','888','/menu/getBaseMenuById','POST','','',''),('p','888','/user/getUserInfo','GET','','',''),('p','888','/user/setUserInfo','PUT','','',''),('p','888','/user/setSelfInfo','PUT','','',''),('p','888','/user/getUserList','POST','','',''),('p','888','/user/deleteUser','DELETE','','',''),('p','888','/user/changePassword','POST','','',''),('p','888','/user/setUserAuthority','POST','','',''),('p','888','/user/setUserAuthorities','POST','','',''),('p','888','/user/resetPassword','POST','','',''),('p','888','/fileUploadAndDownload/findFile','GET','','',''),('p','888','/fileUploadAndDownload/breakpointContinueFinish','POST','','',''),('p','888','/fileUploadAndDownload/breakpointContinue','POST','','',''),('p','888','/fileUploadAndDownload/removeChunk','POST','','',''),('p','888','/fileUploadAndDownload/upload','POST','','',''),('p','888','/fileUploadAndDownload/deleteFile','POST','','',''),('p','888','/fileUploadAndDownload/getFileList','POST','','',''),('p','888','/casbin/updateCasbin','POST','','',''),('p','888','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','888','/jwt/jsonInBlacklist','POST','','',''),('p','888','/system/getSystemConfig','POST','','',''),('p','888','/system/setSystemConfig','POST','','',''),('p','888','/system/getServerInfo','POST','','',''),('p','888','/customer/customer','GET','','',''),('p','888','/customer/customer','PUT','','',''),('p','888','/customer/customer','POST','','',''),('p','888','/customer/customer','DELETE','','',''),('p','888','/customer/customerList','GET','','',''),('p','888','/autoCode/getDB','GET','','',''),('p','888','/autoCode/getMeta','POST','','',''),('p','888','/autoCode/preview','POST','','',''),('p','888','/autoCode/getTables','GET','','',''),('p','888','/autoCode/getColumn','GET','','',''),('p','888','/autoCode/rollback','POST','','',''),('p','888','/autoCode/createTemp','POST','','',''),('p','888','/autoCode/delSysHistory','POST','','',''),('p','888','/autoCode/getSysHistory','POST','','',''),('p','888','/sysDictionaryDetail/findSysDictionaryDetail','GET','','',''),('p','888','/sysDictionaryDetail/updateSysDictionaryDetail','PUT','','',''),('p','888','/sysDictionaryDetail/createSysDictionaryDetail','POST','','',''),('p','888','/sysDictionaryDetail/getSysDictionaryDetailList','GET','','',''),('p','888','/sysDictionaryDetail/deleteSysDictionaryDetail','DELETE','','',''),('p','888','/sysDictionary/findSysDictionary','GET','','',''),('p','888','/sysDictionary/updateSysDictionary','PUT','','',''),('p','888','/sysDictionary/getSysDictionaryList','GET','','',''),('p','888','/sysDictionary/createSysDictionary','POST','','',''),('p','888','/sysDictionary/deleteSysDictionary','DELETE','','',''),('p','888','/sysOperationRecord/findSysOperationRecord','GET','','',''),('p','888','/sysOperationRecord/updateSysOperationRecord','PUT','','',''),('p','888','/sysOperationRecord/createSysOperationRecord','POST','','',''),('p','888','/sysOperationRecord/getSysOperationRecordList','GET','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecord','DELETE','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','',''),('p','888','/email/emailTest','POST','','',''),('p','888','/simpleUploader/upload','POST','','',''),('p','888','/simpleUploader/checkFileMd5','GET','','',''),('p','888','/simpleUploader/mergeFileMd5','GET','','',''),('p','888','/excel/importExcel','POST','','',''),('p','888','/excel/loadExcel','GET','','',''),('p','888','/excel/exportExcel','POST','','',''),('p','888','/excel/downloadTemplate','GET','','',''),('p','888','/authorityBtn/setAuthorityBtn','POST','','',''),('p','888','/authorityBtn/getAuthorityBtn','POST','','',''),('p','888','/authorityBtn/canRemoveAuthorityBtn','POST','','',''),('p','8881','/base/login','POST','','',''),('p','8881','/user/register','POST','','',''),('p','8881','/api/createApi','POST','','',''),('p','8881','/api/getApiList','POST','','',''),('p','8881','/api/getApiById','POST','','',''),('p','8881','/api/deleteApi','POST','','',''),('p','8881','/api/updateApi','POST','','',''),('p','8881','/api/getAllApis','POST','','',''),('p','8881','/authority/createAuthority','POST','','',''),('p','8881','/authority/deleteAuthority','POST','','',''),('p','8881','/authority/getAuthorityList','POST','','',''),('p','8881','/authority/setDataAuthority','POST','','',''),('p','8881','/menu/getMenu','POST','','',''),('p','8881','/menu/getMenuList','POST','','',''),('p','8881','/menu/addBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuTree','POST','','',''),('p','8881','/menu/addMenuAuthority','POST','','',''),('p','8881','/menu/getMenuAuthority','POST','','',''),('p','8881','/menu/deleteBaseMenu','POST','','',''),('p','8881','/menu/updateBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuById','POST','','',''),('p','8881','/user/changePassword','POST','','',''),('p','8881','/user/getUserList','POST','','',''),('p','8881','/user/setUserAuthority','POST','','',''),('p','8881','/fileUploadAndDownload/upload','POST','','',''),('p','8881','/fileUploadAndDownload/getFileList','POST','','',''),('p','8881','/fileUploadAndDownload/deleteFile','POST','','',''),('p','8881','/casbin/updateCasbin','POST','','',''),('p','8881','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','8881','/jwt/jsonInBlacklist','POST','','',''),('p','8881','/system/getSystemConfig','POST','','',''),('p','8881','/system/setSystemConfig','POST','','',''),('p','8881','/customer/customer','POST','','',''),('p','8881','/customer/customer','PUT','','',''),('p','8881','/customer/customer','DELETE','','',''),('p','8881','/customer/customer','GET','','',''),('p','8881','/customer/customerList','GET','','',''),('p','8881','/user/getUserInfo','GET','','',''),('p','9528','/base/login','POST','','',''),('p','9528','/user/register','POST','','',''),('p','9528','/api/createApi','POST','','',''),('p','9528','/api/getApiList','POST','','',''),('p','9528','/api/getApiById','POST','','',''),('p','9528','/api/deleteApi','POST','','',''),('p','9528','/api/updateApi','POST','','',''),('p','9528','/api/getAllApis','POST','','',''),('p','9528','/authority/createAuthority','POST','','',''),('p','9528','/authority/deleteAuthority','POST','','',''),('p','9528','/authority/getAuthorityList','POST','','',''),('p','9528','/authority/setDataAuthority','POST','','',''),('p','9528','/menu/getMenu','POST','','',''),('p','9528','/menu/getMenuList','POST','','',''),('p','9528','/menu/addBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuTree','POST','','',''),('p','9528','/menu/addMenuAuthority','POST','','',''),('p','9528','/menu/getMenuAuthority','POST','','',''),('p','9528','/menu/deleteBaseMenu','POST','','',''),('p','9528','/menu/updateBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuById','POST','','',''),('p','9528','/user/changePassword','POST','','',''),('p','9528','/user/getUserList','POST','','',''),('p','9528','/user/setUserAuthority','POST','','',''),('p','9528','/fileUploadAndDownload/upload','POST','','',''),('p','9528','/fileUploadAndDownload/getFileList','POST','','',''),('p','9528','/fileUploadAndDownload/deleteFile','POST','','',''),('p','9528','/casbin/updateCasbin','POST','','',''),('p','9528','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','9528','/jwt/jsonInBlacklist','POST','','',''),('p','9528','/system/getSystemConfig','POST','','',''),('p','9528','/system/setSystemConfig','POST','','',''),('p','9528','/customer/customer','PUT','','',''),('p','9528','/customer/customer','GET','','',''),('p','9528','/customer/customer','POST','','',''),('p','9528','/customer/customer','DELETE','','',''),('p','9528','/customer/customerList','GET','','',''),('p','9528','/autoCode/createTemp','POST','','',''),('p','9528','/user/getUserInfo','GET','','',''),('p','888','/base/login','POST','','',''),('p','888','/user/register','POST','','',''),('p','888','/api/createApi','POST','','',''),('p','888','/api/getApiList','POST','','',''),('p','888','/api/getApiById','POST','','',''),('p','888','/api/deleteApi','POST','','',''),('p','888','/api/updateApi','POST','','',''),('p','888','/api/getAllApis','POST','','',''),('p','888','/api/deleteApisByIds','DELETE','','',''),('p','888','/authority/copyAuthority','POST','','',''),('p','888','/authority/updateAuthority','PUT','','',''),('p','888','/authority/createAuthority','POST','','',''),('p','888','/authority/deleteAuthority','POST','','',''),('p','888','/authority/getAuthorityList','POST','','',''),('p','888','/authority/setDataAuthority','POST','','',''),('p','888','/menu/getMenu','POST','','',''),('p','888','/menu/getMenuList','POST','','',''),('p','888','/menu/addBaseMenu','POST','','',''),('p','888','/menu/getBaseMenuTree','POST','','',''),('p','888','/menu/addMenuAuthority','POST','','',''),('p','888','/menu/getMenuAuthority','POST','','',''),('p','888','/menu/deleteBaseMenu','POST','','',''),('p','888','/menu/updateBaseMenu','POST','','',''),('p','888','/menu/getBaseMenuById','POST','','',''),('p','888','/user/getUserInfo','GET','','',''),('p','888','/user/setUserInfo','PUT','','',''),('p','888','/user/setSelfInfo','PUT','','',''),('p','888','/user/getUserList','POST','','',''),('p','888','/user/deleteUser','DELETE','','',''),('p','888','/user/changePassword','POST','','',''),('p','888','/user/setUserAuthority','POST','','',''),('p','888','/user/setUserAuthorities','POST','','',''),('p','888','/user/resetPassword','POST','','',''),('p','888','/fileUploadAndDownload/findFile','GET','','',''),('p','888','/fileUploadAndDownload/breakpointContinueFinish','POST','','',''),('p','888','/fileUploadAndDownload/breakpointContinue','POST','','',''),('p','888','/fileUploadAndDownload/removeChunk','POST','','',''),('p','888','/fileUploadAndDownload/upload','POST','','',''),('p','888','/fileUploadAndDownload/deleteFile','POST','','',''),('p','888','/fileUploadAndDownload/getFileList','POST','','',''),('p','888','/casbin/updateCasbin','POST','','',''),('p','888','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','888','/jwt/jsonInBlacklist','POST','','',''),('p','888','/system/getSystemConfig','POST','','',''),('p','888','/system/setSystemConfig','POST','','',''),('p','888','/system/getServerInfo','POST','','',''),('p','888','/customer/customer','GET','','',''),('p','888','/customer/customer','PUT','','',''),('p','888','/customer/customer','POST','','',''),('p','888','/customer/customer','DELETE','','',''),('p','888','/customer/customerList','GET','','',''),('p','888','/autoCode/getDB','GET','','',''),('p','888','/autoCode/getMeta','POST','','',''),('p','888','/autoCode/preview','POST','','',''),('p','888','/autoCode/getTables','GET','','',''),('p','888','/autoCode/getColumn','GET','','',''),('p','888','/autoCode/rollback','POST','','',''),('p','888','/autoCode/createTemp','POST','','',''),('p','888','/autoCode/delSysHistory','POST','','',''),('p','888','/autoCode/getSysHistory','POST','','',''),('p','888','/sysDictionaryDetail/findSysDictionaryDetail','GET','','',''),('p','888','/sysDictionaryDetail/updateSysDictionaryDetail','PUT','','',''),('p','888','/sysDictionaryDetail/createSysDictionaryDetail','POST','','',''),('p','888','/sysDictionaryDetail/getSysDictionaryDetailList','GET','','',''),('p','888','/sysDictionaryDetail/deleteSysDictionaryDetail','DELETE','','',''),('p','888','/sysDictionary/findSysDictionary','GET','','',''),('p','888','/sysDictionary/updateSysDictionary','PUT','','',''),('p','888','/sysDictionary/getSysDictionaryList','GET','','',''),('p','888','/sysDictionary/createSysDictionary','POST','','',''),('p','888','/sysDictionary/deleteSysDictionary','DELETE','','',''),('p','888','/sysOperationRecord/findSysOperationRecord','GET','','',''),('p','888','/sysOperationRecord/updateSysOperationRecord','PUT','','',''),('p','888','/sysOperationRecord/createSysOperationRecord','POST','','',''),('p','888','/sysOperationRecord/getSysOperationRecordList','GET','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecord','DELETE','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','',''),('p','888','/email/emailTest','POST','','',''),('p','888','/simpleUploader/upload','POST','','',''),('p','888','/simpleUploader/checkFileMd5','GET','','',''),('p','888','/simpleUploader/mergeFileMd5','GET','','',''),('p','888','/excel/importExcel','POST','','',''),('p','888','/excel/loadExcel','GET','','',''),('p','888','/excel/exportExcel','POST','','',''),('p','888','/excel/downloadTemplate','GET','','',''),('p','888','/authorityBtn/setAuthorityBtn','POST','','',''),('p','888','/authorityBtn/getAuthorityBtn','POST','','',''),('p','888','/authorityBtn/canRemoveAuthorityBtn','POST','','',''),('p','8881','/base/login','POST','','',''),('p','8881','/user/register','POST','','',''),('p','8881','/api/createApi','POST','','',''),('p','8881','/api/getApiList','POST','','',''),('p','8881','/api/getApiById','POST','','',''),('p','8881','/api/deleteApi','POST','','',''),('p','8881','/api/updateApi','POST','','',''),('p','8881','/api/getAllApis','POST','','',''),('p','8881','/authority/createAuthority','POST','','',''),('p','8881','/authority/deleteAuthority','POST','','',''),('p','8881','/authority/getAuthorityList','POST','','',''),('p','8881','/authority/setDataAuthority','POST','','',''),('p','8881','/menu/getMenu','POST','','',''),('p','8881','/menu/getMenuList','POST','','',''),('p','8881','/menu/addBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuTree','POST','','',''),('p','8881','/menu/addMenuAuthority','POST','','',''),('p','8881','/menu/getMenuAuthority','POST','','',''),('p','8881','/menu/deleteBaseMenu','POST','','',''),('p','8881','/menu/updateBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuById','POST','','',''),('p','8881','/user/changePassword','POST','','',''),('p','8881','/user/getUserList','POST','','',''),('p','8881','/user/setUserAuthority','POST','','',''),('p','8881','/fileUploadAndDownload/upload','POST','','',''),('p','8881','/fileUploadAndDownload/getFileList','POST','','',''),('p','8881','/fileUploadAndDownload/deleteFile','POST','','',''),('p','8881','/casbin/updateCasbin','POST','','',''),('p','8881','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','8881','/jwt/jsonInBlacklist','POST','','',''),('p','8881','/system/getSystemConfig','POST','','',''),('p','8881','/system/setSystemConfig','POST','','',''),('p','8881','/customer/customer','POST','','',''),('p','8881','/customer/customer','PUT','','',''),('p','8881','/customer/customer','DELETE','','',''),('p','8881','/customer/customer','GET','','',''),('p','8881','/customer/customerList','GET','','',''),('p','8881','/user/getUserInfo','GET','','',''),('p','9528','/base/login','POST','','',''),('p','9528','/user/register','POST','','',''),('p','9528','/api/createApi','POST','','',''),('p','9528','/api/getApiList','POST','','',''),('p','9528','/api/getApiById','POST','','',''),('p','9528','/api/deleteApi','POST','','',''),('p','9528','/api/updateApi','POST','','',''),('p','9528','/api/getAllApis','POST','','',''),('p','9528','/authority/createAuthority','POST','','',''),('p','9528','/authority/deleteAuthority','POST','','',''),('p','9528','/authority/getAuthorityList','POST','','',''),('p','9528','/authority/setDataAuthority','POST','','',''),('p','9528','/menu/getMenu','POST','','',''),('p','9528','/menu/getMenuList','POST','','',''),('p','9528','/menu/addBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuTree','POST','','',''),('p','9528','/menu/addMenuAuthority','POST','','',''),('p','9528','/menu/getMenuAuthority','POST','','',''),('p','9528','/menu/deleteBaseMenu','POST','','',''),('p','9528','/menu/updateBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuById','POST','','',''),('p','9528','/user/changePassword','POST','','',''),('p','9528','/user/getUserList','POST','','',''),('p','9528','/user/setUserAuthority','POST','','',''),('p','9528','/fileUploadAndDownload/upload','POST','','',''),('p','9528','/fileUploadAndDownload/getFileList','POST','','',''),('p','9528','/fileUploadAndDownload/deleteFile','POST','','',''),('p','9528','/casbin/updateCasbin','POST','','',''),('p','9528','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','9528','/jwt/jsonInBlacklist','POST','','',''),('p','9528','/system/getSystemConfig','POST','','',''),('p','9528','/system/setSystemConfig','POST','','',''),('p','9528','/customer/customer','PUT','','',''),('p','9528','/customer/customer','GET','','',''),('p','9528','/customer/customer','POST','','',''),('p','9528','/customer/customer','DELETE','','',''),('p','9528','/customer/customerList','GET','','',''),('p','9528','/autoCode/createTemp','POST','','',''),('p','9528','/user/getUserInfo','GET','','',''),('p','888','/base/login','POST','','',''),('p','888','/user/register','POST','','',''),('p','888','/api/createApi','POST','','',''),('p','888','/api/getApiList','POST','','',''),('p','888','/api/getApiById','POST','','',''),('p','888','/api/deleteApi','POST','','',''),('p','888','/api/updateApi','POST','','',''),('p','888','/api/getAllApis','POST','','',''),('p','888','/api/deleteApisByIds','DELETE','','',''),('p','888','/authority/copyAuthority','POST','','',''),('p','888','/authority/updateAuthority','PUT','','',''),('p','888','/authority/createAuthority','POST','','',''),('p','888','/authority/deleteAuthority','POST','','',''),('p','888','/authority/getAuthorityList','POST','','',''),('p','888','/authority/setDataAuthority','POST','','',''),('p','888','/menu/getMenu','POST','','',''),('p','888','/menu/getMenuList','POST','','',''),('p','888','/menu/addBaseMenu','POST','','',''),('p','888','/menu/getBaseMenuTree','POST','','',''),('p','888','/menu/addMenuAuthority','POST','','',''),('p','888','/menu/getMenuAuthority','POST','','',''),('p','888','/menu/deleteBaseMenu','POST','','',''),('p','888','/menu/updateBaseMenu','POST','','',''),('p','888','/menu/getBaseMenuById','POST','','',''),('p','888','/user/getUserInfo','GET','','',''),('p','888','/user/setUserInfo','PUT','','',''),('p','888','/user/setSelfInfo','PUT','','',''),('p','888','/user/getUserList','POST','','',''),('p','888','/user/deleteUser','DELETE','','',''),('p','888','/user/changePassword','POST','','',''),('p','888','/user/setUserAuthority','POST','','',''),('p','888','/user/setUserAuthorities','POST','','',''),('p','888','/user/resetPassword','POST','','',''),('p','888','/fileUploadAndDownload/findFile','GET','','',''),('p','888','/fileUploadAndDownload/breakpointContinueFinish','POST','','',''),('p','888','/fileUploadAndDownload/breakpointContinue','POST','','',''),('p','888','/fileUploadAndDownload/removeChunk','POST','','',''),('p','888','/fileUploadAndDownload/upload','POST','','',''),('p','888','/fileUploadAndDownload/deleteFile','POST','','',''),('p','888','/fileUploadAndDownload/getFileList','POST','','',''),('p','888','/casbin/updateCasbin','POST','','',''),('p','888','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','888','/jwt/jsonInBlacklist','POST','','',''),('p','888','/system/getSystemConfig','POST','','',''),('p','888','/system/setSystemConfig','POST','','',''),('p','888','/system/getServerInfo','POST','','',''),('p','888','/customer/customer','GET','','',''),('p','888','/customer/customer','PUT','','',''),('p','888','/customer/customer','POST','','',''),('p','888','/customer/customer','DELETE','','',''),('p','888','/customer/customerList','GET','','',''),('p','888','/autoCode/getDB','GET','','',''),('p','888','/autoCode/getMeta','POST','','',''),('p','888','/autoCode/preview','POST','','',''),('p','888','/autoCode/getTables','GET','','',''),('p','888','/autoCode/getColumn','GET','','',''),('p','888','/autoCode/rollback','POST','','',''),('p','888','/autoCode/createTemp','POST','','',''),('p','888','/autoCode/delSysHistory','POST','','',''),('p','888','/autoCode/getSysHistory','POST','','',''),('p','888','/sysDictionaryDetail/findSysDictionaryDetail','GET','','',''),('p','888','/sysDictionaryDetail/updateSysDictionaryDetail','PUT','','',''),('p','888','/sysDictionaryDetail/createSysDictionaryDetail','POST','','',''),('p','888','/sysDictionaryDetail/getSysDictionaryDetailList','GET','','',''),('p','888','/sysDictionaryDetail/deleteSysDictionaryDetail','DELETE','','',''),('p','888','/sysDictionary/findSysDictionary','GET','','',''),('p','888','/sysDictionary/updateSysDictionary','PUT','','',''),('p','888','/sysDictionary/getSysDictionaryList','GET','','',''),('p','888','/sysDictionary/createSysDictionary','POST','','',''),('p','888','/sysDictionary/deleteSysDictionary','DELETE','','',''),('p','888','/sysOperationRecord/findSysOperationRecord','GET','','',''),('p','888','/sysOperationRecord/updateSysOperationRecord','PUT','','',''),('p','888','/sysOperationRecord/createSysOperationRecord','POST','','',''),('p','888','/sysOperationRecord/getSysOperationRecordList','GET','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecord','DELETE','','',''),('p','888','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','',''),('p','888','/email/emailTest','POST','','',''),('p','888','/simpleUploader/upload','POST','','',''),('p','888','/simpleUploader/checkFileMd5','GET','','',''),('p','888','/simpleUploader/mergeFileMd5','GET','','',''),('p','888','/excel/importExcel','POST','','',''),('p','888','/excel/loadExcel','GET','','',''),('p','888','/excel/exportExcel','POST','','',''),('p','888','/excel/downloadTemplate','GET','','',''),('p','888','/authorityBtn/setAuthorityBtn','POST','','',''),('p','888','/authorityBtn/getAuthorityBtn','POST','','',''),('p','888','/authorityBtn/canRemoveAuthorityBtn','POST','','',''),('p','8881','/base/login','POST','','',''),('p','8881','/user/register','POST','','',''),('p','8881','/api/createApi','POST','','',''),('p','8881','/api/getApiList','POST','','',''),('p','8881','/api/getApiById','POST','','',''),('p','8881','/api/deleteApi','POST','','',''),('p','8881','/api/updateApi','POST','','',''),('p','8881','/api/getAllApis','POST','','',''),('p','8881','/authority/createAuthority','POST','','',''),('p','8881','/authority/deleteAuthority','POST','','',''),('p','8881','/authority/getAuthorityList','POST','','',''),('p','8881','/authority/setDataAuthority','POST','','',''),('p','8881','/menu/getMenu','POST','','',''),('p','8881','/menu/getMenuList','POST','','',''),('p','8881','/menu/addBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuTree','POST','','',''),('p','8881','/menu/addMenuAuthority','POST','','',''),('p','8881','/menu/getMenuAuthority','POST','','',''),('p','8881','/menu/deleteBaseMenu','POST','','',''),('p','8881','/menu/updateBaseMenu','POST','','',''),('p','8881','/menu/getBaseMenuById','POST','','',''),('p','8881','/user/changePassword','POST','','',''),('p','8881','/user/getUserList','POST','','',''),('p','8881','/user/setUserAuthority','POST','','',''),('p','8881','/fileUploadAndDownload/upload','POST','','',''),('p','8881','/fileUploadAndDownload/getFileList','POST','','',''),('p','8881','/fileUploadAndDownload/deleteFile','POST','','',''),('p','8881','/casbin/updateCasbin','POST','','',''),('p','8881','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','8881','/jwt/jsonInBlacklist','POST','','',''),('p','8881','/system/getSystemConfig','POST','','',''),('p','8881','/system/setSystemConfig','POST','','',''),('p','8881','/customer/customer','POST','','',''),('p','8881','/customer/customer','PUT','','',''),('p','8881','/customer/customer','DELETE','','',''),('p','8881','/customer/customer','GET','','',''),('p','8881','/customer/customerList','GET','','',''),('p','8881','/user/getUserInfo','GET','','',''),('p','9528','/base/login','POST','','',''),('p','9528','/user/register','POST','','',''),('p','9528','/api/createApi','POST','','',''),('p','9528','/api/getApiList','POST','','',''),('p','9528','/api/getApiById','POST','','',''),('p','9528','/api/deleteApi','POST','','',''),('p','9528','/api/updateApi','POST','','',''),('p','9528','/api/getAllApis','POST','','',''),('p','9528','/authority/createAuthority','POST','','',''),('p','9528','/authority/deleteAuthority','POST','','',''),('p','9528','/authority/getAuthorityList','POST','','',''),('p','9528','/authority/setDataAuthority','POST','','',''),('p','9528','/menu/getMenu','POST','','',''),('p','9528','/menu/getMenuList','POST','','',''),('p','9528','/menu/addBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuTree','POST','','',''),('p','9528','/menu/addMenuAuthority','POST','','',''),('p','9528','/menu/getMenuAuthority','POST','','',''),('p','9528','/menu/deleteBaseMenu','POST','','',''),('p','9528','/menu/updateBaseMenu','POST','','',''),('p','9528','/menu/getBaseMenuById','POST','','',''),('p','9528','/user/changePassword','POST','','',''),('p','9528','/user/getUserList','POST','','',''),('p','9528','/user/setUserAuthority','POST','','',''),('p','9528','/fileUploadAndDownload/upload','POST','','',''),('p','9528','/fileUploadAndDownload/getFileList','POST','','',''),('p','9528','/fileUploadAndDownload/deleteFile','POST','','',''),('p','9528','/casbin/updateCasbin','POST','','',''),('p','9528','/casbin/getPolicyPathByAuthorityId','POST','','',''),('p','9528','/jwt/jsonInBlacklist','POST','','',''),('p','9528','/system/getSystemConfig','POST','','',''),('p','9528','/system/setSystemConfig','POST','','',''),('p','9528','/customer/customer','PUT','','',''),('p','9528','/customer/customer','GET','','',''),('p','9528','/customer/customer','POST','','',''),('p','9528','/customer/customer','DELETE','','',''),('p','9528','/customer/customerList','GET','','',''),('p','9528','/autoCode/createTemp','POST','','',''),('p','9528','/user/getUserInfo','GET','','',''),('p','888','/servicefields/createServiceFields','POST','','',''),('p','123','/base/login','POST','','',''),('p','123','/jwt/jsonInBlacklist','POST','','',''),('p','123','/user/register','POST','','',''),('p','123','/user/setUserInfo','PUT','','',''),('p','123','/user/setSelfInfo','PUT','','',''),('p','123','/user/getUserInfo','GET','','',''),('p','123','/user/changePassword','POST','','',''),('p','123','/user/setUserAuthority','POST','','',''),('p','123','/user/resetPassword','POST','','',''),('p','123','/menu/getMenu','POST','','',''),('p','123','/system/getServerInfo','POST','','',''),('p','123','/system/getSystemConfig','POST','','',''),('p','123','/system/setSystemConfig','POST','','',''),('p','123','/sysDictionary/createSysDictionary','POST','','',''),('p','123','/sysDictionary/deleteSysDictionary','DELETE','','',''),('p','123','/sysDictionary/updateSysDictionary','PUT','','',''),('p','123','/sysDictionary/findSysDictionary','GET','','',''),('p','123','/sysDictionary/getSysDictionaryList','GET','','',''),('p','123','/sysOperationRecord/createSysOperationRecord','POST','','',''),('p','123','/sysOperationRecord/findSysOperationRecord','GET','','',''),('p','123','/sysOperationRecord/getSysOperationRecordList','GET','','',''),('p','123','/sysOperationRecord/deleteSysOperationRecord','DELETE','','',''),('p','123','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','',''),('p','123','/simpleUploader/upload','POST','','',''),('p','123','/simpleUploader/checkFileMd5','GET','','',''),('p','123','/simpleUploader/mergeFileMd5','GET','','',''),('p','123','/email/emailTest','POST','','',''),('p','123','/email/emailSend','POST','','',''),('p','123','/excel/importExcel','POST','','',''),('p','123','/excel/loadExcel','GET','','',''),('p','123','/excel/exportExcel','POST','','',''),('p','123','/excel/downloadTemplate','GET','','',''),('p','123','/gateways/createGateways','POST','','',''),('p','123','/gateways/deleteGateways','DELETE','','',''),('p','123','/gateways/deleteGatewaysByIds','DELETE','','',''),('p','123','/gateways/updateGateways','PUT','','',''),('p','123','/gateways/findGateways','GET','','',''),('p','123','/gateways/getGatewaysList','GET','','',''),('p','123','/categories/createCategories','POST','','',''),('p','123','/categories/deleteCategories','DELETE','','',''),('p','123','/categories/deleteCategoriesByIds','DELETE','','',''),('p','123','/categories/updateCategories','PUT','','',''),('p','123','/categories/findCategories','GET','','',''),('p','123','/categories/getCategoriesList','GET','','',''),('p','123','/providers/createProviders','POST','','',''),('p','123','/providers/deleteProviders','DELETE','','',''),('p','123','/providers/deleteProvidersByIds','DELETE','','',''),('p','123','/providers/updateProviders','PUT','','',''),('p','123','/providers/findProviders','GET','','',''),('p','123','/providers/getProvidersList','GET','','',''),('p','123','/frontends/createVersions','POST','','',''),('p','123','/frontends/deleteVersions','DELETE','','',''),('p','123','/frontends/deleteVersionsByIds','DELETE','','',''),('p','123','/frontends/updateVersions','PUT','','',''),('p','123','/frontends/findVersions','GET','','',''),('p','123','/frontends/getVersionsList','GET','','',''),('p','123','/terminals/createTerminals','POST','','',''),('p','123','/terminals/deleteTerminals','DELETE','','',''),('p','123','/terminals/deleteTerminalsByIds','DELETE','','',''),('p','123','/terminals/updateTerminals','PUT','','',''),('p','123','/terminals/findTerminals','GET','','',''),('p','123','/terminals/getTerminalsList','GET','','',''),('p','123','/fields/createFields','POST','','',''),('p','123','/fields/deleteFields','DELETE','','',''),('p','123','/fields/deleteFieldsByIds','DELETE','','',''),('p','123','/fields/updateFields','PUT','','',''),('p','123','/fields/findFields','GET','','',''),('p','123','/fields/getFieldsList','GET','','',''),('p','123','/services/createServices','POST','','',''),('p','123','/services/deleteServices','DELETE','','',''),('p','123','/services/deleteServicesByIds','DELETE','','',''),('p','123','/services/updateServices','PUT','','',''),('p','123','/services/findServices','GET','','',''),('p','123','/services/getServicesList','GET','','',''),('p','123','/merchant/createMerchant','POST','','',''),('p','123','/merchant/deleteMerchant','DELETE','','',''),('p','123','/merchant/deleteMerchantByIds','DELETE','','',''),('p','123','/merchant/updateMerchant','PUT','','',''),('p','123','/merchant/findMerchant','GET','','',''),('p','123','/merchant/getMerchantList','GET','','',''),('p','123','/packages/createPackages','POST','','',''),('p','123','/packages/deletePackages','DELETE','','',''),('p','123','/packages/deletePackagesByIds','DELETE','','',''),('p','123','/packages/updatePackages','PUT','','',''),('p','123','/packages/findPackages','GET','','',''),('p','123','/packages/getPackagesList','GET','','','');
/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` int unsigned DEFAULT NULL,
  `update_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_categories_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (4,'2022-05-10 10:23:07.275','2022-05-10 10:23:07.275','2022-05-10 10:23:15.584','a','a',NULL,NULL),(5,'2022-05-11 11:38:23.705','2022-05-11 11:38:23.705','2022-05-11 11:58:47.533','cat1','cat1',NULL,NULL),(6,'2022-05-25 12:44:58.542','2022-05-25 12:44:58.542',NULL,' شحن علي الطاير','',NULL,NULL),(7,'2022-05-25 12:45:32.931','2022-05-25 12:45:32.931',NULL,'كروت الشحن','',NULL,NULL),(8,'2022-05-25 12:45:57.161','2022-05-25 12:45:57.161',NULL,'اتصالات وانترنت','',NULL,NULL),(9,'2022-05-25 12:46:57.025','2022-05-25 12:46:57.025',NULL,'تبرعات','',NULL,NULL),(10,'2022-05-25 12:47:15.541','2022-05-25 12:47:15.541',NULL,'معاملات مالية وبنوك','',NULL,NULL),(11,'2022-05-25 12:47:31.401','2022-05-25 12:47:31.401',NULL,'تأمين','',NULL,NULL),(12,'2022-05-25 12:47:45.469','2022-05-25 12:47:45.469',NULL,'مرافق عامة','',NULL,NULL),(13,'2022-05-25 12:48:08.745','2022-05-25 12:48:08.745',NULL,'مدفوعات اونلاين','',NULL,NULL),(14,'2022-05-25 12:48:19.869','2022-05-25 12:48:19.869',NULL,'تعليم','',NULL,NULL),(15,'2022-05-25 12:48:36.055','2022-05-25 12:48:36.055',NULL,'تذاكر وسياحة','',NULL,NULL),(16,'2022-05-25 12:49:01.942','2022-05-25 12:49:01.942',NULL,'الإسكان الإجتماعي','',NULL,NULL),(17,'2022-05-25 12:49:22.216','2022-05-25 12:49:22.216',NULL,'اشتراكات وإعلانات','',NULL,NULL),(18,'2022-05-25 12:49:38.252','2022-05-25 12:49:38.252',NULL,'المرور','',NULL,NULL),(19,'2022-05-25 12:49:55.118','2022-05-25 12:49:55.118',NULL,'خدمات التاجر','',NULL,NULL),(20,'2022-05-25 12:50:07.336','2022-05-25 12:50:07.336',NULL,'تعاقدات','',NULL,NULL),(21,'2022-05-25 12:52:27.648','2022-05-25 12:52:27.648',NULL,'خدمات حكومية','',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_customers`
--

DROP TABLE IF EXISTS `exa_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名',
  `customer_phone_data` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户手机号',
  `sys_user_id` bigint unsigned DEFAULT NULL COMMENT '管理ID',
  `sys_user_authority_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理角色ID',
  PRIMARY KEY (`id`),
  KEY `idx_exa_customers_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_customers`
--

LOCK TABLES `exa_customers` WRITE;
/*!40000 ALTER TABLE `exa_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_file_chunks`
--

DROP TABLE IF EXISTS `exa_file_chunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_file_chunks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `exa_file_id` bigint unsigned DEFAULT NULL,
  `file_chunk_number` bigint DEFAULT NULL,
  `file_chunk_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_exa_file_chunks_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_file_chunks`
--

LOCK TABLES `exa_file_chunks` WRITE;
/*!40000 ALTER TABLE `exa_file_chunks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_file_chunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_file_upload_and_downloads`
--

DROP TABLE IF EXISTS `exa_file_upload_and_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_file_upload_and_downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名',
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件地址',
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件标签',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `idx_exa_file_upload_and_downloads_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_file_upload_and_downloads`
--

LOCK TABLES `exa_file_upload_and_downloads` WRITE;
/*!40000 ALTER TABLE `exa_file_upload_and_downloads` DISABLE KEYS */;
INSERT INTO `exa_file_upload_and_downloads` VALUES (1,'2022-03-15 10:33:37.636','2022-03-15 10:33:37.636',NULL,'10.png','https://qmplusimg.henrongyi.top/gvalogo.png','png','158787308910.png'),(2,'2022-03-15 10:33:37.636','2022-03-15 10:33:37.636',NULL,'logo.png','https://qmplusimg.henrongyi.top/1576554439myAvatar.png','png','1587973709logo.png'),(3,'2022-03-16 11:17:36.195','2022-03-16 11:17:36.195',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316111736.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316111736.json'),(4,'2022-03-16 11:21:28.369','2022-03-16 11:21:28.369',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316112128.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316112128.json'),(5,'2022-03-16 11:22:45.433','2022-03-16 11:22:45.433',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316112245.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316112245.json'),(6,'2022-03-16 11:41:08.561','2022-03-16 11:41:08.561',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316114108.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316114108.json'),(7,'2022-03-16 12:06:32.219','2022-03-16 12:06:32.219',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316120632.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316120632.json'),(8,'2022-03-16 12:10:49.228','2022-03-16 12:10:49.228',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316121049.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316121049.json'),(9,'2022-03-16 12:12:04.654','2022-03-16 12:12:04.654',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316121204.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316121204.json'),(10,'2022-03-16 12:23:41.446','2022-03-16 12:23:41.446',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316122341.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316122341.json'),(11,'2022-03-16 12:26:18.140','2022-03-16 12:26:18.140',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316122618.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316122618.json'),(12,'2022-03-16 13:10:34.999','2022-03-16 13:10:34.999',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316131034.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316131034.json'),(13,'2022-03-16 13:35:23.336','2022-03-16 13:35:23.336',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316133523.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316133523.json'),(14,'2022-03-16 13:37:48.663','2022-03-16 13:37:48.663',NULL,'file 2.json','uploads/file/b445bf8b5da4cf880dd14e98c18c1bfa_20220316133748.json','json','b445bf8b5da4cf880dd14e98c18c1bfa_20220316133748.json'),(15,'2022-03-16 13:45:10.010','2022-03-16 13:45:10.010',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316134510.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316134510.json'),(16,'2022-03-16 14:01:32.342','2022-03-16 14:01:32.342',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316140132.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316140132.json'),(17,'2022-03-16 14:22:36.324','2022-03-16 14:22:36.324',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316142236.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316142236.json'),(18,'2022-03-16 14:24:59.176','2022-03-16 14:24:59.176',NULL,'file 2.json','uploads/file/b445bf8b5da4cf880dd14e98c18c1bfa_20220316142459.json','json','b445bf8b5da4cf880dd14e98c18c1bfa_20220316142459.json'),(19,'2022-03-16 16:09:37.053','2022-03-16 16:09:37.053',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316160937.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316160937.json'),(20,'2022-03-16 19:27:13.821','2022-03-16 19:27:13.821',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316192713.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316192713.json'),(21,'2022-03-16 19:33:46.946','2022-03-16 19:33:46.946',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220316193346.json','json','8c7dd922ad47494fc02c388e12c00eac_20220316193346.json'),(22,'2022-03-17 09:32:14.907','2022-03-17 09:32:14.907',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317093214.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317093214.json'),(23,'2022-03-17 09:37:07.042','2022-03-17 09:37:07.042',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317093707.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317093707.json'),(24,'2022-03-17 09:53:02.300','2022-03-17 09:53:02.300',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317095302.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317095302.json'),(25,'2022-03-17 10:02:54.218','2022-03-17 10:02:54.218',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317100254.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317100254.json'),(26,'2022-03-17 10:27:33.048','2022-03-17 10:27:33.048',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317102733.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317102733.json'),(27,'2022-03-17 10:55:47.933','2022-03-17 10:55:47.933',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317105547.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317105547.json'),(28,'2022-03-17 11:05:11.000','2022-03-17 11:05:11.000',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317110510.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317110510.json'),(29,'2022-03-17 11:09:12.501','2022-03-17 11:09:12.501',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317110912.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317110912.json'),(30,'2022-03-17 11:14:46.150','2022-03-17 11:14:46.150',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317111446.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317111446.json'),(31,'2022-03-17 11:49:27.320','2022-03-17 11:49:27.320',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317114927.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317114927.json'),(32,'2022-03-17 11:57:04.984','2022-03-17 11:57:04.984',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317115704.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317115704.json'),(33,'2022-03-17 12:00:45.290','2022-03-17 12:00:45.290',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317120045.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317120045.json'),(34,'2022-03-17 12:11:37.831','2022-03-17 12:11:37.831',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220317121137.json','json','8c7dd922ad47494fc02c388e12c00eac_20220317121137.json'),(35,'2022-03-17 12:25:37.139','2022-03-17 12:25:37.139',NULL,'file 2.json','uploads/file/b445bf8b5da4cf880dd14e98c18c1bfa_20220317122537.json','json','b445bf8b5da4cf880dd14e98c18c1bfa_20220317122537.json'),(36,'2022-03-17 12:26:29.700','2022-03-17 12:26:29.700',NULL,'file 2.json','uploads/file/b445bf8b5da4cf880dd14e98c18c1bfa_20220317122629.json','json','b445bf8b5da4cf880dd14e98c18c1bfa_20220317122629.json'),(37,'2022-03-17 12:31:47.947','2022-03-17 12:31:47.947',NULL,'file 2.json','uploads/file/b445bf8b5da4cf880dd14e98c18c1bfa_20220317123147.json','json','b445bf8b5da4cf880dd14e98c18c1bfa_20220317123147.json'),(38,'2022-03-17 12:34:55.449','2022-03-17 12:34:55.449',NULL,'file 2.json','uploads/file/b445bf8b5da4cf880dd14e98c18c1bfa_20220317123455.json','json','b445bf8b5da4cf880dd14e98c18c1bfa_20220317123455.json'),(39,'2022-03-17 12:35:15.198','2022-03-17 12:35:15.198',NULL,'file 2.json','uploads/file/b445bf8b5da4cf880dd14e98c18c1bfa_20220317123515.json','json','b445bf8b5da4cf880dd14e98c18c1bfa_20220317123515.json'),(40,'2022-03-17 12:38:53.475','2022-03-17 12:38:53.475',NULL,'file 2.json','uploads/file/b445bf8b5da4cf880dd14e98c18c1bfa_20220317123853.json','json','b445bf8b5da4cf880dd14e98c18c1bfa_20220317123853.json'),(41,'2022-03-22 11:03:21.672','2022-03-22 11:03:21.672',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220322110321.json','json','8c7dd922ad47494fc02c388e12c00eac_20220322110321.json'),(42,'2022-03-22 11:10:24.264','2022-03-22 11:10:24.264',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220322111024.json','json','8c7dd922ad47494fc02c388e12c00eac_20220322111024.json'),(43,'2022-03-22 11:15:46.265','2022-03-22 11:15:46.265',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220322111546.json','json','8c7dd922ad47494fc02c388e12c00eac_20220322111546.json'),(44,'2022-03-22 11:28:34.060','2022-03-22 11:28:34.060',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220322112834.json','json','8c7dd922ad47494fc02c388e12c00eac_20220322112834.json'),(45,'2022-03-22 11:58:23.557','2022-03-22 11:58:23.557',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220322115823.json','json','8c7dd922ad47494fc02c388e12c00eac_20220322115823.json'),(46,'2022-03-22 12:21:52.216','2022-03-22 12:21:52.216',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220322122152.json','json','8c7dd922ad47494fc02c388e12c00eac_20220322122152.json'),(47,'2022-03-22 12:24:47.648','2022-03-22 12:24:47.648',NULL,'file.json','uploads/file/8c7dd922ad47494fc02c388e12c00eac_20220322122447.json','json','8c7dd922ad47494fc02c388e12c00eac_20220322122447.json'),(48,'2022-04-18 14:22:12.115','2022-04-18 14:22:12.115',NULL,'g.json','uploads/file/b2f5ff47436671b6e533d8dc3614845d_20220418142212.json','json','b2f5ff47436671b6e533d8dc3614845d_20220418142212.json'),(49,'2022-04-18 14:40:31.826','2022-04-18 14:40:31.826',NULL,'g.json','uploads/file/b2f5ff47436671b6e533d8dc3614845d_20220418144031.json','json','b2f5ff47436671b6e533d8dc3614845d_20220418144031.json'),(50,'2022-05-11 11:40:55.104','2022-05-11 11:40:55.104',NULL,'gateways.json','uploads/file/15fd82cde2a6c5cde8ab669e8d349305_20220511114054.json','json','15fd82cde2a6c5cde8ab669e8d349305_20220511114054.json'),(51,'2022-05-11 12:00:57.388','2022-05-11 12:00:57.388',NULL,'gateways.json','uploads/file/15fd82cde2a6c5cde8ab669e8d349305_20220511120057.json','json','15fd82cde2a6c5cde8ab669e8d349305_20220511120057.json'),(52,'2022-05-11 14:20:51.255','2022-05-11 14:20:51.255',NULL,'gateways.json','uploads/file/15fd82cde2a6c5cde8ab669e8d349305_20220511142051.json','json','15fd82cde2a6c5cde8ab669e8d349305_20220511142051.json');
/*!40000 ALTER TABLE `exa_file_upload_and_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_files`
--

DROP TABLE IF EXISTS `exa_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_md5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chunk_total` bigint DEFAULT NULL,
  `is_finish` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_exa_files_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_files`
--

LOCK TABLES `exa_files` WRITE;
/*!40000 ALTER TABLE `exa_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `double_check` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `max` bigint DEFAULT NULL,
  `min` bigint DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `regex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fields_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (2,'2022-05-26 07:39:21.974','2022-05-26 07:39:21.974',NULL,'0',0,0,'رقم تليفون العميل','','(01)(\\\\d{9})',1,5),(3,'2022-05-26 07:43:22.075','2022-05-26 07:43:22.075',NULL,'0',0,0,'رقم الموبايل','','(01)(\\\\d{9})',1,5),(4,'2022-05-26 07:46:15.393','2022-05-26 07:46:15.393',NULL,'0',0,0,'الرصيد المطلوب','','\\\\d+',1,3),(5,'2022-05-26 08:05:25.598','2022-05-26 10:42:09.023',NULL,'0',0,0,'Amount','Amount','',1,4);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `domain_name_service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cols` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gateways_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways`
--

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
INSERT INTO `gateways` VALUES (3,'2022-05-10 10:54:00.066','2022-05-10 10:54:00.066',NULL,'com.wakty.efinance','إي فاينانس','E-Finance',NULL),(4,'2022-05-10 10:54:41.182','2022-05-10 10:55:45.154',NULL,'com.wakty.sadad','سداد','Sadad',NULL),(5,'2022-05-10 10:55:14.037','2022-05-10 10:55:54.769',NULL,'com.wakty.orange','أورانج','Orange',NULL);
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_blacklists`
--

DROP TABLE IF EXISTS `jwt_blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_blacklists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `jwt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'jwt',
  PRIMARY KEY (`id`),
  KEY `idx_jwt_blacklists_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_blacklists`
--

LOCK TABLES `jwt_blacklists` WRITE;
/*!40000 ALTER TABLE `jwt_blacklists` DISABLE KEYS */;
INSERT INTO `jwt_blacklists` VALUES (1,'2022-03-15 10:59:29.538','2022-03-15 10:59:29.538',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY0NzkzOTUwOCwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjQ3MzMzNzA4fQ.OoKIWsGXQ_Pk7ZqAsSYpEnmA4sdiXQbrY9XboRbl0A0'),(2,'2022-03-16 09:46:00.838','2022-03-16 09:46:00.838',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY0ODAyMDcwOCwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjQ3NDE0OTA4fQ.F1B70D4bA556GTdpJOZ0sikjwHR8eWl4rm6TjhaoBBk'),(3,'2022-03-16 09:46:00.844','2022-03-16 09:46:00.844',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY0ODAyMDcwOCwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjQ3NDE0OTA4fQ.F1B70D4bA556GTdpJOZ0sikjwHR8eWl4rm6TjhaoBBk'),(4,'2022-03-20 14:06:57.130','2022-03-20 14:06:57.130',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY0ODA0MjY5MCwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjQ3NDM2ODkwfQ.vL572hb7r2LAbhbvg5eSJjNoxaaxCTRdNo6-MxIBMlE'),(5,'2022-03-20 15:29:12.774','2022-03-20 15:29:12.774',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY0ODA1ODUyOSwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjQ3NDUyNzI5fQ.rptcAZxuFCQtWdn7xpP3SyUTbIBkMcIvkOL8LEtSPZs'),(6,'2022-03-20 15:29:12.778','2022-03-20 15:29:12.778',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY0ODA1ODUyOSwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjQ3NDUyNzI5fQ.rptcAZxuFCQtWdn7xpP3SyUTbIBkMcIvkOL8LEtSPZs'),(7,'2022-04-14 10:02:03.332','2022-04-14 10:02:03.332',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1MDUyNzQxMCwiaXNzIjoicW1QbHVzIiwibmJmIjoxNjQ5OTIxNjEwfQ.YvpRPzBaA8PQLM0v09kaHT0sAyRxFrkZ7TxAHqvgJ30'),(8,'2022-04-14 11:00:24.128','2022-04-14 11:00:24.128',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1MDUyODM1MywiaXNzIjoicW1QbHVzIiwibmJmIjoxNjQ5OTIyNTUzfQ.iFNAR4SM2F0pYb3WFWV5hsvD6aSyzSGX8p7zCbbf7fs'),(9,'2022-05-09 13:14:04.494','2022-05-09 13:14:04.494',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1MjYyMzczNywiaXNzIjoicW1QbHVzIiwibmJmIjoxNjUyMDE3OTM3fQ.pnQImDFVrjPT2uif9uYwjOcxTYmuaA_DQEVC-jhljMM'),(10,'2022-05-09 13:14:04.664','2022-05-09 13:14:04.664',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2hee6p-euoeeQhuWRmCIsIkF1dGhvcml0eUlkIjoiODg4IiwiQnVmZmVyVGltZSI6ODY0MDAsImV4cCI6MTY1MjYyMzczNywiaXNzIjoicW1QbHVzIiwibmJmIjoxNjUyMDE3OTM3fQ.pnQImDFVrjPT2uif9uYwjOcxTYmuaA_DQEVC-jhljMM'),(11,'2022-05-10 10:21:59.146','2022-05-10 10:21:59.146',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6Ijg4OCIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI2OTk2NjcsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjA5Mzg2N30.GPCuAx_Sub7Ht6vKwQezL85b1HnIdzlF75SZEVozl_E'),(12,'2022-05-10 10:23:40.461','2022-05-10 10:23:40.461',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6IjEyMyIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzU3MzksImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE2OTkzOX0.mTC_yOLi8wdrq5wAKhE25-zXWSMcSOKgIcCqL1nFzW0'),(13,'2022-05-10 10:25:36.363','2022-05-10 10:25:36.363',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IlN1cGVyIGFkbWluaXN0cmF0b3IiLCJBdXRob3JpdHlJZCI6Ijg4OCIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzU4MjgsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MDAyOH0.ClfzlIIhe1mZs58Lby7W2NRPO5RMIC4K6UTuZr0uR0g'),(14,'2022-05-10 10:27:00.842','2022-05-10 10:27:00.842',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6IjEyMyIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzU5NTUsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MDE1NX0.oK6gIsZ5YX5mNug8S_UvpinS__bNP_-RlJlOfhnDnSE'),(15,'2022-05-10 10:27:01.148','2022-05-10 10:27:01.148',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6IjEyMyIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzU5NTUsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MDE1NX0.oK6gIsZ5YX5mNug8S_UvpinS__bNP_-RlJlOfhnDnSE'),(16,'2022-05-10 10:32:06.179','2022-05-10 10:32:06.179',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IlN1cGVyIGFkbWluaXN0cmF0b3IiLCJBdXRob3JpdHlJZCI6Ijg4OCIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzYwMjksImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MDIyOX0.80aY4_sPATKu1EjwUJwE2Oawg_bs77Op79jbSjDSHGc'),(17,'2022-05-10 10:33:12.750','2022-05-10 10:33:12.750',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6IjEyMyIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzYzNjUsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MDU2NX0.JV4q539kKbtOxBOj_g4RicOjPqqGWSV5X6bk5AuJtbA'),(18,'2022-05-10 10:39:17.320','2022-05-10 10:39:17.320',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IlN1cGVyIGFkbWluaXN0cmF0b3IiLCJBdXRob3JpdHlJZCI6Ijg4OCIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzY0MDAsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MDYwMH0.XD8x-7BeOdqiFPFt16urbiloZej5RBRNsCfGTFrMe24'),(19,'2022-05-10 10:39:17.343','2022-05-10 10:39:17.343',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IlN1cGVyIGFkbWluaXN0cmF0b3IiLCJBdXRob3JpdHlJZCI6Ijg4OCIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzY0MDAsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MDYwMH0.XD8x-7BeOdqiFPFt16urbiloZej5RBRNsCfGTFrMe24'),(20,'2022-05-10 10:39:57.386','2022-05-10 10:39:57.386',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6IjEyMyIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzY3NzgsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MDk3OH0.F-5z2A2tKtBTZXz5XYLchDCG0T1ox3Uck09kEoBqE1E'),(21,'2022-05-10 10:43:17.661','2022-05-10 10:43:17.661',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IlN1cGVyIGFkbWluaXN0cmF0b3IiLCJBdXRob3JpdHlJZCI6Ijg4OCIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzY4MDgsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MTAwOH0.uv8GqxG4M-AWXP5z30aUvOKix0uVwN5dzejd98Xr8eY'),(22,'2022-05-10 10:44:57.416','2022-05-10 10:44:57.416',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6IjEyMyIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzcwNTUsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MTI1NX0.edbscxEabnnB5pt3TSOt9pIT_dssMe2HaHN1HaAF3tw'),(23,'2022-05-10 10:44:57.428','2022-05-10 10:44:57.428',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6IjEyMyIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzcwNTUsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MTI1NX0.edbscxEabnnB5pt3TSOt9pIT_dssMe2HaHN1HaAF3tw'),(24,'2022-05-10 10:48:07.403','2022-05-10 10:48:07.403',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IlN1cGVyIGFkbWluaXN0cmF0b3IiLCJBdXRob3JpdHlJZCI6Ijg4OCIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzcxMTMsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MTMxM30.PHiHndou046JLYzoqvVP7qxbZQGO5cQ3t0ikgYX3Iwc'),(25,'2022-05-10 10:48:43.435','2022-05-10 10:48:43.435',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6IjEyMyIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzczMDQsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MTUwNH0.j9AiyYse3mU9OEru0q2gfftIi7dDLTnpkXEEd_0kGdY'),(26,'2022-05-10 10:48:43.618','2022-05-10 10:48:43.618',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMjc0ZGQ1MzMtMzYyYS00ZTgxLWExNTktZmY2MWY0NTdkMTIxIiwiSUQiOjQsIlVzZXJuYW1lIjoib3BlcmF0aW9uIiwiTmlja05hbWUiOiJPcGVyYXRpb24iLCJBdXRob3JpdHlJZCI6IjEyMyIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzczMDQsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MTUwNH0.j9AiyYse3mU9OEru0q2gfftIi7dDLTnpkXEEd_0kGdY'),(27,'2022-05-10 10:51:58.772','2022-05-10 10:51:58.772',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IlN1cGVyIGFkbWluaXN0cmF0b3IiLCJBdXRob3JpdHlJZCI6Ijg4OCIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3NzczMzQsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY1MjE3MTUzNH0.4i1LV3Go1y8fbFwlH_VgQs4YG3HX50zaAYaTTwiERow'),(28,'2022-05-10 13:58:53.256','2022-05-10 13:58:53.256',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZGRmZDE1OWMtNTVkNC00Y2U1LWFjMTItNTc3OGIyYjBkYjYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IlN1cGVyIGFkbWluaXN0cmF0b3IiLCJBdXRob3JpdHlJZCI6Ijg4OCIsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NTI3OTU3NjksIm5iZiI6MTY1MjE4OTk2OX0.d7sOhnTCU6CM1Wh7NOPhh8jnagEsLRtc1_eT2C7hRz4');
/*!40000 ALTER TABLE `jwt_blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `request_id` varchar(255) DEFAULT NULL,
  `service_id` int unsigned DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `terminal_id` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `msg` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_logs_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (9,'2022-05-11 10:49:46','2022-05-11 10:49:46',NULL,'2022-05-11 10:49:46','SUCCESS','d7c4f94d3ba442b89ad9c9a22e4b8a27',0,'','','','\"FillMap:gateways map was filled successfully\"'),(10,'2022-05-12 07:12:32','2022-05-12 07:12:32',NULL,'2022-05-12 07:12:32','SUCCESS','d6b16fd536a94465a659d6bcbfca9de4',0,'','','','\"FillMap:gateways map was filled successfully\"'),(11,'2022-05-15 07:02:23','2022-05-15 07:02:23',NULL,'2022-05-15 07:02:23','SUCCESS','122efe8217db4d6299e0f597465a91a9',0,'','','','\"FillMap:gateways map was filled successfully\"'),(12,'2022-05-15 07:41:58','2022-05-15 07:41:58',NULL,'2022-05-15 07:41:58','SUCCESS','4e1e57aa4e2241538fb19e90c5e3ba3b',0,'','','','\"FillMap:gateways map was filled successfully\"'),(13,'2022-05-16 07:02:41','2022-05-16 07:02:41',NULL,'2022-05-16 07:02:41','SUCCESS','7b4f45aae85b4075bda946f8bed17dc1',0,'','','','\"FillMap:gateways map was filled successfully\"'),(14,'2022-05-17 07:00:28','2022-05-17 07:00:28',NULL,'2022-05-17 07:00:28','SUCCESS','ca9500b1c85544018a68c3d9cd81264f',0,'','','','\"FillMap:gateways map was filled successfully\"'),(15,'2022-05-18 06:42:09','2022-05-18 06:42:09',NULL,'2022-05-18 06:42:09','SUCCESS','a682ac435be64e1db7afc9844947da19',0,'','','','\"FillMap:gateways map was filled successfully\"'),(16,'2022-05-19 06:54:39','2022-05-19 06:54:39',NULL,'2022-05-19 06:54:39','SUCCESS','d6137fe377ed44749949b703148aecf9',0,'','','','\"FillMap:gateways map was filled successfully\"'),(17,'2022-05-22 06:48:48','2022-05-22 06:48:48',NULL,'2022-05-22 06:48:48','SUCCESS','7eada70417a74a2b9b0b09b88232c8cf',0,'','','','\"FillMap:gateways map was filled successfully\"'),(18,'2022-05-23 07:09:13','2022-05-23 07:09:13',NULL,'2022-05-23 07:09:13','SUCCESS','5f967f42a005427fa25b2b0fb32ecb15',0,'','','','\"FillMap:gateways map was filled successfully\"'),(19,'2022-05-25 07:15:58','2022-05-25 07:15:58',NULL,'2022-05-25 07:15:58','SUCCESS','4c50e596f98d4c0b950bf756fd1768e5',0,'','','','\"FillMap:gateways map was filled successfully\"'),(20,'2022-05-26 06:53:20','2022-05-26 06:53:20',NULL,'2022-05-26 06:53:20','SUCCESS','4054adf821b448f3a001771db26f9295',0,'','','','\"FillMap:gateways map was filled successfully\"'),(21,'2022-05-26 08:56:09','2022-05-26 08:56:09',NULL,'2022-05-26 08:56:09','SUCCESS','3ea2ccb404eb4b11982c8b678be56ad0',0,'','','','\"FillMap:gateways map was filled successfully\"');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  `last_login` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_merchants_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` VALUES (1,'2022-03-16 09:47:38.225','2022-04-27 08:44:30.942',NULL,'123','$2a$14$sBnq7r8Z5SRLG5jnjGlJh.O7h7Y3e7MBLgjjBPgQl6cUGq.4yUnRu',0,'2022-04-27 08:44:30.545');
/*!40000 ALTER TABLE `merchants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pckg_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_id` mediumint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_packages_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (2,'2022-05-26 08:08:38.224','2022-05-26 08:08:38.224',NULL,'2.5','','2.5',5),(3,'2022-05-26 08:09:07.843','2022-05-26 08:09:07.843',NULL,'4.00','','4',5),(4,'2022-05-26 08:09:37.153','2022-05-26 08:09:37.153',NULL,'9','','9',5),(5,'2022-06-21 11:08:41.254','2022-06-21 11:08:49.710',NULL,'10','10','10',2);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` int unsigned DEFAULT NULL,
  `update_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_providers_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (3,'2022-05-11 11:38:42.325','2022-05-11 11:38:42.325','2022-05-25 12:46:04.905','prov1','prov1',NULL,NULL),(4,'2022-05-25 12:53:10.434','2022-05-25 12:53:10.434',NULL,'المصرية للإتصالات','',NULL,NULL),(5,'2022-05-25 12:53:21.737','2022-05-25 12:53:21.737',NULL,'فودافون','',NULL,NULL),(6,'2022-05-25 12:53:30.722','2022-05-25 12:53:30.722',NULL,'اورانج','',NULL,NULL),(7,'2022-05-25 12:53:44.093','2022-05-25 12:53:44.093',NULL,'اتصالات','',NULL,NULL),(8,'2022-05-25 12:54:27.470','2022-05-25 12:54:27.470',NULL,'المصرية لنقل البيانات','',NULL,NULL),(9,'2022-05-25 12:54:45.280','2022-05-25 12:54:45.280',NULL,'نور دي اس ال','',NULL,NULL),(10,'2022-05-25 12:54:58.774','2022-05-25 12:54:58.774',NULL,'الفجر','',NULL,NULL),(11,'2022-05-25 12:55:25.527','2022-05-25 12:55:25.527',NULL,'خدمات الانترنت ق.م','',NULL,NULL),(12,'2022-05-25 12:56:17.017','2022-05-25 12:56:17.017',NULL,'بيت الزكاة والصدقات - الأزهر','',NULL,NULL),(13,'2022-05-25 12:56:29.351','2022-05-25 12:56:29.351',NULL,'بنك الطعام','',NULL,NULL),(14,'2022-05-25 12:56:43.238','2022-05-25 12:56:43.238',NULL,'بنك الشفاء','',NULL,NULL),(15,'2022-05-25 12:57:03.603','2022-05-25 12:57:03.603',NULL,'جمعية دار الأورمان','',NULL,NULL),(16,'2022-05-25 12:57:29.035','2022-05-25 12:57:29.035',NULL,'شفاء الأورمان','',NULL,NULL),(17,'2022-05-25 12:57:51.688','2022-05-25 12:57:51.688',NULL,'صندوق تحيا مصر','',NULL,NULL),(18,'2022-05-25 12:58:08.041','2022-05-25 12:58:08.041',NULL,'عمار الأرض','',NULL,NULL),(19,'2022-05-25 13:16:20.378','2022-05-25 13:16:20.378',NULL,'مستشفي 57357','',NULL,NULL),(20,'2022-05-25 13:16:54.862','2022-05-25 13:16:54.862',NULL,'مصر الخير','',NULL,NULL),(21,'2022-05-25 13:17:29.709','2022-05-25 13:17:29.709',NULL,'جمعية رسالة','',NULL,NULL),(22,'2022-05-25 13:17:45.435','2022-05-25 13:17:45.435',NULL,'معهد الاورام','',NULL,NULL),(23,'2022-05-25 13:18:17.097','2022-05-25 13:18:17.097',NULL,'مؤسسة صناع الحياة  مصر','',NULL,NULL),(24,'2022-05-25 13:18:45.058','2022-05-25 13:18:45.058',NULL,'مؤسسة مجدي يعقوب للقلب','',NULL,NULL),(25,'2022-05-25 13:19:02.985','2022-05-25 13:19:02.985',NULL,'جمعية نور علي نور','',NULL,NULL),(26,'2022-05-25 13:19:18.268','2022-05-25 13:19:18.268',NULL,'بنك الكساء','',NULL,NULL),(27,'2022-05-25 13:19:43.125','2022-05-25 13:19:43.125',NULL,'برنامج اﻷغذية العالمي','',NULL,NULL),(28,'2022-05-25 13:20:19.672','2022-05-25 13:20:19.672',NULL,'مستشفي اهل مصر للحروق','',NULL,NULL),(29,'2022-05-25 13:20:35.231','2022-05-25 13:20:35.231',NULL,'مستشفي 25 يناير','',NULL,NULL),(30,'2022-05-25 13:20:54.297','2022-05-25 13:20:54.297',NULL,'معهد اﻷورام 500 500','',NULL,NULL),(31,'2022-05-25 13:21:11.413','2022-05-25 13:21:11.413',NULL,'معهد اﻷورام 777','',NULL,NULL),(32,'2022-05-25 13:21:27.580','2022-05-25 13:21:27.580',NULL,'جامعة عين شمس','',NULL,NULL),(33,'2022-05-25 13:21:40.353','2022-05-25 13:21:40.353',NULL,'مؤسسة بهية','',NULL,NULL),(34,'2022-05-25 13:22:02.407','2022-05-25 13:22:02.407',NULL,'مؤسسة مرسال الخيرية','',NULL,NULL),(35,'2022-05-25 13:22:17.022','2022-05-25 13:22:17.022',NULL,'مؤسسة الكبد','',NULL,NULL),(36,'2022-05-25 13:22:34.307','2022-05-25 13:22:34.307',NULL,'جمعية البراق الخيرية','',NULL,NULL),(37,'2022-05-25 13:22:54.378','2022-05-25 13:22:54.378',NULL,'جمعية المصباح المضئ','',NULL,NULL),(38,'2022-05-25 13:23:20.352','2022-05-25 13:23:20.352',NULL,'مستشفي عين شمس','',NULL,NULL),(39,'2022-05-25 13:23:41.095','2022-05-25 13:23:41.095',NULL,'تحصيلات رسالة','',NULL,NULL),(40,'2022-05-25 13:23:54.759','2022-05-25 13:23:54.759',NULL,'مدينة زويل','',NULL,NULL),(41,'2022-05-25 13:24:11.824','2022-05-25 13:24:11.824',NULL,'أبوالريش المنيرة','',NULL,NULL),(42,'2022-05-25 13:24:44.491','2022-05-25 13:24:44.491',NULL,'مؤسسه القصر العيني','',NULL,NULL),(43,'2022-05-25 13:25:20.858','2022-05-25 13:25:20.858',NULL,' 4040ايادي المستقبل ','',NULL,NULL),(44,'2022-05-25 13:26:07.128','2022-05-25 13:26:07.128',NULL,'جمعية بيت الخير الخيرية','',NULL,NULL),(45,'2022-05-25 13:26:24.420','2022-05-25 13:26:24.420',NULL,'جمعية عيون مصر','',NULL,NULL),(46,'2022-05-25 13:26:42.534','2022-05-25 13:26:42.534',NULL,'تبرعات مستشفي 333','',NULL,NULL),(47,'2022-05-25 13:27:05.439','2022-05-25 13:27:05.439',NULL,'جمعية الصعيد','',NULL,NULL),(48,'2022-05-25 13:27:34.618','2022-05-25 13:27:34.618',NULL,'جمعية النور واﻷمل','',NULL,NULL),(49,'2022-05-25 13:27:58.160','2022-05-25 13:27:58.160',NULL,'جمعية مركز اﻷورام','',NULL,NULL),(50,'2022-05-25 13:28:34.296','2022-05-25 13:28:34.296',NULL,'الجمعيه المصريه لرعايه مرضي الكبد','',NULL,NULL),(51,'2022-05-25 13:28:52.218','2022-05-25 13:28:52.218',NULL,'مؤسسة بسمة الحياة','',NULL,NULL),(52,'2022-05-25 13:29:10.275','2022-05-25 13:29:10.275',NULL,'من احياها','',NULL,NULL),(53,'2022-05-25 13:29:29.588','2022-05-25 13:29:29.588',NULL,'مؤسسة السندس للأيتام','',NULL,NULL),(54,'2022-05-25 13:29:49.158','2022-05-25 13:29:49.158',NULL,'راعى مصر للتنمية','',NULL,NULL),(55,'2022-05-25 13:30:10.899','2022-05-25 13:30:10.899',NULL,'مؤسسة بالعربي إنسان للتنمية','',NULL,NULL),(56,'2022-05-25 13:30:26.109','2022-05-25 13:30:26.109',NULL,'المستشفيات الجامعية','',NULL,NULL),(57,'2022-05-25 13:30:43.497','2022-05-25 13:30:43.497',NULL,'مؤسسة الزهراوان للتنمية','',NULL,NULL),(58,'2022-05-25 13:31:24.979','2022-05-25 13:31:24.979',NULL,'شارك البسمة','',NULL,NULL),(59,'2022-05-25 13:31:49.581','2022-05-25 13:31:49.581',NULL,'جمعية سفراء الهداية','',NULL,NULL),(60,'2022-05-25 13:32:13.001','2022-05-25 13:32:13.001',NULL,'جمعية بنكمل بعض','',NULL,NULL),(61,'2022-05-25 13:32:31.295','2022-05-25 13:32:31.295',NULL,'مركز اورام الفيوم','',NULL,NULL),(62,'2022-05-25 13:32:50.682','2022-05-25 13:32:50.682',NULL,'مستشفى الناس','',NULL,NULL),(63,'2022-05-25 13:33:08.614','2022-05-25 13:33:08.614',NULL,'مؤسسه صلاح الدين الايوبي','',NULL,NULL),(64,'2022-05-25 13:33:27.897','2022-05-25 13:33:27.897',NULL,'مؤسسه شباب الخير بميت فضاله','',NULL,NULL),(65,'2022-05-25 13:33:43.827','2022-05-25 13:33:43.827',NULL,'مؤسسه منه الله','',NULL,NULL),(66,'2022-05-25 13:34:04.289','2022-05-25 13:34:04.289',NULL,'مؤسسه نوبه الخير','',NULL,NULL),(67,'2022-05-25 13:34:22.400','2022-05-25 13:34:22.400',NULL,'مؤسسة باقيات صالحات','',NULL,NULL),(68,'2022-05-25 13:34:39.836','2022-05-25 13:34:39.836',NULL,'جمعية مسجد د.مصطفي محمود','',NULL,NULL),(69,'2022-05-25 13:34:56.723','2022-05-25 13:34:56.723',NULL,'جمعية سرطان أطفال اسكندرية','',NULL,NULL),(70,'2022-05-25 13:35:23.416','2022-05-25 13:35:23.416',NULL,'جمعيه الهلال الاحمر المصري','',NULL,NULL),(71,'2022-05-25 13:35:37.894','2022-05-25 13:35:37.894',NULL,'نادى الزمالك','',NULL,NULL),(72,'2022-05-25 14:39:21.448','2022-05-25 14:39:21.448',NULL,'ادعم رشيد','',NULL,NULL);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_field`
--

DROP TABLE IF EXISTS `service_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_field` (
  `fields_id` bigint unsigned NOT NULL,
  `services_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`fields_id`,`services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_field`
--

LOCK TABLES `service_field` WRITE;
/*!40000 ALTER TABLE `service_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_fields`
--

DROP TABLE IF EXISTS `service_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_fields` (
  `fields_id` bigint unsigned NOT NULL,
  `services_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`fields_id`,`services_id`),
  KEY `service_fields_services_id_services_id_foreign` (`services_id`),
  CONSTRAINT `service_fields_fields_id_fields_id_foreign` FOREIGN KEY (`fields_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_fields_services_id_services_id_foreign` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_fields`
--

LOCK TABLES `service_fields` WRITE;
/*!40000 ALTER TABLE `service_fields` DISABLE KEYS */;
INSERT INTO `service_fields` VALUES (2,47),(2,48),(3,48),(2,53),(3,54),(5,54),(5,55),(5,56),(3,60),(3,62),(5,62),(5,63),(5,64),(5,65),(5,67),(5,68),(5,69),(5,70),(5,71),(5,82),(5,83),(5,84),(5,85),(5,87),(5,88),(4,89),(5,89),(5,91),(5,92),(5,93),(3,95),(3,96),(4,96),(5,96),(2,97);
/*!40000 ALTER TABLE `service_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_gateways`
--

DROP TABLE IF EXISTS `service_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_gateways` (
  `services_id` bigint unsigned NOT NULL,
  `gateways_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`services_id`,`gateways_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_gateways`
--

LOCK TABLES `service_gateways` WRITE;
/*!40000 ALTER TABLE `service_gateways` DISABLE KEYS */;
INSERT INTO `service_gateways` VALUES (41,4),(42,4),(43,4),(44,4),(45,4),(47,4),(48,4),(53,4),(54,4),(55,4),(56,4),(60,4),(62,4),(63,4),(64,4),(65,4),(66,4),(67,4),(68,4),(69,4),(70,3),(71,4),(82,4),(83,4),(84,4),(85,4),(87,4),(88,4),(89,4),(91,4),(92,3),(93,3),(95,3),(96,3),(96,4),(97,3);
/*!40000 ALTER TABLE `service_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_versions`
--

DROP TABLE IF EXISTS `service_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_versions` (
  `versions_id` bigint unsigned NOT NULL,
  `services_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`versions_id`,`services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_versions`
--

LOCK TABLES `service_versions` WRITE;
/*!40000 ALTER TABLE `service_versions` DISABLE KEYS */;
INSERT INTO `service_versions` VALUES (2,47),(2,48),(2,53),(2,54),(2,55),(2,56),(2,60),(2,62),(2,63),(2,64),(2,65),(2,66),(2,67),(2,68),(2,69),(2,70),(2,71),(2,82),(2,83),(2,84),(2,85),(2,87),(2,88),(2,89),(2,91),(2,92),(2,93),(2,95),(2,96),(2,97);
/*!40000 ALTER TABLE `service_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `cat_id` mediumint DEFAULT NULL,
  `prov_id` mediumint DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_price` smallint DEFAULT NULL,
  `price` double DEFAULT NULL,
  `inq` smallint DEFAULT NULL,
  `count` mediumint DEFAULT NULL,
  `is_par` mediumint DEFAULT NULL,
  `default_gateway_dn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` int unsigned DEFAULT NULL,
  `update_by` int unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_services_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (41,'2022-05-11 11:41:07.060','2022-05-11 11:41:07.060','2022-05-11 14:18:06.698',5,3,'serv1','serv1',0,0,0,0,0,'4',NULL,NULL,NULL),(42,'2022-05-11 12:01:00.411','2022-05-11 12:01:00.411','2022-05-11 14:18:13.271',0,3,'aasa','dsasda',0,0,0,0,0,'4',NULL,NULL,NULL),(43,'2022-05-11 12:01:30.502','2022-05-11 12:01:30.502','2022-05-11 14:18:22.702',0,3,'aasa','dsasda',0,0,0,0,0,'4',NULL,NULL,NULL),(44,'2022-05-11 12:01:56.853','2022-05-11 12:01:56.853','2022-05-11 14:27:32.129',0,3,'aasa','dsasda',0,0,0,0,0,'4',NULL,NULL,NULL),(45,'2022-05-11 14:21:14.327','2022-05-11 14:21:14.327','2022-05-11 14:35:50.461',0,0,'www','eee',0,0,0,0,0,'4',NULL,NULL,NULL),(47,'2022-06-19 12:35:13.531','2022-06-19 12:35:13.531','2022-06-27 14:02:11.193',6,4,'شحن على الطاير ','on air ',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(48,'2022-06-19 12:51:11.226','2022-06-19 12:51:11.226','2022-06-27 14:09:40.684',7,4,'كروت شحن','card',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(53,'2022-06-21 10:32:57.365','2022-06-21 10:32:57.365','2022-06-27 14:14:22.058',6,4,'test122222','test12345',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(54,'2022-06-22 09:53:24.084','2022-06-22 09:53:24.084','2022-06-27 14:15:42.575',6,4,'ddsds','dssssssssssss',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(55,'2022-06-22 10:44:12.273','2022-06-22 10:44:12.273','2022-06-27 14:19:54.824',7,4,'testsada','testsada',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(56,'2022-06-22 10:49:50.591','2022-06-23 14:38:55.381','2022-06-27 14:16:35.788',7,5,'testsada','testsada',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(60,'2022-06-26 11:24:12.581','2022-06-26 11:24:12.581','2022-06-27 14:01:26.736',6,4,'kjrhuirhuri','ekrjirjtr',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(62,'2022-06-27 14:24:51.605','2022-06-27 14:24:51.605','2022-06-27 14:25:12.607',7,5,'ddddddddddddd','dddddddddddd',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(63,'2022-06-27 14:30:57.235','2022-06-27 14:30:57.235','2022-06-27 14:32:15.750',7,4,'ser1','ser2',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(64,'2022-06-27 15:03:04.065','2022-06-27 15:03:04.065',NULL,7,4,'serv1','serv2',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(65,'2022-06-27 15:07:18.576','2022-06-27 15:07:18.576','2022-06-27 15:08:45.342',7,4,'servvvvv','servvvvv',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(66,'2022-06-27 15:24:50.202','2022-06-27 15:24:50.202',NULL,6,4,'d','d',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(67,'2022-06-27 15:29:30.043','2022-06-27 15:29:30.043','2022-06-27 15:30:19.290',6,5,'s3','s3',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(68,'2022-06-27 15:52:29.935','2022-06-27 15:52:29.935',NULL,7,4,'eeeeeeeeeeee','eeeeeeeeee',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(69,'2022-06-27 16:02:33.997','2022-06-27 16:02:33.997',NULL,6,5,'sd1','sd2',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(70,'2022-06-27 16:06:49.730','2022-06-27 16:06:49.730','2022-06-28 14:39:01.388',6,4,'xxxx','xxxxxxxxx',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(71,'2022-06-27 16:08:24.209','2022-06-27 16:08:24.209','2022-06-28 11:20:35.755',7,5,'dddddd','dd',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(82,'2022-06-28 10:50:15.746','2022-06-28 11:09:24.657','2022-06-28 11:30:13.202',6,5,'t3343434','t4344444',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(83,'2022-06-28 11:47:48.475','2022-06-28 11:47:48.475',NULL,7,5,'ASD','asd',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(84,'2022-06-28 12:58:34.756','2022-06-28 12:58:34.756','2022-06-28 13:20:15.623',7,4,'sw','sw',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(85,'2022-06-28 13:27:15.312','2022-06-28 13:27:15.312','2022-06-28 13:27:35.772',6,4,'de','ed',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(87,'2022-06-28 13:39:15.588','2022-06-28 13:39:15.588',NULL,6,4,'ffffffff','ffffff',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(88,'2022-06-28 13:40:01.043','2022-06-28 13:40:01.043',NULL,7,6,'fffffff','ffff',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(89,'2022-06-28 13:41:11.167','2022-06-28 13:41:11.167','2022-06-28 14:24:27.020',7,4,'f','f',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(91,'2022-06-29 09:54:07.611','2022-06-29 10:02:54.740','2022-06-29 10:21:06.249',7,4,'gygyg','gggygy',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(92,'2022-07-05 13:22:07.190','2022-07-05 13:22:07.190',NULL,7,5,'serv2333','serv45',0,0,0,0,0,'com.wakty.efinance',NULL,NULL,0),(93,'2022-07-05 13:36:16.126','2022-07-05 13:36:16.126',NULL,6,4,'vvvvv','vvvvvv',0,0,0,0,0,'com.wakty.efinance',NULL,NULL,0),(95,'2022-07-05 13:52:36.261','2022-07-05 14:18:09.805','2022-07-05 14:18:48.108',6,5,'cccc','cccccccc',0,0,0,0,0,'com.wakty.efinance',NULL,NULL,0),(96,'2022-07-05 14:31:07.073','2022-07-05 14:31:07.073',NULL,6,4,'jjijiji','bbjjj',0,0,0,0,0,'com.wakty.sadad',NULL,NULL,0),(97,'2022-07-05 14:33:40.732','2022-07-05 14:33:40.732',NULL,6,4,'gg','gggggg',0,0,0,0,0,'com.wakty.efinance',NULL,NULL,0);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_apis`
--

DROP TABLE IF EXISTS `sys_apis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_apis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`),
  KEY `idx_sys_apis_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_apis`
--

LOCK TABLES `sys_apis` WRITE;
/*!40000 ALTER TABLE `sys_apis` DISABLE KEYS */;
INSERT INTO `sys_apis` VALUES (1,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/base/login','User login (required)','base','POST'),(2,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/jwt/jsonInBlacklist','JWT added to the blacklist (Logout required)','jwt','POST'),(3,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/deleteUser','Delete Users','System User','DELETE'),(4,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/register','User registration','System User','POST'),(5,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/getUserList','Get user list','System User','POST'),(6,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/setUserInfo','Set user information','System User','PUT'),(7,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/setSelfInfo','Set self information (required)','System User','PUT'),(8,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/getUserInfo','Get self information (required)','System User','GET'),(9,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/setUserAuthorities','Set permission group','System User','POST'),(10,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/changePassword','Change password (recommended)','System User','POST'),(11,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/setUserAuthority','Modify user role (required)','System User','POST'),(12,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/user/resetPassword','Reset User Password','System User','POST'),(13,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/api/createApi','Create API','api','POST'),(14,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/api/deleteApi','Delete APIs','api','POST'),(15,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/api/updateApi','Update APIs','api','POST'),(16,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/api/getApiList','Get API List','api','POST'),(17,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/api/getAllApis','Get All API','api','POST'),(18,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/api/getApiById','Get API Details','api','POST'),(19,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/api/deleteApisByIds','Batch Delete API','api','DELETE'),(20,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/authority/copyAuthority','Copy Role','Role','POST'),(21,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/authority/createAuthority','Create Role','Role','POST'),(22,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/authority/deleteAuthority','Delete role','Role','POST'),(23,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/authority/updateAuthority','Update Role','Role','PUT'),(24,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/authority/getAuthorityList','Get Roles List','Role','POST'),(25,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/authority/setDataAuthority','Set role resource permissions','Role','POST'),(26,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/casbin/updateCasbin','Change role api permissions','casbin','POST'),(27,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/casbin/getPolicyPathByAuthorityId','Get permission list','casbin','POST'),(28,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/menu/addBaseMenu','Add menu','Menu','POST'),(29,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/menu/getMenu','Get the menu tree (required)','Menu','POST'),(30,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/menu/deleteBaseMenu','Delete Menu','Menu','POST'),(31,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/menu/updateBaseMenu','Update Menu','Menu','POST'),(32,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/menu/getBaseMenuById','Get Menu By ID','Menu','POST'),(33,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/menu/getMenuList','Get Menu List','Menu','POST'),(34,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/menu/getBaseMenuTree','Get user dynamic route','Menu','POST'),(35,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/menu/getMenuAuthority','Get the specified role menu','Menu','POST'),(36,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/menu/addMenuAuthority','Add menu and role association','Menu','POST'),(37,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/fileUploadAndDownload/findFile','寻找目标文件（秒传）','Partial upload','POST'),(38,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/fileUploadAndDownload/breakpointContinue','断点续传','Partial upload','POST'),(39,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/fileUploadAndDownload/breakpointContinueFinish','断点续传完成','Partial upload','POST'),(40,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/fileUploadAndDownload/removeChunk','上传完成移除文件','Partial upload','POST'),(41,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/fileUploadAndDownload/upload','文件上传示例','File upload and download','POST'),(42,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/fileUploadAndDownload/deleteFile','删除文件','File upload and download','POST'),(43,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/fileUploadAndDownload/getFileList','获取上传文件列表','File upload and download','POST'),(44,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/system/getServerInfo','获取服务器信息','System Service','POST'),(45,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/system/getSystemConfig','获取配置文件内容','System Service','POST'),(46,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/system/setSystemConfig','设置配置文件内容','System Service','POST'),(47,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/customer/customer','更新客户','Customer','PUT'),(48,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/customer/customer','创建客户','Customer','POST'),(49,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/customer/customer','删除客户','Customer','DELETE'),(50,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/customer/customer','获取单一客户','Customer','GET'),(51,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/customer/customerList','获取客户列表','Customer','GET'),(52,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/autoCode/getDB','获取所有数据库','Code Generator','GET'),(53,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/autoCode/getTables','获取数据库表','Code Generator','GET'),(54,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/autoCode/createTemp','自动化代码','Code Generator','POST'),(55,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/autoCode/preview','预览自动化代码','Code Generator','POST'),(56,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/autoCode/getColumn','获取所选table的所有字段','Code Generator','GET'),(57,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/autoCode/getMeta','获取meta信息','Code generator log','POST'),(58,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/autoCode/rollback','回滚自动生成代码','Code generator log','POST'),(59,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/autoCode/getSysHistory','查询回滚记录','Code generator log','POST'),(60,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/autoCode/delSysHistory','删除回滚记录','Code generator log','POST'),(61,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionaryDetail/updateSysDictionaryDetail','更新字典内容','System Dictionary Details','PUT'),(62,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionaryDetail/createSysDictionaryDetail','新增字典内容','System Dictionary Details','POST'),(63,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionaryDetail/deleteSysDictionaryDetail','删除字典内容','System Dictionary Details','DELETE'),(64,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionaryDetail/findSysDictionaryDetail','根据ID获取字典内容','System Dictionary Details','GET'),(65,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionaryDetail/getSysDictionaryDetailList','获取字典内容列表','System Dictionary Details','GET'),(66,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionary/createSysDictionary','新增字典','System dictionary','POST'),(67,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionary/deleteSysDictionary','删除字典','System dictionary','DELETE'),(68,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionary/updateSysDictionary','更新字典','System dictionary','PUT'),(69,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionary/findSysDictionary','根据ID获取字典','System dictionary','GET'),(70,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysDictionary/getSysDictionaryList','获取字典列表','System dictionary','GET'),(71,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysOperationRecord/createSysOperationRecord','新增操作记录','Operation record','POST'),(72,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysOperationRecord/findSysOperationRecord','根据ID获取操作记录','Operation record','GET'),(73,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysOperationRecord/getSysOperationRecordList','获取操作记录列表','Operation record','GET'),(74,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysOperationRecord/deleteSysOperationRecord','删除操作记录','Operation record','DELETE'),(75,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/sysOperationRecord/deleteSysOperationRecordByIds','批量删除操作历史','Operation record','DELETE'),(76,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/simpleUploader/upload','插件版分片上传','Resumable upload (plug-in version)','POST'),(77,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/simpleUploader/checkFileMd5','文件完整度验证','Resumable upload (plug-in version)','GET'),(78,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/simpleUploader/mergeFileMd5','上传完成合并文件','Resumable upload (plug-in version)','GET'),(79,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/email/emailTest','发送测试邮件','email','POST'),(80,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/email/emailSend','发送邮件示例','email','POST'),(81,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/excel/importExcel','导入excel','excel','POST'),(82,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/excel/loadExcel','下载excel','excel','GET'),(83,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/excel/exportExcel','导出excel','excel','POST'),(84,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/excel/downloadTemplate','下载excel模板','excel','GET'),(85,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/authorityBtn/setAuthorityBtn','设置按钮权限','按钮权限','POST'),(86,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/authorityBtn/getAuthorityBtn','获取已有按钮权限','按钮权限','POST'),(87,'2022-03-15 10:33:32.878','2022-03-15 10:33:32.878',NULL,'/authorityBtn/canRemoveAuthorityBtn','删除按钮','按钮权限','POST'),(88,'2022-03-15 10:45:57.710','2022-03-15 10:45:57.710',NULL,'/gateways/createGateways','新增gateways table','gateways','POST'),(89,'2022-03-15 10:45:57.712','2022-03-15 10:45:57.712',NULL,'/gateways/deleteGateways','删除gateways table','gateways','DELETE'),(90,'2022-03-15 10:45:57.714','2022-03-15 10:45:57.714',NULL,'/gateways/deleteGatewaysByIds','批量删除gateways table','gateways','DELETE'),(91,'2022-03-15 10:45:57.716','2022-03-15 10:45:57.716',NULL,'/gateways/updateGateways','更新gateways table','gateways','PUT'),(92,'2022-03-15 10:45:57.717','2022-03-15 10:45:57.717',NULL,'/gateways/findGateways','根据ID获取gateways table','gateways','GET'),(93,'2022-03-15 10:45:57.717','2022-03-15 10:45:57.717',NULL,'/gateways/getGatewaysList','获取gateways table列表','gateways','GET'),(94,'2022-03-15 10:48:34.517','2022-03-15 10:48:34.517',NULL,'/categories/createCategories','新增categories table','categories','POST'),(95,'2022-03-15 10:48:34.518','2022-03-15 10:48:34.518',NULL,'/categories/deleteCategories','删除categories table','categories','DELETE'),(96,'2022-03-15 10:48:34.518','2022-03-15 10:48:34.518',NULL,'/categories/deleteCategoriesByIds','批量删除categories table','categories','DELETE'),(97,'2022-03-15 10:48:34.519','2022-03-15 10:48:34.519',NULL,'/categories/updateCategories','更新categories table','categories','PUT'),(98,'2022-03-15 10:48:34.519','2022-03-15 10:48:34.519',NULL,'/categories/findCategories','根据ID获取categories table','categories','GET'),(99,'2022-03-15 10:48:34.520','2022-03-15 10:48:34.520',NULL,'/categories/getCategoriesList','获取categories table列表','categories','GET'),(100,'2022-03-15 11:11:05.620','2022-03-15 11:11:05.620',NULL,'/providers/createProviders','新增providers table','providers','POST'),(101,'2022-03-15 11:11:05.621','2022-03-15 11:11:05.621',NULL,'/providers/deleteProviders','删除providers table','providers','DELETE'),(102,'2022-03-15 11:11:05.622','2022-03-15 11:11:05.622',NULL,'/providers/deleteProvidersByIds','批量删除providers table','providers','DELETE'),(103,'2022-03-15 11:11:05.623','2022-03-15 11:11:05.623',NULL,'/providers/updateProviders','更新providers table','providers','PUT'),(104,'2022-03-15 11:11:05.624','2022-03-15 11:11:05.624',NULL,'/providers/findProviders','根据ID获取providers table','providers','GET'),(105,'2022-03-15 11:11:05.626','2022-03-15 11:11:05.626',NULL,'/providers/getProvidersList','获取providers table列表','providers','GET'),(106,'2022-03-15 11:11:05.644','2022-03-15 11:11:05.644',NULL,'/providers/createProviders','新增providers table','providers','POST'),(107,'2022-03-15 11:11:05.646','2022-03-15 11:11:05.646',NULL,'/providers/deleteProviders','删除providers table','providers','DELETE'),(108,'2022-03-15 11:11:05.648','2022-03-15 11:11:05.648',NULL,'/providers/deleteProvidersByIds','批量删除providers table','providers','DELETE'),(109,'2022-03-15 11:11:05.652','2022-03-15 11:11:05.652',NULL,'/providers/updateProviders','更新providers table','providers','PUT'),(110,'2022-03-15 11:11:05.654','2022-03-15 11:11:05.654',NULL,'/providers/findProviders','根据ID获取providers table','providers','GET'),(111,'2022-03-15 11:11:05.655','2022-03-15 11:11:05.655',NULL,'/providers/getProvidersList','获取providers table列表','providers','GET'),(112,'2022-03-15 11:14:42.368','2022-03-15 11:14:42.368',NULL,'/frontends/createVersions','新增versions table','frontends','POST'),(113,'2022-03-15 11:14:42.370','2022-03-15 11:14:42.370',NULL,'/frontends/deleteVersions','删除versions table','frontends','DELETE'),(114,'2022-03-15 11:14:42.373','2022-03-15 11:14:42.373',NULL,'/frontends/deleteVersionsByIds','批量删除versions table','frontends','DELETE'),(115,'2022-03-15 11:14:42.374','2022-03-15 11:14:42.374',NULL,'/frontends/updateVersions','更新versions table','frontends','PUT'),(116,'2022-03-15 11:14:42.375','2022-03-15 11:14:42.375',NULL,'/frontends/findVersions','根据ID获取versions table','frontends','GET'),(117,'2022-03-15 11:14:42.376','2022-03-15 11:14:42.376',NULL,'/frontends/getVersionsList','获取versions table列表','frontends','GET'),(118,'2022-03-15 12:01:15.246','2022-03-15 12:01:15.246',NULL,'/terminals/createTerminals','新增terminals table','terminals','POST'),(119,'2022-03-15 12:01:15.247','2022-03-15 12:01:15.247',NULL,'/terminals/deleteTerminals','删除terminals table','terminals','DELETE'),(120,'2022-03-15 12:01:15.248','2022-03-15 12:01:15.248',NULL,'/terminals/deleteTerminalsByIds','批量删除terminals table','terminals','DELETE'),(121,'2022-03-15 12:01:15.251','2022-03-15 12:01:15.251',NULL,'/terminals/updateTerminals','更新terminals table','terminals','PUT'),(122,'2022-03-15 12:01:15.252','2022-03-15 12:01:15.252',NULL,'/terminals/findTerminals','根据ID获取terminals table','terminals','GET'),(123,'2022-03-15 12:01:15.253','2022-03-15 12:01:15.253',NULL,'/terminals/getTerminalsList','获取terminals table列表','terminals','GET'),(124,'2022-03-15 12:14:27.241','2022-03-15 12:14:27.241',NULL,'/fields/createFields','新增fields table','fields','POST'),(125,'2022-03-15 12:14:27.241','2022-03-15 12:14:27.241',NULL,'/fields/deleteFields','删除fields table','fields','DELETE'),(126,'2022-03-15 12:14:27.242','2022-03-15 12:14:27.242',NULL,'/fields/deleteFieldsByIds','批量删除fields table','fields','DELETE'),(127,'2022-03-15 12:14:27.243','2022-03-15 12:14:27.243',NULL,'/fields/updateFields','更新fields table','fields','PUT'),(128,'2022-03-15 12:14:27.245','2022-03-15 12:14:27.245',NULL,'/fields/findFields','根据ID获取fields table','fields','GET'),(129,'2022-03-15 12:14:27.246','2022-03-15 12:14:27.246',NULL,'/fields/getFieldsList','获取fields table列表','fields','GET'),(130,'2022-03-15 12:28:31.427','2022-03-15 12:28:31.427',NULL,'/services/createServices','新增services table','services','POST'),(131,'2022-03-15 12:28:31.428','2022-03-15 12:28:31.428',NULL,'/services/deleteServices','删除services table','services','DELETE'),(132,'2022-03-15 12:28:31.429','2022-03-15 12:28:31.429',NULL,'/services/deleteServicesByIds','批量删除services table','services','DELETE'),(133,'2022-03-15 12:28:31.430','2022-03-15 12:28:31.430',NULL,'/services/updateServices','更新services table','services','PUT'),(134,'2022-03-15 12:28:31.431','2022-03-15 12:28:31.431',NULL,'/services/findServices','根据ID获取services table','services','GET'),(135,'2022-03-15 12:28:31.432','2022-03-15 12:28:31.432',NULL,'/services/getServicesList','获取services table列表','services','GET'),(136,'2022-03-16 09:38:02.037','2022-03-16 09:38:02.037','2022-03-16 09:38:44.488','/userLogin/createUserLogin','新增userLogin table','userLogin','POST'),(137,'2022-03-16 09:38:02.038','2022-03-16 09:38:02.038','2022-03-16 09:38:44.488','/userLogin/deleteUserLogin','删除userLogin table','userLogin','DELETE'),(138,'2022-03-16 09:38:02.040','2022-03-16 09:38:02.040','2022-03-16 09:38:44.488','/userLogin/deleteUserLoginByIds','批量删除userLogin table','userLogin','DELETE'),(139,'2022-03-16 09:38:02.041','2022-03-16 09:38:02.041','2022-03-16 09:38:44.488','/userLogin/updateUserLogin','更新userLogin table','userLogin','PUT'),(140,'2022-03-16 09:38:02.042','2022-03-16 09:38:02.042','2022-03-16 09:38:44.488','/userLogin/findUserLogin','根据ID获取userLogin table','userLogin','GET'),(141,'2022-03-16 09:38:02.043','2022-03-16 09:38:02.043','2022-03-16 09:38:44.488','/userLogin/getUserLoginList','获取userLogin table列表','userLogin','GET'),(142,'2022-03-16 09:39:49.131','2022-03-16 09:39:49.131','2022-03-16 09:40:39.570','/userLogin/createUserLogin','新增userLogin table','userLogin','POST'),(143,'2022-03-16 09:39:49.132','2022-03-16 09:39:49.132','2022-03-16 09:40:39.570','/userLogin/deleteUserLogin','删除userLogin table','userLogin','DELETE'),(144,'2022-03-16 09:39:49.133','2022-03-16 09:39:49.133','2022-03-16 09:40:39.570','/userLogin/deleteUserLoginByIds','批量删除userLogin table','userLogin','DELETE'),(145,'2022-03-16 09:39:49.256','2022-03-16 09:39:49.256','2022-03-16 09:40:39.570','/userLogin/updateUserLogin','更新userLogin table','userLogin','PUT'),(146,'2022-03-16 09:39:49.259','2022-03-16 09:39:49.259','2022-03-16 09:40:39.570','/userLogin/findUserLogin','根据ID获取userLogin table','userLogin','GET'),(147,'2022-03-16 09:39:49.262','2022-03-16 09:39:49.262','2022-03-16 09:40:39.570','/userLogin/getUserLoginList','获取userLogin table列表','userLogin','GET'),(148,'2022-03-16 09:42:18.850','2022-03-16 09:42:18.850',NULL,'/merchant/createMerchant','新增merchant table','merchant','POST'),(149,'2022-03-16 09:42:18.851','2022-03-16 09:42:18.851',NULL,'/merchant/deleteMerchant','删除merchant table','merchant','DELETE'),(150,'2022-03-16 09:42:18.851','2022-03-16 09:42:18.851',NULL,'/merchant/deleteMerchantByIds','批量删除merchant table','merchant','DELETE'),(151,'2022-03-16 09:42:18.852','2022-03-16 09:42:18.852',NULL,'/merchant/updateMerchant','更新merchant table','merchant','PUT'),(152,'2022-03-16 09:42:18.854','2022-03-16 09:42:18.854',NULL,'/merchant/findMerchant','根据ID获取merchant table','merchant','GET'),(153,'2022-03-16 09:42:18.855','2022-03-16 09:42:18.855',NULL,'/merchant/getMerchantList','获取merchant table列表','merchant','GET'),(154,'2022-03-16 10:24:37.998','2022-03-16 10:24:37.998',NULL,'/packages/createPackages','新增packages table','packages','POST'),(155,'2022-03-16 10:24:37.999','2022-03-16 10:24:37.999',NULL,'/packages/deletePackages','删除packages table','packages','DELETE'),(156,'2022-03-16 10:24:38.000','2022-03-16 10:24:38.000',NULL,'/packages/deletePackagesByIds','批量删除packages table','packages','DELETE'),(157,'2022-03-16 10:24:38.001','2022-03-16 10:24:38.001',NULL,'/packages/updatePackages','更新packages table','packages','PUT'),(158,'2022-03-16 10:24:38.003','2022-03-16 10:24:38.003',NULL,'/packages/findPackages','根据ID获取packages table','packages','GET'),(159,'2022-03-16 10:24:38.005','2022-03-16 10:24:38.005',NULL,'/packages/getPackagesList','获取packages table列表','packages','GET'),(160,'2022-06-19 11:06:18.996','2022-06-19 11:06:18.996',NULL,'/servicefields/CreateServiceFields','to add servicefield ','servicefields','POST');
/*!40000 ALTER TABLE `sys_apis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authorities`
--

DROP TABLE IF EXISTS `sys_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authorities` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `authority_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名',
  `parent_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父角色ID',
  `default_router` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'dashboard' COMMENT '默认菜单',
  PRIMARY KEY (`authority_id`),
  UNIQUE KEY `authority_id` (`authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authorities`
--

LOCK TABLES `sys_authorities` WRITE;
/*!40000 ALTER TABLE `sys_authorities` DISABLE KEYS */;
INSERT INTO `sys_authorities` VALUES ('2022-05-10 10:17:59.507','2022-06-16 15:08:29.377',NULL,'123','operation','0','state'),('2022-03-15 10:33:34.507','2022-06-16 15:09:25.800',NULL,'888','Normal Users','0','dashboard'),('2022-03-15 10:33:34.507','2022-03-15 10:33:34.507',NULL,'8881','Normal User Sub-Role','888','dashboard'),('2022-03-15 10:33:34.507','2022-03-15 10:33:34.507',NULL,'9528','Test Role','0','dashboard');
/*!40000 ALTER TABLE `sys_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authority_btns`
--

DROP TABLE IF EXISTS `sys_authority_btns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authority_btns` (
  `authority_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色ID',
  `sys_menu_id` bigint unsigned DEFAULT NULL COMMENT '菜单ID',
  `sys_base_menu_btn_id` bigint unsigned DEFAULT NULL COMMENT '菜单按钮ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authority_btns`
--

LOCK TABLES `sys_authority_btns` WRITE;
/*!40000 ALTER TABLE `sys_authority_btns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_authority_btns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authority_menus`
--

DROP TABLE IF EXISTS `sys_authority_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authority_menus` (
  `sys_base_menu_id` bigint unsigned NOT NULL,
  `sys_authority_authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_base_menu_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authority_menus`
--

LOCK TABLES `sys_authority_menus` WRITE;
/*!40000 ALTER TABLE `sys_authority_menus` DISABLE KEYS */;
INSERT INTO `sys_authority_menus` VALUES (1,'123'),(1,'888'),(1,'8881'),(1,'9528'),(2,'123'),(2,'888'),(2,'8881'),(2,'9528'),(3,'123'),(3,'888'),(3,'9528'),(4,'888'),(4,'9528'),(5,'888'),(5,'9528'),(6,'888'),(6,'9528'),(7,'888'),(7,'9528'),(8,'123'),(8,'888'),(8,'8881'),(8,'9528'),(14,'888'),(14,'9528'),(17,'888'),(17,'9528'),(18,'888'),(19,'888'),(20,'123'),(20,'888'),(22,'123'),(22,'888'),(23,'123'),(23,'888'),(25,'888'),(27,'123'),(27,'888'),(28,'123'),(28,'888'),(29,'123'),(29,'888'),(30,'123'),(30,'888'),(31,'123'),(31,'888'),(32,'123'),(32,'888'),(33,'123'),(33,'888'),(34,'123'),(34,'888'),(35,'123'),(35,'888'),(36,'123'),(36,'888');
/*!40000 ALTER TABLE `sys_authority_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auto_code_histories`
--

DROP TABLE IF EXISTS `sys_auto_code_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_auto_code_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `request_meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `auto_code_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `injection_meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `struct_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `struct_cn_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `api_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `flag` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_auto_code_histories_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auto_code_histories`
--

LOCK TABLES `sys_auto_code_histories` WRITE;
/*!40000 ALTER TABLE `sys_auto_code_histories` DISABLE KEYS */;
INSERT INTO `sys_auto_code_histories` VALUES (1,'2022-03-15 10:45:57.820','2022-03-15 10:45:57.820',NULL,'gateways','{\"structName\":\"Gateways\",\"tableName\":\"gateways\",\"packageName\":\"gateways\",\"humpPackageName\":\"gateways\",\"abbreviation\":\"gateways\",\"description\":\"gateways table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"DomainNameService\",\"fieldDesc\":\"domainNameService field\",\"fieldType\":\"string\",\"fieldJson\":\"domainNameService\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"domain_name_service\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"NameAr\",\"fieldDesc\":\"nameAr field\",\"fieldType\":\"string\",\"fieldJson\":\"nameAr\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_ar\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"NameEn\",\"fieldDesc\":\"nameEn field\",\"fieldType\":\"string\",\"fieldJson\":\"nameEn\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_en\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/gateways.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/gateways.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/gateways.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/gateways.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/gateways.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/gateways.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/gateways/gatewaysForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/gateways/gateways.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.Gateways{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitGatewaysRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@GatewaysApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@GatewaysRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@GatewaysService;','Gateways','gateways table','88;89;90;91;92;93;',0),(2,'2022-03-15 10:48:34.791','2022-03-15 10:48:34.791',NULL,'categories','{\"structName\":\"Categories\",\"tableName\":\"categories\",\"packageName\":\"categories\",\"humpPackageName\":\"categories\",\"abbreviation\":\"categories\",\"description\":\"categories table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"NameAr\",\"fieldDesc\":\"nameAr field\",\"fieldType\":\"string\",\"fieldJson\":\"nameAr\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_ar\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"NameEn\",\"fieldDesc\":\"nameEn field\",\"fieldType\":\"string\",\"fieldJson\":\"nameEn\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_en\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/categories.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/categories.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/categories.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/categories.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/categories.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/categories.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/categories/categoriesForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/categories/categories.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.Categories{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitCategoriesRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@CategoriesApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@CategoriesRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@CategoriesService;','Categories','categories table','94;95;96;97;98;99;',0),(3,'2022-03-15 11:11:05.725','2022-03-15 11:11:05.725',NULL,'providers','{\"structName\":\"Providers\",\"tableName\":\"providers\",\"packageName\":\"providers\",\"humpPackageName\":\"providers\",\"abbreviation\":\"providers\",\"description\":\"providers table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"NameAr\",\"fieldDesc\":\"nameAr field\",\"fieldType\":\"string\",\"fieldJson\":\"nameAr\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_ar\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"NameEn\",\"fieldDesc\":\"nameEn field\",\"fieldType\":\"string\",\"fieldJson\":\"nameEn\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_en\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/providers.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/providers.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/providers.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/providers.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/providers.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/providers.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/providers/providersForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/providers/providers.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.Providers{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitProvidersRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@ProvidersApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@ProvidersRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@ProvidersService;','Providers','providers table','100;101;102;103;104;105;',0),(4,'2022-03-15 11:14:42.494','2022-03-15 11:14:42.494',NULL,'versions','{\"structName\":\"Versions\",\"tableName\":\"versions\",\"packageName\":\"versions\",\"humpPackageName\":\"versions\",\"abbreviation\":\"frontends\",\"description\":\"versions table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"ServiceListVersion\",\"fieldDesc\":\"serviceListVersion field\",\"fieldType\":\"string\",\"fieldJson\":\"serviceListVersion\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"service_list_version\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"SoftwareVersion\",\"fieldDesc\":\"softwareVersion field\",\"fieldType\":\"string\",\"fieldJson\":\"softwareVersion\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"software_version\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/versions.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/versions.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/versions.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/versions.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/versions.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/versions.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/versions/versionsForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/versions/versions.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.Versions{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitVersionsRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@VersionsApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@VersionsRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@VersionsService;','Versions','versions table','112;113;114;115;116;117;',0),(5,'2022-03-15 12:01:15.892','2022-03-15 12:01:15.892',NULL,'terminals','{\"structName\":\"Terminals\",\"tableName\":\"terminals\",\"packageName\":\"terminals\",\"humpPackageName\":\"terminals\",\"abbreviation\":\"terminals\",\"description\":\"terminals table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"Sn\",\"fieldDesc\":\"sn field\",\"fieldType\":\"string\",\"fieldJson\":\"sn\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"sn\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Imei\",\"fieldDesc\":\"imei field\",\"fieldType\":\"string\",\"fieldJson\":\"imei\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"imei\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"VersionId\",\"fieldDesc\":\"versionId field\",\"fieldType\":\"int\",\"fieldJson\":\"versionId\",\"dataTypeLong\":\"10\",\"comment\":\"\",\"columnName\":\"version_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"MerchantId\",\"fieldDesc\":\"merchantId field\",\"fieldType\":\"int\",\"fieldJson\":\"merchantId\",\"dataTypeLong\":\"10\",\"comment\":\"\",\"columnName\":\"merchant_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Model\",\"fieldDesc\":\"model\",\"fieldType\":\"string\",\"fieldJson\":\"model\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"model\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/terminals.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/terminals.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/terminals.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/terminals.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/terminals.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/terminals.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/terminals/terminalsForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/terminals/terminals.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.Terminals{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitTerminalsRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@TerminalsApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@TerminalsRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@TerminalsService;','Terminals','terminals table','118;119;120;121;122;123;',0),(6,'2022-03-15 12:14:27.356','2022-03-15 12:14:27.356',NULL,'fields','{\"structName\":\"Fields\",\"tableName\":\"fields\",\"packageName\":\"fields\",\"humpPackageName\":\"fields\",\"abbreviation\":\"fields\",\"description\":\"fields table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"DoubleCheck\",\"fieldDesc\":\"doubleCheck field\",\"fieldType\":\"string\",\"fieldJson\":\"doubleCheck\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"double_check\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Max\",\"fieldDesc\":\"max field\",\"fieldType\":\"int\",\"fieldJson\":\"max\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"max\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Min\",\"fieldDesc\":\"min field\",\"fieldType\":\"int\",\"fieldJson\":\"min\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"min\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"NameAr\",\"fieldDesc\":\"nameAr field\",\"fieldType\":\"string\",\"fieldJson\":\"nameAr\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_ar\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"NameEn\",\"fieldDesc\":\"nameEn field\",\"fieldType\":\"string\",\"fieldJson\":\"nameEn\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_en\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Regex\",\"fieldDesc\":\"regex field\",\"fieldType\":\"string\",\"fieldJson\":\"regex\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"regex\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Required\",\"fieldDesc\":\"required field\",\"fieldType\":\"bool\",\"fieldJson\":\"required\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"required\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"TypeId\",\"fieldDesc\":\"typeId field\",\"fieldType\":\"int\",\"fieldJson\":\"typeId\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"type_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/fields.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/fields.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/fields.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/fields.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/fields.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/fields.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/fields/fieldsForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/fields/fields.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.Fields{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitFieldsRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@FieldsApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@FieldsRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@FieldsService;','Fields','fields table','124;125;126;127;128;129;',0),(7,'2022-03-15 12:28:31.520','2022-03-15 12:28:31.520',NULL,'services','{\"structName\":\"Services\",\"tableName\":\"services\",\"packageName\":\"services\",\"humpPackageName\":\"services\",\"abbreviation\":\"services\",\"description\":\"services table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"CatId\",\"fieldDesc\":\"catId field\",\"fieldType\":\"int\",\"fieldJson\":\"catId\",\"dataTypeLong\":\"19\",\"comment\":\"\",\"columnName\":\"cat_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"ProvId\",\"fieldDesc\":\"provId field\",\"fieldType\":\"int\",\"fieldJson\":\"provId\",\"dataTypeLong\":\"19\",\"comment\":\"\",\"columnName\":\"prov_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"NameAr\",\"fieldDesc\":\"nameAr field\",\"fieldType\":\"string\",\"fieldJson\":\"nameAr\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_ar\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"NameEn\",\"fieldDesc\":\"nameEn field\",\"fieldType\":\"string\",\"fieldJson\":\"nameEn\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_en\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"IsPrice\",\"fieldDesc\":\"isPrice field\",\"fieldType\":\"int\",\"fieldJson\":\"isPrice\",\"dataTypeLong\":\"10\",\"comment\":\"\",\"columnName\":\"is_price\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Price\",\"fieldDesc\":\"price field\",\"fieldType\":\"float64\",\"fieldJson\":\"price\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"price\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Inq\",\"fieldDesc\":\"inq field\",\"fieldType\":\"int\",\"fieldJson\":\"inq\",\"dataTypeLong\":\"10\",\"comment\":\"\",\"columnName\":\"inq\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Count\",\"fieldDesc\":\"count field\",\"fieldType\":\"int\",\"fieldJson\":\"count\",\"dataTypeLong\":\"19\",\"comment\":\"\",\"columnName\":\"count\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"IsPar\",\"fieldDesc\":\"isPar field\",\"fieldType\":\"int\",\"fieldJson\":\"isPar\",\"dataTypeLong\":\"19\",\"comment\":\"\",\"columnName\":\"is_par\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"DefaultGatewayDn\",\"fieldDesc\":\"defaultGatewayDn field\",\"fieldType\":\"string\",\"fieldJson\":\"defaultGatewayDn\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"default_gateway_dn\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/services.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/services.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/services.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/services.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/services.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/services.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/services/servicesForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/services/services.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.Services{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitServicesRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@ServicesApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@ServicesRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@ServicesService;','Services','services table','130;131;132;133;134;135;',0),(8,'2022-03-16 09:38:02.231','2022-03-16 09:38:44.670','2022-03-16 09:39:01.673','user_login','{\"structName\":\"UserLogin\",\"tableName\":\"user_login\",\"packageName\":\"userLogin\",\"humpPackageName\":\"user_login\",\"abbreviation\":\"userLogin\",\"description\":\"userLogin table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"UserId\",\"fieldDesc\":\"userId field\",\"fieldType\":\"string\",\"fieldJson\":\"userId\",\"dataTypeLong\":\"45\",\"comment\":\"\",\"columnName\":\"user_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Password\",\"fieldDesc\":\"password field\",\"fieldType\":\"string\",\"fieldJson\":\"password\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"password\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Status\",\"fieldDesc\":\"status field\",\"fieldType\":\"int\",\"fieldJson\":\"status\",\"dataTypeLong\":\"10\",\"comment\":\"\",\"columnName\":\"status\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"LastLogin\",\"fieldDesc\":\"lastLogin field\",\"fieldType\":\"time.Time\",\"fieldJson\":\"lastLogin\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"last_login\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/userLogin.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/userLogin/userLoginForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/userLogin/userLogin.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.UserLogin{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitUserLoginRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@UserLoginApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@UserLoginRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@UserLoginService;','UserLogin','userLogin table','136;137;138;139;140;141;',1),(9,'2022-03-16 09:39:50.339','2022-03-16 09:40:39.719','2022-03-16 09:40:51.281','user_logins','{\"structName\":\"UserLogin\",\"tableName\":\"user_logins\",\"packageName\":\"userLogin\",\"humpPackageName\":\"user_login\",\"abbreviation\":\"userLogin\",\"description\":\"userLogin table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"UserId\",\"fieldDesc\":\"userId field\",\"fieldType\":\"string\",\"fieldJson\":\"userId\",\"dataTypeLong\":\"45\",\"comment\":\"\",\"columnName\":\"user_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Password\",\"fieldDesc\":\"password field\",\"fieldType\":\"string\",\"fieldJson\":\"password\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"password\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Status\",\"fieldDesc\":\"status field\",\"fieldType\":\"int\",\"fieldJson\":\"status\",\"dataTypeLong\":\"10\",\"comment\":\"\",\"columnName\":\"status\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"LastLogin\",\"fieldDesc\":\"lastLogin field\",\"fieldType\":\"time.Time\",\"fieldJson\":\"lastLogin\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"last_login\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/user_login.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/userLogin.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/userLogin/userLoginForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/userLogin/userLogin.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.UserLogin{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitUserLoginRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@UserLoginApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@UserLoginRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@UserLoginService;','UserLogin','userLogin table','142;143;144;145;146;147;',1),(10,'2022-03-16 09:42:19.049','2022-03-16 09:42:19.049',NULL,'merchants','{\"structName\":\"Merchant\",\"tableName\":\"merchants\",\"packageName\":\"merchant\",\"humpPackageName\":\"merchant\",\"abbreviation\":\"merchant\",\"description\":\"merchant table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"UserId\",\"fieldDesc\":\"userId field\",\"fieldType\":\"string\",\"fieldJson\":\"userId\",\"dataTypeLong\":\"45\",\"comment\":\"\",\"columnName\":\"user_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Password\",\"fieldDesc\":\"password field\",\"fieldType\":\"string\",\"fieldJson\":\"password\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"password\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"Status\",\"fieldDesc\":\"status field\",\"fieldType\":\"int\",\"fieldJson\":\"status\",\"dataTypeLong\":\"10\",\"comment\":\"\",\"columnName\":\"status\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"LastLogin\",\"fieldDesc\":\"lastLogin field\",\"fieldType\":\"time.Time\",\"fieldJson\":\"lastLogin\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"last_login\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/merchant.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/merchant.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/merchant.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/merchant.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/merchant.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/merchant.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/merchant/merchantForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/merchant/merchant.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.Merchant{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitMerchantRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@MerchantApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@MerchantRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@MerchantService;','Merchant','merchant table','148;149;150;151;152;153;',0),(11,'2022-03-16 10:24:38.996','2022-03-16 10:24:38.996',NULL,'packages','{\"structName\":\"Packages\",\"tableName\":\"packages\",\"packageName\":\"packages\",\"humpPackageName\":\"packages\",\"abbreviation\":\"packages\",\"description\":\"packages table\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"NameAr\",\"fieldDesc\":\"nameAr field\",\"fieldType\":\"string\",\"fieldJson\":\"nameAr\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_ar\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"NameEn\",\"fieldDesc\":\"nameEn field\",\"fieldType\":\"string\",\"fieldJson\":\"nameEn\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"name_en\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"PckgCode\",\"fieldDesc\":\"pckgCode field\",\"fieldType\":\"string\",\"fieldJson\":\"pckgCode\",\"dataTypeLong\":\"255\",\"comment\":\"\",\"columnName\":\"pckg_code\",\"fieldSearchType\":\"\",\"dictType\":\"\"},{\"fieldName\":\"FieldId\",\"fieldDesc\":\"fieldId field\",\"fieldType\":\"int\",\"fieldJson\":\"fieldId\",\"dataTypeLong\":\"19\",\"comment\":\"\",\"columnName\":\"field_id\",\"fieldSearchType\":\"\",\"dictType\":\"\"}]}','/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/packages.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/packages.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/model/autocode/request/packages.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/packages.go;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/packages.go;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/api/packages.js;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/packages/packagesForm.vue;/home/mohamed/Documents/GitHub/gin-vue-admin/web/src/view/packages/packages.vue;','/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/gorm.go@MysqlTables@autocode.Packages{},;/home/mohamed/Documents/GitHub/gin-vue-admin/server/initialize/router.go@Routers@autocodeRouter.InitPackagesRouter(PrivateGroup);/home/mohamed/Documents/GitHub/gin-vue-admin/server/api/v1/autocode/enter.go@ApiGroup@PackagesApi;/home/mohamed/Documents/GitHub/gin-vue-admin/server/router/autocode/enter.go@RouterGroup@PackagesRouter;/home/mohamed/Documents/GitHub/gin-vue-admin/server/service/autocode/enter.go@ServiceGroup@PackagesService;','Packages','packages table','154;155;156;157;158;159;',0);
/*!40000 ALTER TABLE `sys_auto_code_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menu_btns`
--

DROP TABLE IF EXISTS `sys_base_menu_btns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menu_btns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '按钮关键key',
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sys_base_menu_id` bigint unsigned DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_btns_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menu_btns`
--

LOCK TABLES `sys_base_menu_btns` WRITE;
/*!40000 ALTER TABLE `sys_base_menu_btns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_base_menu_btns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menu_parameters`
--

DROP TABLE IF EXISTS `sys_base_menu_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menu_parameters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `sys_base_menu_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的key',
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的值',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_parameters_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menu_parameters`
--

LOCK TABLES `sys_base_menu_parameters` WRITE;
/*!40000 ALTER TABLE `sys_base_menu_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_base_menu_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menus`
--

DROP TABLE IF EXISTS `sys_base_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `menu_level` bigint unsigned DEFAULT NULL,
  `parent_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由path',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由name',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否在列表隐藏',
  `component` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对应前端文件路径',
  `sort` bigint DEFAULT NULL COMMENT '排序标记',
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `default_menu` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `title` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附加属性',
  `icon` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附加属性',
  `close_tab` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menus_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menus`
--

LOCK TABLES `sys_base_menus` WRITE;
/*!40000 ALTER TABLE `sys_base_menus` DISABLE KEYS */;
INSERT INTO `sys_base_menus` VALUES (1,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'0','dashboard','dashboard',0,'view/dashboard/index.vue',1,0,0,'Dashboard','odometer',0),(2,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'0','about','about',0,'view/about/index.vue',7,0,0,'About','info-filled',0),(3,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'0','admin','superAdmin',0,'view/superAdmin/index.vue',3,0,0,'Administration Tools','user',0),(4,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'3','authority','authority',0,'view/superAdmin/authority/authority.vue',1,0,0,'Role Management','avatar',0),(5,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'3','menu','menu',0,'view/superAdmin/menu/menu.vue',2,1,0,'Menu Management','tickets',0),(6,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'3','api','api',0,'view/superAdmin/api/api.vue',3,1,0,'API Management','platform',0),(7,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'3','user','user',0,'view/superAdmin/user/user.vue',4,0,0,'User Management','coordinate',0),(8,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'0','person','person',1,'view/person/person.vue',4,0,0,'Personal Information','message',0),(9,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114','2022-03-21 09:59:15.035',0,'0','example','example',0,'view/example/index.vue',6,0,0,'Examples','management',0),(10,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114','2022-03-20 14:24:59.338',0,'9','excel','excel',0,'view/example/excel/excel.vue',4,0,0,'Excel Import And Export','takeaway-box',0),(11,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114','2022-03-20 14:25:05.840',0,'9','upload','upload',0,'view/example/upload/upload.vue',5,0,0,'Media Library (Upload and Download)','upload',0),(12,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114','2022-03-20 14:25:15.878',0,'9','breakpoint','breakpoint',0,'view/example/breakpoint/breakpoint.vue',6,0,0,'HTTP','upload-filled',0),(13,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114','2022-03-20 14:25:30.116',0,'9','customer','customer',0,'view/example/customer/customer.vue',7,0,0,'Customer List (Resource Example)','avatar',0),(14,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'0','systemTools','systemTools',0,'view/systemTools/index.vue',5,0,0,'System Tools','tools',0),(15,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114','2022-03-21 11:14:01.968',0,'14','autoCode','autoCode',0,'view/systemTools/autoCode/index.vue',1,1,0,'Code Generator','cpu',0),(16,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114','2022-03-21 11:57:09.996',0,'14','formCreate','formCreate',0,'view/systemTools/formCreate/index.vue',2,1,0,'Form Builder','magic-stick',0),(17,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'14','system','system',0,'view/systemTools/system/system.vue',3,0,0,'System Configuration','operation',0),(18,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'3','dictionary','dictionary',0,'view/superAdmin/dictionary/sysDictionary.vue',5,0,0,'Dictionary Management','notebook',0),(19,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'3','dictionaryDetail/:id','dictionaryDetail',1,'view/superAdmin/dictionary/sysDictionaryDetail.vue',1,0,0,'Dictionary Details','order',0),(20,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'3','operation','operation',0,'view/superAdmin/operation/sysOperationRecord.vue',6,0,0,'Audit Log','pie-chart',0),(21,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114','2022-03-20 14:25:22.741',0,'9','simpleUploader','simpleUploader',0,'view/example/simpleUploader/simpleUploader',6,0,0,'Resumable upload (plug-in version)','upload',0),(22,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'0','https://wakty.com/','https://wakty.com/',0,'/',0,0,0,'Official Website','home-filled',0),(23,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'0','state','state',0,'view/system/state.vue',6,0,0,'Server Status','cloudy',0),(24,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114','2022-03-21 11:13:57.725',0,'14','autoCodeAdmin','autoCodeAdmin',0,'view/systemTools/autoCodeAdmin/index.vue',1,0,0,'Automated Code Management','magic-stick',0),(25,'2022-03-15 10:33:34.114','2022-03-15 10:33:34.114',NULL,0,'14','autoCodeEdit/:id','autoCodeEdit',1,'view/systemTools/autoCode/index.vue',0,0,0,'Automate code (reuse)','magic-stick',0),(27,'2022-03-15 10:55:13.126','2022-03-20 14:12:24.260',NULL,0,'0','gateways','gateways',0,'view/gateways/gateways.vue',13,0,0,'gateways','collection',0),(28,'2022-03-15 10:56:53.084','2022-03-20 14:15:19.202',NULL,0,'0','categories','categories',0,'view/categories/categories.vue',11,0,0,'categories','collection',0),(29,'2022-03-15 11:17:22.297','2022-03-20 14:15:33.041',NULL,0,'0','providers','providers',0,'view/providers/providers.vue',12,0,0,'providers','aim',0),(30,'2022-03-15 11:20:31.514','2022-03-20 14:13:14.262',NULL,0,'0','versions','versions',0,'view/versions/versions.vue',14,0,0,'versions','aim',0),(31,'2022-03-15 12:02:31.997','2022-03-20 14:13:36.432',NULL,0,'0','terminals','terminals',0,'view/terminals/terminals.vue',15,0,0,'terminal','aim',0),(32,'2022-03-15 12:17:12.869','2022-03-20 14:13:58.142',NULL,0,'0','fields','fields',0,'view/fields/fields.vue',16,0,0,'fields','aim',0),(33,'2022-03-15 12:29:33.631','2022-03-20 14:14:18.670',NULL,0,'0','services','services',0,'view/services/services.vue',17,0,0,'services','aim',0),(34,'2022-03-16 09:45:10.535','2022-03-20 14:12:52.137',NULL,0,'0','merchants','merchants',0,'view/merchant/merchant.vue',19,0,0,'merchants','user',0),(35,'2022-03-16 10:26:48.151','2022-03-20 14:10:32.780',NULL,0,'0','packages','packages',0,'view/packages/packages.vue',20,0,0,'packages','aim',0),(36,'2022-06-16 15:05:07.768','2022-06-16 15:05:55.706',NULL,0,'0','serviceField','serviceField',0,'view/servicefields/servicefields.vue',1000,0,0,'serviceField','aim',0);
/*!40000 ALTER TABLE `sys_base_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_authority_id`
--

DROP TABLE IF EXISTS `sys_data_authority_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_data_authority_id` (
  `sys_authority_authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `data_authority_id_authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_authority_authority_id`,`data_authority_id_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_authority_id`
--

LOCK TABLES `sys_data_authority_id` WRITE;
/*!40000 ALTER TABLE `sys_data_authority_id` DISABLE KEYS */;
INSERT INTO `sys_data_authority_id` VALUES ('123','123'),('888','888'),('888','8881'),('888','9528'),('9528','8881'),('9528','9528');
/*!40000 ALTER TABLE `sys_data_authority_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionaries`
--

DROP TABLE IF EXISTS `sys_dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dictionaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（中）',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（英）',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionaries_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionaries`
--

LOCK TABLES `sys_dictionaries` WRITE;
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;
INSERT INTO `sys_dictionaries` VALUES (1,'2022-03-15 10:33:34.703','2022-03-15 10:33:34.703',NULL,'Gender Type','gender',1,'Gender dictionary'),(2,'2022-03-15 10:33:34.703','2022-03-15 10:33:34.703',NULL,'Integer Type','int',1,'The database type corresponding to the int type'),(3,'2022-03-15 10:33:34.703','2022-03-15 10:33:34.703',NULL,'Time-Date Type','time.Time',1,'Database Time-Date Type'),(4,'2022-03-15 10:33:34.703','2022-03-15 10:33:34.703',NULL,'Float Type','float64',1,'Float Type'),(5,'2022-03-15 10:33:34.703','2022-03-15 10:33:34.703',NULL,'String Type','string',1,'String Type'),(6,'2022-03-15 10:33:34.703','2022-03-15 10:33:34.703',NULL,'Boolean Type','bool',1,'Boolean Type');
/*!40000 ALTER TABLE `sys_dictionaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionary_details`
--

DROP TABLE IF EXISTS `sys_dictionary_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dictionary_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '展示值',
  `value` bigint DEFAULT NULL COMMENT '字典值',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `sort` bigint DEFAULT NULL COMMENT '排序标记',
  `sys_dictionary_id` bigint unsigned DEFAULT NULL COMMENT '关联标记',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionary_details_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionary_details`
--

LOCK TABLES `sys_dictionary_details` WRITE;
/*!40000 ALTER TABLE `sys_dictionary_details` DISABLE KEYS */;
INSERT INTO `sys_dictionary_details` VALUES (1,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'Male',1,1,1,1),(2,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'Female',2,1,2,1),(3,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'smallint',1,1,1,2),(4,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'mediumint',2,1,2,2),(5,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'int',3,1,3,2),(6,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'bigint',4,1,4,2),(7,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'date',0,1,0,3),(8,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'time',1,1,1,3),(9,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'year',2,1,2,3),(10,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'datetime',3,1,3,3),(11,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'timestamp',5,1,5,3),(12,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'float',0,1,0,4),(13,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'double',1,1,1,4),(14,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'decimal',2,1,2,4),(15,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'char',0,1,0,5),(16,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'varchar',1,1,1,5),(17,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'tinyblob',2,1,2,5),(18,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'tinytext',3,1,3,5),(19,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'text',4,1,4,5),(20,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'blob',5,1,5,5),(21,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'mediumblob',6,1,6,5),(22,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'mediumtext',7,1,7,5),(23,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'longblob',8,1,8,5),(24,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'longtext',9,1,9,5),(25,'2022-03-15 10:33:36.680','2022-03-15 10:33:36.680',NULL,'tinyint',0,1,0,6);
/*!40000 ALTER TABLE `sys_dictionary_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_operation_records`
--

DROP TABLE IF EXISTS `sys_operation_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_operation_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
  `status` bigint DEFAULT NULL COMMENT '请求状态',
  `latency` bigint DEFAULT NULL COMMENT '延迟',
  `agent` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '代理',
  `error_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '错误信息',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求Body',
  `resp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '响应Body',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `idx_sys_operation_records_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operation_records`
--

LOCK TABLES `sys_operation_records` WRITE;
/*!40000 ALTER TABLE `sys_operation_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_operation_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_authority`
--

DROP TABLE IF EXISTS `sys_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_authority` (
  `sys_user_id` bigint unsigned NOT NULL,
  `sys_authority_authority_id` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_user_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_authority`
--

LOCK TABLES `sys_user_authority` WRITE;
/*!40000 ALTER TABLE `sys_user_authority` DISABLE KEYS */;
INSERT INTO `sys_user_authority` VALUES (1,'888'),(1,'8881'),(1,'9528'),(2,'888'),(4,'123');
/*!40000 ALTER TABLE `sys_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_users`
--

DROP TABLE IF EXISTS `sys_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户UUID',
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录密码',
  `nick_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '系统用户' COMMENT '用户昵称',
  `side_mode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'dark' COMMENT '用户侧边主题',
  `header_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '用户头像',
  `base_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#fff' COMMENT '基础颜色',
  `active_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#1890ff' COMMENT '活跃颜色',
  `authority_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '888' COMMENT '用户角色ID',
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`id`),
  KEY `idx_sys_users_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users`
--

LOCK TABLES `sys_users` WRITE;
/*!40000 ALTER TABLE `sys_users` DISABLE KEYS */;
INSERT INTO `sys_users` VALUES (1,'2022-03-15 10:33:33.767','2022-05-09 13:09:55.661',NULL,'ddfd159c-55d4-4ce5-ac12-5778b2b0db63','admin','e10adc3949ba59abbe56e057f20f883e','Super administrator','dark','https://qmplusimg.henrongyi.top/gva_header.jpg','#fff','#1890ff','888','17611111111','333333333@qq.com'),(2,'2022-03-15 10:33:33.767','2022-03-15 10:33:33.767',NULL,'a88f6a25-1644-4394-b690-f65b84336924','a303176530','3ec063004a6f31642261936a379fde3d','QMPlusUser','dark','https:///qmplusimg.henrongyi.top/1572075907logo.png','#fff','#1890ff','9528','17611111111','333333333@qq.com'),(3,'2022-05-09 13:12:47.367','2022-05-09 13:12:47.367','2022-05-09 13:13:21.027','28bef721-2771-417a-837a-e7e66ea1ced4','Operation','5f4dcc3b5aa765d61d8327deb882cf99','Operation','dark','https://qmplusimg.henrongyi.top/gva_header.jpg','#fff','#1890ff','888','',''),(4,'2022-05-09 13:13:52.613','2022-05-10 10:37:41.402',NULL,'274dd533-362a-4e81-a159-ff61f457d121','operation','5f4dcc3b5aa765d61d8327deb882cf99','Operation','dark','https://qmplusimg.henrongyi.top/gva_header.jpg','#fff','#1890ff','123','','');
/*!40000 ALTER TABLE `sys_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminals`
--

DROP TABLE IF EXISTS `terminals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imei` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `version_id` smallint DEFAULT NULL,
  `merchant_id` smallint DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_terminals_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminals`
--

LOCK TABLES `terminals` WRITE;
/*!40000 ALTER TABLE `terminals` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `service_list_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_versions_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (2,'2022-05-26 07:31:42.173','2022-05-26 07:31:42.173',NULL,'6647','10-20-30');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `authority_menu`
--

/*!50001 DROP VIEW IF EXISTS `authority_menu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wakty`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `authority_menu` AS select `sys_base_menus`.`id` AS `id`,`sys_base_menus`.`path` AS `path`,`sys_base_menus`.`icon` AS `icon`,`sys_base_menus`.`name` AS `name`,`sys_base_menus`.`sort` AS `sort`,`sys_base_menus`.`title` AS `title`,`sys_base_menus`.`hidden` AS `hidden`,`sys_base_menus`.`component` AS `component`,`sys_base_menus`.`parent_id` AS `parent_id`,`sys_base_menus`.`created_at` AS `created_at`,`sys_base_menus`.`updated_at` AS `updated_at`,`sys_base_menus`.`deleted_at` AS `deleted_at`,`sys_base_menus`.`keep_alive` AS `keep_alive`,`sys_base_menus`.`menu_level` AS `menu_level`,`sys_base_menus`.`default_menu` AS `default_menu`,`sys_base_menus`.`close_tab` AS `close_tab`,`sys_authority_menus`.`sys_base_menu_id` AS `menu_id`,`sys_authority_menus`.`sys_authority_authority_id` AS `authority_id` from (`sys_authority_menus` join `sys_base_menus` on((`sys_authority_menus`.`sys_base_menu_id` = `sys_base_menus`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-21 14:35:43