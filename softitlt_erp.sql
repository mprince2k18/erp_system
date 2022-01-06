-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2021 at 04:45 PM
-- Server version: 10.3.32-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `softitlt_erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_categories`
--

CREATE TABLE `account_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_categories`
--

INSERT INTO `account_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Account for Cash', NULL, NULL),
(2, 'Account for Bank', NULL, NULL),
(3, 'Account for receivable', NULL, NULL),
(4, 'Account for Payable', NULL, NULL),
(5, 'Account for Equity/Capital', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_configuration_category`
--

CREATE TABLE `account_configuration_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_category_id` int(10) UNSIGNED NOT NULL,
  `chart_account_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apply_leaves`
--

CREATE TABLE `apply_leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `leave_type_id` bigint(20) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `day` tinyint(1) NOT NULL,
  `makeup_leave` tinyint(1) NOT NULL DEFAULT 0,
  `makeup_date` date DEFAULT NULL,
  `makeup_half` tinyint(1) NOT NULL DEFAULT 0,
  `leave_from` tinyint(1) NOT NULL DEFAULT 0,
  `leave_to` tinyint(1) NOT NULL DEFAULT 0,
  `total_days` double NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apply_loans`
--

CREATE TABLE `apply_loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_date` date DEFAULT NULL,
  `loan_date` date DEFAULT NULL,
  `amount` double(12,2) NOT NULL DEFAULT 0.00,
  `paid_loan_amount` double(12,2) NOT NULL DEFAULT 0.00,
  `total_month` int(11) DEFAULT NULL,
  `monthly_installment` double(12,2) NOT NULL DEFAULT 0.00,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval` tinyint(4) NOT NULL DEFAULT 0,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attendance` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'P',
  `date` date DEFAULT NULL,
  `day` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chart_account_id` bigint(20) UNSIGNED NOT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'samsung', NULL, 1, 1, NULL, '2021-08-17 13:16:27', '2021-08-17 13:16:27'),
(2, 'china', NULL, 1, 1, NULL, '2021-11-30 23:28:55', '2021-11-30 23:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `category_type`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'email_verification', 0, '2021-08-16 06:58:34', NULL),
(2, NULL, 'mail_notification', 0, '2021-08-16 06:58:34', NULL),
(3, NULL, 'system_notification', 0, '2021-08-16 06:58:34', NULL),
(4, 'voucher', 'beginning_stock_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(5, 'voucher', 'sale_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(6, 'voucher', 'sale_return_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(7, 'voucher', 'pos_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(8, 'voucher', 'purchase_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(9, 'voucher', 'purchase_return_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(10, 'voucher', 'commision_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(11, 'voucher', 'packing_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(12, 'voucher', 'retailer_add_balance_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(13, 'voucher', 'retailer_substraction_balance_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(14, 'voucher', 'add_balance_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(15, 'voucher', 'substraction_balance_voucher_approval', 0, '2021-08-16 06:58:34', NULL),
(16, 'voucher', 'voucher_payment_approval', 1, '2021-08-16 06:58:34', NULL),
(17, 'voucher', 'voucher_recieve_approval', 1, '2021-08-16 06:58:34', NULL),
(18, 'voucher', 'journal_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(19, 'voucher', 'contra_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(20, 'voucher', 'payroll_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(21, 'voucher', 'loan_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(22, 'voucher', 'expense_voucher_approval', 1, '2021-08-16 06:58:34', NULL),
(23, 'sale&purchase_type', 'sale_approval', 1, '2021-08-16 06:58:34', NULL),
(24, 'sale&purchase_type', 'sale_return_approval', 1, '2021-08-16 06:58:34', NULL),
(25, 'sale&purchase_type', 'purchase_approval', 1, '2021-08-16 06:58:34', NULL),
(26, 'sale&purchase_type', 'purchase_return_approval', 1, '2021-08-16 06:58:34', NULL),
(27, NULL, 'system_registration', 0, '2021-08-16 06:58:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `level` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `code`, `description`, `status`, `level`, `parent_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'electronics', '101', NULL, 1, 0, NULL, 1, NULL, '2021-08-17 13:17:00', '2021-08-17 13:17:00'),
(2, 'household', '201', NULL, 1, 1, 1, 1, NULL, '2021-08-17 13:17:33', '2021-08-17 13:17:33'),
(3, 'furniture', NULL, NULL, 1, 0, NULL, 1, NULL, '2021-11-30 23:43:50', '2021-11-30 23:43:50'),
(4, 'office furniture', NULL, NULL, 1, 1, 3, 1, NULL, '2021-11-30 23:44:24', '2021-11-30 23:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `chart_accounts`
--

CREATE TABLE `chart_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) DEFAULT NULL,
  `is_group` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration_group_id` tinyint(4) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `contactable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_accounts`
--

INSERT INTO `chart_accounts` (`id`, `code`, `level`, `is_group`, `name`, `type`, `configuration_group_id`, `description`, `parent_id`, `status`, `contactable_type`, `contactable_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '01-01', 1, 1, 'Group Cash Account', '1', NULL, 'Cash Account', NULL, 1, NULL, NULL, 2, 2, '2020-11-10 23:34:57', '2020-11-10 23:34:57'),
(2, '01-01-02', 2, 0, 'Cash account', '1', 1, NULL, 1, 1, NULL, NULL, 2, 2, '2020-11-10 23:35:58', '2020-11-10 23:35:58'),
(3, '01-03', 1, 1, 'Bank & Mobile Banking Account', '1', NULL, 'Bank & Mobile Banking Account', NULL, 1, NULL, NULL, 2, 2, '2020-11-10 23:36:42', '2020-11-10 23:36:42'),
(4, '01-03-04', 2, 0, 'Bank Account', '1', 2, 'Bank Account', 3, 1, NULL, NULL, 2, 2, '2020-11-10 23:37:06', '2020-11-10 23:37:06'),
(5, '01-05', 1, 1, 'Account Receivable (Group Account of Customer & Retailer)', '1', NULL, 'Account Receivable (Group Account of Customer & Retailer)', NULL, 1, NULL, NULL, 2, 2, '2020-11-10 23:38:15', '2020-11-10 23:38:15'),
(6, '01-06', 1, 1, 'Advance & Loan', '1', NULL, 'Advance & Loan', NULL, 1, NULL, NULL, 2, 2, '2020-11-10 23:54:28', '2020-11-10 23:54:28'),
(7, '01-07', 1, 0, 'Purchase & Inventory Account', '1', NULL, 'Purchase & Inventory Account', NULL, 1, NULL, NULL, 2, 2, '2020-11-10 23:55:08', '2020-11-10 23:55:08'),
(8, '02-08', 1, 1, 'Account Payable (Group Account)', '2', NULL, 'Account Payable (Group Account)', NULL, 1, NULL, NULL, 2, 2, '2020-11-10 23:56:47', '2020-11-10 23:56:47'),
(9, '02-09', 1, 1, 'Capital & Equity', '2', NULL, 'Capital & Equity', NULL, 1, NULL, NULL, 2, 2, '2020-11-10 23:57:12', '2020-11-10 23:57:12'),
(10, '02-09-10', 2, 0, 'Capital Account', '2', NULL, 'Capital Account', 9, 1, NULL, NULL, 2, 2, '2020-11-10 23:58:26', '2020-11-10 23:58:26'),
(11, '02-09-11', 2, 0, 'Capital (Opening Balance Purpose)', '2', NULL, 'Capital (Opening Balance Purpose)', 9, 1, NULL, NULL, 2, 2, '2020-11-10 23:59:02', '2020-11-10 23:59:02'),
(12, '02-12', 1, 1, 'Tax Account (Group Account)', '2', NULL, 'Tax Account (Group Account)', NULL, 1, NULL, NULL, 2, 2, '2020-11-10 23:59:38', '2020-11-10 23:59:38'),
(13, '02-12-13', 2, 0, 'Product Tax', '2', NULL, 'Product Tax', 12, 1, NULL, NULL, 2, 2, '2020-11-11 00:00:18', '2020-11-11 00:00:18'),
(14, '02-14', 1, 0, 'Retailer Earning (Profit)', '2', NULL, 'Retailer Earning (Profit)', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:00:51', '2020-11-11 00:00:51'),
(15, '04-15', 1, 0, 'Sales', '4', NULL, 'Sales', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:01:37', '2020-11-11 00:01:37'),
(16, '04-16', 1, 1, 'Other Income (Group Account)', '4', NULL, 'Other Income (Group Account)', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:02:05', '2020-11-11 00:02:05'),
(17, '04-16-17', 2, 0, 'Salary Deduction Account', '4', NULL, 'Salary Deduction Account', 16, 1, NULL, NULL, 2, 2, '2020-11-11 00:02:28', '2020-11-11 00:02:28'),
(18, '03-18', 1, 0, 'Salary & Allowance List', '3', NULL, 'Salary & Allowance List', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:03:20', '2020-11-11 00:03:20'),
(19, '03-19', 1, 0, 'Cost Of Goods Sold', '3', NULL, 'Cost Of Goods Sold', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:03:38', '2020-11-11 00:03:38'),
(20, '03-20', 1, 0, 'Retailer Sales Commission', '3', NULL, 'Retailer Sales Commission', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:04:24', '2020-11-11 00:04:24'),
(21, '03-21', 1, 0, 'Discount Expense', '3', NULL, 'Discount Expense', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:04:48', '2020-11-11 00:04:48'),
(22, '03-22', 1, 0, 'Extra Salary Allowance', '3', NULL, 'Extra Salary Allowance', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:05:10', '2020-11-11 00:05:10'),
(23, '03-23', 1, 0, 'Sales Return Account', '3', NULL, 'Sales Return Account', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:41:56', '2020-11-11 00:41:56'),
(24, '04-24', 1, 0, 'Purchase Return Account', '4', NULL, 'Purchase Return Account', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:55:13', '2020-11-11 00:55:13'),
(25, '03-25', 1, 0, 'Packaging Cost', '3', NULL, 'Packaging Cost', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:55:13', '2020-11-11 00:55:13'),
(26, '01-26', 1, 0, 'Purchase Tax', '1', NULL, 'Purchase Tax', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:55:13', '2020-11-11 00:55:13'),
(27, '01-27', 1, 0, 'Purchase Other Tax', '1', NULL, 'Purchase Other Tax', NULL, 1, NULL, NULL, 2, 2, '2020-11-11 00:55:13', '2020-11-11 00:55:13'),
(28, '04-16-28', 2, 0, 'Purchase Discount(Income)', '4', NULL, 'Purchase Discount(Income)', 16, 1, NULL, NULL, 2, 2, '2020-11-11 00:55:13', '2020-11-11 00:55:13'),
(29, '02-05-29', 2, 0, 'Walk in Customer', '1', NULL, 'Walk in Customer', 5, 1, 'Modules\\Contact\\Entities\\ContactModel', 1, NULL, NULL, NULL, NULL),
(30, '03-30', 2, 0, 'Stripe', '1', 2, 'Stripe Payment', 3, 1, '', 0, NULL, NULL, NULL, NULL),
(31, '03-31', 2, 0, 'Paypal', '1', 2, 'Paypal Payment', 3, 1, '', 0, NULL, NULL, NULL, NULL),
(32, '04-16-32', 2, 0, 'Others Income', '4', 2, 'Others Income', 16, 1, '', 0, NULL, NULL, NULL, NULL),
(33, '03-33', 1, 0, 'Others Expense', '3', 2, 'Others Expense', NULL, 1, '', 0, NULL, NULL, NULL, NULL),
(34, '01-01-34', 2, 0, 'Main Branch(Cash)', '1', 1, NULL, 1, 1, 'Modules\\Inventory\\Entities\\ShowRoom', 1, NULL, NULL, '2021-08-16 18:58:35', '2021-08-16 18:58:35'),
(35, '02-08-35', 2, 0, 'Riley Morgan', '2', NULL, NULL, 8, 1, 'Modules\\Contact\\Entities\\ContactModel', 2, 1, 1, '2021-08-17 13:20:55', '2021-08-17 13:20:55'),
(36, '01-05-36', 2, 0, 'Mohammad Sazzad Hossain', '1', NULL, NULL, 5, 1, 'Modules\\Contact\\Entities\\ContactModel', 3, 1, 1, '2021-08-17 13:28:53', '2021-08-17 13:28:53'),
(37, '02-08-37', 2, 0, 'jimi', '2', NULL, NULL, 8, 1, 'Modules\\Contact\\Entities\\ContactModel', 4, 1, 1, '2021-11-30 23:52:09', '2021-11-30 23:52:09'),
(38, '01-05-38', 2, 0, 'shafiq', '1', NULL, NULL, 5, 1, 'Modules\\Contact\\Entities\\ContactModel', 5, 1, 1, '2021-11-30 23:57:08', '2021-11-30 23:57:08'),
(39, '02-08-39', 2, 0, 'rafiq', '2', NULL, NULL, 8, 1, 'Modules\\Contact\\Entities\\ContactModel', 6, 1, 1, '2021-11-30 23:58:50', '2021-11-30 23:58:50'),
(40, '01-05-40', 2, 0, 'rafiq', '1', NULL, NULL, 5, 1, 'Modules\\Contact\\Entities\\ContactModel', 7, 1, 1, '2021-12-01 00:02:08', '2021-12-01 00:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `default_value`, `created_at`, `updated_at`) VALUES
(1, 'base_color', '#415094', NULL, NULL),
(2, 'gradient_1', '#7c32ff', NULL, NULL),
(3, 'gradient_2', '#A235EC', NULL, NULL),
(4, 'gradient_3', '#c738d8', NULL, NULL),
(5, 'scroll_color', '#7e7172', NULL, NULL),
(6, 'text-color', '#828bb2', NULL, NULL),
(7, 'text_white', '#ffffff', NULL, NULL),
(8, 'bg_white', '#ffffff', NULL, NULL),
(9, 'text_black', '#000000', NULL, NULL),
(10, 'bg_black', '#000000', NULL, NULL),
(11, 'border_color', '#ECEEF4', NULL, NULL),
(12, 'input__bg', '#ffffff', NULL, NULL),
(13, 'success', '#51A351', NULL, NULL),
(14, 'warning', '#E09079', NULL, NULL),
(15, 'danger', '#FF6D68', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `color_theme`
--

CREATE TABLE `color_theme` (
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `theme_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `color_theme`
--

INSERT INTO `color_theme` (`color_id`, `theme_id`, `value`) VALUES
(1, 1, '#415094'),
(2, 1, '#7c32ff'),
(3, 1, '#A235EC'),
(4, 1, '#c738d8'),
(5, 1, '#7e7172'),
(6, 1, '#828bb2'),
(7, 1, '#ffffff'),
(8, 1, '#ffffff'),
(9, 1, '#000000'),
(10, 1, '#000000'),
(11, 1, '#ECEEF4'),
(12, 1, '#ffffff'),
(13, 1, '#51A351'),
(14, 1, '#E09079'),
(15, 1, '#FF6D68');

-- --------------------------------------------------------

--
-- Table structure for table `combo_products`
--

CREATE TABLE `combo_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `showroom_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(16,2) NOT NULL DEFAULT 0.00,
  `total_purchase_price` double(16,2) NOT NULL DEFAULT 0.00,
  `total_regular_price` double(16,2) NOT NULL DEFAULT 0.00,
  `min_selling_price` int(11) NOT NULL DEFAULT 0,
  `image_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `barcode_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `combo_product_details`
--

CREATE TABLE `combo_product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `combo_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_qty` bigint(20) UNSIGNED DEFAULT NULL,
  `product_sku_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `pay_term` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_condition` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `alternate_contact_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `contact_type`, `name`, `business_name`, `contact_id`, `tax_number`, `opening_balance`, `pay_term`, `pay_term_condition`, `customer_group`, `credit_limit`, `email`, `username`, `mobile`, `avatar`, `address`, `is_active`, `alternate_contact_no`, `country_id`, `state`, `city`, `note`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Customer', 'Walk In Customer', NULL, 'CUS-100001', NULL, '0', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'Default Account', NULL, NULL, '2021-08-16 18:58:35', '2021-08-16 18:58:35'),
(2, NULL, 'Supplier', 'Riley Morgan', NULL, 'SUP-200002', NULL, '0', NULL, 'Months', 'None', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, '2021-08-17 13:20:55', '2021-08-17 13:20:55'),
(3, NULL, 'Customer', 'Mohammad Sazzad Hossain', 'Popular IT BD', 'CUS-100003', NULL, '0', NULL, 'Months', 'None', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, '2021-08-17 13:28:53', '2021-08-17 13:28:53'),
(4, NULL, 'Supplier', 'jimi', NULL, 'SUP-200004', NULL, '0', NULL, 'Months', 'None', NULL, NULL, NULL, '018789464563', NULL, NULL, 1, '02458789', 45, NULL, NULL, NULL, 1, 1, '2021-11-30 23:52:09', '2021-11-30 23:52:09'),
(5, NULL, 'Customer', 'shafiq', 'chair bd', 'CUS-100005', NULL, '0', NULL, 'Months', 'None', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 19, NULL, NULL, NULL, 1, 1, '2021-11-30 23:57:08', '2021-11-30 23:57:08'),
(7, NULL, 'Customer', 'rafiq', NULL, 'CUS-100007', NULL, '0', NULL, 'Months', 'None', NULL, NULL, NULL, '0320368085', NULL, NULL, 1, '0215452101', 19, NULL, NULL, NULL, 1, 1, '2021-12-01 00:02:08', '2021-12-01 00:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `cost_of_goods_histories`
--

CREATE TABLE `cost_of_goods_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `costable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `storeable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storeable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `product_sku_id` int(10) UNSIGNED DEFAULT NULL,
  `previous_remaining_stock` int(11) DEFAULT NULL,
  `newly_stock` int(11) DEFAULT NULL,
  `previous_cost_of_goods_sold` double(16,2) NOT NULL DEFAULT 0.00,
  `new_cost_of_goods_sold` double(16,2) NOT NULL DEFAULT 0.00,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cost_of_goods_histories`
--

INSERT INTO `cost_of_goods_histories` (`id`, `costable_type`, `costable_id`, `storeable_type`, `storeable_id`, `date`, `product_sku_id`, `previous_remaining_stock`, `newly_stock`, `previous_cost_of_goods_sold`, `new_cost_of_goods_sold`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Modules\\Purchase\\Entities\\PurchaseOrder', 1, 'Modules\\Inventory\\Entities\\ShowRoom', 1, '2021-08-17', 1, 0, 10, 35000.00, 35000.00, 1, 1, '2021-08-17 13:26:18', '2021-08-17 13:26:18'),
(2, 'Modules\\Purchase\\Entities\\PurchaseOrder', 3, 'Modules\\Inventory\\Entities\\ShowRoom', 1, '2021-12-01', 2, 0, 100, 300.00, 300.00, 1, 1, '2021-12-01 00:09:31', '2021-12-01 00:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso3` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonecode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `phonecode`, `currency`, `capital`, `active_status`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AFG', 'AF', '93', 'AFN', 'Kabul', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(2, 'Aland Islands', 'ALA', 'AX', '+358-18', 'EUR', 'Mariehamn', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(3, 'Albania', 'ALB', 'AL', '355', 'ALL', 'Tirana', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(4, 'Algeria', 'DZA', 'DZ', '213', 'DZD', 'Algiers', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(5, 'American Samoa', 'ASM', 'AS', '+1-684', 'USD', 'Pago Pago', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(6, 'Andorra', 'AND', 'AD', '376', 'EUR', 'Andorra la Vella', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(7, 'Angola', 'AGO', 'AO', '244', 'AOA', 'Luanda', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(8, 'Anguilla', 'AIA', 'AI', '+1-264', 'XCD', 'The Valley', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(9, 'Antarctica', 'ATA', 'AQ', '', '', '', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(10, 'Antigua And Barbuda', 'ATG', 'AG', '+1-268', 'XCD', 'St. John\'s', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(11, 'Argentina', 'ARG', 'AR', '54', 'ARS', 'Buenos Aires', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(12, 'Armenia', 'ARM', 'AM', '374', 'AMD', 'Yerevan', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(13, 'Aruba', 'ABW', 'AW', '297', 'AWG', 'Oranjestad', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(14, 'Australia', 'AUS', 'AU', '61', 'AUD', 'Canberra', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(15, 'Austria', 'AUT', 'AT', '43', 'EUR', 'Vienna', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(16, 'Azerbaijan', 'AZE', 'AZ', '994', 'AZN', 'Baku', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(17, 'Bahamas The', 'BHS', 'BS', '+1-242', 'BSD', 'Nassau', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(18, 'Bahrain', 'BHR', 'BH', '973', 'BHD', 'Manama', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(19, 'Bangladesh', 'BGD', 'BD', '880', 'BDT', 'Dhaka', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(20, 'Barbados', 'BRB', 'BB', '+1-246', 'BBD', 'Bridgetown', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(21, 'Belarus', 'BLR', 'BY', '375', 'BYR', 'Minsk', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(22, 'Belgium', 'BEL', 'BE', '32', 'EUR', 'Brussels', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(23, 'Belize', 'BLZ', 'BZ', '501', 'BZD', 'Belmopan', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(24, 'Benin', 'BEN', 'BJ', '229', 'XOF', 'Porto-Novo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(25, 'Bermuda', 'BMU', 'BM', '+1-441', 'BMD', 'Hamilton', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(26, 'Bhutan', 'BTN', 'BT', '975', 'BTN', 'Thimphu', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(27, 'Bolivia', 'BOL', 'BO', '591', 'BOB', 'Sucre', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(28, 'Bosnia and Herzegovina', 'BIH', 'BA', '387', 'BAM', 'Sarajevo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(29, 'Botswana', 'BWA', 'BW', '267', 'BWP', 'Gaborone', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(30, 'Bouvet Island', 'BVT', 'BV', '', 'NOK', '', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(31, 'Brazil', 'BRA', 'BR', '55', 'BRL', 'Brasilia', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(32, 'British Indian Ocean Territory', 'IOT', 'IO', '246', 'USD', 'Diego Garcia', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(33, 'Brunei', 'BRN', 'BN', '673', 'BND', 'Bandar Seri Begawan', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(34, 'Bulgaria', 'BGR', 'BG', '359', 'BGN', 'Sofia', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(35, 'Burkina Faso', 'BFA', 'BF', '226', 'XOF', 'Ouagadougou', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(36, 'Burundi', 'BDI', 'BI', '257', 'BIF', 'Bujumbura', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(37, 'Cambodia', 'KHM', 'KH', '855', 'KHR', 'Phnom Penh', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(38, 'Cameroon', 'CMR', 'CM', '237', 'XAF', 'Yaounde', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(39, 'Canada', 'CAN', 'CA', '1', 'CAD', 'Ottawa', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(40, 'Cape Verde', 'CPV', 'CV', '238', 'CVE', 'Praia', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(41, 'Cayman Islands', 'CYM', 'KY', '+1-345', 'KYD', 'George Town', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(42, 'Central African Republic', 'CAF', 'CF', '236', 'XAF', 'Bangui', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(43, 'Chad', 'TCD', 'TD', '235', 'XAF', 'N\'Djamena', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(44, 'Chile', 'CHL', 'CL', '56', 'CLP', 'Santiago', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(45, 'China', 'CHN', 'CN', '86', 'CNY', 'Beijing', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(46, 'Christmas Island', 'CXR', 'CX', '61', 'AUD', 'Flying Fish Cove', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(47, 'Cocos (Keeling) Islands', 'CCK', 'CC', '61', 'AUD', 'West Island', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(48, 'Colombia', 'COL', 'CO', '57', 'COP', 'Bogota', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(49, 'Comoros', 'COM', 'KM', '269', 'KMF', 'Moroni', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(50, 'Congo', 'COG', 'CG', '242', 'XAF', 'Brazzaville', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(51, 'Congo The Democratic Republic Of The', 'COD', 'CD', '243', 'CDF', 'Kinshasa', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(52, 'Cook Islands', 'COK', 'CK', '682', 'NZD', 'Avarua', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(53, 'Costa Rica', 'CRI', 'CR', '506', 'CRC', 'San Jose', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(54, 'Cote D\'Ivoire (Ivory Coast)', 'CIV', 'CI', '225', 'XOF', 'Yamoussoukro', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(55, 'Croatia (Hrvatska)', 'HRV', 'HR', '385', 'HRK', 'Zagreb', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(56, 'Cuba', 'CUB', 'CU', '53', 'CUP', 'Havana', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(57, 'Cyprus', 'CYP', 'CY', '357', 'EUR', 'Nicosia', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(58, 'Czech Republic', 'CZE', 'CZ', '420', 'CZK', 'Prague', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(59, 'Denmark', 'DNK', 'DK', '45', 'DKK', 'Copenhagen', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(60, 'Djibouti', 'DJI', 'DJ', '253', 'DJF', 'Djibouti', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(61, 'Dominica', 'DMA', 'DM', '+1-767', 'XCD', 'Roseau', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(62, 'Dominican Republic', 'DOM', 'DO', '+1-809 and 1-829', 'DOP', 'Santo Domingo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(63, 'East Timor', 'TLS', 'TL', '670', 'USD', 'Dili', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(64, 'Ecuador', 'ECU', 'EC', '593', 'USD', 'Quito', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(65, 'Egypt', 'EGY', 'EG', '20', 'EGP', 'Cairo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(66, 'El Salvador', 'SLV', 'SV', '503', 'USD', 'San Salvador', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(67, 'Equatorial Guinea', 'GNQ', 'GQ', '240', 'XAF', 'Malabo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(68, 'Eritrea', 'ERI', 'ER', '291', 'ERN', 'Asmara', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(69, 'Estonia', 'EST', 'EE', '372', 'EUR', 'Tallinn', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(70, 'Ethiopia', 'ETH', 'ET', '251', 'ETB', 'Addis Ababa', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(71, 'Falkland Islands', 'FLK', 'FK', '500', 'FKP', 'Stanley', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(72, 'Faroe Islands', 'FRO', 'FO', '298', 'DKK', 'Torshavn', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(73, 'Fiji Islands', 'FJI', 'FJ', '679', 'FJD', 'Suva', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(74, 'Finland', 'FIN', 'FI', '358', 'EUR', 'Helsinki', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(75, 'France', 'FRA', 'FR', '33', 'EUR', 'Paris', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(76, 'French Guiana', 'GUF', 'GF', '594', 'EUR', 'Cayenne', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(77, 'French Polynesia', 'PYF', 'PF', '689', 'XPF', 'Papeete', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(78, 'French Southern Territories', 'ATF', 'TF', '', 'EUR', 'Port-aux-Francais', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(79, 'Gabon', 'GAB', 'GA', '241', 'XAF', 'Libreville', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(80, 'Gambia The', 'GMB', 'GM', '220', 'GMD', 'Banjul', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(81, 'Georgia', 'GEO', 'GE', '995', 'GEL', 'Tbilisi', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(82, 'Germany', 'DEU', 'DE', '49', 'EUR', 'Berlin', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(83, 'Ghana', 'GHA', 'GH', '233', 'GHS', 'Accra', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(84, 'Gibraltar', 'GIB', 'GI', '350', 'GIP', 'Gibraltar', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(85, 'Greece', 'GRC', 'GR', '30', 'EUR', 'Athens', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(86, 'Greenland', 'GRL', 'GL', '299', 'DKK', 'Nuuk', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(87, 'Grenada', 'GRD', 'GD', '+1-473', 'XCD', 'St. George\'s', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(88, 'Guadeloupe', 'GLP', 'GP', '590', 'EUR', 'Basse-Terre', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(89, 'Guam', 'GUM', 'GU', '+1-671', 'USD', 'Hagatna', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(90, 'Guatemala', 'GTM', 'GT', '502', 'GTQ', 'Guatemala City', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(91, 'Guernsey and Alderney', 'GGY', 'GG', '+44-1481', 'GBP', 'St Peter Port', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(92, 'Guinea', 'GIN', 'GN', '224', 'GNF', 'Conakry', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(93, 'Guinea-Bissau', 'GNB', 'GW', '245', 'XOF', 'Bissau', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(94, 'Guyana', 'GUY', 'GY', '592', 'GYD', 'Georgetown', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(95, 'Haiti', 'HTI', 'HT', '509', 'HTG', 'Port-au-Prince', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(96, 'Heard and McDonald Islands', 'HMD', 'HM', ' ', 'AUD', '', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(97, 'Honduras', 'HND', 'HN', '504', 'HNL', 'Tegucigalpa', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(98, 'Hong Kong S.A.R.', 'HKG', 'HK', '852', 'HKD', 'Hong Kong', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(99, 'Hungary', 'HUN', 'HU', '36', 'HUF', 'Budapest', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(100, 'Iceland', 'ISL', 'IS', '354', 'ISK', 'Reykjavik', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(101, 'India', 'IND', 'IN', '91', 'INR', 'New Delhi', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(102, 'Indonesia', 'IDN', 'ID', '62', 'IDR', 'Jakarta', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(103, 'Iran', 'IRN', 'IR', '98', 'IRR', 'Tehran', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(104, 'Iraq', 'IRQ', 'IQ', '964', 'IQD', 'Baghdad', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(105, 'Ireland', 'IRL', 'IE', '353', 'EUR', 'Dublin', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(106, 'Israel', 'ISR', 'IL', '972', 'ILS', 'Jerusalem', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(107, 'Italy', 'ITA', 'IT', '39', 'EUR', 'Rome', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(108, 'Jamaica', 'JAM', 'JM', '+1-876', 'JMD', 'Kingston', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(109, 'Japan', 'JPN', 'JP', '81', 'JPY', 'Tokyo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(110, 'Jersey', 'JEY', 'JE', '+44-1534', 'GBP', 'Saint Helier', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(111, 'Jordan', 'JOR', 'JO', '962', 'JOD', 'Amman', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(112, 'Kazakhstan', 'KAZ', 'KZ', '7', 'KZT', 'Astana', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(113, 'Kenya', 'KEN', 'KE', '254', 'KES', 'Nairobi', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(114, 'Kiribati', 'KIR', 'KI', '686', 'AUD', 'Tarawa', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(115, 'Korea North\n', 'PRK', 'KP', '850', 'KPW', 'Pyongyang', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(116, 'Korea South', 'KOR', 'KR', '82', 'KRW', 'Seoul', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(117, 'Kuwait', 'KWT', 'KW', '965', 'KWD', 'Kuwait City', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(118, 'Kyrgyzstan', 'KGZ', 'KG', '996', 'KGS', 'Bishkek', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(119, 'Laos', 'LAO', 'LA', '856', 'LAK', 'Vientiane', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(120, 'Latvia', 'LVA', 'LV', '371', 'EUR', 'Riga', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(121, 'Lebanon', 'LBN', 'LB', '961', 'LBP', 'Beirut', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(122, 'Lesotho', 'LSO', 'LS', '266', 'LSL', 'Maseru', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(123, 'Liberia', 'LBR', 'LR', '231', 'LRD', 'Monrovia', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(124, 'Libya', 'LBY', 'LY', '218', 'LYD', 'Tripolis', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(125, 'Liechtenstein', 'LIE', 'LI', '423', 'CHF', 'Vaduz', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(126, 'Lithuania', 'LTU', 'LT', '370', 'LTL', 'Vilnius', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(127, 'Luxembourg', 'LUX', 'LU', '352', 'EUR', 'Luxembourg', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(128, 'Macau S.A.R.', 'MAC', 'MO', '853', 'MOP', 'Macao', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(129, 'Macedonia', 'MKD', 'MK', '389', 'MKD', 'Skopje', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(130, 'Madagascar', 'MDG', 'MG', '261', 'MGA', 'Antananarivo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(131, 'Malawi', 'MWI', 'MW', '265', 'MWK', 'Lilongwe', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(132, 'Malaysia', 'MYS', 'MY', '60', 'MYR', 'Kuala Lumpur', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(133, 'Maldives', 'MDV', 'MV', '960', 'MVR', 'Male', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(134, 'Mali', 'MLI', 'ML', '223', 'XOF', 'Bamako', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(135, 'Malta', 'MLT', 'MT', '356', 'EUR', 'Valletta', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(136, 'Man (Isle of)', 'IMN', 'IM', '+44-1624', 'GBP', 'Douglas, Isle of Man', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(137, 'Marshall Islands', 'MHL', 'MH', '692', 'USD', 'Majuro', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(138, 'Martinique', 'MTQ', 'MQ', '596', 'EUR', 'Fort-de-France', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(139, 'Mauritania', 'MRT', 'MR', '222', 'MRO', 'Nouakchott', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(140, 'Mauritius', 'MUS', 'MU', '230', 'MUR', 'Port Louis', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(141, 'Mayotte', 'MYT', 'YT', '262', 'EUR', 'Mamoudzou', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(142, 'Mexico', 'MEX', 'MX', '52', 'MXN', 'Mexico City', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(143, 'Micronesia', 'FSM', 'FM', '691', 'USD', 'Palikir', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(144, 'Moldova', 'MDA', 'MD', '373', 'MDL', 'Chisinau', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(145, 'Monaco', 'MCO', 'MC', '377', 'EUR', 'Monaco', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(146, 'Mongolia', 'MNG', 'MN', '976', 'MNT', 'Ulan Bator', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(147, 'Montenegro', 'MNE', 'ME', '382', 'EUR', 'Podgorica', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(148, 'Montserrat', 'MSR', 'MS', '+1-664', 'XCD', 'Plymouth', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(149, 'Morocco', 'MAR', 'MA', '212', 'MAD', 'Rabat', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(150, 'Mozambique', 'MOZ', 'MZ', '258', 'MZN', 'Maputo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(151, 'Myanmar', 'MMR', 'MM', '95', 'MMK', 'Nay Pyi Taw', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(152, 'Namibia', 'NAM', 'NA', '264', 'NAD', 'Windhoek', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(153, 'Nauru', 'NRU', 'NR', '674', 'AUD', 'Yaren', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(154, 'Nepal', 'NPL', 'NP', '977', 'NPR', 'Kathmandu', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(155, 'Netherlands Antilles', 'ANT', 'AN', '', '', '', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(156, 'Netherlands The', 'NLD', 'NL', '31', 'EUR', 'Amsterdam', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(157, 'New Caledonia', 'NCL', 'NC', '687', 'XPF', 'Noumea', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(158, 'New Zealand', 'NZL', 'NZ', '64', 'NZD', 'Wellington', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(159, 'Nicaragua', 'NIC', 'NI', '505', 'NIO', 'Managua', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(160, 'Niger', 'NER', 'NE', '227', 'XOF', 'Niamey', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(161, 'Nigeria', 'NGA', 'NG', '234', 'NGN', 'Abuja', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(162, 'Niue', 'NIU', 'NU', '683', 'NZD', 'Alofi', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(163, 'Norfolk Island', 'NFK', 'NF', '672', 'AUD', 'Kingston', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(164, 'Northern Mariana Islands', 'MNP', 'MP', '+1-670', 'USD', 'Saipan', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(165, 'Norway', 'NOR', 'NO', '47', 'NOK', 'Oslo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(166, 'Oman', 'OMN', 'OM', '968', 'OMR', 'Muscat', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(167, 'Pakistan', 'PAK', 'PK', '92', 'PKR', 'Islamabad', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(168, 'Palau', 'PLW', 'PW', '680', 'USD', 'Melekeok', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(169, 'Palestinian Territory Occupied', 'PSE', 'PS', '970', 'ILS', 'East Jerusalem', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(170, 'Panama', 'PAN', 'PA', '507', 'PAB', 'Panama City', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(171, 'Papua new Guinea', 'PNG', 'PG', '675', 'PGK', 'Port Moresby', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(172, 'Paraguay', 'PRY', 'PY', '595', 'PYG', 'Asuncion', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(173, 'Peru', 'PER', 'PE', '51', 'PEN', 'Lima', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(174, 'Philippines', 'PHL', 'PH', '63', 'PHP', 'Manila', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(175, 'Pitcairn Island', 'PCN', 'PN', '870', 'NZD', 'Adamstown', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(176, 'Poland', 'POL', 'PL', '48', 'PLN', 'Warsaw', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(177, 'Portugal', 'PRT', 'PT', '351', 'EUR', 'Lisbon', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(178, 'Puerto Rico', 'PRI', 'PR', '+1-787 and 1-939', 'USD', 'San Juan', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(179, 'Qatar', 'QAT', 'QA', '974', 'QAR', 'Doha', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(180, 'Reunion', 'REU', 'RE', '262', 'EUR', 'Saint-Denis', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(181, 'Romania', 'ROU', 'RO', '40', 'RON', 'Bucharest', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(182, 'Russia', 'RUS', 'RU', '7', 'RUB', 'Moscow', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(183, 'Rwanda', 'RWA', 'RW', '250', 'RWF', 'Kigali', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(184, 'Saint Helena', 'SHN', 'SH', '290', 'SHP', 'Jamestown', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(185, 'Saint Kitts And Nevis', 'KNA', 'KN', '+1-869', 'XCD', 'Basseterre', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(186, 'Saint Lucia', 'LCA', 'LC', '+1-758', 'XCD', 'Castries', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(187, 'Saint Pierre and Miquelon', 'SPM', 'PM', '508', 'EUR', 'Saint-Pierre', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(188, 'Saint Vincent And The Grenadines', 'VCT', 'VC', '+1-784', 'XCD', 'Kingstown', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(189, 'Saint-Barthelemy', 'BLM', 'BL', '590', 'EUR', 'Gustavia', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(190, 'Saint-Martin (French part)', 'MAF', 'MF', '590', 'EUR', 'Marigot', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(191, 'Samoa', 'WSM', 'WS', '685', 'WST', 'Apia', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(192, 'San Marino', 'SMR', 'SM', '378', 'EUR', 'San Marino', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(193, 'Sao Tome and Principe', 'STP', 'ST', '239', 'STD', 'Sao Tome', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(194, 'Saudi Arabia', 'SAU', 'SA', '966', 'SAR', 'Riyadh', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(195, 'Senegal', 'SEN', 'SN', '221', 'XOF', 'Dakar', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(196, 'Serbia', 'SRB', 'RS', '381', 'RSD', 'Belgrade', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(197, 'Seychelles', 'SYC', 'SC', '248', 'SCR', 'Victoria', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(198, 'Sierra Leone', 'SLE', 'SL', '232', 'SLL', 'Freetown', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(199, 'Singapore', 'SGP', 'SG', '65', 'SGD', 'Singapur', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(200, 'Slovakia', 'SVK', 'SK', '421', 'EUR', 'Bratislava', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(201, 'Slovenia', 'SVN', 'SI', '386', 'EUR', 'Ljubljana', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(202, 'Solomon Islands', 'SLB', 'SB', '677', 'SBD', 'Honiara', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(203, 'Somalia', 'SOM', 'SO', '252', 'SOS', 'Mogadishu', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(204, 'South Africa', 'ZAF', 'ZA', '27', 'ZAR', 'Pretoria', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(205, 'South Georgia', 'SGS', 'GS', '', 'GBP', 'Grytviken', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(206, 'South Sudan', 'SSD', 'SS', '211', 'SSP', 'Juba', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(207, 'Spain', 'ESP', 'ES', '34', 'EUR', 'Madrid', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(208, 'Sri Lanka', 'LKA', 'LK', '94', 'LKR', 'Colombo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(209, 'Sudan', 'SDN', 'SD', '249', 'SDG', 'Khartoum', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(210, 'Suriname', 'SUR', 'SR', '597', 'SRD', 'Paramaribo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(211, 'Svalbard And Jan Mayen Islands', 'SJM', 'SJ', '47', 'NOK', 'Longyearbyen', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(212, 'Swaziland', 'SWZ', 'SZ', '268', 'SZL', 'Mbabane', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(213, 'Sweden', 'SWE', 'SE', '46', 'SEK', 'Stockholm', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(214, 'Switzerland', 'CHE', 'CH', '41', 'CHF', 'Berne', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(215, 'Syria', 'SYR', 'SY', '963', 'SYP', 'Damascus', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(216, 'Taiwan', 'TWN', 'TW', '886', 'TWD', 'Taipei', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(217, 'Tajikistan', 'TJK', 'TJ', '992', 'TJS', 'Dushanbe', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(218, 'Tanzania', 'TZA', 'TZ', '255', 'TZS', 'Dodoma', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(219, 'Thailand', 'THA', 'TH', '66', 'THB', 'Bangkok', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(220, 'Togo', 'TGO', 'TG', '228', 'XOF', 'Lome', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(221, 'Tokelau', 'TKL', 'TK', '690', 'NZD', '', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(222, 'Tonga', 'TON', 'TO', '676', 'TOP', 'Nuku\'alofa', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(223, 'Trinidad And Tobago', 'TTO', 'TT', '+1-868', 'TTD', 'Port of Spain', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(224, 'Tunisia', 'TUN', 'TN', '216', 'TND', 'Tunis', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(225, 'Turkey', 'TUR', 'TR', '90', 'TRY', 'Ankara', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(226, 'Turkmenistan', 'TKM', 'TM', '993', 'TMT', 'Ashgabat', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(227, 'Turks And Caicos Islands', 'TCA', 'TC', '+1-649', 'USD', 'Cockburn Town', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(228, 'Tuvalu', 'TUV', 'TV', '688', 'AUD', 'Funafuti', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(229, 'Uganda', 'UGA', 'UG', '256', 'UGX', 'Kampala', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(230, 'Ukraine', 'UKR', 'UA', '380', 'UAH', 'Kiev', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(231, 'United Arab Emirates', 'ARE', 'AE', '971', 'AED', 'Abu Dhabi', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(232, 'United Kingdom', 'GBR', 'GB', '44', 'GBP', 'London', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(233, 'United States', 'USA', 'US', '1', 'USD', 'Washington', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(234, 'United States Minor Outlying Islands', 'UMI', 'UM', '1', 'USD', '', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(235, 'Uruguay', 'URY', 'UY', '598', 'UYU', 'Montevideo', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(236, 'Uzbekistan', 'UZB', 'UZ', '998', 'UZS', 'Tashkent', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(237, 'Vanuatu', 'VUT', 'VU', '678', 'VUV', 'Port Vila', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(238, 'Vatican City State (Holy See)', 'VAT', 'VA', '379', 'EUR', 'Vatican City', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(239, 'Venezuela', 'VEN', 'VE', '58', 'VEF', 'Caracas', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(240, 'Vietnam', 'VNM', 'VN', '84', 'VND', 'Hanoi', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(241, 'Virgin Islands (British)', 'VGB', 'VG', '+1-284', 'USD', 'Road Town', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(242, 'Virgin Islands (US)', 'VIR', 'VI', '+1-340', 'USD', 'Charlotte Amalie', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(243, 'Wallis And Futuna Islands', 'WLF', 'WF', '681', 'XPF', 'Mata Utu', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(244, 'Western Sahara', 'ESH', 'EH', '212', 'MAD', 'El-Aaiun', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(245, 'Yemen', 'YEM', 'YE', '967', 'YER', 'Sanaa', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(246, 'Zambia', 'ZMB', 'ZM', '260', 'ZMK', 'Lusaka', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03'),
(247, 'Zimbabwe', 'ZWE', 'ZW', '263', 'ZWL', 'Harare', 1, '2018-07-20 14:41:03', '2018-07-20 14:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cause` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Leke', 'ALL', 'Lek', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(2, 'Dollars', 'USD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(3, 'Afghanis', 'AFN', '؋', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(4, 'Pesos', 'ARS', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(5, 'Guilders', 'AWG', 'ƒ', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(6, 'Dollars', 'AUD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(7, 'New Manats', 'AZN', 'ман', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(8, 'Dollars', 'BSD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(9, 'Dollars', 'BBD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(10, 'Rubles', 'BYR', 'p.', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(11, 'Euro', 'EUR', '€', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(12, 'Dollars', 'BZD', 'BZ$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(13, 'Dollars', 'BMD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(14, 'Bolivianos', 'BOB', '$b', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(15, 'Convertible Marka', 'BAM', 'KM', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(16, 'Pula', 'BWP', 'P', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(17, 'Leva', 'BGN', 'лв', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(18, 'Reais', 'BRL', 'R$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(19, 'Pounds', 'GBP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(20, 'Dollars', 'BND', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(21, 'Riels', 'KHR', '៛', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(22, 'Dollars', 'CAD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(23, 'Dollars', 'KYD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(24, 'Pesos', 'CLP', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(25, 'Yuan Renminbi', 'CNY', '¥', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(26, 'Pesos', 'COP', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(27, 'Colón', 'CRC', '₡', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(28, 'Kuna', 'HRK', 'kn', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(29, 'Pesos', 'CUP', '₱', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(30, 'Koruny', 'CZK', 'Kč', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(31, 'Kroner', 'DKK', 'kr', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(32, 'Pesos', 'DOP ', 'RD$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(33, 'Dollars', 'XCD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(34, 'Pounds', 'EGP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(35, 'Colones', 'SVC', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(36, 'Pounds', 'FKP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(37, 'Dollars', 'FJD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(38, 'Cedis', 'GHC', '¢', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(39, 'Pounds', 'GIP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(40, 'Quetzales', 'GTQ', 'Q', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(41, 'Pounds', 'GGP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(42, 'Dollars', 'GYD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(43, 'Lempiras', 'HNL', 'L', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(44, 'Dollars', 'HKD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(45, 'Forint', 'HUF', 'Ft', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(46, 'Kronur', 'ISK', 'kr', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(47, 'Rupees', 'INR', '₹', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(48, 'Rupiahs', 'IDR', 'Rp', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(49, 'Rials', 'IRR', '﷼', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(50, 'Pounds', 'IMP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(51, 'New Shekels', 'ILS', '₪', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(52, 'Dollars', 'JMD', 'J$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(53, 'Yen', 'JPY', '¥', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(54, 'Pounds', 'JEP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(55, 'Tenge', 'KZT', 'лв', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(56, 'Won', 'KPW', '₩', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(57, 'Won', 'KRW', '₩', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(58, 'Soms', 'KGS', 'лв', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(59, 'Kips', 'LAK', '₭', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(60, 'Lati', 'LVL', 'Ls', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(61, 'Pounds', 'LBP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(62, 'Dollars', 'LRD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(63, 'Switzerland Francs', 'CHF', 'CHF', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(64, 'Litai', 'LTL', 'Lt', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(65, 'Denars', 'MKD', 'ден', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(66, 'Ringgits', 'MYR', 'RM', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(67, 'Rupees', 'MUR', '₨', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(68, 'Pesos', 'MXN', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(69, 'Tugriks', 'MNT', '₮', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(70, 'Meticais', 'MZN', 'MT', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(71, 'Dollars', 'NAD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(72, 'Rupees', 'NPR', '₨', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(73, 'Guilders', 'ANG', 'ƒ', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(74, 'Dollars', 'NZD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(75, 'Cordobas', 'NIO', 'C$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(76, 'Nairas', 'NGN', '₦', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(77, 'Krone', 'NOK', 'kr', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(78, 'Rials', 'OMR', '﷼', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(79, 'Rupees', 'PKR', '₨', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(80, 'Balboa', 'PAB', 'B/.', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(81, 'Guarani', 'PYG', 'Gs', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(82, 'Nuevos Soles', 'PEN', 'S/.', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(83, 'Pesos', 'PHP', 'Php', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(84, 'Zlotych', 'PLN', 'zł', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(85, 'Rials', 'QAR', '﷼', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(86, 'New Lei', 'RON', 'lei', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(87, 'Rubles', 'RUB', 'руб', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(88, 'Pounds', 'SHP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(89, 'Riyals', 'SAR', '﷼', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(90, 'Dinars', 'RSD', 'Дин.', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(91, 'Rupees', 'SCR', '₨', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(92, 'Dollars', 'SGD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(93, 'Dollars', 'SBD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(94, 'Shillings', 'SOS', 'S', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(95, 'Rand', 'ZAR', 'R', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(96, 'Rupees', 'LKR', '₨', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(97, 'Kronor', 'SEK', 'kr', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(98, 'Dollars', 'SRD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(99, 'Pounds', 'SYP', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(100, 'New Dollars', 'TWD', 'NT$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(101, 'Baht', 'THB', '฿', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(102, 'Dollars', 'TTD', 'TT$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(103, 'Lira', 'TRY', 'TL', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(104, 'Liras', 'TRL', '£', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(105, 'Dollars', 'TVD', '$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(106, 'Hryvnia', 'UAH', '₴', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(107, 'Pesos', 'UYU', '$U', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(108, 'Sums', 'UZS', 'лв', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(110, 'Dong', 'VND', '₫', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(111, 'Rials', 'YER', '﷼', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(112, 'Taka', 'BDT', '৳', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(113, 'Zimbabwe Dollars', 'ZWD', 'Z$', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(114, 'Kenya', 'KES', 'KSh', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(115, 'Nigeria', 'naira', '₦', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(116, 'Ghana', 'GHS', 'GH₵', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(117, 'Ethiopian', 'ETB', 'Br', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(118, 'Tanzania', 'TZS', 'TSh', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(119, 'Uganda', 'UGX', 'USh', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(120, 'Rwandan', 'FRW', 'FRw', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(121, 'Taka', 'BDT', '৳', '2021-11-30 23:49:34', '2021-11-30 23:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `c_n_fs`
--

CREATE TABLE `c_n_fs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `date_formats`
--

CREATE TABLE `date_formats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `normal_view` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(10) UNSIGNED DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `date_formats`
--

INSERT INTO `date_formats` (`id`, `format`, `normal_view`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'jS M, Y', '17th May, 2019', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(2, 'Y-m-d', '2019-05-17', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(3, 'Y-d-m', '2019-17-05', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(4, 'd-m-Y', '17-05-2019', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(5, 'm-d-Y', '05-17-2019', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(6, 'Y/m/d', '2019/05/17', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(7, 'Y/d/m', '2019/17/05', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(8, 'd/m/Y', '17/05/2019', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(9, 'm/d/Y', '05/17/2019', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(10, 'l jS \\of F Y', 'Monday 17th of May 2019', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(11, 'jS \\of F Y', '17th of May 2019', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(12, 'g:ia \\o\\n l jS F Y', '12:00am on Monday 17th May 2019', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(13, 'F j, Y, g:i a', 'May 7, 2019, 6:20 pm', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(14, 'F j, Y', 'May 17, 2019', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34'),
(15, '\\i\\t \\i\\s \\t\\h\\e jS \\d\\a\\y', 'it is the 17th day', 1, 1, 1, '2021-08-16 06:58:34', '2021-08-16 18:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sales', 'Sales Department', 1, NULL, NULL),
(2, 'Marketing', 'Marketing Department', 1, NULL, NULL),
(3, 'HR', 'HR Department', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_no` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available_variable` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `type`, `subject`, `value`, `available_variable`, `status`, `created_at`, `updated_at`, `for`) VALUES
(1, 'quotation_template', 'Quotation Invoice', '<div style=\"color: rgb(255, 255, 255); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center; background-color: rgb(65, 80, 148); padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0px;\"><h1 style=\"margin: 20px 0px 10px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.1; color: inherit; font-size: 36px;\">Quotation Invoice</h1></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; padding: 20px;\"><p style=\"color: rgb(85, 85, 85);\">Hello {USER_FIRST_NAME}<br><br>An account has been created for you.</p><p style=\"color: rgb(85, 85, 85);\">Please use the following info to login your dashboard:</p><hr style=\"box-sizing: content-box; margin-top: 20px; margin-bottom: 20px; border-top-color: rgb(238, 238, 238);\"><p style=\"color: rgb(85, 85, 85);\"><br></p></div>', '{USER_FIRST_NAME}', 1, NULL, '2021-01-20 12:40:59', 'email'),
(2, 'sale_template', '', '<div style=\"font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(255, 255, 255); text-align: center; background-color: rgb(65, 80, 148); padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0px;\"><h1 style=\"margin: 20px 0px 10px; font-size: 36px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.1; color: inherit;\">Sale Invoice</h1></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; padding: 20px;\"><p style=\"color: rgb(85, 85, 85);\">Hello {USER_FIRST_NAME}<br><br>An account has been created for you.</p><p style=\"color: rgb(85, 85, 85);\">Please use the following info to login your dashboard:</p><hr style=\"box-sizing: content-box; margin-top: 20px; margin-bottom: 20px; border-top-color: rgb(238, 238, 238);\"><p style=\"color: rgb(85, 85, 85);\"><br></p></div>', '{USER_FIRST_NAME}', 1, NULL, '2021-01-20 12:40:47', 'email'),
(3, 'purchase_template', '', '<div style=\"color: rgb(255, 255, 255); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-align: center; background-color: rgb(65, 80, 148); padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0px;\"><h1 style=\"margin: 20px 0px 10px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.1; color: inherit; font-size: 36px;\">Purchase Invoice</h1></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; padding: 20px;\"><p style=\"color: rgb(85, 85, 85);\">Hello {USER_FIRST_NAME}<br><br><span style=\"color: rgb(85, 85, 85);\">An account has been created for you</span><br></p><p style=\"color: rgb(85, 85, 85);\"><br></p><hr style=\"box-sizing: content-box; margin-top: 20px; margin-bottom: 20px; border-top-color: rgb(238, 238, 238);\"><p style=\"color: rgb(85, 85, 85);\"><br></p></div>', '{USER_FIRST_NAME}', 1, NULL, '2021-02-14 06:36:37', 'email'),
(7, 'due_customer_sms_template', NULL, 'Hello {USER_FIRST_NAME}\r\nPrevious Due : {PREVIOUS_DUE_AMOUNT}\r\nCurrent Due: {TOTAL_DUE_AMOUNT}\r\nTHANK YOU\r\n{APP_NAME}', '{USER_FIRST_NAME}, {PREVIOUS_DUE_AMOUNT}, {TOTAL_DUE_AMOUNT}, {APP_NAME}', 1, NULL, '2021-02-16 04:47:24', 'sms'),
(8, 'team_member_invitation', 'Team Member Invitation', '                <meta charset=\"UTF-8\">\n                    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n                    <title>Document</title>\n                    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css\">\n                    <style>\n                        @import url(\'https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap\');\n                        body{\n                            font-family: \'Poppins\', sans-serif;\n                            margin: 0;\n                            padding: 0;\n                        }\n                        .email_invite_wrapper{\n                            background: #fff;\n                            text-align: center;\n\n                        }\n                        h1,h2,h3,h4,h5{\n                            color: #415094;\n                        }\n                        .btn_1 {\n                            display: inline-block;\n                            padding: 13.5px 45px;\n                            border-radius: 5px;\n                            font-size: 14px;\n                            color: #fff;\n                            -o-transition: all .4s ease-in-out;\n                            -webkit-transition: all .4s ease-in-out;\n                            transition: all .4s ease-in-out;\n                            text-transform: capitalize;\n                            background-size: 200% auto;\n                            border: 1px solid transparent;\n                            box-shadow: 0px 10px 20px 0px rgba(108, 39, 255, 0.3);\n                            background-image: -webkit-gradient(linear, right top, left top, from(#7c32ff), color-stop(50%, #c738d8), to(#7c32ff));\n                            background-image: -webkit-linear-gradient(right, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                            background-image: -o-linear-gradient(right, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                            background-image: linear-gradient(to left, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                        }\n                        .btn_1:hover {\n                            color: #fff !important;\n                            background-position: right center;\n                            box-shadow: 0px 10px 20px 0px rgba(108, 39, 255, 0.3);\n                        }\n\n                        .banner img{\n                            width: 100%;\n                        }\n                        .invitation_text {\n                            max-width: 500px;\n                            margin: 30px auto 0 auto\n                        }\n                        .invitation_text h3{\n                            font-size: 20px;\n                            text-transform: capitalize;\n                            color: #2F353D;\n                            margin-bottom: 10px;\n                            font-weight: 600;\n                        }\n                        .invitation_text p{\n                            font-family: \"Poppins\", sans-serif;\n                            line-height: 1.929;\n                            font-size: 16px;\n                            margin-bottom: 0px;\n                            color: #828bb2;\n                            font-weight: 300;\n                            margin: 10px 0 30px 0;\n                        }\n                        .invitation_text a{}\n                        .logo{\n                            margin: 30px 0;\n                        }\n                        .social_links{\n                            background: #F4F4F8;\n                            padding: 15px;\n                            margin: 30px 0 30px 0;\n                        }\n                        .social_links a{\n                            display: inline-block;\n                            font-size: 15px;\n                            color: #252B33;\n                            padding: 5px;\n                        }\n                        .email_invite_bottom{\n                            text-align: center;\n                            margin: 20px 0 30px 0;\n                        }\n                        .email_invite_bottom p{\n                            font-size: 14px;\n                            font-weight: 400;\n                            color: #828bb2;\n                            text-transform: capitalize;\n                            margin-bottom: 0;\n                        }\n                        .email_invite_bottom a{\n                            font-size: 14px;\n                            font-weight: 500;\n                            color: #7c32ff  ;\n\n                        }\n                        a{\n                            text-decoration: none;\n                        }\n                    </style>\n\n\n\n                    <div class=\"email_invite_wrapper text-center\">\n                        <div class=\"logo\">\n                            <a href=\"#\">\n                                <img src=\"img/logo.png\" alt=\"\">\n                            </a>\n                        </div>\n                        <div class=\"banner\">\n                            <img src=\"img/banner_bg.jpg\" alt=\"\">\n                        </div>\n                        <div class=\"invitation_text\">\n                            <h3>Team Member Invitation</h3>\n                            <p style=\"text-align: left; \">Hello {USER_NAME}, </p><p style=\"text-align: left; \">{INVITATION_SENT_BY} has sent you an invitation to join with <a href=\"http://TEAM_URL\" target=\"_blank\">{TEAM_NAME}</a>. </p><p style=\"text-align: left; \">If you don not want to accept this invitation, simply ignore this email. </p></div>\n                        <div class=\"social_links\">\n                            <a href=\"#\"> <i class=\"fab fa-facebook-f\"></i> </a>\n                            <a href=\"#\"> <i class=\"fab fa-instagram\"></i> </a>\n                            <a href=\"#\"> <i class=\"fab fa-twitter\"></i> </a>\n                            <a href=\"#\"> <i class=\"fab fa-pinterest-p\"></i> </a>\n                        </div>\n                        <div class=\"email_invite_bottom\">\n                            </div>\n                    </div>', '{USER_NAME},{INVITATION_SENT_BY},{TEAM_NAME},,{TEAM_URL}', 1, NULL, NULL, 'email'),
(9, 'project_member_invitation', 'Project Member Invitation', '                    <meta charset=\"UTF-8\">\n                    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n                    <title>Document</title>\n                    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css\">\n                    <style>\n                        @import url(\'https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap\');\n                        body{\n                            font-family: \'Poppins\', sans-serif;\n                            margin: 0;\n                            padding: 0;\n                        }\n                        .email_invite_wrapper{\n                            background: #fff;\n                            text-align: center;\n\n                        }\n                        h1,h2,h3,h4,h5{\n                            color: #415094;\n                        }\n                        .btn_1 {\n                            display: inline-block;\n                            padding: 13.5px 45px;\n                            border-radius: 5px;\n                            font-size: 14px;\n                            color: #fff;\n                            -o-transition: all .4s ease-in-out;\n                            -webkit-transition: all .4s ease-in-out;\n                            transition: all .4s ease-in-out;\n                            text-transform: capitalize;\n                            background-size: 200% auto;\n                            border: 1px solid transparent;\n                            box-shadow: 0px 10px 20px 0px rgba(108, 39, 255, 0.3);\n                            background-image: -webkit-gradient(linear, right top, left top, from(#7c32ff), color-stop(50%, #c738d8), to(#7c32ff));\n                            background-image: -webkit-linear-gradient(right, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                            background-image: -o-linear-gradient(right, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                            background-image: linear-gradient(to left, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                        }\n                        .btn_1:hover {\n                            color: #fff !important;\n                            background-position: right center;\n                            box-shadow: 0px 10px 20px 0px rgba(108, 39, 255, 0.3);\n                        }\n\n                        .banner img{\n                            width: 100%;\n                        }\n                        .invitation_text {\n                            max-width: 500px;\n                            margin: 30px auto 0 auto\n                        }\n                        .invitation_text h3{\n                            font-size: 20px;\n                            text-transform: capitalize;\n                            color: #2F353D;\n                            margin-bottom: 10px;\n                            font-weight: 600;\n                        }\n                        .invitation_text p{\n                            font-family: \"Poppins\", sans-serif;\n                            line-height: 1.929;\n                            font-size: 16px;\n                            margin-bottom: 0px;\n                            color: #828bb2;\n                            font-weight: 300;\n                            margin: 10px 0 30px 0;\n                        }\n                        .invitation_text a{}\n                        .logo{\n                            margin: 30px 0;\n                        }\n                        .social_links{\n                            background: #F4F4F8;\n                            padding: 15px;\n                            margin: 30px 0 30px 0;\n                        }\n                        .social_links a{\n                            display: inline-block;\n                            font-size: 15px;\n                            color: #252B33;\n                            padding: 5px;\n                        }\n                        .email_invite_bottom{\n                            text-align: center;\n                            margin: 20px 0 30px 0;\n                        }\n                        .email_invite_bottom p{\n                            font-size: 14px;\n                            font-weight: 400;\n                            color: #828bb2;\n                            text-transform: capitalize;\n                            margin-bottom: 0;\n                        }\n                        .email_invite_bottom a{\n                            font-size: 14px;\n                            font-weight: 500;\n                            color: #7c32ff  ;\n\n                        }\n                        a{\n                            text-decoration: none;\n                        }\n                    </style>\n\n\n\n                    <div class=\"email_invite_wrapper text-center\">\n                        <div class=\"logo\">\n                            <a href=\"#\">\n                                <img src=\"img/logo.png\" alt=\"\">\n                            </a>\n                        </div>\n                        <div class=\"banner\">\n                            <img src=\"img/banner_bg.jpg\" alt=\"\">\n                        </div>\n                        <div class=\"invitation_text\">\n                            <h3>Project Member Invitation</h3>\n                            <p style=\"text-align: left; \">Hello {USER_NAME}, </p><p style=\"text-align: left; \">{INVITATION_SENT_BY} has sent you an invitation to join with <a href=\"http://PROJECT_URL\" target=\"_blank\">{PROJECT_NAME}</a>. </p><p style=\"text-align: left; \">If you don not want to accept this invitation, simply ignore this email. </p></div>\n                        <div class=\"social_links\">\n                            <a href=\"#\"> <i class=\"fab fa-facebook-f\"></i> </a>\n                            <a href=\"#\"> <i class=\"fab fa-instagram\"></i> </a>\n                            <a href=\"#\"> <i class=\"fab fa-twitter\"></i> </a>\n                            <a href=\"#\"> <i class=\"fab fa-pinterest-p\"></i> </a>\n                        </div>\n                        <div class=\"email_invite_bottom\">\n                            </div>\n                    </div>', '{USER_NAME},{PROJECT_NAME},{PROJECT_URL},', 1, NULL, NULL, 'email'),
(11, 'email_confirmation', 'Email Confirmation', '                <meta charset=\"UTF-8\">\n                <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n                <title>Document</title>\n                <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css\">\n                <style>\n                    @import url(\'https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap\');\n                    body{\n                        font-family: \'Poppins\', sans-serif;\n                        margin: 0;\n                        padding: 0;\n                    }\n                    .email_invite_wrapper{\n                        background: #fff;\n                        text-align: center;\n\n                    }\n                    h1,h2,h3,h4,h5{\n                        color: #415094;\n                    }\n                    .btn_1 {\n                        display: inline-block;\n                        padding: 13.5px 45px;\n                        border-radius: 5px;\n                        font-size: 14px;\n                        color: #fff;\n                        -o-transition: all .4s ease-in-out;\n                        -webkit-transition: all .4s ease-in-out;\n                        transition: all .4s ease-in-out;\n                        text-transform: capitalize;\n                        background-size: 200% auto;\n                        border: 1px solid transparent;\n                        box-shadow: 0px 10px 20px 0px rgba(108, 39, 255, 0.3);\n                        background-image: -webkit-gradient(linear, right top, left top, from(#7c32ff), color-stop(50%, #c738d8), to(#7c32ff));\n                        background-image: -webkit-linear-gradient(right, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                        background-image: -o-linear-gradient(right, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                        background-image: linear-gradient(to left, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                    }\n                    .btn_1:hover {\n                        color: #fff !important;\n                        background-position: right center;\n                        box-shadow: 0px 10px 20px 0px rgba(108, 39, 255, 0.3);\n                    }\n\n                    .banner img{\n                        width: 100%;\n                    }\n                    .invitation_text {\n                        max-width: 500px;\n                        margin: 30px auto 0 auto\n                    }\n                    .invitation_text h3{\n                        font-size: 20px;\n                        text-transform: capitalize;\n                        color: #2F353D;\n                        margin-bottom: 10px;\n                        font-weight: 600;\n                    }\n                    .invitation_text p{\n                        font-family: \"Poppins\", sans-serif;\n                        line-height: 1.929;\n                        font-size: 16px;\n                        margin-bottom: 0px;\n                        color: #828bb2;\n                        font-weight: 300;\n                        margin: 10px 0 30px 0;\n                    }\n                    .invitation_text a{}\n                    .logo{\n                        margin: 30px 0;\n                    }\n                    .social_links{\n                        background: #F4F4F8;\n                        padding: 15px;\n                        margin: 30px 0 30px 0;\n                    }\n                    .social_links a{\n                        display: inline-block;\n                        font-size: 15px;\n                        color: #252B33;\n                        padding: 5px;\n                    }\n                    .email_invite_bottom{\n                        text-align: center;\n                        margin: 20px 0 30px 0;\n                    }\n                    .email_invite_bottom p{\n                        font-size: 14px;\n                        font-weight: 400;\n                        color: #828bb2;\n                        text-transform: capitalize;\n                        margin-bottom: 0;\n                    }\n                    .email_invite_bottom a{\n                        font-size: 14px;\n                        font-weight: 500;\n                        color: #7c32ff  ;\n\n                    }\n                    a{\n                        text-decoration: none;\n                    }\n                </style>\n\n\n\n                <div class=\"email_invite_wrapper text-center\">\n                    <div class=\"logo\">\n                        <a href=\"#\">\n                            <img src=\"img/logo.png\" alt=\"\">\n                        </a>\n                    </div>\n                    <div class=\"banner\">\n                        <img src=\"img/banner_bg.jpg\" alt=\"\">\n                    </div>\n                    <div class=\"invitation_text\">\n                        <h3>Verify Your Email address</h3>\n                        <p style=\"text-align: left; \">Hello,</p><p style=\"text-align: left; \">Please click the link below to verify your email address <a href=\"http://VERIFY_URL\" target=\"_blank\">verify link</a>.</p><p style=\"text-align: left; \">If you did not create an account, no further action is required. </p><p style=\"text-align: left; \">Regards </p></div>\n                    <div class=\"social_links\">\n                        <a href=\"#\"> <i class=\"fab fa-facebook-f\"></i> </a>\n                        <a href=\"#\"> <i class=\"fab fa-instagram\"></i> </a>\n                        <a href=\"#\"> <i class=\"fab fa-twitter\"></i> </a>\n                        <a href=\"#\"> <i class=\"fab fa-pinterest-p\"></i> </a>\n                    </div>\n                    <div class=\"email_invite_bottom\">\n                        </div>\n                </div>', '{VERIFY_URL},', 1, NULL, NULL, 'email'),
(18, 'password_reset_template', 'Password reset template', '                <meta charset=\"UTF-8\">\n                <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n                <title>Document</title>\n                <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css\">\n                <style>\n                    @import url(\'https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap\');\n                    body{\n                        font-family: \'Poppins\', sans-serif;\n                        margin: 0;\n                        padding: 0;\n                    }\n                    .email_invite_wrapper{\n                        background: #fff;\n                        text-align: center;\n\n                    }\n                    h1,h2,h3,h4,h5{\n                        color: #415094;\n                    }\n                    .btn_1 {\n                        display: inline-block;\n                        padding: 13.5px 45px;\n                        border-radius: 5px;\n                        font-size: 14px;\n                        color: #fff;\n                        -o-transition: all .4s ease-in-out;\n                        -webkit-transition: all .4s ease-in-out;\n                        transition: all .4s ease-in-out;\n                        text-transform: capitalize;\n                        background-size: 200% auto;\n                        border: 1px solid transparent;\n                        box-shadow: 0px 10px 20px 0px rgba(108, 39, 255, 0.3);\n                        background-image: -webkit-gradient(linear, right top, left top, from(#7c32ff), color-stop(50%, #c738d8), to(#7c32ff));\n                        background-image: -webkit-linear-gradient(right, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                        background-image: -o-linear-gradient(right, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                        background-image: linear-gradient(to left, #7c32ff 0%, #c738d8 50%, #7c32ff 100%);\n                    }\n                    .btn_1:hover {\n                        color: #fff !important;\n                        background-position: right center;\n                        box-shadow: 0px 10px 20px 0px rgba(108, 39, 255, 0.3);\n                    }\n\n                    .banner img{\n                        width: 100%;\n                    }\n                    .invitation_text {\n                        max-width: 500px;\n                        margin: 30px auto 0 auto\n                    }\n                    .invitation_text h3{\n                        font-size: 20px;\n                        text-transform: capitalize;\n                        color: #2F353D;\n                        margin-bottom: 10px;\n                        font-weight: 600;\n                    }\n                    .invitation_text p{\n                        font-family: \"Poppins\", sans-serif;\n                        line-height: 1.929;\n                        font-size: 16px;\n                        margin-bottom: 0px;\n                        color: #828bb2;\n                        font-weight: 300;\n                        margin: 10px 0 30px 0;\n                    }\n.primary_btn_large {\n    display: inline-block;\n    padding: 17px 23px;\n    text-transform: uppercase;\n    line-height: 16px;\n    font-size: 12px;\n    font-weight: 500;\n    border-radius: 5px;\n    white-space: nowrap;\n    -webkit-transition: 0.3s;\n    transition: 0.3s;\n    color: #fff;\n    border: 0;\n    cursor: pointer;\n    letter-spacing: 0.1em;\n}\n\n                    .invitation_text a{}\n                    .logo{\n                        margin: 30px 0;\n                    }\n                    .social_links{\n                        background: #F4F4F8;\n                        padding: 15px;\n                        margin: 30px 0 30px 0;\n                    }\n                    .social_links a{\n                        display: inline-block;\n                        font-size: 15px;\n                        color: #252B33;\n                        padding: 5px;\n                    }\n                    .email_invite_bottom{\n                        text-align: center;\n                        margin: 20px 0 30px 0;\n                    }\n                    .email_invite_bottom p{\n                        font-size: 14px;\n                        font-weight: 400;\n                        color: #828bb2;\n                        text-transform: capitalize;\n                        margin-bottom: 0;\n                    }\n                    .email_invite_bottom a{\n                        font-size: 14px;\n                        font-weight: 500;\n                        color: #7c32ff  ;\n\n                    }\n                    a{\n                        text-decoration: none;\n                    }\n\n.primary_btn_large {\n    display: inline-block;\n    padding: 17px 23px;\n    text-transform: uppercase;\n    line-height: 16px;\n    font-size: 12px;\n    font-weight: 500;\n    border-radius: 5px;\n    white-space: nowrap;\n    -webkit-transition: 0.3s;\n    transition: 0.3s;\n    color: #fff;\n    border: 0;\n    cursor: pointer;\n    letter-spacing: 0.1em;\n}\n                </style>\n\n\n\n                <div class=\"email_invite_wrapper text-center\">\n                    <div class=\"logo\">\n                        <a href=\"#\">\n                            <img src=\"http://demo.infixdev.com/public/uploads/settings/logo.png\" alt=\"\"></a></div><div class=\"invitation_text\">\n                        <h1 style=\"text-align: left; \" segoe=\"\" ui\",=\"\" roboto,=\"\" helvetica,=\"\" arial,=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\";=\"\" position:=\"\" relative;=\"\" color:=\"\" rgb(61,=\"\" 72,=\"\" 82);=\"\" font-size:=\"\" 18px;=\"\" text-align:=\"\" left;\"=\"\">Hello!</h1><p style=\"text-align: left; color: rgb(113, 128, 150);\" segoe=\"\" ui\",=\"\" roboto,=\"\" helvetica,=\"\" arial,=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\";=\"\" position:=\"\" relative;=\"\" line-height:=\"\" 1.5em;=\"\" text-align:=\"\" left;\"=\"\">You are receiving this email because we received a password reset request for your account.</p><p style=\"text-align: left; color: rgb(113, 128, 150);\" segoe=\"\" ui\",=\"\" roboto,=\"\" helvetica,=\"\" arial,=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\";=\"\" position:=\"\" relative;=\"\" line-height:=\"\" 1.5em;=\"\" text-align:=\"\" left;\"=\"\"><a calss=\"primary_btn_large\" href=\"http://{RESET_LINK}\" target=\"_blank\">Reset Link</a></p><p style=\"text-align: left; color: rgb(113, 128, 150);\" segoe=\"\" ui\",=\"\" roboto,=\"\" helvetica,=\"\" arial,=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\";=\"\" position:=\"\" relative;=\"\" line-height:=\"\" 1.5em;=\"\" text-align:=\"\" left;\"=\"\">This password reset link will expire in 60 minutes.</p><p style=\"text-align: left; color: rgb(113, 128, 150);\" segoe=\"\" ui\",=\"\" roboto,=\"\" helvetica,=\"\" arial,=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\";=\"\" position:=\"\" relative;=\"\" line-height:=\"\" 1.5em;=\"\" text-align:=\"\" left;\"=\"\">If you did not request a password reset, no further action is required.</p><p style=\"color: rgb(113, 128, 150); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\",=\"\" roboto,=\"\" helvetica,=\"\" arial,=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\";=\"\" position:=\"\" relative;=\"\" line-height:=\"\" 1.5em;=\"\" text-align:=\"\" left;\"=\"\"><br></p><p style=\"position: relative; line-height: 1.5em; text-align: left;\"><font color=\"#828bb2\" face=\"-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol\"><span style=\"font-size: 14px;\">If you’re having trouble clicking the \"Reset Password\" button, copy and paste the URL below into your web browser: <a href=\"http://{RESET_LINK}\" target=\"_blank\">{RESET_LINK}</a></span></font><br></p></div>\n                    <div class=\"social_links\">\n                        <a href=\"#\"> <i class=\"fab fa-facebook-f\"></i> </a>\n                        <a href=\"#\"> <i class=\"fab fa-instagram\"></i> </a>\n                        <a href=\"#\"> <i class=\"fab fa-twitter\"></i> </a>\n                        <a href=\"#\"> <i class=\"fab fa-pinterest-p\"></i> </a>\n                    </div>\n                    <div class=\"email_invite_bottom\">\n                        <p><span style=\"color: rgb(130, 139, 178); font-family: Poppins, sans-serif; font-size: 16px; text-align: left; text-transform: none;\"></span><br></p></div>\n                </div>', '{RESET_LINK},{APP_NAME}', 1, NULL, NULL, 'email');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `for_whom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `showroom_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete set null',
  `workspace_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'only for type = number',
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'only for type = number',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'right' COMMENT 'only for type = number',
  `decimal` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'only for type = number',
  `editable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => edit only creator, 0=> edit everyone',
  `notify` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'if type = dropdown/date, 1 => notify everyone when change, 0 => not notify',
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `user_id`, `workspace_id`, `name`, `type`, `format`, `label`, `position`, `decimal`, `editable`, `notify`, `default`, `description`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Assignee', 'user_id', NULL, NULL, 'right', '0', 0, 0, 1, NULL, '2021-08-16 18:58:38', '2021-08-16 18:58:38'),
(2, NULL, NULL, 'Due Date', 'date', NULL, NULL, 'right', '0', 0, 0, 1, NULL, '2021-08-16 18:58:38', '2021-08-16 18:58:38'),
(3, NULL, NULL, 'Tags', 'tags', NULL, NULL, 'right', '0', 0, 0, 1, NULL, '2021-08-16 18:58:38', '2021-08-16 18:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `field_options`
--

CREATE TABLE `field_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field_project`
--

CREATE TABLE `field_project` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `project_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `order` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `visibility` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field_task`
--

CREATE TABLE `field_task` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `field_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `option_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `date` timestamp NULL DEFAULT NULL,
  `number` double(20,6) DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_login` tinyint(1) NOT NULL DEFAULT 0,
  `file_supported` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'USD',
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '$',
  `promotionSetting` int(11) DEFAULT 0,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public/uploads/settings/logo.png',
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public/uploads/settings/favicon.png',
  `system_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1.0',
  `active_status` int(11) DEFAULT 1,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'USD',
  `language_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `system_purchase_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_activated_date` date DEFAULT NULL,
  `envato_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `envato_item_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_btn` int(11) NOT NULL DEFAULT 1,
  `dashboard_btn` int(11) NOT NULL DEFAULT 1,
  `report_btn` int(11) NOT NULL DEFAULT 1,
  `style_btn` int(11) NOT NULL DEFAULT 1,
  `ltl_rtl_btn` int(11) NOT NULL DEFAULT 1,
  `lang_btn` int(11) NOT NULL DEFAULT 1,
  `website_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttl_rtl` int(11) NOT NULL DEFAULT 2,
  `phone_number_privacy` int(11) NOT NULL DEFAULT 1 COMMENT '1 = enable, 0 = disable',
  `time_zone_id` int(11) DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT 19,
  `date_format_id` int(10) UNSIGNED DEFAULT 1,
  `software_version` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_header` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_footer` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_protocol` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preloader` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'infix',
  `payment_gateway` int(11) NOT NULL DEFAULT 1 COMMENT '1 => cash ,2 => bank',
  `terms_conditions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_view` int(11) DEFAULT NULL COMMENT '1 => grid ,2 => table',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_updated_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_bg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public/backEnd/img/login-bg.png',
  `error_page_bg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public/backEnd/img/login-bg.jpg',
  `default_view` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `company_name`, `country_name`, `company_info`, `contact_login`, `file_supported`, `zip_code`, `vat_number`, `address`, `phone`, `email`, `currency`, `currency_symbol`, `promotionSetting`, `logo`, `favicon`, `system_version`, `active_status`, `currency_code`, `language_name`, `system_purchase_code`, `system_activated_date`, `envato_user`, `envato_item_id`, `system_domain`, `copyright_text`, `website_btn`, `dashboard_btn`, `report_btn`, `style_btn`, `ltl_rtl_btn`, `lang_btn`, `website_url`, `ttl_rtl`, `phone_number_privacy`, `time_zone_id`, `language_id`, `date_format_id`, `software_version`, `mail_signature`, `mail_header`, `mail_footer`, `mail_protocol`, `preloader`, `payment_gateway`, `terms_conditions`, `remarks_title`, `remarks_body`, `pos_view`, `created_at`, `updated_at`, `last_updated_date`, `login_bg`, `error_page_bg`, `default_view`) VALUES
(1, 'Soft IT LTD', 'SOFT IT LTD', 'Bangladesh', NULL, 0, 'jpg,png,jpeg,pdf,doc,docx,xls,xlsx,txt', '1216', NULL, 'Suit #3A House #1232 Road #12, Avenue #9 Mirpur DOHS', '+8801831080976', 'info@softitltd.com', '112', '৳', 0, 'public/uploads/settings/611a6281ab889.png', 'public/uploads/settings/611a628198f91.png', '3.1.4', 1, 'BDT', 'en', NULL, '2021-08-16', NULL, NULL, 'https://erp.softitltd.com', 'Copyright © 2020 - 2021 All rights reserved | This application is made by <a href=\"https://www.popularitbd.com/\">Soft IT LTD</a>', 1, 1, 1, 1, 1, 1, NULL, 2, 1, 1, 19, 1, NULL, NULL, NULL, NULL, 'smtp', 'Soft IT LTD', 1, NULL, NULL, NULL, 2, NULL, '2021-12-01 00:34:55', NULL, 'public/backEnd/img/login-bg.png', 'public/backEnd/img/login-bg.jpg', 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` year(4) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =>single 1 => multiple',
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `showroom_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `intro_prefix`
--

CREATE TABLE `intro_prefix` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `intro_prefix`
--

INSERT INTO `intro_prefix` (`id`, `prefix`, `title`, `created_at`, `updated_at`) VALUES
(1, 'PO', 'About purchase order', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(2, 'PI', 'About purchase invoice', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(3, 'INV', 'About sales invoice', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(4, 'QTA', 'About customer quotation', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(5, 'RET', 'About Retailer', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(6, 'CUS', 'About Customer', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(7, 'SUP', 'About Supplier', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(8, 'EMP', 'About Staff', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(9, 'PSO', 'About Packing', '2021-08-16 18:58:34', '2021-08-16 18:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `native` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `json_exist` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `native`, `rtl`, `status`, `json_exist`, `created_at`, `updated_at`) VALUES
(1, 'af', 'Afrikaans', 'Afrikaans', 0, 0, 0, NULL, NULL),
(2, 'am', 'Amharic', 'አማርኛ', 0, 1, 0, NULL, NULL),
(3, 'ar', 'Arabic', 'العربية', 1, 0, 0, NULL, NULL),
(4, 'ay', 'Aymara', 'Aymar', 0, 0, 0, NULL, NULL),
(5, 'az', 'Azerbaijani', 'Azərbaycanca / آذربايجان', 0, 0, 0, NULL, NULL),
(6, 'be', 'Belarusian', 'Беларуская', 0, 0, 0, NULL, NULL),
(7, 'bg', 'Bulgarian', 'Български', 0, 0, 0, NULL, NULL),
(8, 'bi', 'Bislama', 'Bislama', 0, 0, 0, NULL, NULL),
(9, 'bn', 'Bengali', 'বাংলা', 0, 0, 0, NULL, NULL),
(10, 'bs', 'Bosnian', 'Bosanski', 0, 0, 0, NULL, NULL),
(11, 'ca', 'Catalan', 'Català', 0, 0, 0, NULL, NULL),
(12, 'ch', 'Chamorro', 'Chamoru', 0, 0, 0, NULL, NULL),
(13, 'cs', 'Czech', 'Česky', 0, 0, 0, NULL, NULL),
(14, 'da', 'Danish', 'Dansk', 0, 0, 0, NULL, NULL),
(15, 'de', 'German', 'Deutsch', 0, 0, 0, NULL, NULL),
(16, 'dv', 'Divehi', 'ދިވެހިބަސް', 1, 0, 0, NULL, NULL),
(17, 'dz', 'Dzongkha', 'ཇོང་ཁ', 0, 0, 0, NULL, NULL),
(18, 'el', 'Greek', 'Ελληνικά', 0, 0, 0, NULL, NULL),
(19, 'en', 'English', 'English', 0, 1, 0, NULL, NULL),
(20, 'es', 'Spanish', 'Español', 0, 0, 0, NULL, NULL),
(21, 'et', 'Estonian', 'Eesti', 0, 0, 0, NULL, NULL),
(22, 'eu', 'Basque', 'Euskara', 0, 0, 0, NULL, NULL),
(23, 'fa', 'Persian', 'فارسی', 1, 0, 0, NULL, NULL),
(24, 'ff', 'Peul', 'Fulfulde', 0, 0, 0, NULL, NULL),
(25, 'fi', 'Finnish', 'Suomi', 0, 0, 0, NULL, NULL),
(26, 'fj', 'Fijian', 'Na Vosa Vakaviti', 0, 0, 0, NULL, NULL),
(27, 'fo', 'Faroese', 'Føroyskt', 0, 0, 0, NULL, NULL),
(28, 'fr', 'French', 'Français', 0, 0, 0, NULL, NULL),
(29, 'ga', 'Irish', 'Gaeilge', 0, 0, 0, NULL, NULL),
(30, 'gl', 'Galician', 'Galego', 0, 0, 0, NULL, NULL),
(31, 'gn', 'Guarani', 'Avañe\'ẽ', 0, 0, 0, NULL, NULL),
(32, 'gv', 'Manx', 'Gaelg', 0, 0, 0, NULL, NULL),
(33, 'he', 'Hebrew', 'עברית', 1, 0, 0, NULL, NULL),
(34, 'hi', 'Hindi', 'हिन्दी', 0, 0, 0, NULL, NULL),
(35, 'hr', 'Croatian', 'Hrvatski', 0, 0, 0, NULL, NULL),
(36, 'ht', 'Haitian', 'Krèyol ayisyen', 0, 0, 0, NULL, NULL),
(37, 'hu', 'Hungarian', 'Magyar', 0, 0, 0, NULL, NULL),
(38, 'hy', 'Armenian', 'Հայերեն', 0, 0, 0, NULL, NULL),
(39, 'indo', 'Indonesian', 'Bahasa Indonesia', 0, 0, 0, NULL, NULL),
(40, 'is', 'Icelandic', 'Íslenska', 0, 0, 0, NULL, NULL),
(41, 'it', 'Italian', 'Italiano', 0, 0, 0, NULL, NULL),
(42, 'ja', 'Japanese', '日本語', 0, 0, 0, NULL, NULL),
(43, 'ka', 'Georgian', 'ქართული', 0, 0, 0, NULL, NULL),
(44, 'kg', 'Kongo', 'KiKongo', 0, 0, 0, NULL, NULL),
(45, 'kk', 'Kazakh', 'Қазақша', 0, 0, 0, NULL, NULL),
(46, 'kl', 'Greenlandic', 'Kalaallisut', 0, 0, 0, NULL, NULL),
(47, 'km', 'Cambodian', 'ភាសាខ្មែរ', 0, 0, 0, NULL, NULL),
(48, 'ko', 'Korean', '한국어', 0, 0, 0, NULL, NULL),
(49, 'ku', 'Kurdish', 'Kurdî / كوردی', 1, 0, 0, NULL, NULL),
(50, 'ky', 'Kirghiz', 'Kırgızca / Кыргызча', 0, 0, 0, NULL, NULL),
(51, 'la', 'Latin', 'Latina', 0, 0, 0, NULL, NULL),
(52, 'lb', 'Luxembourgish', 'Lëtzebuergesch', 0, 0, 0, NULL, NULL),
(53, 'ln', 'Lingala', 'Lingála', 0, 0, 0, NULL, NULL),
(54, 'lo', 'Laotian', 'ລາວ / Pha xa lao', 0, 0, 0, NULL, NULL),
(55, 'lt', 'Lithuanian', 'Lietuvių', 0, 0, 0, NULL, NULL),
(56, 'lu', '', '', 0, 0, 0, NULL, NULL),
(57, 'lv', 'Latvian', 'Latviešu', 0, 0, 0, NULL, NULL),
(58, 'mg', 'Malagasy', 'Malagasy', 0, 0, 0, NULL, NULL),
(59, 'mh', 'Marshallese', 'Kajin Majel / Ebon', 0, 0, 0, NULL, NULL),
(60, 'mi', 'Maori', 'Māori', 0, 0, 0, NULL, NULL),
(61, 'mk', 'Macedonian', 'Македонски', 0, 0, 0, NULL, NULL),
(62, 'mn', 'Mongolian', 'Монгол', 0, 0, 0, NULL, NULL),
(63, 'ms', 'Malay', 'Bahasa Melayu', 0, 0, 0, NULL, NULL),
(64, 'mt', 'Maltese', 'bil-Malti', 0, 0, 0, NULL, NULL),
(65, 'my', 'Burmese', 'မြန်မာစာ', 0, 0, 0, NULL, NULL),
(66, 'na', 'Nauruan', 'Dorerin Naoero', 0, 0, 0, NULL, NULL),
(67, 'nb', '', '', 0, 0, 0, NULL, NULL),
(68, 'nd', 'North Ndebele', 'Sindebele', 0, 0, 0, NULL, NULL),
(69, 'ne', 'Nepali', 'नेपाली', 0, 0, 0, NULL, NULL),
(70, 'nl', 'Dutch', 'Nederlands', 0, 0, 0, NULL, NULL),
(71, 'nn', 'Norwegian Nynorsk', 'Norsk (nynorsk)', 0, 0, 0, NULL, NULL),
(72, 'no', 'Norwegian', 'Norsk (bokmål / riksmål)', 0, 0, 0, NULL, NULL),
(73, 'nr', 'South Ndebele', 'isiNdebele', 0, 0, 0, NULL, NULL),
(74, 'ny', 'Chichewa', 'Chi-Chewa', 0, 0, 0, NULL, NULL),
(75, 'oc', 'Occitan', 'Occitan', 0, 0, 0, NULL, NULL),
(76, 'pa', 'Panjabi / Punjabi', 'ਪੰਜਾਬੀ / पंजाबी / پنجابي', 0, 0, 0, NULL, NULL),
(77, 'pl', 'Polish', 'Polski', 0, 0, 0, NULL, NULL),
(78, 'ps', 'Pashto', 'پښتو', 1, 0, 0, NULL, NULL),
(79, 'pt', 'Portuguese', 'Português', 0, 0, 0, NULL, NULL),
(80, 'qu', 'Quechua', 'Runa Simi', 0, 0, 0, NULL, NULL),
(81, 'rn', 'Kirundi', 'Kirundi', 0, 0, 0, NULL, NULL),
(82, 'ro', 'Romanian', 'Română', 0, 0, 0, NULL, NULL),
(83, 'ru', 'Russian', 'Русский', 0, 0, 0, NULL, NULL),
(84, 'rw', 'Rwandi', 'Kinyarwandi', 0, 0, 0, NULL, NULL),
(85, 'sg', 'Sango', 'Sängö', 0, 0, 0, NULL, NULL),
(86, 'si', 'Sinhalese', 'සිංහල', 0, 0, 0, NULL, NULL),
(87, 'sk', 'Slovak', 'Slovenčina', 0, 0, 0, NULL, NULL),
(88, 'sl', 'Slovenian', 'Slovenščina', 0, 0, 0, NULL, NULL),
(89, 'sm', 'Samoan', 'Gagana Samoa', 0, 0, 0, NULL, NULL),
(90, 'sn', 'Shona', 'chiShona', 0, 0, 0, NULL, NULL),
(91, 'so', 'Somalia', 'Soomaaliga', 0, 0, 0, NULL, NULL),
(92, 'sq', 'Albanian', 'Shqip', 0, 0, 0, NULL, NULL),
(93, 'sr', 'Serbian', 'Српски', 0, 0, 0, NULL, NULL),
(94, 'ss', 'Swati', 'SiSwati', 0, 0, 0, NULL, NULL),
(95, 'st', 'Southern Sotho', 'Sesotho', 0, 0, 0, NULL, NULL),
(96, 'sv', 'Swedish', 'Svenska', 0, 0, 0, NULL, NULL),
(97, 'sw', 'Swahili', 'Kiswahili', 0, 0, 0, NULL, NULL),
(98, 'ta', 'Tamil', 'தமிழ்', 0, 0, 0, NULL, NULL),
(99, 'tg', 'Tajik', 'Тоҷикӣ', 0, 0, 0, NULL, NULL),
(100, 'th', 'Thai', 'ไทย / Phasa Thai', 0, 0, 0, NULL, NULL),
(101, 'ti', 'Tigrinya', 'ትግርኛ', 0, 0, 0, NULL, NULL),
(102, 'tk', 'Turkmen', 'Туркмен /تركمن ', 0, 0, 0, NULL, NULL),
(103, 'tn', 'Tswana', 'Setswana', 0, 0, 0, NULL, NULL),
(104, 'to', 'Tonga', 'Lea Faka-Tonga', 0, 0, 0, NULL, NULL),
(105, 'tr', 'Turkish', 'Türkçe', 0, 0, 0, NULL, NULL),
(106, 'ts', 'Tsonga', 'Xitsonga', 0, 0, 0, NULL, NULL),
(107, 'uk', 'Ukrainian', 'Українська', 0, 0, 0, NULL, NULL),
(108, 'ur', 'Urdu', 'اردو', 1, 0, 0, NULL, NULL),
(109, 'uz', 'Uzbek', 'Ўзбек', 0, 0, 0, NULL, NULL),
(110, 've', 'Venda', 'Tshivenḓa', 0, 0, 0, NULL, NULL),
(111, 'vi', 'Vietnamese', 'Tiếng Việt', 0, 0, 0, NULL, NULL),
(112, 'xh', 'Xhosa', 'isiXhosa', 0, 0, 0, NULL, NULL),
(113, 'zh', 'Chinese', '中文', 0, 0, 0, NULL, NULL),
(114, 'zu', 'Zulu', 'isiZulu', 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `language_phrases`
--

CREATE TABLE `language_phrases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED DEFAULT NULL,
  `page_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_phrases` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `es` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_defines`
--

CREATE TABLE `leave_defines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `leave_type_id` bigint(20) UNSIGNED NOT NULL,
  `total_days` int(11) NOT NULL DEFAULT 0,
  `max_forward` int(11) NOT NULL DEFAULT 0,
  `balance_forward` tinyint(1) NOT NULL DEFAULT 0,
  `adjusted` tinyint(1) NOT NULL DEFAULT 0,
  `year` year(4) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` tinyint(1) NOT NULL DEFAULT 0,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_activity`
--

INSERT INTO `log_activity` (`id`, `subject`, `type`, `url`, `method`, `ip`, `login`, `login_time`, `logout_time`, `agent`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'SOFT IT LTD - logged out at : 2021-08-16 19:08:22', 1, 'https://erp.softitltd.com/login', 'POST', '103.117.149.17', 1, '2021-08-16 18:59:36', '2021-08-16 19:08:22', 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-16 18:59:37', '2021-08-16 19:08:22'),
(2, 'Profile has been updated.', 1, 'https://erp.softitltd.com/profile-update/1', 'POST', '103.117.149.17', 0, NULL, NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-16 19:07:43', '2021-08-16 19:07:43'),
(3, 'SOFT IT LTD - logged in at : 2021-08-17 13:13:19', 1, 'https://erp.softitltd.com/login', 'POST', '103.117.149.18', 1, '2021-08-17 13:13:19', NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-17 13:13:20', '2021-08-17 13:13:20'),
(4, 'New Product - (1 ton ac) has been created.', 1, 'https://erp.softitltd.com/product/add_product', 'POST', '103.117.149.18', 0, NULL, NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-17 13:19:14', '2021-08-17 13:19:14'),
(5, 'Contact Added Successfully', 1, 'https://erp.softitltd.com/contact/add_contact', 'POST', '103.117.149.18', 0, NULL, NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-17 13:20:55', '2021-08-17 13:20:55'),
(6, 'Purchase Added Successfully with payment', 1, 'https://erp.softitltd.com/purchase/purchase_order', 'POST', '103.117.149.18', 0, NULL, NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-17 13:22:13', '2021-08-17 13:22:13'),
(7, 'Undefined offset: 1', 0, 'https://erp.softitltd.com/sale/product-modal-for-select', 'POST', '103.117.149.18', 0, NULL, NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-17 13:22:50', '2021-08-17 13:22:50'),
(8, 'Contact Added Successfully', 1, 'https://erp.softitltd.com/contact/add_contact', 'POST', '103.117.149.18', 0, NULL, NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-17 13:28:53', '2021-08-17 13:28:53'),
(9, 'Sale Added Successfully.', 1, 'https://erp.softitltd.com/sale/sale', 'POST', '103.117.149.18', 0, NULL, NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(10, 'SOFT IT LTD - logged in at : 2021-08-17 22:49:52', 1, 'https://erp.softitltd.com/login', 'POST', '202.134.14.151', 1, '2021-08-17 22:49:52', NULL, 'Facebook Messenger Lite-324-Unknown-iOS 14.6-iPhone 11 Pro Max', 1, '2021-08-17 22:49:53', '2021-08-17 22:49:53'),
(11, 'SOFT IT LTD - logged in at : 2021-08-19 13:44:39', 1, 'https://erp.softitltd.com/login', 'POST', '103.243.141.39', 1, '2021-08-19 13:44:39', NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-19 13:44:40', '2021-08-19 13:44:40'),
(12, 'SOFT IT LTD - logged in at : 2021-08-19 14:08:50', 1, 'https://erp.softitltd.com/login', 'POST', '203.95.221.1', 1, '2021-08-19 14:08:50', NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-19 14:08:51', '2021-08-19 14:08:51'),
(13, 'No query results for model [Modules\\Inventory\\Entities\\ShowRoom].', 0, 'https://erp.softitltd.com/home', 'GET', '103.203.93.173', 0, NULL, NULL, 'Chrome-92.0.4515-Blink-Windows 10-', 1, '2021-08-25 17:06:51', '2021-08-25 17:06:51'),
(14, 'SOFT IT LTD - logged in at : 2021-09-12 20:10:51', 1, 'http://erp.softitltd.com/login', 'POST', '37.111.204.209', 1, '2021-09-12 20:10:51', NULL, 'Samsung Browser-15-WebKit-Android 8-Galaxy S7 Edge', 1, '2021-09-12 20:10:51', '2021-09-12 20:10:51'),
(15, 'SOFT IT LTD - logged in at : 2021-10-09 21:44:54', 1, 'https://erp.softitltd.com/login', 'POST', '202.134.8.136', 1, '2021-10-09 21:44:54', NULL, 'Facebook Messenger Lite-333-Unknown-iOS 14.6-iPhone 11 Pro Max', 1, '2021-10-09 21:44:54', '2021-10-09 21:44:54'),
(16, 'SOFT IT LTD - logged in at : 2021-11-26 16:06:06', 1, 'https://erp.softitltd.com/login', 'POST', '103.117.149.27', 1, '2021-11-26 16:06:06', NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-11-26 15:06:07', '2021-11-26 15:06:07'),
(17, 'SOFT IT LTD - logged in at : 2021-11-27 19:27:23', 1, 'https://erp.softitltd.com/login', 'POST', '103.197.205.32', 1, '2021-11-27 19:27:23', NULL, 'Chrome Mobile-96.0.4664-Blink-Android 11-1920', 1, '2021-11-27 18:27:23', '2021-11-27 18:27:23'),
(18, 'SOFT IT LTD - logged in at : 2021-12-01 00:25:26', 1, 'http://erp.softitltd.com/login', 'POST', '103.117.149.27', 1, '2021-12-01 00:25:26', NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-11-30 23:25:26', '2021-11-30 23:25:26'),
(19, 'New Product - (chair) has been created.', 1, 'http://erp.softitltd.com/product/add_product', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-11-30 23:45:46', '2021-11-30 23:45:46'),
(20, 'Contact Added Successfully', 1, 'http://erp.softitltd.com/contact/add_contact', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-11-30 23:52:09', '2021-11-30 23:52:09'),
(21, 'Contact Added Successfully', 1, 'http://erp.softitltd.com/contact/add_contact', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-11-30 23:57:08', '2021-11-30 23:57:08'),
(22, 'Contact Added Successfully', 1, 'http://erp.softitltd.com/contact/add_contact', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-11-30 23:58:50', '2021-11-30 23:58:50'),
(23, 'Contact Deleted Successfully', 1, 'http://erp.softitltd.com/contact/add_contact/6/delete', 'GET', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-12-01 00:01:45', '2021-12-01 00:01:45'),
(24, 'Contact Added Successfully', 1, 'http://erp.softitltd.com/contact/add_contact', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-12-01 00:02:08', '2021-12-01 00:02:08'),
(25, 'Contact Updated Successfully', 1, 'http://erp.softitltd.com/contact/add_contact/7', 'PUT', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-12-01 00:02:38', '2021-12-01 00:02:38'),
(26, 'Purchase Added Successfully with payment', 1, 'http://erp.softitltd.com/purchase/purchase_order', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(27, 'Purchase Added Successfully without payment', 1, 'http://erp.softitltd.com/purchase/purchase-save-payments/1', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-12-01 00:05:28', '2021-12-01 00:05:28'),
(28, 'Sale Added Successfully.', 1, 'http://erp.softitltd.com/sale/sale', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(29, 'Sale Added Successfully.', 1, 'http://erp.softitltd.com/sale/sale', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(30, 'Sale Added Successfully.', 1, 'http://erp.softitltd.com/sale/sale', 'POST', '103.117.149.27', 0, NULL, NULL, 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-12-01 00:31:25', '2021-12-01 00:31:25'),
(31, 'SOFT IT LTD - logged out at : 2021-12-01 15:13:06', 1, 'https://erp.softitltd.com/login', 'POST', '103.117.149.22', 1, '2021-12-01 15:11:19', '2021-12-01 15:13:06', 'Chrome-96.0.4664-Blink-Windows 10-', 1, '2021-12-01 14:11:19', '2021-12-01 14:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_11_063308_create_intro_prefix_table', 1),
(5, '2020_07_11_161843_crate_table_currencie_table', 1),
(6, '2020_07_11_162112_create_language_table', 1),
(7, '2020_07_11_162546_create_selected_language_table', 1),
(8, '2020_07_12_044721_create_date_formats_table', 1),
(9, '2020_07_12_115528_create_language_phrases_table', 1),
(10, '2020_07_13_061051_create_timezone_table', 1),
(11, '2020_07_20_095501_create_permissions_tables', 1),
(12, '2020_07_20_095817_create_role_permission_tables', 1),
(13, '2020_09_01_120041_create_variants_table', 1),
(14, '2020_09_02_043711_create_unit_types_table', 1),
(15, '2020_09_02_052045_create_brands_table', 1),
(16, '2020_09_02_054852_create_business_settings_table', 1),
(17, '2020_09_02_064958_create_models_table', 1),
(18, '2020_09_02_084215_create_general_settings_table', 1),
(19, '2020_09_02_093954_create_categories_table', 1),
(20, '2020_09_03_084516_create_notifications_table', 1),
(21, '2020_09_03_115811_create_activity_log_table', 1),
(22, '2020_09_04_035253_create_variant_values_table', 1),
(23, '2020_09_07_093017_create_products_table', 1),
(24, '2020_09_07_093446_create_product_variations_table', 1),
(25, '2020_09_09_094459_create_sms_gateways_table', 1),
(26, '2020_09_09_120113_create_log_activity_table', 1),
(27, '2020_09_10_075009_create_roles_table', 1),
(28, '2020_09_10_093236_create_staffs_table', 1),
(29, '2020_09_11_082831_create_departments_table', 1),
(30, '2020_09_11_094754_create_contacts_table', 1),
(31, '2020_09_13_053041_create_chart_accounts_table', 1),
(32, '2020_09_13_090742_create_account_categories_table', 1),
(33, '2020_09_13_090843_create_account_configuration_category_table', 1),
(34, '2020_09_14_101704_create_ware_houses_table', 1),
(35, '2020_09_14_131911_create_transactions_table', 1),
(36, '2020_09_14_132128_create_vouchers_table', 1),
(37, '2020_09_15_094822_create_taxes_table', 1),
(38, '2020_09_15_103812_create_tranaction_account_table', 1),
(39, '2020_09_16_114526_create_purchase_orders_table', 1),
(40, '2020_09_17_041005_create_documents_table', 1),
(41, '2020_09_17_052417_create_product_item_details_table', 1),
(42, '2020_09_18_055314_create_c_n_fs_table', 1),
(43, '2020_09_22_051736_create_coupons_table', 1),
(44, '2020_09_22_070849_create_leave_types_table', 1),
(45, '2020_09_22_072102_create_leave_defines_table', 1),
(46, '2020_09_22_115817_create_apply_leaves_table', 1),
(47, '2020_09_23_053724_create_sales_table', 1),
(48, '2020_09_23_092712_create_attendances_table', 1),
(49, '2020_09_24_050714_create_payments_table', 1),
(50, '2020_09_24_124617_create_payrolls_table', 1),
(51, '2020_09_24_124844_create_payroll_earn_deducs_table', 1),
(52, '2020_09_25_083718_create_stock_transfers_table', 1),
(53, '2020_09_27_051835_create_staff_documents_table', 1),
(54, '2020_09_29_023615_create_show_rooms_table', 1),
(55, '2020_09_30_071854_create_apply_loans_table', 1),
(56, '2020_09_30_073201_create_shippings_table', 1),
(57, '2020_10_01_102136_create_quotations_table', 1),
(58, '2020_10_02_034421_create_product_sku_table', 1),
(59, '2020_10_02_125012_create_combo_products_table', 1),
(60, '2020_10_05_034531_create_combo_product_details_table', 1),
(61, '2020_10_07_123200_create_product_histories_table', 1),
(62, '2020_10_09_120554_create_stock_reports_table', 1),
(63, '2020_10_11_124005_create_stock_adjustments_table', 1),
(64, '2020_10_12_071456_create_stock_adjustment_products_table', 1),
(65, '2020_10_12_071604_create_printers_table', 1),
(66, '2020_10_19_072410_create_time_period_accounts_table', 1),
(67, '2020_10_19_072749_create_opening_balance_histories_table', 1),
(68, '2020_10_27_121055_create_expenses_table', 1),
(69, '2020_10_28_053034_create_suggest_lists_table', 1),
(70, '2020_11_07_100402_create_type_opening_balances_table', 1),
(71, '2020_11_18_095356_create_cost_of_goods_histories_table', 1),
(72, '2020_11_26_174602_create_holidays_table', 1),
(73, '2020_12_07_103420_create_events_table', 1),
(74, '2020_12_07_135925_create_to_dos_table', 1),
(75, '2020_12_17_133916_create_incomes_table', 1),
(76, '2020_12_18_115454_modify_general_settings_table', 1),
(77, '2020_12_18_170411_modify_users_table', 1),
(78, '2020_12_21_135117_create_bank_accounts_table', 1),
(79, '2020_12_29_162406_add_cnf_no_cnf_agent_name_table', 1),
(80, '2020_12_30_104159_create_workspaces_table', 1),
(81, '2020_12_30_104458_modify_workspaces_users_table', 1),
(82, '2020_12_31_064638_create_teams_table', 1),
(83, '2021_01_03_043716_create_team_user_table', 1),
(84, '2021_01_04_124445_create_projects_table', 1),
(85, '2021_01_04_184447_min_selling_price_to_product_sku_table', 1),
(86, '2021_01_04_190359_min_selling_price_to_combo_products_table', 1),
(87, '2021_01_05_083633_create_project_user_table', 1),
(88, '2021_01_05_152836_create_part_numbers_table', 1),
(89, '2021_01_05_171150_add_signature_field_table', 1),
(90, '2021_01_05_184840_create_receive_products_table', 1),
(91, '2021_01_06_130616_create_product_item_details_part_numbers_table', 1),
(92, '2021_01_09_163011_create_email_templates_table', 1),
(93, '2021_01_10_140928_create_countries_table', 1),
(94, '2021_01_12_065025_create_sections_table', 1),
(95, '2021_01_12_065037_create_tasks_table', 1),
(96, '2021_01_12_085103_create_fields_table', 1),
(97, '2021_01_12_085115_create_tags_table', 1),
(98, '2021_01_12_104704_create_field_options_table', 1),
(99, '2021_01_12_114101_create_tag_task_table', 1),
(100, '2021_01_12_114857_create_task_dependencies_table', 1),
(101, '2021_01_12_122401_create_project_task_table', 1),
(102, '2021_01_12_132932_create_field_task_table', 1),
(103, '2021_01_13_105602_create_field_project_table', 1),
(104, '2021_02_01_082534_create_uploads_table', 1),
(105, '2021_02_02_093303_create_task_comments_table', 1),
(106, '2021_02_02_094353_create_task_comment_likes_table', 1),
(107, '2021_02_02_094428_create_task_likes_table', 1),
(108, '2021_02_16_160442_create_project_comments_table', 1),
(109, '2021_02_22_153618_create_payment_gateways_table', 1),
(110, '2021_02_23_200517_general_setting_add_column', 1),
(111, '2021_02_28_121144_create_version_histories_table', 1),
(112, '2021_03_09_155454_create_product_selling_price_histories_table', 1),
(113, '2021_03_09_173005_add_selling_price_product_item_details_table', 1),
(114, '2021_04_28_124129_add_column_to_settings_table', 1),
(115, '2021_05_02_100430_modify_email_tempates_table', 1),
(116, '2021_05_03_155307_create_colors_table', 1),
(117, '2021_05_03_155358_create_themes_table', 1),
(118, '2021_05_03_155409_create_color_themes_table', 1),
(119, '2021_05_06_144230_remove_setup_permissions_to_setting_permission', 1),
(120, '2021_05_11_091449_remove_email_templates_row', 1),
(121, '2021_05_17_113132_add_used_column_to_variant_values_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `name`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '2017', NULL, 1, 1, NULL, '2021-08-17 13:17:45', '2021-08-17 13:17:45'),
(2, '2021', NULL, 1, 1, NULL, '2021-11-30 23:44:55', '2021-11-30 23:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opening_balance_histories`
--

CREATE TABLE `opening_balance_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `acc_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `part_numbers`
--

CREATE TABLE `part_numbers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_item_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seiral_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sold` tinyint(1) NOT NULL DEFAULT 0,
  `is_returned` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payable_id` bigint(20) UNSIGNED NOT NULL,
  `payable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `advance_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_owner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `initial_payment` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payable_id`, `payable_type`, `payment_method`, `account_id`, `amount`, `advance_amount`, `bank_name`, `branch`, `account_no`, `account_owner`, `card_type`, `card_number`, `card_holder`, `expiry_date`, `security_code`, `return_amount`, `initial_payment`, `created_at`, `updated_at`) VALUES
(1, 1, 'Modules\\Sale\\Entities\\Sale', 'cash', 0, 52500.00, 0.00, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 0.00, 1, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(2, 3, 'Modules\\Purchase\\Entities\\PurchaseOrder', 'cash', 0, 38000.00, 0.00, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 0.00, 0, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(3, 1, 'Modules\\Purchase\\Entities\\PurchaseOrder', 'cash', 0, 350000.00, 0.00, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 0.00, 0, '2021-12-01 00:05:28', '2021-12-01 00:05:28'),
(4, 2, 'Modules\\Sale\\Entities\\Sale', 'cash', 0, 15750.00, 0.00, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 0.00, 1, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(5, 3, 'Modules\\Sale\\Entities\\Sale', 'cash', 0, 5000.00, 0.00, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 0.00, 1, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(6, 4, 'Modules\\Sale\\Entities\\Sale', 'cash', 0, 1000.00, 0.00, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 0.00, 1, '2021-12-01 00:31:25', '2021-12-01 00:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_publisher_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_private_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT 1,
  `bank_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT 1,
  `updated_by` int(10) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `gateway_name`, `gateway_username`, `gateway_password`, `gateway_signature`, `gateway_client_id`, `gateway_mode`, `gateway_api_key`, `gateway_secret_key`, `gateway_publisher_key`, `gateway_private_key`, `redirect_url`, `active_status`, `bank_details`, `cheque_details`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Stripe', 'demo@strip.com', '12334589', NULL, '', NULL, 'pk_test_51HCgdXH0fV5JGUSf9sz1ksFaT4FfpTz1xuHmpaV6MmXvbBg7H10H5VgvvfzMiGtUF3EJP4PpinVFXJWZtuDO0QQn005EkhlFtC', 'sk_test_51HCgdXH0fV5JGUSfiNBoJUpDC9hYFff56A31nRD4fOVLqg0Fl2jm4b9xX70XQbEsEvFGRzEPIHkfINKecazqPOhF003WSV0dHc', NULL, NULL, 'http://uxseven.com/infixbio', 1, NULL, NULL, 1, 1, '2021-08-16 06:58:37', NULL),
(2, 'Paypal', 'demo@paypal.com', '12334589', NULL, '', NULL, 'Ab7PORaM7Qu7mQlumVUZn3-HlSFHJks1pcnxnrCALoMiRs0NyrHg02JwbHMf2tsfV_jy1ziLzv5CdB3G', 'EKtbarnhCk46f0fSrYPrzs89I3dd9ZeUCyGIguy0mfuLcrrwOp0KHcRtKvCi3T0OR2r35plQv76h5L7p', NULL, NULL, 'http://uxseven.com/infixbio', 1, NULL, NULL, 1, 1, '2021-08-16 06:58:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `basic_salary` double(16,2) DEFAULT NULL,
  `total_earning` double(16,2) DEFAULT NULL,
  `total_deduction` double(16,2) DEFAULT NULL,
  `gross_salary` double(16,2) DEFAULT NULL,
  `tax` double(16,2) DEFAULT NULL,
  `net_salary` double(16,2) DEFAULT NULL,
  `payroll_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payroll_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payroll_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NG for not generated, G for generated, P for paid',
  `payment_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `note` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_earn_deducs`
--

CREATE TABLE `payroll_earn_deducs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `earn_dedc_type` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'e for earnings and d for deductions',
  `active_status` tinyint(4) NOT NULL DEFAULT 1,
  `loan_status` tinyint(4) NOT NULL DEFAULT 0,
  `payroll_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `type` int(11) DEFAULT NULL COMMENT '1 for main menu, 2 for sub menu , 3 action',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `parent_id`, `name`, `route`, `status`, `created_by`, `updated_by`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Dashboard', 'dashboard', 1, 1, 1, 1, NULL, NULL),
(400, 22, NULL, 'Project Management', 'project', 1, 1, 1, 1, NULL, NULL),
(346, 1, 1, 'Widgets', 'widget', 1, 1, 1, 2, NULL, NULL),
(347, 1, 346, 'Total Purchase', 'widget.total_purchase', 1, 1, 1, 3, NULL, NULL),
(348, 1, 346, 'Total Sale', 'widget.total_sale', 1, 1, 1, 3, NULL, NULL),
(349, 1, 346, 'Expense', 'widget.expense', 1, 1, 1, 3, NULL, NULL),
(350, 1, 346, 'Purchase Due', 'widget.purchase_due', 1, 1, 1, 3, NULL, NULL),
(351, 1, 346, 'Invoice Due', 'widget.invoice_due', 1, 1, 1, 3, NULL, NULL),
(352, 1, 346, 'Total in Bank', 'widget.total_in_bank', 1, 1, 1, 3, NULL, NULL),
(353, 1, 346, 'Total in Cash', 'widget.total_in_cash', 1, 1, 1, 3, NULL, NULL),
(354, 1, 346, 'Net Profit', 'widget.net_profit', 1, 1, 1, 3, NULL, NULL),
(355, 1, 1, 'Sale Statistics', 'sale_statistics', 1, 1, 1, 2, NULL, NULL),
(356, 1, 1, 'Profit Statistics', 'profit_statistics', 1, 1, 1, 2, NULL, NULL),
(357, 1, 1, 'Recent Activity', 'recent_activity', 1, 1, 1, 2, NULL, NULL),
(358, 1, 1, 'Branch Wise Product Quantity', 'showroom_wise_product_qty', 1, 1, 1, 2, NULL, NULL),
(359, 1, 1, 'Payment Due List', 'payment_due_list', 1, 1, 1, 2, NULL, NULL),
(360, 1, 1, 'Stock Alert List', 'stock_alert_list', 1, 1, 1, 2, NULL, NULL),
(361, 1, 1, 'To Do List', 'to_do_list', 1, 1, 1, 2, NULL, NULL),
(2, 2, NULL, 'Product', '', 1, 1, 1, 1, NULL, NULL),
(3, 2, 2, 'Variant', 'variant.index', 1, 1, 1, 2, NULL, NULL),
(4, 2, 3, 'Variant Add', 'variant.store', 1, 1, 1, 3, NULL, NULL),
(5, 2, 3, 'Variant Edit', 'variant.edit', 1, 1, 1, 3, NULL, NULL),
(6, 2, 3, 'Variant Delete', 'variant.delete', 1, 1, 1, 3, NULL, NULL),
(7, 2, 3, 'Variant Show', 'variant.show', 1, 1, 1, 3, NULL, NULL),
(8, 2, 3, 'Variation list', 'variation_list', 1, 1, 1, 3, NULL, NULL),
(9, 2, 3, 'Variant with values', 'variant_with_values', 1, 1, 1, 3, NULL, NULL),
(10, 2, 2, 'Unit Type', 'unit_type.index', 1, 1, 1, 2, NULL, NULL),
(11, 2, 10, 'Unit Type Add', 'unit_type.store', 1, 1, 1, 3, NULL, NULL),
(12, 2, 10, 'Unit Type Edit', 'unit_type.edit', 1, 1, 1, 3, NULL, NULL),
(13, 2, 10, 'Unit Type Delete', 'unit_type.delete', 1, 1, 1, 3, NULL, NULL),
(14, 2, 10, 'Unit Type Show', 'unit_type.show', 1, 1, 1, 3, NULL, NULL),
(15, 2, 2, 'Brand', 'brand.index', 1, 1, 1, 2, NULL, NULL),
(16, 2, 15, 'Brand Add', 'brand.store', 1, 1, 1, 3, NULL, NULL),
(17, 2, 15, 'Brand Edit', 'brand.edit', 1, 1, 1, 3, NULL, NULL),
(18, 2, 15, 'Brand Delete', 'brand.delete', 1, 1, 1, 3, NULL, NULL),
(19, 2, 15, 'Brand Show', 'brand.show', 1, 1, 1, 3, NULL, NULL),
(20, 2, 2, 'Model', 'model.index', 1, 1, 1, 2, NULL, NULL),
(21, 2, 20, 'Add Model', 'model.store', 1, 1, 1, 3, NULL, NULL),
(22, 2, 20, 'Edit', 'model.edit', 1, 1, 1, 3, NULL, NULL),
(23, 2, 20, 'Delete', 'model.delete', 1, 1, 1, 3, NULL, NULL),
(24, 2, 20, 'Show', 'model.show', 1, 1, 1, 3, NULL, NULL),
(31, 2, 2, 'Category', 'category.index', 1, 1, 1, 2, NULL, NULL),
(32, 2, 31, 'Add Category', 'category.store', 1, 1, 1, 3, NULL, NULL),
(33, 2, 31, 'Edit', 'category.edit', 1, 1, 1, 3, NULL, NULL),
(34, 2, 31, 'Delete', 'category.delete', 1, 1, 1, 3, NULL, NULL),
(35, 2, 31, 'Show', 'category.show', 1, 1, 1, 3, NULL, NULL),
(36, 2, 31, 'Category Parent', 'category.parent', 1, 1, 1, 3, NULL, NULL),
(37, 2, 2, 'Product', 'add_product.index', 1, 1, 1, 2, NULL, NULL),
(38, 2, 37, 'Add Product', 'add_product.store', 1, 1, 1, 3, NULL, NULL),
(39, 2, 37, 'Edit', 'add_product.edit', 1, 1, 1, 3, NULL, NULL),
(40, 2, 37, 'Delete', 'add_product.delete', 1, 1, 1, 3, NULL, NULL),
(41, 2, 37, 'Show', 'add_product.show', 1, 1, 1, 3, NULL, NULL),
(42, 2, 37, 'Category wise subcategory', 'category_wise_subcategory', 1, 1, 1, 3, NULL, NULL),
(43, 2, 37, 'Search', 'add_product.search_index', 1, 1, 1, 3, NULL, NULL),
(44, 2, 37, 'Destroy', 'add_product.destroy', 1, 1, 1, 3, NULL, NULL),
(45, 2, 37, 'Edit Combo', 'add_product.editCombo', 1, 1, 1, 3, NULL, NULL),
(46, 2, 37, 'Details', 'add_product.product_Detail', 1, 1, 1, 3, NULL, NULL),
(47, 2, 37, 'Combo Delete', 'combo_product.destroy', 1, 1, 1, 3, NULL, NULL),
(48, 2, 37, 'Update Active Status', 'add_product.update_active_status', 1, 1, 1, 3, NULL, NULL),
(49, 2, 37, 'Product Sku', 'product_sku.get_product_price', 1, 1, 1, 3, NULL, NULL),
(61, 3, NULL, 'Activity Log', 'activity_log', 1, 1, 1, 1, NULL, NULL),
(62, 4, NULL, 'Backup', 'backup.index', 1, 1, 1, 1, NULL, NULL),
(63, 4, 62, 'Create', 'backup.create', 1, 1, 1, 2, NULL, NULL),
(64, 4, 62, 'Delete', 'backup.delete', 1, 1, 1, 2, NULL, NULL),
(66, 5, NULL, 'Settings', 'setting.index', 1, 1, 1, 1, NULL, NULL),
(67, 5, 66, 'Update Activation Status', 'update_activation_status', 1, 1, 1, 2, NULL, NULL),
(68, 5, 66, 'Update Company Information', 'company_information_update', 1, 1, 1, 2, NULL, NULL),
(69, 5, 66, 'Sms gateway credentials update', 'sms_gateway_credentials_update', 1, 1, 1, 2, NULL, NULL),
(70, 5, 66, 'Email gateway credentials update', 'smtp_gateway_credentials_update', 1, 1, 1, 2, NULL, NULL),
(71, 5, 66, 'Test SMS', 'sms_send_demo', 1, 1, 1, 2, NULL, NULL),
(72, 5, 66, 'Test Mail', 'test_mail.send', 1, 1, 1, 2, NULL, NULL),
(720, 5, 66, 'Payment Method Settings', 'payment-method-settings', 1, 1, 1, 2, NULL, NULL),
(721, 5, 66, 'System Update', 'setting.updatesystem', 1, 1, 1, 2, NULL, NULL),
(722, 5, 66, 'General Setting', 'general_settings.index', 1, 1, 1, 2, NULL, NULL),
(723, 5, 66, 'Invoice Setting', 'invoice_settings.index', 1, 1, 1, 2, NULL, NULL),
(724, 5, 66, 'Email Template', 'email_template.index', 1, 1, 1, 2, NULL, NULL),
(725, 5, 66, 'Sms Template', 'sms_template.index', 1, 1, 1, 2, NULL, NULL),
(74, 7, 73, 'Country', 'country.index', 1, 1, 1, 2, NULL, NULL),
(89, 7, 66, 'Tax', 'tax.index', 1, 1, 1, 2, NULL, '2021-08-16 18:58:38'),
(90, 7, 89, 'Add Tax', 'tax.store', 1, 1, 1, 3, NULL, NULL),
(91, 7, 89, 'Edit', 'tax.edit', 1, 1, 1, 3, NULL, NULL),
(92, 7, 89, 'Delete', 'tax.destroy', 1, 1, 1, 3, NULL, NULL),
(93, 7, 89, 'Show', 'tax.show', 1, 1, 1, 3, NULL, NULL),
(94, 7, 89, 'Change Status', 'tax.update_active_status', 1, 1, 1, 3, NULL, NULL),
(95, 7, 66, 'Intro Prefix', 'introPrefix.index', 1, 1, 1, 2, NULL, '2021-08-16 18:58:38'),
(96, 7, 95, 'Add Intro Prefix', 'introPrefix.store', 1, 1, 1, 3, NULL, NULL),
(97, 7, 95, 'Edit', 'introPrefix.edit', 1, 1, 1, 3, NULL, NULL),
(98, 7, 95, 'Delete', 'introPrefix.destroy', 1, 1, 1, 3, NULL, NULL),
(99, 7, 95, 'Show', 'introPrefix.show', 1, 1, 1, 3, NULL, NULL),
(100, 7, 95, 'Search', 'introPrefix.search_index', 1, 1, 1, 3, NULL, NULL),
(106, 7, 66, 'Currencies', 'currencies.index', 1, 1, 1, 2, NULL, '2021-08-16 18:58:38'),
(107, 7, 106, 'Add Currencies', 'currencies.store', 1, 1, 1, 3, NULL, NULL),
(108, 7, 106, 'Edit', 'currencies.edit', 1, 1, 1, 3, NULL, NULL),
(109, 7, 106, 'Delete', 'currencies.delete', 1, 1, 1, 3, NULL, NULL),
(110, 7, 106, 'Show', 'currencies.show', 1, 1, 1, 3, NULL, NULL),
(111, 7, 66, 'Language', 'languages.index', 1, 1, 1, 2, NULL, '2021-08-16 18:58:38'),
(112, 7, 111, 'Add', 'languages.store', 1, 1, 1, 3, NULL, NULL),
(113, 7, 111, 'Edit', 'languages.edit', 1, 1, 1, 3, NULL, NULL),
(114, 7, 111, 'Delete', 'languages.destroy', 1, 1, 1, 3, NULL, NULL),
(115, 7, 111, 'Show', 'language.translate_view', 1, 1, 1, 3, NULL, NULL),
(116, 7, 111, 'Change Status', 'languages.update_active_status', 1, 1, 1, 3, NULL, NULL),
(117, 7, 111, 'Change', 'language.change', 1, 1, 1, 3, NULL, NULL),
(163, 9, NULL, 'Contact', 'contact', 1, 1, 1, 1, NULL, NULL),
(164, 9, 163, 'Customer List', 'customer', 1, 1, 1, 2, NULL, NULL),
(165, 9, 163, 'Supplier List', 'supplier', 1, 1, 1, 2, NULL, NULL),
(166, 9, 163, 'Contact', 'add_contact.index', 1, 1, 1, 2, NULL, NULL),
(167, 9, 166, 'Edit', 'add_contact.edit', 1, 1, 1, 3, NULL, NULL),
(168, 9, 166, 'Delete', 'add_contact.destroy', 1, 1, 1, 3, NULL, NULL),
(169, 9, 166, 'Add', 'add_contact.store', 1, 1, 1, 3, NULL, NULL),
(169, 9, 167, 'Settings', 'contact.settings', 1, 1, 1, 3, NULL, NULL),
(170, 10, NULL, 'Leave', 'leave', 1, 1, 1, 1, NULL, NULL),
(171, 10, 170, 'Leave Define', 'leave_define.index', 1, 1, 1, 2, NULL, NULL),
(172, 10, 171, 'Add', 'leave_define.store', 1, 1, 1, 3, NULL, NULL),
(173, 10, 171, 'Edit', 'leave_define.edit', 1, 1, 1, 3, NULL, NULL),
(174, 10, 171, 'Delete', 'leave_define.delete', 1, 1, 1, 3, NULL, NULL),
(175, 10, 171, 'Approve', 'approved_index', 1, 1, 1, 3, NULL, NULL),
(176, 10, 171, 'Set Approval', 'set_approval_leave', 1, 1, 1, 3, NULL, NULL),
(324, 10, 171, 'Pending Leave', 'pending_index', 1, 1, 1, 3, NULL, NULL),
(325, 10, 171, 'Apply Leave', 'apply_leave.index', 1, 1, 1, 3, NULL, NULL),
(326, 10, 171, 'Carry Forward', 'carry.forward', 1, 1, 1, 3, NULL, NULL),
(177, 11, NULL, 'Human Resource', 'human_resource', 1, 1, 1, 1, NULL, NULL),
(178, 11, 177, 'Staffs', 'staffs.index', 1, 1, 1, 2, NULL, NULL),
(179, 11, 178, 'Add Staffs', 'staffs.store', 1, 1, 1, 3, NULL, NULL),
(180, 11, 178, 'Edit', 'staffs.edit', 1, 1, 1, 3, NULL, NULL),
(181, 11, 178, 'Delete', 'staffs.destroy', 1, 1, 1, 3, NULL, NULL),
(182, 11, 178, 'Update Status', 'staffs.update_active_status', 1, 1, 1, 3, NULL, NULL),
(183, 11, 178, 'View', 'staffs.view', 1, 1, 1, 3, NULL, NULL),
(184, 11, 177, 'Department', 'departments.index', 1, 1, 1, 2, NULL, NULL),
(185, 11, 184, 'Add Department', 'departments.store', 1, 1, 1, 3, NULL, NULL),
(186, 11, 184, 'Edit', 'departments.edit', 1, 1, 1, 3, NULL, NULL),
(187, 11, 184, 'Delete', 'departments.delete', 1, 1, 1, 3, NULL, NULL),
(188, 11, 177, 'Attendance Report', 'attendance_report.index', 1, 1, 1, 2, NULL, NULL),
(189, 11, 177, 'Attendance', 'attendances.index', 1, 1, 1, 2, NULL, NULL),
(190, 11, 189, 'Add', 'attendances.store', 1, 1, 1, 3, NULL, NULL),
(191, 11, 177, 'Payroll', 'payroll.index', 1, 1, 1, 2, NULL, NULL),
(192, 11, 191, 'Payroll Report', 'payroll_reports.index', 1, 1, 1, 2, NULL, NULL),
(193, 11, 177, 'Loan Approval', 'apply_loans.loan_approval_index', 1, 1, 1, 2, NULL, NULL),
(194, 11, 193, 'Approve Loan', 'set_approval_applied_loan', 1, 1, 1, 3, NULL, NULL),
(338, 11, 193, 'Loan Apply Index', 'apply_loans.index', 1, 1, 1, 3, NULL, NULL),
(339, 11, 193, 'Loan History', 'apply_loans.history', 1, 1, 1, 3, NULL, NULL),
(195, 11, 177, 'Role', 'permission.roles.index', 1, 1, 1, 2, NULL, NULL),
(196, 11, 195, 'Add', 'permission.roles.store', 1, 1, 1, 3, NULL, NULL),
(197, 11, 195, 'Edit', 'permission.roles.edit', 1, 1, 1, 3, NULL, NULL),
(198, 11, 195, 'Delete', 'permission.roles.destroy', 1, 1, 1, 3, NULL, NULL),
(199, 11, 177, 'Permission', 'permission.permissions.index', 1, 1, 1, 2, NULL, NULL),
(200, 11, 199, 'Add', 'permission.permissions.create', 1, 1, 1, 3, NULL, NULL),
(201, 11, 199, 'Edit', 'permission.permissions.edit', 1, 1, 1, 3, NULL, NULL),
(202, 11, 199, 'Delete', 'permission.permissions.destroy', 1, 1, 1, 3, NULL, NULL),
(203, 10, 170, 'Leave Type', 'leave_types.index', 1, 1, 1, 2, NULL, NULL),
(204, 10, 203, 'Add', 'leave_types.store', 1, 1, 1, 3, NULL, NULL),
(205, 10, 203, 'Edit', 'leave_types.edit', 1, 1, 1, 3, NULL, NULL),
(206, 10, 203, 'Delete', 'leave_types.delete', 1, 1, 1, 3, NULL, NULL),
(217, 13, NULL, 'Purchase', 'purchase', 1, 1, 1, 1, NULL, NULL),
(218, 13, 217, 'Purchase Order', 'purchase_order.index', 1, 1, 1, 2, NULL, NULL),
(219, 13, 218, 'Add Purchase Order', 'purchase_order.store', 1, 1, 1, 3, NULL, NULL),
(220, 13, 218, 'Edit', 'purchase_order.edit', 1, 1, 1, 3, NULL, NULL),
(221, 13, 218, 'Delete', 'purchase.order.destroy', 1, 1, 1, 3, NULL, NULL),
(222, 13, 218, 'show', 'purchase_order.show', 1, 1, 1, 3, NULL, NULL),
(223, 13, 217, 'Purchase Return', 'purchase.return.index', 1, 1, 1, 2, NULL, NULL),
(224, 13, 223, 'Approve', 'return.purchase.approve', 1, 1, 1, 3, NULL, NULL),
(225, 13, NULL, 'Sale', 'sale', 1, 1, 1, 1, NULL, NULL),
(226, 13, 225, 'Sale', 'sale.index', 1, 1, 1, 2, NULL, NULL),
(227, 13, 226, 'Add Sale', 'sale.store', 1, 1, 1, 3, NULL, NULL),
(228, 13, 226, 'Edit', 'sale.edit', 1, 1, 1, 3, NULL, NULL),
(229, 13, 226, 'Delete', 'sale.delete', 1, 1, 1, 3, NULL, NULL),
(230, 13, 226, 'Show', 'sale.show', 1, 1, 1, 3, NULL, NULL),
(342, 13, 226, 'Sale Return', 'sale.return', 1, 1, 1, 3, NULL, NULL),
(343, 13, 226, 'Approval', 'conditional.sale.approve', 1, 1, 1, 3, NULL, NULL),
(344, 13, 226, 'Return Approval', 'return.sale.approve', 1, 1, 1, 3, NULL, NULL),
(231, 13, 225, 'Sale Return', 'sale.return.index', 1, 1, 1, 2, NULL, NULL),
(232, 14, NULL, 'Inventory', 'inventory', 1, 1, 1, 1, NULL, NULL),
(318, 14, 232, 'Openning Stock', 'add_opening_stock_create', 1, 1, 1, 2, NULL, NULL),
(319, 14, 318, 'Openning Stock Add', 'add_opening_stock_create', 1, 1, 1, 3, NULL, NULL),
(320, 14, 232, 'Recieve Purchase Product', 'purchase_order.recieve.index', 1, 1, 1, 2, NULL, NULL),
(321, 14, 320, 'Recieve Purchase Product', 'purchase.add.stock', 1, 1, 1, 3, NULL, NULL),
(322, 14, 232, 'Cost of Goods Sold', 'purchase_order.cost_of_goods.index', 1, 1, 1, 2, NULL, NULL),
(323, 14, 322, 'History Index', 'purchase_order.cost_of_goods.index', 1, 1, 1, 3, NULL, NULL),
(233, 14, 232, 'Stock Transfar', 'stock-transfer.index', 1, 1, 1, 2, NULL, NULL),
(234, 14, 233, 'Add Stock Transfar', 'stock-transfer.store', 1, 1, 1, 3, NULL, NULL),
(235, 14, 233, 'Edit', 'stock-transfer.edit', 1, 1, 1, 3, NULL, NULL),
(236, 14, 233, 'Delete', 'stock-transfer.delete', 1, 1, 1, 3, NULL, NULL),
(237, 14, 233, 'Show', 'stock-transfer.show', 1, 1, 1, 3, NULL, NULL),
(238, 14, 233, 'Status Change', 'stock-transfer.status', 1, 1, 1, 3, NULL, NULL),
(340, 14, 233, 'Stock Sent Approval', 'stock-transfer.sent', 1, 1, 1, 3, NULL, NULL),
(341, 14, 233, 'Transfered stock Recieve', 'stock-transfer.receive', 1, 1, 1, 3, NULL, NULL),
(239, 14, 232, 'Stock List', 'stock.report', 1, 1, 1, 2, NULL, NULL),
(248, 14, 232, 'Stock adjustment', 'stock_adjustment.index', 1, 1, 1, 2, NULL, NULL),
(249, 14, 248, 'Add Stock adjustment', 'stock_adjustment.store', 1, 1, 1, 3, NULL, NULL),
(250, 14, 248, 'Edit', 'stock_adjustment.edit', 1, 1, 1, 3, NULL, NULL),
(251, 14, 248, 'Delete', 'stock_adjustment.destroy', 1, 1, 1, 3, NULL, NULL),
(252, 14, 248, 'Show', 'stock_adjustment.show', 1, 1, 1, 3, NULL, NULL),
(253, 14, 248, 'Approve', 'stock_adjustment.approve', 1, 1, 1, 3, NULL, NULL),
(254, 15, NULL, 'Quotation', 'quotation', 1, 1, 1, 1, NULL, NULL),
(255, 15, 254, 'Quotation', 'quotation.index', 1, 1, 1, 2, NULL, NULL),
(256, 15, 255, 'Add Quotation', 'quotation.store', 1, 1, 1, 3, NULL, NULL),
(257, 15, 255, 'Edit', 'quotation.edit', 1, 1, 1, 3, NULL, NULL),
(258, 15, 255, 'Delete', 'quotation.delete', 1, 1, 1, 3, NULL, NULL),
(289, 15, 255, 'Show', 'quotation.show', 1, 1, 1, 3, NULL, NULL),
(264, 18, NULL, 'Account', 'accounts', 1, 1, 1, 1, NULL, NULL),
(289, 18, 264, 'Expense', 'expenses.index', 1, 1, 1, 2, NULL, NULL),
(290, 18, 289, 'Create Expense', 'expenses.create', 1, 1, 1, 3, NULL, NULL),
(291, 18, 289, 'Add', 'expenses.store', 1, 1, 1, 3, NULL, NULL),
(292, 18, 289, 'Edit', 'expenses.edit', 1, 1, 1, 3, NULL, NULL),
(293, 18, 289, 'Delete', 'expenses.delete', 1, 1, 1, 3, NULL, NULL),
(294, 18, 289, 'Show', 'expenses.show', 1, 1, 1, 3, NULL, NULL),
(295, 18, 264, 'Income', 'income.index', 1, 1, 1, 2, NULL, NULL),
(296, 18, 295, 'Create Income', 'income.create', 1, 1, 1, 3, NULL, NULL),
(297, 18, 295, 'Add', 'income.store', 1, 1, 1, 3, NULL, NULL),
(298, 18, 295, 'Edit', 'income.edit', 1, 1, 1, 3, NULL, NULL),
(299, 18, 295, 'Delete', 'income.delete', 1, 1, 1, 3, NULL, NULL),
(300, 18, 295, 'Show', 'income.show', 1, 1, 1, 3, NULL, NULL),
(301, 18, 264, 'Bank Account', 'bank_accounts.index', 1, 1, 1, 2, NULL, NULL),
(302, 18, 301, 'Create Bank', 'bank_accounts.create', 1, 1, 1, 3, NULL, NULL),
(303, 18, 301, 'Add', 'bank_accounts.store', 1, 1, 1, 3, NULL, NULL),
(304, 18, 301, 'Edit', 'bank_accounts.edit', 1, 1, 1, 3, NULL, NULL),
(305, 18, 301, 'Delete', 'bank_accounts.delete', 1, 1, 1, 3, NULL, NULL),
(306, 18, 301, 'Show', 'bank_accounts.show', 1, 1, 1, 3, NULL, NULL),
(307, 18, 264, 'Opening Balance', 'openning_balance.index', 1, 1, 1, 2, NULL, NULL),
(308, 18, 307, 'Create Opening Balance', 'openning_balance.create', 1, 1, 1, 3, NULL, NULL),
(309, 18, 307, 'Add', 'openning_balance.store', 1, 1, 1, 3, NULL, NULL),
(310, 18, 307, 'Edit', 'openning_balance.edit', 1, 1, 1, 3, NULL, NULL),
(311, 18, 307, 'Delete', 'openning_balance.delete', 1, 1, 1, 3, NULL, NULL),
(312, 18, 307, 'Show', 'openning_balance.show', 1, 1, 1, 3, NULL, NULL),
(283, 18, 264, 'char accounts', 'char_accounts.index', 1, 1, 1, 2, NULL, NULL),
(284, 18, 283, 'Add', 'char_accounts.store', 1, 1, 1, 3, NULL, NULL),
(285, 18, 283, 'Edit', 'char_accounts.edit', 1, 1, 1, 3, NULL, NULL),
(286, 18, 283, 'Delete', 'char_accounts.destroy', 1, 1, 1, 3, NULL, NULL),
(313, 18, 264, 'Reports', 'reports.index', 1, 1, 1, 2, NULL, NULL),
(314, 18, 313, 'Transaction', 'transaction.index', 1, 1, 1, 3, NULL, NULL),
(315, 18, 313, 'Statement', 'statement.index', 1, 1, 1, 3, NULL, NULL),
(316, 18, 313, 'Profit', 'profit.index', 1, 1, 1, 3, NULL, NULL),
(317, 18, 313, 'Account Balance', 'account.balance.index', 1, 1, 1, 3, NULL, NULL),
(318, 18, 313, 'Income by customer', 'income_by_customer', 1, 1, 1, 3, NULL, NULL),
(319, 18, 313, 'Expense by customer', 'expense_by_supplier', 1, 1, 1, 3, NULL, NULL),
(320, 18, 313, 'Sale tax', 'sale_tax', 1, 1, 1, 3, NULL, NULL),
(315, 18, 264, 'Transfer Money ', 'transfer_showroom.index', 1, 1, 1, 2, NULL, NULL),
(316, 18, 315, 'Make Mone Transfer', 'transfer_showroom.create', 1, 1, 1, 3, NULL, NULL),
(317, 18, 315, 'Make Mone Transfer Update', 'transfer_showroom.edit', 1, 1, 1, 3, NULL, NULL),
(338, 20, NULL, 'Location', NULL, 1, 1, 1, 1, NULL, NULL),
(240, 20, 338, 'Warehouse', 'warehouse.index', 1, 1, 1, 2, NULL, NULL),
(241, 20, 240, 'Add', 'warehouse.store', 1, 1, 1, 3, NULL, NULL),
(242, 20, 240, 'Edit', 'warehouse.edit', 1, 1, 1, 3, NULL, NULL),
(243, 20, 240, 'Delete', 'warehouse.destroy', 1, 1, 1, 3, NULL, NULL),
(244, 20, 338, 'Branch', 'showroom.index', 1, 1, 1, 2, NULL, NULL),
(245, 20, 244, 'Add', 'showroom.store', 1, 1, 1, 3, NULL, NULL),
(246, 20, 244, 'Edit', 'showroom.edit', 1, 1, 1, 3, NULL, NULL),
(247, 20, 244, 'Delete', 'showroom.destroy', 1, 1, 1, 3, NULL, NULL),
(800, 20, NULL, 'Cashbook', 'cashbook.index', 1, 1, 1, 1, NULL, NULL),
(900, 5, NULL, 'Styles', 'style.index', 1, 1, 1, 1, NULL, NULL),
(901, 5, 900, 'Guest Background', 'guest-background', 1, 1, 1, 2, NULL, NULL),
(902, 5, 900, 'Theme Options', 'themes.index', 1, 1, 1, 2, NULL, NULL),
(903, 2, 902, 'Theme Add', 'themes.store', 1, 1, 1, 3, NULL, NULL),
(904, 2, 902, 'Theme Edit', 'themes.edit', 1, 1, 1, 3, NULL, NULL),
(905, 2, 902, 'Theme Delete', 'themes.delete', 1, 1, 1, 3, NULL, NULL),
(906, 2, 902, 'Theme Show', 'themes.show', 1, 1, 1, 3, NULL, NULL),
(907, 2, 902, 'Theme Clone', 'themes.copy', 1, 1, 1, 3, NULL, NULL),
(908, 2, 902, 'Make Default', 'themes.default', 1, 1, 1, 3, NULL, NULL),
(726, 5, 66, 'Remove Logo / Fav', 'setting.remove', 1, 1, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `origin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(16,2) DEFAULT NULL,
  `price_of_other_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ware_house_id` bigint(20) UNSIGNED DEFAULT NULL,
  `manage_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_type`, `model_id`, `unit_type_id`, `brand_id`, `category_id`, `sub_category_id`, `origin`, `description`, `image_source`, `created_by`, `updated_by`, `created_at`, `updated_at`, `product_sku`, `barcode_type`, `price`, `price_of_other_currency`, `ware_house_id`, `manage_stock`, `alert_quantity`) VALUES
(1, '1 ton ac', 'Single', 1, 1, 1, 1, 2, NULL, NULL, 'public/uploads/images/17-08-2021/611b62f113dfb.jpeg', 1, NULL, '2021-08-17 13:19:13', '2021-08-17 13:19:13', NULL, NULL, NULL, '0', NULL, 0, NULL),
(2, 'chair', 'Single', 2, 1, 2, 3, 4, NULL, NULL, NULL, 1, NULL, '2021-11-30 23:45:45', '2021-11-30 23:45:45', NULL, NULL, NULL, '0', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_histories`
--

CREATE TABLE `product_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `houseable_id` bigint(20) UNSIGNED NOT NULL,
  `houseable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemable_id` bigint(20) UNSIGNED NOT NULL,
  `itemable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `in_out` bigint(20) UNSIGNED NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_histories`
--

INSERT INTO `product_histories` (`id`, `type`, `houseable_id`, `houseable_type`, `itemable_id`, `itemable_type`, `date`, `in_out`, `product_sku_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'purchase', 1, 'Modules\\Purchase\\Entities\\PurchaseOrder', 1, 'Modules\\Inventory\\Entities\\ShowRoom', '2021-08-17', 10, 1, 1, 1, 1, '2021-08-17 13:22:13', '2021-08-17 13:22:13'),
(2, 'sales', 1, 'Modules\\Sale\\Entities\\Sale', 1, 'Modules\\Inventory\\Entities\\ShowRoom', '2021-08-17', 1, 1, 0, 1, NULL, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(3, 'purchase', 3, 'Modules\\Purchase\\Entities\\PurchaseOrder', 1, 'Modules\\Inventory\\Entities\\ShowRoom', '2021-12-01', 100, 2, 1, 1, 1, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(4, 'sales', 2, 'Modules\\Sale\\Entities\\Sale', 1, 'Modules\\Inventory\\Entities\\ShowRoom', '2021-12-01', 30, 2, 0, 1, NULL, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(5, 'sales', 3, 'Modules\\Sale\\Entities\\Sale', 1, 'Modules\\Inventory\\Entities\\ShowRoom', '2021-12-01', 10, 2, 0, 1, NULL, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(6, 'sales', 4, 'Modules\\Sale\\Entities\\Sale', 1, 'Modules\\Inventory\\Entities\\ShowRoom', '2021-12-01', 3, 2, 0, 1, NULL, '2021-12-01 00:31:25', '2021-12-01 00:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_item_details`
--

CREATE TABLE `product_item_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `itemable_id` int(10) UNSIGNED DEFAULT NULL,
  `itemable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productable_id` int(10) UNSIGNED DEFAULT NULL,
  `productable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_sku_id` int(10) UNSIGNED NOT NULL,
  `price` double(16,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `tax` double(16,2) NOT NULL DEFAULT 0.00,
  `discount` double(16,2) NOT NULL DEFAULT 0.00,
  `sub_total` double(16,2) NOT NULL DEFAULT 0.00,
  `return_quantity` int(11) NOT NULL DEFAULT 0,
  `return_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `return_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `selling_price` double(16,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_item_details`
--

INSERT INTO `product_item_details` (`id`, `itemable_id`, `itemable_type`, `productable_id`, `productable_type`, `product_sku_id`, `price`, `quantity`, `tax`, `discount`, `sub_total`, `return_quantity`, `return_amount`, `return_date`, `status`, `created_at`, `updated_at`, `selling_price`) VALUES
(1, 1, 'Modules\\Purchase\\Entities\\PurchaseOrder', 1, 'Modules\\Product\\Entities\\ProductSku', 1, 35000.00, 10, 0.00, 0.00, 350000.00, 0, 0.00, '2021-08-17 07:22:13', 1, '2021-08-17 13:22:13', '2021-08-17 13:22:13', 50000.00),
(2, 1, 'Modules\\Sale\\Entities\\Sale', 1, 'Modules\\Product\\Entities\\ProductSku', 1, 50000.00, 1, 5.00, 0.00, 52500.00, 0, 0.00, '2021-08-17 07:31:20', 1, '2021-08-17 13:31:20', '2021-08-17 13:31:20', 0.00),
(3, 3, 'Modules\\Purchase\\Entities\\PurchaseOrder', 2, 'Modules\\Product\\Entities\\ProductSku', 2, 300.00, 100, 0.00, 0.00, 30000.00, 0, 0.00, '2021-11-30 19:04:42', 1, '2021-12-01 00:04:42', '2021-12-01 00:04:42', 500.00),
(4, 2, 'Modules\\Sale\\Entities\\Sale', 2, 'Modules\\Product\\Entities\\ProductSku', 2, 500.00, 30, 5.00, 0.00, 15750.00, 0, 0.00, '2021-11-30 19:13:28', 1, '2021-12-01 00:13:28', '2021-12-01 00:13:28', 0.00),
(5, 3, 'Modules\\Sale\\Entities\\Sale', 2, 'Modules\\Product\\Entities\\ProductSku', 2, 500.00, 10, 5.00, 0.00, 5250.00, 0, 0.00, '2021-11-30 19:28:27', 1, '2021-12-01 00:28:27', '2021-12-01 00:28:27', 0.00),
(6, 4, 'Modules\\Sale\\Entities\\Sale', 2, 'Modules\\Product\\Entities\\ProductSku', 2, 500.00, 3, 5.00, 0.00, 1575.00, 0, 0.00, '2021-11-30 19:31:25', 1, '2021-12-01 00:31:25', '2021-12-01 00:31:25', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_item_details_part_numbers`
--

CREATE TABLE `product_item_details_part_numbers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `part_number_id` int(10) UNSIGNED DEFAULT NULL,
  `sale_id` int(10) UNSIGNED DEFAULT NULL,
  `product_item_detail_id` int(10) UNSIGNED DEFAULT NULL,
  `product_sku_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_selling_price_histories`
--

CREATE TABLE `product_selling_price_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `old_price` double(28,2) NOT NULL DEFAULT 0.00,
  `new_selling_price` double(28,2) NOT NULL DEFAULT 0.00,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_selling_price_histories`
--

INSERT INTO `product_selling_price_histories` (`id`, `product_sku_id`, `purchase_order_id`, `old_price`, `new_selling_price`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 50000.00, 50000.00, 1, '2021-08-17 13:22:13', '2021-08-17 13:22:13'),
(2, 2, 3, 500.00, 500.00, 1, '2021-12-01 00:04:42', '2021-12-01 00:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_sku`
--

CREATE TABLE `product_sku` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sku` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_quantity` bigint(20) UNSIGNED DEFAULT NULL,
  `alert_quantity` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_price` double(16,2) NOT NULL DEFAULT 0.00,
  `selling_price` double(16,2) NOT NULL DEFAULT 0.00,
  `min_selling_price` int(11) NOT NULL DEFAULT 0,
  `barcode_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double(16,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` double(16,2) NOT NULL DEFAULT 0.00,
  `cost_of_goods` double(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sku`
--

INSERT INTO `product_sku` (`id`, `product_id`, `sku`, `stock_quantity`, `alert_quantity`, `purchase_price`, `selling_price`, `min_selling_price`, `barcode_type`, `barcode_id`, `discount_type`, `discount`, `tax_type`, `tax`, `cost_of_goods`, `created_at`, `updated_at`) VALUES
(1, 1, 'ac001-1', NULL, 3, 35000.00, 50000.00, 45000, NULL, '1000-1-unfuD1LhL0bv', NULL, 0.00, '%', 5.00, 35000.00, '2021-08-17 13:19:13', '2021-08-17 13:19:13'),
(2, 2, 'c005-2', NULL, 5, 300.00, 500.00, 450, NULL, '1000-2-iQR5TTu2coLl', NULL, 0.00, '%', 5.00, 300.00, '2021-11-30 23:45:45', '2021-11-30 23:45:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED DEFAULT NULL,
  `variant_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_value_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variants` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `team_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'On delete cascade',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy` int(11) NOT NULL DEFAULT 1 COMMENT '1 => public to team, 2 => private to project member, 3 => private to me',
  `default_view` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT '2021-08-16',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_comments`
--

CREATE TABLE `project_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin_top` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_task`
--

CREATE TABLE `project_task` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `project_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_user`
--

CREATE TABLE `project_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `project_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favourite` tinyint(1) NOT NULL DEFAULT 0,
  `default_view` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `purchasable_id` bigint(20) UNSIGNED NOT NULL,
  `cnf_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchasable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `total_quantity` bigint(20) NOT NULL DEFAULT 0,
  `total_discount` double(16,2) NOT NULL DEFAULT 0.00,
  `discount_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `discount_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '2 => percentage, 1 => amount',
  `total_vat` double(16,2) NOT NULL DEFAULT 0.00,
  `shipping_charge` double(16,2) NOT NULL DEFAULT 0.00,
  `other_charge` double(16,2) NOT NULL DEFAULT 0.00,
  `payable_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documents` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `return_status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '0=>pending,1=>approved,2=>default',
  `added_to_stock` tinyint(1) NOT NULL DEFAULT 0,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>no,1=>partial,2=>paid',
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lc_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnf_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `supplier_id`, `purchasable_id`, `cnf_id`, `tax_id`, `purchasable_type`, `date`, `amount`, `total_quantity`, `total_discount`, `discount_amount`, `discount_type`, `total_vat`, `shipping_charge`, `other_charge`, `payable_amount`, `payment_method`, `invoice_no`, `ref_no`, `shipping_address`, `documents`, `status`, `return_status`, `added_to_stock`, `is_paid`, `notes`, `created_by`, `updated_by`, `created_at`, `updated_at`, `lc_no`, `cnf_agent`) VALUES
(1, 2, 1, 0, NULL, 'Modules\\Inventory\\Entities\\ShowRoom', '2021-08-17', 350000.00, 10, 0.00, 0.00, 1, 0.00, 0.00, 0.00, 350000.00, '[\"cash-00\"]', 'PI-210811', NULL, NULL, '[]', 1, 2, 1, 2, NULL, 1, 1, '2021-08-17 13:22:13', '2021-12-01 00:05:28', NULL, NULL),
(3, 4, 1, 0, NULL, 'Modules\\Inventory\\Entities\\ShowRoom', '2021-12-01', 30000.00, 100, 0.00, 0.00, 1, 0.00, 3000.00, 5000.00, 38000.00, '[\"cash-00\"]', 'PI-211213', NULL, NULL, '[]', 1, 2, 1, 2, NULL, 1, 1, '2021-12-01 00:04:42', '2021-12-01 00:09:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quotationable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quotationable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_quantity` double(16,2) NOT NULL DEFAULT 0.00,
  `total_discount` double(16,2) NOT NULL DEFAULT 0.00,
  `total_vat` double(16,2) NOT NULL DEFAULT 0.00,
  `shipping_charge` double(16,2) NOT NULL DEFAULT 0.00,
  `other_charge` double(16,2) NOT NULL DEFAULT 0.00,
  `payable_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `discount_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `discount_type` tinyint(4) NOT NULL DEFAULT 1,
  `date` timestamp NULL DEFAULT NULL,
  `valid_till_date` date DEFAULT NULL,
  `shipping_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `convert_status` tinyint(1) NOT NULL DEFAULT 0,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receive_products`
--

CREATE TABLE `receive_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED NOT NULL,
  `receive_quantity` int(11) NOT NULL DEFAULT 0,
  `receive_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receive_products`
--

INSERT INTO `receive_products` (`id`, `purchase_id`, `product_sku_id`, `receive_quantity`, `receive_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, '2021-08-17', '2021-08-17 13:26:18', '2021-08-17 13:26:18'),
(2, 3, 2, 100, '2021-12-01', '2021-12-01 00:09:31', '2021-12-01 00:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `type`, `details`, `created_at`, `updated_at`) VALUES
(1, 'Super admin', 'system_user', NULL, '2021-08-16 06:58:35', NULL),
(2, 'Admin', 'system_user', NULL, '2021-08-16 06:58:35', NULL),
(3, 'Staff', 'regular_user', NULL, '2021-08-16 06:58:35', NULL),
(4, 'Supplier', 'normal_user', NULL, '2021-08-16 06:58:35', NULL),
(5, 'Customer', 'normal_user', NULL, '2021-08-16 06:58:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `permission_id`, `role_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 170, 3, 1, 1, 1, NULL, NULL),
(2, 171, 3, 1, 1, 1, NULL, NULL),
(3, 325, 3, 1, 1, 1, NULL, NULL),
(4, 177, 3, 1, 1, 1, NULL, NULL),
(5, 193, 3, 1, 1, 1, NULL, NULL),
(6, 194, 3, 1, 1, 1, NULL, NULL),
(7, 338, 3, 1, 1, 1, NULL, NULL),
(8, 339, 3, 1, 1, 1, NULL, NULL),
(9, 217, 3, 1, 1, 1, NULL, NULL),
(10, 218, 3, 1, 1, 1, NULL, NULL),
(11, 219, 3, 1, 1, 1, NULL, NULL),
(12, 220, 3, 1, 1, 1, NULL, NULL),
(13, 221, 3, 1, 1, 1, NULL, NULL),
(14, 222, 3, 1, 1, 1, NULL, NULL),
(15, 223, 3, 1, 1, 1, NULL, NULL),
(16, 224, 3, 1, 1, 1, NULL, NULL),
(17, 225, 3, 1, 1, 1, NULL, NULL),
(18, 226, 3, 1, 1, 1, NULL, NULL),
(19, 227, 3, 1, 1, 1, NULL, NULL),
(20, 228, 3, 1, 1, 1, NULL, NULL),
(21, 229, 3, 1, 1, 1, NULL, NULL),
(22, 230, 3, 1, 1, 1, NULL, NULL),
(23, 342, 3, 1, 1, 1, NULL, NULL),
(24, 343, 3, 1, 1, 1, NULL, NULL),
(25, 344, 3, 1, 1, 1, NULL, NULL),
(26, 231, 3, 1, 1, 1, NULL, NULL),
(27, 232, 3, 1, 1, 1, NULL, NULL),
(28, 320, 3, 1, 1, 1, NULL, NULL),
(29, 321, 3, 1, 1, 1, NULL, NULL),
(30, 233, 3, 1, 1, 1, NULL, NULL),
(31, 234, 3, 1, 1, 1, NULL, NULL),
(32, 235, 3, 1, 1, 1, NULL, NULL),
(33, 236, 3, 1, 1, 1, NULL, NULL),
(34, 237, 3, 1, 1, 1, NULL, NULL),
(35, 341, 3, 1, 1, 1, NULL, NULL),
(36, 289, 3, 1, 1, 1, NULL, NULL),
(37, 290, 3, 1, 1, 1, NULL, NULL),
(38, 291, 3, 1, 1, 1, NULL, NULL),
(39, 292, 3, 1, 1, 1, NULL, NULL),
(40, 293, 3, 1, 1, 1, NULL, NULL),
(41, 294, 3, 1, 1, 1, NULL, NULL),
(42, 261, 3, 1, 1, 1, NULL, NULL),
(43, 262, 3, 1, 1, 1, NULL, NULL),
(44, 263, 3, 1, 1, 1, NULL, NULL),
(45, 239, 3, 1, 1, 1, NULL, NULL),
(46, 315, 3, 1, 1, 1, NULL, NULL),
(47, 316, 3, 1, 1, 1, NULL, NULL),
(48, 317, 3, 1, 1, 1, NULL, NULL),
(49, 800, 3, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `saleable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `saleable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `total_quantity` double(16,2) NOT NULL DEFAULT 0.00,
  `total_discount` double(16,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(16,2) NOT NULL DEFAULT 0.00,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_charge` double(16,2) NOT NULL DEFAULT 0.00,
  `other_charge` double(16,2) NOT NULL DEFAULT 0.00,
  `payable_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `discount_type` tinyint(4) NOT NULL DEFAULT 1,
  `mail_status` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Unpaid, 1 => Paid & 2 => Partial',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT ' 1 => Regular, 0 => Conditional,2 => POS',
  `is_approved` tinyint(4) NOT NULL DEFAULT 0 COMMENT ' 0 => No ,1 => Yes',
  `is_draft` tinyint(4) NOT NULL DEFAULT 0 COMMENT ' 0 => No ,1 => Yes',
  `date` date DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_document` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_status` tinyint(4) NOT NULL DEFAULT 2 COMMENT '0 => Pending, 1 => Accepted',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `agent_user_id`, `user_id`, `saleable_id`, `saleable_type`, `amount`, `total_quantity`, `total_discount`, `total_tax`, `tax_id`, `shipping_charge`, `other_charge`, `payable_amount`, `ref_no`, `invoice_no`, `discount_amount`, `discount_type`, `mail_status`, `status`, `type`, `is_approved`, `is_draft`, `date`, `notes`, `return_note`, `document`, `signature`, `return_document`, `return_status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 1, 1, 'Modules\\Inventory\\Entities\\ShowRoom', 52500.00, 1.00, 0.00, 0.00, NULL, 0.00, 0.00, 52500.00, NULL, 'INV-210811', 0.00, 1, 0, 1, 1, 1, 0, '2021-08-17', NULL, NULL, NULL, NULL, NULL, 2, 1, 1, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(2, 5, NULL, 1, 1, 'Modules\\Inventory\\Entities\\ShowRoom', 15750.00, 30.00, 0.00, 0.00, NULL, 0.00, 0.00, 15750.00, NULL, 'INV-211212', 0.00, 1, 0, 1, 1, 1, 0, '2021-12-01', NULL, NULL, NULL, NULL, NULL, 2, 1, 1, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(3, 7, NULL, 1, 1, 'Modules\\Inventory\\Entities\\ShowRoom', 5250.00, 10.00, 0.00, 0.00, NULL, 0.00, 0.00, 5250.00, NULL, 'INV-211213', 0.00, 1, 0, 2, 1, 1, 0, '2021-12-01', NULL, NULL, NULL, NULL, NULL, 2, 1, 1, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(4, 7, NULL, 1, 1, 'Modules\\Inventory\\Entities\\ShowRoom', 1575.00, 3.00, 0.00, 0.00, NULL, 0.00, 0.00, 1575.00, NULL, 'INV-211214', 0.00, 1, 0, 2, 1, 1, 0, '2021-12-01', NULL, NULL, NULL, NULL, NULL, 2, 1, 1, '2021-12-01 00:31:25', '2021-12-01 00:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selected_languages`
--

CREATE TABLE `selected_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `native` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_universal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `booking_slip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prove_of_delivery` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `show_rooms`
--

CREATE TABLE `show_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `show_rooms`
--

INSERT INTO `show_rooms` (`id`, `name`, `email`, `address`, `phone`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Main Branch', NULL, NULL, NULL, 1, NULL, NULL, '2021-08-16 18:58:35', '2021-08-16 18:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Twillo', 0, '2021-08-16 06:58:35', NULL),
(2, 'Text to Local', 0, '2021-08-16 06:58:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT 1,
  `department_id` int(10) UNSIGNED DEFAULT 1,
  `showroom_id` int(10) UNSIGNED DEFAULT 1,
  `warehouse_id` int(10) UNSIGNED DEFAULT 1,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(16,2) DEFAULT 0.00,
  `provisional_months` tinyint(4) NOT NULL DEFAULT 0,
  `date_of_joining` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `leave_applicable_date` date DEFAULT NULL,
  `carry_forward` int(11) NOT NULL DEFAULT 0,
  `is_carry_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `employee_id`, `user_id`, `department_id`, `showroom_id`, `warehouse_id`, `phone`, `bank_name`, `bank_branch_name`, `bank_account_name`, `bank_account_no`, `current_address`, `permanent_address`, `basic_salary`, `employment_type`, `opening_balance`, `provisional_months`, `date_of_joining`, `date_of_birth`, `leave_applicable_date`, `carry_forward`, `is_carry_active`, `created_at`, `updated_at`) VALUES
(1, 'EMP-300001', 1, 1, 1, 1, '+8801831080976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, NULL, 0, 0, '2021-08-16 18:58:35', '2021-08-16 19:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `staff_documents`
--

CREATE TABLE `staff_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documents` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments`
--

CREATE TABLE `stock_adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `adjustable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `recovery_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_products`
--

CREATE TABLE `stock_adjustment_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_adjustment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_sku_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `unit_price` double(16,2) NOT NULL DEFAULT 0.00,
  `subtotal` double(16,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_reports`
--

CREATE TABLE `stock_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `houseable_id` bigint(20) UNSIGNED NOT NULL,
  `houseable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_date` date NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED NOT NULL,
  `stock` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_reports`
--

INSERT INTO `stock_reports` (`id`, `houseable_id`, `houseable_type`, `stock_date`, `product_sku_id`, `stock`, `created_at`, `updated_at`) VALUES
(1, 1, 'Modules\\Inventory\\Entities\\ShowRoom', '0000-00-00', 1, '9', '2021-08-17 13:26:18', '2021-08-17 13:31:20'),
(2, 1, 'Modules\\Inventory\\Entities\\ShowRoom', '0000-00-00', 2, '57', '2021-12-01 00:09:31', '2021-12-01 00:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfers`
--

CREATE TABLE `stock_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sendable_id` bigint(20) UNSIGNED NOT NULL,
  `sendable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receivable_id` bigint(20) UNSIGNED NOT NULL,
  `receivable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `sent_at` date DEFAULT NULL,
  `received_at` date DEFAULT NULL,
  `documents` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suggest_lists`
--

CREATE TABLE `suggest_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `houseable_id` bigint(20) UNSIGNED NOT NULL,
  `houseable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete set null',
  `workspace_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag_task`
--

CREATE TABLE `tag_task` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `tag_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on delete cascade',
  `section_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on delete set null',
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on dDelete set cascade',
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => completed, 0 => uncompleted',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on delete set null',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_id` bigint(20) UNSIGNED DEFAULT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `old_id` bigint(20) UNSIGNED DEFAULT NULL,
  `new_id` bigint(20) UNSIGNED DEFAULT NULL,
  `table_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin_top` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_comment_likes`
--

CREATE TABLE `task_comment_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `task_comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_dependencies`
--

CREATE TABLE `task_dependencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `direction` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => blocked by, 1 => blocking',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_likes`
--

CREATE TABLE `task_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `workspace_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_type` int(11) NOT NULL DEFAULT 0 COMMENT '0 => Membership by request, 1=> private, 2=> Public to organization',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `uuid`, `user_id`, `workspace_id`, `name`, `description`, `privacy_type`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, 'Default Team', NULL, 0, '2021-08-16 12:58:36', '2021-08-16 12:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `team_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_user`
--

INSERT INTO `team_user` (`id`, `user_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-08-16 12:58:36', '2021-08-16 12:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gradient',
  `background_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `background_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#fffff',
  `background_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/public/backEnd/img/body-bg.jpg',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `title`, `color_mode`, `background_type`, `background_color`, `background_image`, `is_default`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Default Theme', 'gradient', 'image', '#fffff', 'https://erp.softitltd.com/public/backEnd/img/body-bg.jpg', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time_period_accounts`
--

CREATE TABLE `time_period_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_period_accounts`
--

INSERT INTO `time_period_accounts` (`id`, `start_date`, `end_date`, `is_closed`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '2021-08-16', NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time_zones`
--

CREATE TABLE `time_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_zones`
--

INSERT INTO `time_zones` (`id`, `code`, `time_zone`, `created_at`, `updated_at`) VALUES
(1, 'Pacific/Midway', '(GMT-11:00) Midway Island', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(2, 'US/Samoa', '(GMT-11:00) Samoa', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(3, 'US/Hawaii', '(GMT-10:00) Hawaii', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(4, 'US/Alaska', '(GMT-09:00) Alaska', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(5, 'US/Pacific', '(GMT-08:00) Pacific Time (US &amp; Canada)', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(6, 'America/Tijuana', '(GMT-08:00) Tijuana', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(7, 'US/Arizona', '(GMT-07:00) Arizona', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(8, 'US/Mountain', '(GMT-07:00) Mountain Time (US &amp; Canada)', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(9, 'America/Chihuahua', '(GMT-07:00) Chihuahua', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(10, 'America/Mazatlan', '(GMT-07:00) Mazatlan', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(11, 'America/Mexico_City', '(GMT-06:00) Mexico City', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(12, 'America/Monterrey', '(GMT-06:00) Monterrey', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(13, 'Canada/Saskatchewan', '(GMT-06:00) Saskatchewan', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(14, 'US/Central', '(GMT-06:00) Central Time (US &amp; Canada)', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(15, 'US/Eastern', '(GMT-05:00) Eastern Time (US &amp; Canada)', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(16, 'US/East-Indiana', '(GMT-05:00) Indiana (East)', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(17, 'America/Bogota', '(GMT-05:00) Bogota', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(18, 'America/Lima', '(GMT-05:00) Lima', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(19, 'America/Caracas', '(GMT-04:30) Caracas', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(20, 'Canada/Atlantic', '(GMT-04:00) Atlantic Time (Canada)', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(21, 'America/La_Paz', '(GMT-04:00) La Paz', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(22, 'America/Santiago', '(GMT-04:00) Santiago', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(23, 'Canada/Newfoundland', '(GMT-03:30) Newfoundland', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(24, 'America/Buenos_Aires', '(GMT-03:00) Buenos Aires', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(25, 'America/Godthab', '(GMT-03:00) Greenland', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(26, 'Atlantic/Stanley', '(GMT-02:00) Stanley', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(27, 'Atlantic/Azores', '(GMT-01:00) Azores', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(28, 'Atlantic/Cape_Verde', '(GMT-01:00) Cape Verde Is.', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(29, 'Africa/Casablanca', '(GMT) Casablanca', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(30, 'Europe/Dublin', '(GMT) Dublin', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(31, 'Europe/Lisbon', '(GMT) Lisbon', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(32, 'Europe/London', '(GMT) London', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(33, 'Africa/Monrovia', '(GMT) Monrovia', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(34, 'Europe/Amsterdam', '(GMT+01:00) Amsterdam', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(35, 'Europe/Belgrade', '(GMT+01:00) Belgrade', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(36, 'Europe/Berlin', '(GMT+01:00) Berlin', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(37, 'Europe/Bratislava', '(GMT+01:00) Bratislava', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(38, 'Europe/Brussels', '(GMT+01:00) Brussels', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(39, 'Europe/Budapest', '(GMT+01:00) Budapest', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(40, 'Europe/Copenhagen', '(GMT+01:00) Copenhagen', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(41, 'Europe/Ljubljana', '(GMT+01:00) Ljubljana', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(42, 'Europe/Madrid', '(GMT+01:00) Madrid', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(43, 'Europe/Paris', '(GMT+01:00) Paris', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(44, 'Europe/Prague', '(GMT+01:00) Prague', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(45, 'Europe/Rome', '(GMT+01:00) Rome', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(46, 'Europe/Sarajevo', '(GMT+01:00) Sarajevo', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(47, 'Europe/Skopje', '(GMT+01:00) Skopje', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(48, 'Europe/Stockholm', '(GMT+01:00) Stockholm', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(49, 'Europe/Vienna', '(GMT+01:00) Vienna', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(50, 'Europe/Warsaw', '(GMT+01:00) Warsaw', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(51, 'Europe/Zagreb', '(GMT+01:00) Zagreb', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(52, 'Europe/Athens', '(GMT+02:00) Athens', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(53, 'Europe/Bucharest', '(GMT+02:00) Bucharest', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(54, 'Africa/Cairo', '(GMT+02:00) Cairo', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(55, 'Africa/Harare', '(GMT+02:00) Harare', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(56, 'Europe/Helsinki', '(GMT+02:00) Helsinki', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(57, 'Asia/Jerusalem', '(GMT+02:00) Jerusalem', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(58, 'Europe/Kiev', '(GMT+02:00) Kyiv', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(59, 'Europe/Minsk', '(GMT+02:00) Minsk', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(60, 'Europe/Riga', '(GMT+02:00) Riga', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(61, 'Europe/Sofia', '(GMT+02:00) Sofia', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(62, 'Europe/Tallinn', '(GMT+02:00) Tallinn', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(63, 'Europe/Vilnius', '(GMT+02:00) Vilnius', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(64, 'Europe/Istanbul', '(GMT+03:00) Istanbul', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(65, 'Asia/Baghdad', '(GMT+03:00) Baghdad', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(66, 'Asia/Kuwait', '(GMT+03:00) Kuwait', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(67, 'Africa/Nairobi', '(GMT+03:00) Nairobi', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(68, 'Asia/Riyadh', '(GMT+03:00) Riyadh', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(69, 'Asia/Tehran', '(GMT+03:30) Tehran', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(70, 'Europe/Moscow', '(GMT+04:00) Moscow', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(71, 'Asia/Baku', '(GMT+04:00) Baku', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(72, 'Europe/Volgograd', '(GMT+04:00) Volgograd', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(73, 'Asia/Muscat', '(GMT+04:00) Muscat', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(74, 'Asia/Tbilisi', '(GMT+04:00) Tbilisi', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(75, 'Asia/Yerevan', '(GMT+04:00) Yerevan', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(76, 'Asia/Kabul', '(GMT+04:30) Kabul', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(77, 'Asia/Karachi', '(GMT+05:00) Karachi', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(78, 'Asia/Tashkent', '(GMT+05:00) Tashkent', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(79, 'Asia/Kolkata', '(GMT+05:30) Kolkata', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(80, 'Asia/Kathmandu', '(GMT+05:45) Kathmandu', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(81, 'Asia/Yekaterinburg', '(GMT+06:00) Ekaterinburg', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(82, 'Asia/Almaty', '(GMT+06:00) Almaty', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(83, 'Asia/Dhaka', '(GMT+06:00) Dhaka', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(84, 'Asia/Novosibirsk', '(GMT+07:00) Novosibirsk', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(85, 'Asia/Bangkok', '(GMT+07:00) Bangkok', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(86, 'Asia/Ho_Chi_Minh', '(GMT+07.00) Ho Chi Minh', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(87, 'Asia/Jakarta', '(GMT+07:00) Jakarta', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(88, 'Asia/Krasnoyarsk', '(GMT+08:00) Krasnoyarsk', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(89, 'Asia/Chongqing', '(GMT+08:00) Chongqing', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(90, 'Asia/Hong_Kong', '(GMT+08:00) Hong Kong', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(91, 'Asia/Kuala_Lumpur', '(GMT+08:00) Kuala Lumpur', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(92, 'Australia/Perth', '(GMT+08:00) Perth', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(93, 'Asia/Singapore', '(GMT+08:00) Singapore', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(94, 'Asia/Taipei', '(GMT+08:00) Taipei', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(95, 'Asia/Ulaanbaatar', '(GMT+08:00) Ulaan Bataar', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(96, 'Asia/Urumqi', '(GMT+08:00) Urumqi', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(97, 'Asia/Irkutsk', '(GMT+09:00) Irkutsk', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(98, 'Asia/Seoul', '(GMT+09:00) Seoul', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(99, 'Asia/Tokyo', '(GMT+09:00) Tokyo', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(100, 'Australia/Adelaide', '(GMT+09:30) Adelaide', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(101, 'Australia/Darwin', '(GMT+09:30) Darwin', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(102, 'Asia/Yakutsk', '(GMT+10:00) Yakutsk', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(103, 'Australia/Brisbane', '(GMT+10:00) Brisbane', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(104, 'Australia/Canberra', '(GMT+10:00) Canberra', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(105, 'Pacific/Guam', '(GMT+10:00) Guam', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(106, 'Australia/Hobart', '(GMT+10:00) Hobart', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(107, 'Australia/Melbourne', '(GMT+10:00) Melbourne', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(108, 'Pacific/Port_Moresby', '(GMT+10:00) Port Moresby', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(109, 'Australia/Sydney', '(GMT+10:00) Sydney', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(110, 'Asia/Vladivostok', '(GMT+11:00) Vladivostok', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(111, 'Asia/Magadan', '(GMT+12:00) Magadan', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(112, 'Pacific/Auckland', '(GMT+12:00) Auckland', '2021-08-16 18:58:34', '2021-08-16 18:58:34'),
(113, 'Pacific/Fiji', '(GMT+12:00) Fiji', '2021-08-16 18:58:34', '2021-08-16 18:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `to_dos`
--

CREATE TABLE `to_dos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 => complete, 0 => pending',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tranaction_account`
--

CREATE TABLE `tranaction_account` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `tranaction_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tranaction_account`
--

INSERT INTO `tranaction_account` (`id`, `account_id`, `tranaction_id`, `created_at`, `updated_at`) VALUES
(1, 7, 1, NULL, NULL),
(2, 35, 2, NULL, NULL),
(3, 36, 3, NULL, NULL),
(4, 13, 4, NULL, NULL),
(5, 15, 4, NULL, NULL),
(6, 13, 5, NULL, NULL),
(7, 15, 5, NULL, NULL),
(8, 19, 6, NULL, NULL),
(9, 7, 7, NULL, NULL),
(10, 36, 8, NULL, NULL),
(11, 34, 9, NULL, NULL),
(12, 27, 10, NULL, NULL),
(13, 7, 10, NULL, NULL),
(14, 37, 11, NULL, NULL),
(15, 37, 12, NULL, NULL),
(16, 34, 13, NULL, NULL),
(17, 37, 14, NULL, NULL),
(18, 34, 15, NULL, NULL),
(19, 35, 16, NULL, NULL),
(20, 38, 17, NULL, NULL),
(21, 13, 18, NULL, NULL),
(22, 15, 18, NULL, NULL),
(23, 13, 19, NULL, NULL),
(24, 15, 19, NULL, NULL),
(25, 19, 20, NULL, NULL),
(26, 7, 21, NULL, NULL),
(27, 38, 22, NULL, NULL),
(28, 34, 23, NULL, NULL),
(29, 40, 24, NULL, NULL),
(30, 13, 25, NULL, NULL),
(31, 15, 25, NULL, NULL),
(32, 13, 26, NULL, NULL),
(33, 15, 26, NULL, NULL),
(34, 19, 27, NULL, NULL),
(35, 7, 28, NULL, NULL),
(36, 40, 29, NULL, NULL),
(37, 34, 30, NULL, NULL),
(38, 40, 31, NULL, NULL),
(39, 13, 32, NULL, NULL),
(40, 15, 32, NULL, NULL),
(41, 13, 33, NULL, NULL),
(42, 15, 33, NULL, NULL),
(43, 19, 34, NULL, NULL),
(44, 7, 35, NULL, NULL),
(45, 40, 36, NULL, NULL),
(46, 34, 37, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `narration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucherable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucherable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `account_id`, `type`, `amount`, `narration`, `voucherable_type`, `voucherable_id`, `created_at`, `updated_at`) VALUES
(1, 35, 'Cr', 350000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 1, '2021-08-17 13:22:13', '2021-08-17 13:22:13'),
(2, 7, 'Dr', 350000.00, 'Product Purchase', 'Modules\\Account\\Entities\\Voucher', 1, '2021-08-17 13:22:13', '2021-08-17 13:22:13'),
(3, 36, 'Dr', 52500.00, NULL, 'Modules\\Account\\Entities\\Voucher', 2, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(4, 15, 'Cr', 50000.00, 'Product Sales', 'Modules\\Account\\Entities\\Voucher', 2, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(5, 13, 'Cr', 2500.00, 'Product Sale Tax', 'Modules\\Account\\Entities\\Voucher', 2, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(6, 7, 'Cr', 35000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 3, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(7, 19, 'Dr', 35000.00, 'Cost of goods sold to customer/Retailer', 'Modules\\Account\\Entities\\Voucher', 3, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(8, 34, 'Dr', 52500.00, 'Product Sales', 'Modules\\Account\\Entities\\Voucher', 4, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(9, 36, 'Cr', 52500.00, NULL, 'Modules\\Account\\Entities\\Voucher', 4, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(10, 37, 'Cr', 38000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 5, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(11, 7, 'Dr', 30000.00, 'Product Purchase', 'Modules\\Account\\Entities\\Voucher', 5, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(12, 27, 'Dr', 8000.00, 'Purchase Expense (Shipping and others charge)', 'Modules\\Account\\Entities\\Voucher', 5, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(13, 37, 'Dr', 38000.00, 'Purchase Payment', 'Modules\\Account\\Entities\\Voucher', 6, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(14, 34, 'Cr', 38000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 6, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(15, 35, 'Dr', 350000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 7, '2021-12-01 00:05:28', '2021-12-01 00:05:28'),
(16, 34, 'Cr', 350000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 7, '2021-12-01 00:05:28', '2021-12-01 00:05:28'),
(17, 38, 'Dr', 15750.00, NULL, 'Modules\\Account\\Entities\\Voucher', 8, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(18, 15, 'Cr', 15000.00, 'Product Sales', 'Modules\\Account\\Entities\\Voucher', 8, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(19, 13, 'Cr', 750.00, 'Product Sale Tax', 'Modules\\Account\\Entities\\Voucher', 8, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(20, 7, 'Cr', 9000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 9, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(21, 19, 'Dr', 9000.00, 'Cost of goods sold to customer/Retailer', 'Modules\\Account\\Entities\\Voucher', 9, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(22, 34, 'Dr', 15750.00, 'Product Sales', 'Modules\\Account\\Entities\\Voucher', 10, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(23, 38, 'Cr', 15750.00, NULL, 'Modules\\Account\\Entities\\Voucher', 10, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(24, 40, 'Dr', 5250.00, NULL, 'Modules\\Account\\Entities\\Voucher', 11, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(25, 15, 'Cr', 5000.00, 'Product Sales', 'Modules\\Account\\Entities\\Voucher', 11, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(26, 13, 'Cr', 250.00, 'Product Sale Tax', 'Modules\\Account\\Entities\\Voucher', 11, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(27, 7, 'Cr', 3000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 12, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(28, 19, 'Dr', 3000.00, 'Cost of goods sold to customer/Retailer', 'Modules\\Account\\Entities\\Voucher', 12, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(29, 34, 'Dr', 5000.00, 'Product Sales', 'Modules\\Account\\Entities\\Voucher', 13, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(30, 40, 'Cr', 5000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 13, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(31, 40, 'Dr', 1575.00, NULL, 'Modules\\Account\\Entities\\Voucher', 14, '2021-12-01 00:31:25', '2021-12-01 00:31:25'),
(32, 15, 'Cr', 1500.00, 'Product Sales', 'Modules\\Account\\Entities\\Voucher', 14, '2021-12-01 00:31:25', '2021-12-01 00:31:25'),
(33, 13, 'Cr', 75.00, 'Product Sale Tax', 'Modules\\Account\\Entities\\Voucher', 14, '2021-12-01 00:31:25', '2021-12-01 00:31:25'),
(34, 7, 'Cr', 900.00, NULL, 'Modules\\Account\\Entities\\Voucher', 15, '2021-12-01 00:31:25', '2021-12-01 00:31:25'),
(35, 19, 'Dr', 900.00, 'Cost of goods sold to customer/Retailer', 'Modules\\Account\\Entities\\Voucher', 15, '2021-12-01 00:31:25', '2021-12-01 00:31:25'),
(36, 34, 'Dr', 1000.00, 'Product Sales', 'Modules\\Account\\Entities\\Voucher', 16, '2021-12-01 00:31:25', '2021-12-01 00:31:25'),
(37, 40, 'Cr', 1000.00, NULL, 'Modules\\Account\\Entities\\Voucher', 16, '2021-12-01 00:31:25', '2021-12-01 00:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `type_opening_balances`
--

CREATE TABLE `type_opening_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit_types`
--

CREATE TABLE `unit_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit_types`
--

INSERT INTO `unit_types` (`id`, `name`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'piece', NULL, 1, 1, NULL, '2021-08-17 13:15:59', '2021-08-17 13:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_temp_delete` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_preference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mail',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_workspace_id` bigint(20) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `contact_id`, `name`, `username`, `photo`, `role_id`, `mobile_verified_at`, `email`, `email_verified_at`, `password`, `notification_preference`, `is_active`, `avatar`, `remember_token`, `current_workspace_id`, `created_at`, `updated_at`, `signature`) VALUES
(1, NULL, 'SOFT IT LTD', '0181', NULL, 1, NULL, 'admin@softitltd.com', '2021-08-16 18:58:33', '$2y$10$/wvjnfWTxcD1quoAP9vfXuX9e8t3cIuSkIv2To/Xgo0edrK3J7VsW', 'mail', 1, 'public/uploads/avatar/16-08-2021/611a631e4635f.png', 'o5QCbMQf8iHlMVCy7HCCPuTTgYXjTEYeIo3AqeCpKOmgRKqaamWENBfn6lVn', 1, '2021-08-16 18:58:34', '2021-08-16 19:07:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variant_values`
--

CREATE TABLE `variant_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `version_histories`
--

CREATE TABLE `version_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tx_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CV => Cash Voucher, BV => Bank Voucher, JV => Journal Voucher, CRV => Contra Voucher',
  `referable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_type` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `referable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approve` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 => pending, 1 => Approve, 2 => Cancelled',
  `is_transfer` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'money transfer from here to there',
  `date` date DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `tx_id`, `voucher_type`, `referable_id`, `account_type`, `account_id`, `referable_type`, `amount`, `payment_type`, `narration`, `is_approve`, `is_transfer`, `date`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'JV-1', 'JV', 1, NULL, NULL, 'Modules\\Purchase\\Entities\\PurchaseOrder', 350000.00, 'journal_voucher', 'Product Purchase', 1, 0, '2021-08-17', 1, 1, '2021-08-17 13:22:13', '2021-08-17 13:22:13'),
(2, 'JV-2', 'JV', 1, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 52500.00, 'journal_voucher', 'Product Sales', 1, 0, '2021-08-17', 1, 1, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(3, 'JV-3', 'JV', 1, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 35000.00, 'journal_voucher', 'Inventory deduct for sales purpose', 1, 0, '2021-08-17', 1, 1, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(4, 'CV-4', 'CV', 1, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 52500.00, 'voucher_recieve', 'Payment recieved by cash', 1, 0, '2021-08-17', 1, 1, '2021-08-17 13:31:20', '2021-08-17 13:31:20'),
(5, 'JV-5', 'JV', 3, NULL, NULL, 'Modules\\Purchase\\Entities\\PurchaseOrder', 38000.00, 'journal_voucher', 'Product Purchase', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(6, 'CV-6', 'CV', 3, NULL, NULL, 'Modules\\Purchase\\Entities\\PurchaseOrder', 38000.00, 'voucher_payment', 'Payment given by cash', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:04:42', '2021-12-01 00:04:42'),
(7, 'CV-7', 'CV', 1, NULL, NULL, 'Modules\\Purchase\\Entities\\PurchaseOrder', 350000.00, 'voucher_payment', 'Payment given by cash', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:05:28', '2021-12-01 00:05:28'),
(8, 'JV-8', 'JV', 2, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 15750.00, 'journal_voucher', 'Product Sales', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(9, 'JV-9', 'JV', 2, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 9000.00, 'journal_voucher', 'Inventory deduct for sales purpose', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(10, 'CV-10', 'CV', 2, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 15750.00, 'voucher_recieve', 'Payment recieved by cash', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:13:28', '2021-12-01 00:13:28'),
(11, 'JV-11', 'JV', 3, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 5250.00, 'journal_voucher', 'Product Sales', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(12, 'JV-12', 'JV', 3, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 3000.00, 'journal_voucher', 'Inventory deduct for sales purpose', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(13, 'CV-13', 'CV', 3, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 5000.00, 'voucher_recieve', 'Payment recieved by cash', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:28:27', '2021-12-01 00:28:27'),
(14, 'JV-14', 'JV', 4, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 1575.00, 'journal_voucher', 'Product Sales', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:31:25', '2021-12-01 00:31:25'),
(15, 'JV-15', 'JV', 4, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 900.00, 'journal_voucher', 'Inventory deduct for sales purpose', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:31:25', '2021-12-01 00:31:25'),
(16, 'CV-16', 'CV', 4, NULL, NULL, 'Modules\\Sale\\Entities\\Sale', 1000.00, 'voucher_recieve', 'Payment recieved by cash', 1, 0, '2021-12-01', 1, 1, '2021-12-01 00:31:25', '2021-12-01 00:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `ware_houses`
--

CREATE TABLE `ware_houses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workspaces`
--

CREATE TABLE `workspaces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'on Delete Cascade',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_workspace` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workspaces`
--

INSERT INTO `workspaces` (`id`, `user_id`, `name`, `default_workspace`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default Workspace', 1, '2021-08-16 12:58:36', '2021-08-16 12:58:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_categories`
--
ALTER TABLE `account_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_configuration_category`
--
ALTER TABLE `account_configuration_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`),
  ADD KEY `subject` (`subject_id`,`subject_type`),
  ADD KEY `causer` (`causer_id`,`causer_type`);

--
-- Indexes for table `apply_leaves`
--
ALTER TABLE `apply_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apply_loans`
--
ALTER TABLE `apply_loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `apply_loans_created_by_foreign` (`created_by`),
  ADD KEY `apply_loans_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_created_by_foreign` (`created_by`),
  ADD KEY `attendances_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_created_by_foreign` (`created_by`),
  ADD KEY `brands_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `chart_accounts`
--
ALTER TABLE `chart_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_theme`
--
ALTER TABLE `color_theme`
  ADD KEY `color_theme_color_id_foreign` (`color_id`),
  ADD KEY `color_theme_theme_id_foreign` (`theme_id`);

--
-- Indexes for table `combo_products`
--
ALTER TABLE `combo_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `combo_products_created_by_foreign` (`created_by`),
  ADD KEY `combo_products_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `combo_product_details`
--
ALTER TABLE `combo_product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `cost_of_goods_histories`
--
ALTER TABLE `cost_of_goods_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_created_by_foreign` (`created_by`),
  ADD KEY `coupons_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_n_fs`
--
ALTER TABLE `c_n_fs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_n_fs_created_by_foreign` (`created_by`),
  ADD KEY `c_n_fs_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `date_formats`
--
ALTER TABLE `date_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_created_by_foreign` (`created_by`),
  ADD KEY `expenses_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_user_id_foreign` (`user_id`),
  ADD KEY `fields_workspace_id_foreign` (`workspace_id`);

--
-- Indexes for table `field_options`
--
ALTER TABLE `field_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_options_field_id_foreign` (`field_id`);

--
-- Indexes for table `field_project`
--
ALTER TABLE `field_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_project_field_id_foreign` (`field_id`),
  ADD KEY `field_project_project_id_foreign` (`project_id`);

--
-- Indexes for table `field_task`
--
ALTER TABLE `field_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_task_task_id_foreign` (`task_id`),
  ADD KEY `field_task_field_id_foreign` (`field_id`),
  ADD KEY `field_task_user_id_foreign` (`user_id`),
  ADD KEY `field_task_option_id_foreign` (`option_id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_created_by_foreign` (`created_by`),
  ADD KEY `incomes_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `intro_prefix`
--
ALTER TABLE `intro_prefix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_phrases`
--
ALTER TABLE `language_phrases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_defines`
--
ALTER TABLE `leave_defines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `models_created_by_foreign` (`created_by`),
  ADD KEY `models_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `opening_balance_histories`
--
ALTER TABLE `opening_balance_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opening_balance_histories_created_by_foreign` (`created_by`),
  ADD KEY `opening_balance_histories_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `part_numbers`
--
ALTER TABLE `part_numbers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `part_numbers_seiral_no_unique` (`seiral_no`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payrolls_created_by_foreign` (`created_by`),
  ADD KEY `payrolls_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `payroll_earn_deducs`
--
ALTER TABLE `payroll_earn_deducs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_earn_deducs_created_by_foreign` (`created_by`),
  ADD KEY `payroll_earn_deducs_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_created_by_foreign` (`created_by`),
  ADD KEY `products_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `product_histories`
--
ALTER TABLE `product_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_histories_created_by_foreign` (`created_by`),
  ADD KEY `product_histories_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `product_item_details`
--
ALTER TABLE `product_item_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_item_details_part_numbers`
--
ALTER TABLE `product_item_details_part_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_selling_price_histories`
--
ALTER TABLE `product_selling_price_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sku`
--
ALTER TABLE `product_sku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_product_id_foreign` (`product_id`),
  ADD KEY `product_variations_created_by_foreign` (`created_by`),
  ADD KEY `product_variations_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_user_id_foreign` (`user_id`),
  ADD KEY `projects_team_id_foreign` (`team_id`);

--
-- Indexes for table `project_comments`
--
ALTER TABLE `project_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_comments_project_id_foreign` (`project_id`),
  ADD KEY `project_comments_parent_id_foreign` (`parent_id`),
  ADD KEY `project_comments_created_by_foreign` (`created_by`);

--
-- Indexes for table `project_task`
--
ALTER TABLE `project_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_task_task_id_foreign` (`task_id`),
  ADD KEY `project_task_project_id_foreign` (`project_id`);

--
-- Indexes for table `project_user`
--
ALTER TABLE `project_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_user_user_id_foreign` (`user_id`),
  ADD KEY `project_user_project_id_foreign` (`project_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_created_by_foreign` (`created_by`),
  ADD KEY `quotations_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `receive_products`
--
ALTER TABLE `receive_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_created_by_foreign` (`created_by`),
  ADD KEY `sales_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_project_id_foreign` (`project_id`);

--
-- Indexes for table `selected_languages`
--
ALTER TABLE `selected_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `show_rooms`
--
ALTER TABLE `show_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show_rooms_created_by_foreign` (`created_by`),
  ADD KEY `show_rooms_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_documents`
--
ALTER TABLE `staff_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustments_created_by_foreign` (`created_by`),
  ADD KEY `stock_adjustments_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `stock_adjustment_products`
--
ALTER TABLE `stock_adjustment_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_products_created_by_foreign` (`created_by`),
  ADD KEY `stock_adjustment_products_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `stock_reports`
--
ALTER TABLE `stock_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suggest_lists`
--
ALTER TABLE `suggest_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_user_id_foreign` (`user_id`),
  ADD KEY `tags_workspace_id_foreign` (`workspace_id`);

--
-- Indexes for table `tag_task`
--
ALTER TABLE `tag_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_task_task_id_foreign` (`task_id`),
  ADD KEY `tag_task_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_section_id_foreign` (`section_id`),
  ADD KEY `tasks_parent_id_foreign` (`parent_id`),
  ADD KEY `tasks_created_by_foreign` (`created_by`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comments_field_id_foreign` (`field_id`),
  ADD KEY `task_comments_task_id_foreign` (`task_id`),
  ADD KEY `task_comments_created_by_foreign` (`created_by`);

--
-- Indexes for table `task_comment_likes`
--
ALTER TABLE `task_comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comment_likes_user_id_foreign` (`user_id`),
  ADD KEY `task_comment_likes_task_comment_id_foreign` (`task_comment_id`);

--
-- Indexes for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_dependencies_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_likes`
--
ALTER TABLE `task_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_likes_user_id_foreign` (`user_id`),
  ADD KEY `task_likes_task_id_foreign` (`task_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_foreign` (`user_id`),
  ADD KEY `teams_workspace_id_foreign` (`workspace_id`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_user_user_id_foreign` (`user_id`),
  ADD KEY `team_user_team_id_foreign` (`team_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_period_accounts`
--
ALTER TABLE `time_period_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_period_accounts_created_by_foreign` (`created_by`),
  ADD KEY `time_period_accounts_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `time_zones`
--
ALTER TABLE `time_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `to_dos`
--
ALTER TABLE `to_dos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tranaction_account`
--
ALTER TABLE `tranaction_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_voucherable_type_voucherable_id_index` (`voucherable_type`,`voucherable_id`);

--
-- Indexes for table `type_opening_balances`
--
ALTER TABLE `type_opening_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_types`
--
ALTER TABLE `unit_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_types_created_by_foreign` (`created_by`),
  ADD KEY `unit_types_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploads_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_current_workspace_id_foreign` (`current_workspace_id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_created_by_foreign` (`created_by`),
  ADD KEY `variants_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `variant_values`
--
ALTER TABLE `variant_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_values_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `version_histories`
--
ALTER TABLE `version_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vouchers_created_by_foreign` (`created_by`),
  ADD KEY `vouchers_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `ware_houses`
--
ALTER TABLE `ware_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ware_houses_created_by_foreign` (`created_by`),
  ADD KEY `ware_houses_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `workspaces`
--
ALTER TABLE `workspaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspaces_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_categories`
--
ALTER TABLE `account_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_configuration_category`
--
ALTER TABLE `account_configuration_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apply_leaves`
--
ALTER TABLE `apply_leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apply_loans`
--
ALTER TABLE `apply_loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chart_accounts`
--
ALTER TABLE `chart_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `combo_products`
--
ALTER TABLE `combo_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `combo_product_details`
--
ALTER TABLE `combo_product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cost_of_goods_histories`
--
ALTER TABLE `cost_of_goods_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `c_n_fs`
--
ALTER TABLE `c_n_fs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `date_formats`
--
ALTER TABLE `date_formats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `field_options`
--
ALTER TABLE `field_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_project`
--
ALTER TABLE `field_project`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_task`
--
ALTER TABLE `field_task`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `intro_prefix`
--
ALTER TABLE `intro_prefix`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `language_phrases`
--
ALTER TABLE `language_phrases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_defines`
--
ALTER TABLE `leave_defines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opening_balance_histories`
--
ALTER TABLE `opening_balance_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `part_numbers`
--
ALTER TABLE `part_numbers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_earn_deducs`
--
ALTER TABLE `payroll_earn_deducs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_histories`
--
ALTER TABLE `product_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_item_details`
--
ALTER TABLE `product_item_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_item_details_part_numbers`
--
ALTER TABLE `product_item_details_part_numbers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_selling_price_histories`
--
ALTER TABLE `product_selling_price_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_sku`
--
ALTER TABLE `product_sku`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_comments`
--
ALTER TABLE `project_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_task`
--
ALTER TABLE `project_task`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_user`
--
ALTER TABLE `project_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receive_products`
--
ALTER TABLE `receive_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selected_languages`
--
ALTER TABLE `selected_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `show_rooms`
--
ALTER TABLE `show_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_documents`
--
ALTER TABLE `staff_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_products`
--
ALTER TABLE `stock_adjustment_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_reports`
--
ALTER TABLE `stock_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suggest_lists`
--
ALTER TABLE `suggest_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_task`
--
ALTER TABLE `tag_task`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_comment_likes`
--
ALTER TABLE `task_comment_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_likes`
--
ALTER TABLE `task_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_period_accounts`
--
ALTER TABLE `time_period_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `to_dos`
--
ALTER TABLE `to_dos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tranaction_account`
--
ALTER TABLE `tranaction_account`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `type_opening_balances`
--
ALTER TABLE `type_opening_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_types`
--
ALTER TABLE `unit_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variant_values`
--
ALTER TABLE `variant_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `version_histories`
--
ALTER TABLE `version_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ware_houses`
--
ALTER TABLE `ware_houses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workspaces`
--
ALTER TABLE `workspaces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apply_loans`
--
ALTER TABLE `apply_loans`
  ADD CONSTRAINT `apply_loans_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `apply_loans_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `attendances_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `color_theme`
--
ALTER TABLE `color_theme`
  ADD CONSTRAINT `color_theme_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `color_theme_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `combo_products`
--
ALTER TABLE `combo_products`
  ADD CONSTRAINT `combo_products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `combo_products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupons_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `c_n_fs`
--
ALTER TABLE `c_n_fs`
  ADD CONSTRAINT `c_n_fs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `c_n_fs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fields_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `field_options`
--
ALTER TABLE `field_options`
  ADD CONSTRAINT `field_options_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `field_project`
--
ALTER TABLE `field_project`
  ADD CONSTRAINT `field_project_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `field_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `field_task`
--
ALTER TABLE `field_task`
  ADD CONSTRAINT `field_task_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `field_task_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `field_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `field_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `field_task_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `models_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `opening_balance_histories`
--
ALTER TABLE `opening_balance_histories`
  ADD CONSTRAINT `opening_balance_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `opening_balance_histories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payrolls_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `payroll_earn_deducs`
--
ALTER TABLE `payroll_earn_deducs`
  ADD CONSTRAINT `payroll_earn_deducs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payroll_earn_deducs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_histories`
--
ALTER TABLE `product_histories`
  ADD CONSTRAINT `product_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_histories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_comments`
--
ALTER TABLE `project_comments`
  ADD CONSTRAINT `project_comments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `project_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_comments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_task`
--
ALTER TABLE `project_task`
  ADD CONSTRAINT `project_task_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_user`
--
ALTER TABLE `project_user`
  ADD CONSTRAINT `project_user_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quotations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `show_rooms`
--
ALTER TABLE `show_rooms`
  ADD CONSTRAINT `show_rooms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `show_rooms_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD CONSTRAINT `stock_adjustments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustments_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_products`
--
ALTER TABLE `stock_adjustment_products`
  ADD CONSTRAINT `stock_adjustment_products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tags_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tag_task`
--
ALTER TABLE `tag_task`
  ADD CONSTRAINT `tag_task_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tag_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_comments_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_comment_likes`
--
ALTER TABLE `task_comment_likes`
  ADD CONSTRAINT `task_comment_likes_task_comment_id_foreign` FOREIGN KEY (`task_comment_id`) REFERENCES `task_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_comment_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  ADD CONSTRAINT `task_dependencies_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_likes`
--
ALTER TABLE `task_likes`
  ADD CONSTRAINT `task_likes_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teams_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_user`
--
ALTER TABLE `team_user`
  ADD CONSTRAINT `team_user_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `time_period_accounts`
--
ALTER TABLE `time_period_accounts`
  ADD CONSTRAINT `time_period_accounts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `time_period_accounts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `unit_types`
--
ALTER TABLE `unit_types`
  ADD CONSTRAINT `unit_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `unit_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_current_workspace_id_foreign` FOREIGN KEY (`current_workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variants_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variant_values`
--
ALTER TABLE `variant_values`
  ADD CONSTRAINT `variant_values_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `vouchers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vouchers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ware_houses`
--
ALTER TABLE `ware_houses`
  ADD CONSTRAINT `ware_houses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ware_houses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workspaces`
--
ALTER TABLE `workspaces`
  ADD CONSTRAINT `workspaces_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
