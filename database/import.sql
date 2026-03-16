-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 05, 2026 at 05:09 AM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u214573487_wham5`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `role` varchar(250) NOT NULL DEFAULT 'admin',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `uid`, `role`, `createdAt`) VALUES
(1, 'admin@admin.com', '$2b$10$HHbFod1VgucjKF0btEPODem4n380zouMZZN7p6yHgeb6UZYqPZqXu', 'XhbfYkIAC1bYGhUodfJppmRCEUyGQJCZ', 'admin', '2024-01-31 13:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `owner_uid` varchar(250) DEFAULT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `role` varchar(250) DEFAULT 'agent',
  `email` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `comments` longtext DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `logs` longtext DEFAULT NULL,
  `mask_number` int(11) DEFAULT 1,
  `allow_send_new_qr` int(11) DEFAULT 0,
  `allow_save_contact` int(11) DEFAULT 0,
  `fcm_data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_chats`
--

CREATE TABLE `agent_chats` (
  `id` int(11) NOT NULL,
  `owner_uid` varchar(250) DEFAULT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `chat_id` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_task`
--

CREATE TABLE `agent_task` (
  `id` int(11) NOT NULL,
  `owner_uid` varchar(250) DEFAULT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `agent_comments` longtext DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_task`
--

INSERT INTO `agent_task` (`id`, `owner_uid`, `uid`, `title`, `description`, `agent_comments`, `status`, `createdAt`) VALUES
(2, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', 'holiday ', 'tell all customer that its holiday', 'this was done', 'COMPLETED', '2024-04-09 06:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `session` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`value`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_api_logs`
--

CREATE TABLE `beta_api_logs` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `msg_id` varchar(250) DEFAULT NULL,
  `request` longtext DEFAULT NULL,
  `err` longtext DEFAULT NULL,
  `response` longtext DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_campaign`
--

CREATE TABLE `beta_campaign` (
  `id` int(11) NOT NULL,
  `campaign_id` varchar(250) NOT NULL,
  `uid` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `template_name` varchar(250) NOT NULL,
  `template_language` varchar(250) NOT NULL,
  `phonebook_id` varchar(250) NOT NULL,
  `phonebook_name` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'PENDING',
  `total_contacts` int(11) NOT NULL DEFAULT 0,
  `sent_count` int(11) NOT NULL DEFAULT 0,
  `delivered_count` int(11) NOT NULL DEFAULT 0,
  `read_count` int(11) NOT NULL DEFAULT 0,
  `failed_count` int(11) NOT NULL DEFAULT 0,
  `body_variables` longtext DEFAULT NULL,
  `header_variable` longtext DEFAULT NULL,
  `button_variables` longtext DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `timezone` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_campaign_logs`
--

CREATE TABLE `beta_campaign_logs` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) NOT NULL,
  `campaign_id` varchar(250) NOT NULL,
  `contact_name` varchar(250) NOT NULL,
  `contact_mobile` varchar(250) NOT NULL,
  `meta_msg_id` varchar(250) DEFAULT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'PENDING',
  `delivery_status` varchar(250) DEFAULT NULL,
  `delivery_time` varchar(250) DEFAULT NULL,
  `error_message` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_chatbot`
--

CREATE TABLE `beta_chatbot` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `source` varchar(250) DEFAULT 'wa_chatbot',
  `title` varchar(250) DEFAULT NULL,
  `flow_id` varchar(250) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `origin` longtext DEFAULT NULL,
  `origin_id` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_chats`
--

CREATE TABLE `beta_chats` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `old_chat_id` varchar(250) DEFAULT NULL,
  `profile` longtext DEFAULT NULL,
  `origin_instance_id` varchar(250) DEFAULT NULL,
  `chat_id` varchar(250) DEFAULT NULL,
  `last_message` longtext DEFAULT NULL,
  `chat_label` longtext DEFAULT NULL,
  `chat_note` longtext DEFAULT NULL,
  `sender_name` varchar(250) DEFAULT NULL,
  `sender_mobile` varchar(250) DEFAULT NULL,
  `unread_count` bigint(20) DEFAULT 0,
  `origin` varchar(250) DEFAULT NULL,
  `assigned_agent` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_conversation`
--

CREATE TABLE `beta_conversation` (
  `id` int(11) NOT NULL,
  `type` varchar(250) DEFAULT NULL,
  `chat_id` varchar(250) DEFAULT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `metaChatId` varchar(250) DEFAULT NULL,
  `msgContext` longtext DEFAULT NULL,
  `reaction` varchar(250) DEFAULT NULL,
  `timestamp` varchar(250) DEFAULT NULL,
  `senderName` varchar(250) DEFAULT NULL,
  `senderMobile` varchar(250) DEFAULT NULL,
  `star` varchar(250) DEFAULT NULL,
  `route` varchar(250) DEFAULT NULL,
  `context` longtext DEFAULT NULL,
  `origin` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `sentBy` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_flows`
--

CREATE TABLE `beta_flows` (
  `id` int(11) NOT NULL,
  `is_active` int(11) DEFAULT 1,
  `uid` varchar(250) DEFAULT NULL,
  `flow_id` varchar(250) DEFAULT NULL,
  `source` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast`
--

CREATE TABLE `broadcast` (
  `id` int(11) NOT NULL,
  `broadcast_id` varchar(250) DEFAULT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `templet` longtext DEFAULT NULL,
  `phonebook` longtext DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `timezone` varchar(250) DEFAULT 'Asia/Kolkata',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_log`
--

CREATE TABLE `broadcast_log` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `broadcast_id` varchar(250) DEFAULT NULL,
  `templet_name` varchar(250) DEFAULT NULL,
  `is_read` int(1) DEFAULT 0,
  `meta_msg_id` varchar(250) DEFAULT NULL,
  `sender_mobile` varchar(250) DEFAULT NULL,
  `send_to` varchar(250) DEFAULT NULL,
  `delivery_status` varchar(250) DEFAULT 'PENDING',
  `delivery_time` varchar(250) DEFAULT NULL,
  `err` longtext DEFAULT NULL,
  `example` longtext DEFAULT NULL,
  `contact` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `for_all` int(1) DEFAULT 0,
  `chats` longtext DEFAULT NULL,
  `flow` longtext DEFAULT NULL,
  `flow_id` varchar(250) DEFAULT NULL,
  `active` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `origin` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(250) DEFAULT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `last_message_came` varchar(250) DEFAULT NULL,
  `chat_note` longtext DEFAULT NULL,
  `chat_tags` longtext DEFAULT NULL,
  `sender_name` varchar(250) DEFAULT NULL,
  `sender_mobile` varchar(250) DEFAULT NULL,
  `chat_status` varchar(250) DEFAULT 'open',
  `is_opened` int(1) DEFAULT 0,
  `last_message` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `origin` varchar(250) DEFAULT 'meta',
  `profile` longtext DEFAULT NULL,
  `other` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_tags`
--

CREATE TABLE `chat_tags` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `hex` varchar(250) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_widget`
--

CREATE TABLE `chat_widget` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(250) DEFAULT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `whatsapp_number` varchar(250) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `place` varchar(250) DEFAULT NULL,
  `size` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_widget`
--

INSERT INTO `chat_widget` (`id`, `unique_id`, `uid`, `title`, `whatsapp_number`, `logo`, `place`, `size`, `createdAt`) VALUES
(5, 'ydHVJqmfnL', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'test', '918430088300', 'whatsapp-color-icon.png', 'BOTTOM_RIGHT', '65', '2024-04-10 14:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `phonebook_id` varchar(250) DEFAULT NULL,
  `phonebook_name` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `var1` varchar(250) DEFAULT NULL,
  `var2` varchar(250) DEFAULT NULL,
  `var3` varchar(250) DEFAULT NULL,
  `var4` varchar(250) DEFAULT NULL,
  `var5` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `var6` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `uid`, `phonebook_id`, `phonebook_name`, `name`, `mobile`, `var1`, `var2`, `var3`, `var4`, `var5`, `createdAt`, `var6`) VALUES
(48, 'OnjWZ9wHtdqTrAnZL32DgYbZjs3UZlis', '39', 'code', 'codeyon', '918430088300', NULL, NULL, NULL, NULL, NULL, '2025-09-09 09:26:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `id` int(11) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`id`, `email`, `name`, `mobile`, `content`, `createdAt`) VALUES
(1, 'email@gmail.com', 'John do', '+91999999999', 'hello, what are the charges', '2024-02-28 07:57:12'),
(5, 'Rosslina70@gmail.com', 'Rosslina bt Mohamed Ali', '0182124394', 'Urut Terapuetic  Neuromuskuler & Terapi Getaran Saraf', '2026-01-10 04:07:53'),
(6, 'email@gmail.com', 'asd', '91823233', 'asdsad', '2026-01-23 07:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `createdAt`) VALUES
(4, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:20:45'),
(5, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:20:52'),
(6, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:20:57'),
(7, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:21:05'),
(8, 'this is general', 'this is the general categroy ', '2026-01-19 04:38:02'),
(9, 'this is General', 'this is General this is General', '2026-01-19 04:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `flow`
--

CREATE TABLE `flow` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `flow_id` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `prevent_list` longtext DEFAULT NULL,
  `ai_list` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flow_data`
--

CREATE TABLE `flow_data` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `uniqueId` varchar(250) DEFAULT NULL,
  `inputs` longtext DEFAULT NULL,
  `other` longtext DEFAULT NULL,
  `meta_data` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flow_session`
--

CREATE TABLE `flow_session` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `origin` varchar(250) DEFAULT NULL,
  `origin_id` varchar(250) DEFAULT NULL,
  `flow_id` varchar(250) DEFAULT NULL,
  `sender_mobile` varchar(250) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gen_links`
--

CREATE TABLE `gen_links` (
  `id` int(11) NOT NULL,
  `wa_mobile` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `msg` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gen_links`
--

INSERT INTO `gen_links` (`id`, `wa_mobile`, `email`, `msg`, `createdAt`) VALUES
(2, '918430088300', 'email@gmail.com', 'hey there i am using whatsapp', '2024-08-25 09:41:12'),
(3, '918430088300', 'email@gmail.com', 'hey i am living in my dreams.', '2024-08-25 10:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `g_auth`
--

CREATE TABLE `g_auth` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instance`
--

CREATE TABLE `instance` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `number` varchar(250) DEFAULT NULL,
  `uniqueId` varchar(250) DEFAULT NULL,
  `qr` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `other` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_api`
--

CREATE TABLE `meta_api` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `waba_id` varchar(250) DEFAULT NULL,
  `business_account_id` varchar(250) DEFAULT NULL,
  `access_token` varchar(250) DEFAULT NULL,
  `business_phone_number_id` varchar(250) DEFAULT NULL,
  `app_id` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `embed_data` longtext DEFAULT NULL,
  `login_type` varchar(250) DEFAULT 'manual',
  `is_coexistence` tinyint(1) DEFAULT 0,
  `platform_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_templet_media`
--

CREATE TABLE `meta_templet_media` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `templet_name` varchar(250) DEFAULT NULL,
  `meta_hash` varchar(250) DEFAULT NULL,
  `file_name` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_app`
--

CREATE TABLE `mobile_app` (
  `id` int(11) NOT NULL,
  `fcmJson` longtext DEFAULT NULL,
  `appTheme` longtext DEFAULT NULL,
  `other` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `payment_mode` varchar(250) DEFAULT NULL,
  `amount` varchar(250) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `s_token` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `permanent` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `slug`, `title`, `image`, `content`, `permanent`, `createdAt`) VALUES
(3, 'privacy-policy', 'Privacy policy', 'yLUH6z8H3bQJzraErEpz7CQWepftq7D6.png', '<p><strong>Last updated:</strong> December 2025</p><p>WaCRM (“we”, “our”, or “us”) respects your privacy and is committed to protecting it. This Privacy Policy explains how we collect, use, store, and protect your information when you use our mobile application and related services.</p><p><br></p><h2>1. Information We Collect</h2><p>We collect only the information necessary to provide the service.</p><p><br></p><p><br></p><h3>a. Account Information</h3><p>When you create or use an account, we may collect:</p><p><br></p><p><br></p><ul><li>Name</li><li>Email address</li><li>Mobile number</li><li>Login credentials (encrypted)</li></ul><h3>b. Messaging &amp; Usage Data</h3><p>If you connect your WhatsApp account through official APIs or permitted integrations:</p><p><br></p><p><br></p><ul><li>Message metadata (timestamps, delivery status)</li><li>Message content is processed transiently only as required to display conversations to the user and is not stored or analyzed for any other purpose</li><li>Media files you choose to send, receive, or store</li></ul><p>We <strong>do not read, sell, or share message content for advertising purposes</strong>.</p><p><br></p><p><br></p><h3>c. Device Information</h3><ul><li>Device type and operating system</li><li>App version</li><li>Crash logs and performance diagnostics</li></ul><h3>d. Notifications</h3><p>If you choose to enable push notifications, we store a notification token to deliver alerts.</p><p>Notifications are <strong>optional</strong> and can be disabled at any time.</p><p><br></p><h2>2. How We Use Information</h2><p>We use collected information to:</p><p><br></p><p><br></p><ul><li>Provide and operate the WaCRM app</li><li>Authenticate users</li><li>Display and manage chat inboxes</li><li>Send optional notifications</li><li>Improve app performance and reliability</li><li>Provide customer support</li></ul><p>We do <strong>not</strong> use your data for advertising or marketing without consent.</p><p><br></p><h2>3. WhatsApp &amp; Third-Party Services</h2><p>WaCRM integrates with:</p><p><br></p><p><br></p><ul><li>Official WhatsApp Cloud API (by Meta)</li><li>Other optional third-party services configured by the user</li></ul><p>Data shared with third-party services is limited to what is required for the selected integration and is governed by their respective privacy policies.</p><p><br></p><h2>4. Payments &amp; Subscriptions</h2><p>WaCRM <strong>does not process payments, subscriptions, or in-app purchases</strong> within the mobile app.</p><p>Any account access or feature availability is provisioned externally by businesses or administrators and is not purchased inside the app.</p><p><br></p><h2>5. Data Sharing</h2><p>We do <strong>not sell or rent personal data</strong>.</p><p>We may share information only:</p><p><br></p><p><br></p><ul><li>When required by law</li><li>To comply with legal obligations</li><li>To protect rights, safety, or security</li></ul><h2>6. Data Storage &amp; Security</h2><ul><li>Data is stored securely using industry-standard safeguards</li><li>Access is restricted to authorized systems only</li><li>We use encryption where applicable</li></ul><p>Despite best efforts, no system is 100% secure.</p><p><br></p><h2>7. User Rights</h2><p>You have the right to:</p><p><br></p><p><br></p><ul><li>Access your personal data</li><li>Request correction or deletion of your data</li><li>Disable notifications at any time</li><li>Request account deletion</li></ul><p>To request account deletion or data removal, contact us using the details below.</p><p><br></p><p>WaCRM does not store WhatsApp messages on Meta’s behalf and acts only as a data processor for user-initiated communications.</p><p><br></p><h2>8. Children’s Privacy</h2><p>WaCRM is <strong>not intended for users under the age of 13</strong>.</p><p>We do not knowingly collect data from children.</p><p><br></p><h2>9. Changes to This Policy</h2><p>We may update this Privacy Policy from time to time.</p><p>Any changes will be posted on this page with an updated date.</p><p><br></p><h2>10. Contact Us</h2><p>If you have any questions about this Privacy Policy or your data, contact us at:</p><p><strong>Email:</strong> support@codeyon.com</p><p class=\"ql-align-justify\"><strong>Website:</strong> <a href=\"https://codeyon.com\" rel=\"noopener noreferrer\" target=\"_blank\">https://codeyon.com</a></p>', 1, '2024-02-28 09:21:17'),
(4, 'terms-and-conditions', 'termns', 'yLUH6z8H3bQJzraErEpz7CQWepftq7D6.png', '<p><strong>Last updated:</strong> December 2025</p><p>WaCRM (“we”, “our”, or “us”) respects your privacy and is committed to protecting it. This Privacy Policy explains how we collect, use, store, and protect your information when you use our mobile application and related services.</p><h2>1. Information We Collect</h2><p>We collect only the information necessary to provide the service.</p><p><br></p><h3>a. Account Information</h3><p>When you create or use an account, we may collect:</p><p><br></p><ul><li>Name</li><li>Email address</li><li>Mobile number</li><li>Login credentials (encrypted)</li></ul><h3>b. Messaging &amp; Usage Data</h3><p>If you connect your WhatsApp account through official APIs or permitted integrations:</p><p><br></p><ul><li>Message metadata (timestamps, delivery status)</li><li>Message content processed only to display chats inside the app</li><li>Media files you choose to send, receive, or store</li></ul><p>We <strong>do not read, sell, or share message content for advertising purposes</strong>.</p><p><br></p><h3>c. Device Information</h3><ul><li>Device type and operating system</li><li>App version</li><li>Crash logs and performance diagnostics</li></ul><h3>d. Notifications</h3><p>If you choose to enable push notifications, we store a notification token to deliver alerts.</p><p>Notifications are <strong>optional</strong> and can be disabled at any time.</p><h2>2. How We Use Information</h2><p>We use collected information to:</p><p><br></p><ul><li>Provide and operate the WaCRM app</li><li>Authenticate users</li><li>Display and manage chat inboxes</li><li>Send optional notifications</li><li>Improve app performance and reliability</li><li>Provide customer support</li></ul><p>We do <strong>not</strong> use your data for advertising or marketing without consent.</p><h2>3. WhatsApp &amp; Third-Party Services</h2><p>WaCRM integrates with:</p><p><br></p><ul><li>Official WhatsApp Cloud API (by Meta)</li><li>Other optional third-party services configured by the user</li></ul><p>Data shared with third-party services is limited to what is required for the selected integration and is governed by their respective privacy policies.</p><h2>4. Payments &amp; Subscriptions</h2><p>WaCRM <strong>does not process payments, subscriptions, or in-app purchases</strong> within the mobile app.</p><p>Any account access or feature availability is provisioned externally by businesses or administrators and is not purchased inside the app.</p><h2>5. Data Sharing</h2><p>We do <strong>not sell or rent personal data</strong>.</p><p>We may share information only:</p><p><br></p><ul><li>When required by law</li><li>To comply with legal obligations</li><li>To protect rights, safety, or security</li></ul><h2>6. Data Storage &amp; Security</h2><ul><li>Data is stored securely using industry-standard safeguards</li><li>Access is restricted to authorized systems only</li><li>We use encryption where applicable</li></ul><p>Despite best efforts, no system is 100% secure.</p><h2>7. User Rights</h2><p>You have the right to:</p><p><br></p><ul><li>Access your personal data</li><li>Request correction or deletion of your data</li><li>Disable notifications at any time</li><li>Request account deletion</li></ul><p>To request account deletion or data removal, contact us using the details below.</p><h2>8. Children’s Privacy</h2><p>WaCRM is <strong>not intended for users under the age of 13</strong>.</p><p>We do not knowingly collect data from children.</p><h2>9. Changes to This Policy</h2><p>We may update this Privacy Policy from time to time.</p><p>Any changes will be posted on this page with an updated date.</p><h2>10. Contact Us</h2><p>If you have any questions about this Privacy Policy or your data, contact us at:</p><p><strong>Email:</strong> support@codeyon.com</p><p class=\"ql-align-justify\"><strong>Website:</strong> <a href=\"https://codeyon.com\" rel=\"noopener noreferrer\" target=\"_blank\">https://codeyon.com</a></p>', 1, '2024-02-28 09:26:11'),
(17, 'lorem-one', 'Lorem one', 'dt6jyFCr8b0VFEZWv8qUNSfyxAeBR6Zz.png', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper dolor nisi, eget porta urna eleifend eget. Aliquam erat volutpat. Quisque elementum metus id metus pharetra, et sagittis eros rhoncus. Donec lacinia viverra erat, vitae suscipit leo ultricies feugiat. Phasellus vulputate, est a volutpat molestie, ex diam gravida nisi, ac porta nulla urna eu ipsum. Ut lobortis erat id porttitor suscipit. Integer tristique neque eu diam ornare, sit amet tincidunt nulla luctus. Morbi ultricies nisl sit amet mattis bibendum. Nam gravida at est vel eleifend. Cras ultricies congue ligula id convallis. Phasellus sit amet dolor et neque dapibus iaculis non eu dui. Proin neque lorem, condimentum eu lacus ac, facilisis egestas lacus. Nunc fermentum sagittis tellus, eget varius augue sollicitudin vel. Sed gravida ultrices vulputate.</p><p class=\"ql-align-justify\">Proin a hendrerit orci. Maecenas ultricies leo a diam porttitor imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at dui ut felis tincidunt facilisis. Sed interdum arcu ut arcu pharetra vehicula. Duis laoreet congue enim sit amet ullamcorper. Praesent dignissim ligula ut nibh auctor, vitae fringilla odio mattis.</p><p class=\"ql-align-justify\">Sed nulla lorem, tincidunt sit amet imperdiet nec, dapibus sed nulla. Ut eu condimentum elit, vitae consequat diam. Nunc eget dolor ac velit condimentum varius id in ipsum. Ut ultricies mollis diam et consectetur. Praesent ornare sapien lorem, eget condimentum mi iaculis at. Aliquam erat volutpat. Ut aliquam odio sed mattis tincidunt. Pellentesque ac sapien ac tellus pretium volutpat a consectetur lacus. Aenean blandit nulla imperdiet blandit ultrices. Sed faucibus tristique felis sed laoreet. Suspendisse et vulputate dui, ac consectetur eros. Integer elementum dapibus urna, id accumsan dolor fermentum id. Aenean id urna malesuada ligula venenatis venenatis iaculis ac felis.</p><p class=\"ql-align-justify\">Donec hendrerit erat eget tincidunt finibus. Cras lacus odio, luctus sed elit non, pretium efficitur neque. Integer nec nunc sapien. Donec eu velit enim. Curabitur tincidunt lectus in tincidunt mollis. Donec ultrices dui augue, eu pulvinar arcu ultrices ac. Suspendisse eget neque nec orci mattis maximus at ut arcu. Vivamus leo ex, luctus eget lacus eget, rutrum condimentum massa. Vestibulum pulvinar ullamcorper erat eu tincidunt. Donec purus ante, auctor sit amet placerat sed, viverra ut leo. Aenean tristique massa non sodales viverra.</p><p class=\"ql-align-justify\">Quisque ac commodo eros. Etiam id ultricies mauris. Nam urna ex, viverra eu felis id, sodales tincidunt ipsum. Nulla pharetra in mauris fermentum convallis. Proin velit neque, consequat quis nunc nec, rutrum sollicitudin ipsum. Sed consequat rutrum commodo. Etiam tincidunt tellus vel leo euismod imperdiet. Suspendisse tempus sed tortor eget sollicitudin. Morbi feugiat, leo non euismod maximus, purus erat bibendum dui, ac fermentum arcu magna id tortor. Mauris mi ante, gravida non ex ut, venenatis ullamcorper nunc. Quisque feugiat justo ut lacus mattis aliquam. Curabitur euismod tincidunt turpis. Integer rutrum, nunc eu iaculis condimentum, massa odio facilisis velit, ut volutpat eros nisi ut risus. Nullam faucibus metus dolor, ut aliquet turpis condimentum non. Aliquam sit amet urna neque. Praesent facilisis blandit tincidunt.</p><p><br></p>', 0, '2025-04-19 13:54:32'),
(18, 'lorem-two', 'Lorem two', 'Ny3GD3L42ySjJGdNUBhNN2d016cSSwMD.png', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper dolor nisi, eget porta urna eleifend eget. Aliquam erat volutpat. Quisque elementum metus id metus pharetra, et sagittis eros rhoncus. Donec lacinia viverra erat, vitae suscipit leo ultricies feugiat. Phasellus vulputate, est a volutpat molestie, ex diam gravida nisi, ac porta nulla urna eu ipsum. Ut lobortis erat id porttitor suscipit. Integer tristique neque eu diam ornare, sit amet tincidunt nulla luctus. Morbi ultricies nisl sit amet mattis bibendum. Nam gravida at est vel eleifend. Cras ultricies congue ligula id convallis. Phasellus sit amet dolor et neque dapibus iaculis non eu dui. Proin neque lorem, condimentum eu lacus ac, facilisis egestas lacus. Nunc fermentum sagittis tellus, eget varius augue sollicitudin vel. Sed gravida ultrices vulputate.</p><p class=\"ql-align-justify\">Proin a hendrerit orci. Maecenas ultricies leo a diam porttitor imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at dui ut felis tincidunt facilisis. Sed interdum arcu ut arcu pharetra vehicula. Duis laoreet congue enim sit amet ullamcorper. Praesent dignissim ligula ut nibh auctor, vitae fringilla odio mattis.</p><p class=\"ql-align-justify\">Sed nulla lorem, tincidunt sit amet imperdiet nec, dapibus sed nulla. Ut eu condimentum elit, vitae consequat diam. Nunc eget dolor ac velit condimentum varius id in ipsum. Ut ultricies mollis diam et consectetur. Praesent ornare sapien lorem, eget condimentum mi iaculis at. Aliquam erat volutpat. Ut aliquam odio sed mattis tincidunt. Pellentesque ac sapien ac tellus pretium volutpat a consectetur lacus. Aenean blandit nulla imperdiet blandit ultrices. Sed faucibus tristique felis sed laoreet. Suspendisse et vulputate dui, ac consectetur eros. Integer elementum dapibus urna, id accumsan dolor fermentum id. Aenean id urna malesuada ligula venenatis venenatis iaculis ac felis.</p><p class=\"ql-align-justify\">Donec hendrerit erat eget tincidunt finibus. Cras lacus odio, luctus sed elit non, pretium efficitur neque. Integer nec nunc sapien. Donec eu velit enim. Curabitur tincidunt lectus in tincidunt mollis. Donec ultrices dui augue, eu pulvinar arcu ultrices ac. Suspendisse eget neque nec orci mattis maximus at ut arcu. Vivamus leo ex, luctus eget lacus eget, rutrum condimentum massa. Vestibulum pulvinar ullamcorper erat eu tincidunt. Donec purus ante, auctor sit amet placerat sed, viverra ut leo. Aenean tristique massa non sodales viverra.</p><p class=\"ql-align-justify\">Quisque ac commodo eros. Etiam id ultricies mauris. Nam urna ex, viverra eu felis id, sodales tincidunt ipsum. Nulla pharetra in mauris fermentum convallis. Proin velit neque, consequat quis nunc nec, rutrum sollicitudin ipsum. Sed consequat rutrum commodo. Etiam tincidunt tellus vel leo euismod imperdiet. Suspendisse tempus sed tortor eget sollicitudin. Morbi feugiat, leo non euismod maximus, purus erat bibendum dui, ac fermentum arcu magna id tortor. Mauris mi ante, gravida non ex ut, venenatis ullamcorper nunc. Quisque feugiat justo ut lacus mattis aliquam. Curabitur euismod tincidunt turpis. Integer rutrum, nunc eu iaculis condimentum, massa odio facilisis velit, ut volutpat eros nisi ut risus. Nullam faucibus metus dolor, ut aliquet turpis condimentum non. Aliquam sit amet urna neque. Praesent facilisis blandit tincidunt.</p><p><br></p>', 0, '2025-04-19 13:54:39'),
(19, 'lorem-three', 'Lorem three', 'AVfIQlF7o2H9uai4yyzonnWOY9SeZGuQ.png', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper dolor nisi, eget porta urna eleifend eget. Aliquam erat volutpat. Quisque elementum metus id metus pharetra, et sagittis eros rhoncus. Donec lacinia viverra erat, vitae suscipit leo ultricies feugiat. Phasellus vulputate, est a volutpat molestie, ex diam gravida nisi, ac porta nulla urna eu ipsum. Ut lobortis erat id porttitor suscipit. Integer tristique neque eu diam ornare, sit amet tincidunt nulla luctus. Morbi ultricies nisl sit amet mattis bibendum. Nam gravida at est vel eleifend. Cras ultricies congue ligula id convallis. Phasellus sit amet dolor et neque dapibus iaculis non eu dui. Proin neque lorem, condimentum eu lacus ac, facilisis egestas lacus. Nunc fermentum sagittis tellus, eget varius augue sollicitudin vel. Sed gravida ultrices vulputate.</p><p class=\"ql-align-justify\">Proin a hendrerit orci. Maecenas ultricies leo a diam porttitor imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at dui ut felis tincidunt facilisis. Sed interdum arcu ut arcu pharetra vehicula. Duis laoreet congue enim sit amet ullamcorper. Praesent dignissim ligula ut nibh auctor, vitae fringilla odio mattis.</p><p class=\"ql-align-justify\">Sed nulla lorem, tincidunt sit amet imperdiet nec, dapibus sed nulla. Ut eu condimentum elit, vitae consequat diam. Nunc eget dolor ac velit condimentum varius id in ipsum. Ut ultricies mollis diam et consectetur. Praesent ornare sapien lorem, eget condimentum mi iaculis at. Aliquam erat volutpat. Ut aliquam odio sed mattis tincidunt. Pellentesque ac sapien ac tellus pretium volutpat a consectetur lacus. Aenean blandit nulla imperdiet blandit ultrices. Sed faucibus tristique felis sed laoreet. Suspendisse et vulputate dui, ac consectetur eros. Integer elementum dapibus urna, id accumsan dolor fermentum id. Aenean id urna malesuada ligula venenatis venenatis iaculis ac felis.</p><p class=\"ql-align-justify\">Donec hendrerit erat eget tincidunt finibus. Cras lacus odio, luctus sed elit non, pretium efficitur neque. Integer nec nunc sapien. Donec eu velit enim. Curabitur tincidunt lectus in tincidunt mollis. Donec ultrices dui augue, eu pulvinar arcu ultrices ac. Suspendisse eget neque nec orci mattis maximus at ut arcu. Vivamus leo ex, luctus eget lacus eget, rutrum condimentum massa. Vestibulum pulvinar ullamcorper erat eu tincidunt. Donec purus ante, auctor sit amet placerat sed, viverra ut leo. Aenean tristique massa non sodales viverra.</p><p class=\"ql-align-justify\">Quisque ac commodo eros. Etiam id ultricies mauris. Nam urna ex, viverra eu felis id, sodales tincidunt ipsum. Nulla pharetra in mauris fermentum convallis. Proin velit neque, consequat quis nunc nec, rutrum sollicitudin ipsum. Sed consequat rutrum commodo. Etiam tincidunt tellus vel leo euismod imperdiet. Suspendisse tempus sed tortor eget sollicitudin. Morbi feugiat, leo non euismod maximus, purus erat bibendum dui, ac fermentum arcu magna id tortor. Mauris mi ante, gravida non ex ut, venenatis ullamcorper nunc. Quisque feugiat justo ut lacus mattis aliquam. Curabitur euismod tincidunt turpis. Integer rutrum, nunc eu iaculis condimentum, massa odio facilisis velit, ut volutpat eros nisi ut risus. Nullam faucibus metus dolor, ut aliquet turpis condimentum non. Aliquam sit amet urna neque. Praesent facilisis blandit tincidunt.</p><p><br></p>', 0, '2025-04-19 13:54:44'),
(20, 'lorem-four', 'Lorem four', 'Dn7HK81io00p1xORi4IASpetwRUvnSs4.png', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper dolor nisi, eget porta urna eleifend eget. Aliquam erat volutpat. Quisque elementum metus id metus pharetra, et sagittis eros rhoncus. Donec lacinia viverra erat, vitae suscipit leo ultricies feugiat. Phasellus vulputate, est a volutpat molestie, ex diam gravida nisi, ac porta nulla urna eu ipsum. Ut lobortis erat id porttitor suscipit. Integer tristique neque eu diam ornare, sit amet tincidunt nulla luctus. Morbi ultricies nisl sit amet mattis bibendum. Nam gravida at est vel eleifend. Cras ultricies congue ligula id convallis. Phasellus sit amet dolor et neque dapibus iaculis non eu dui. Proin neque lorem, condimentum eu lacus ac, facilisis egestas lacus. Nunc fermentum sagittis tellus, eget varius augue sollicitudin vel. Sed gravida ultrices vulputate.</p><p class=\"ql-align-justify\">Proin a hendrerit orci. Maecenas ultricies leo a diam porttitor imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at dui ut felis tincidunt facilisis. Sed interdum arcu ut arcu pharetra vehicula. Duis laoreet congue enim sit amet ullamcorper. Praesent dignissim ligula ut nibh auctor, vitae fringilla odio mattis.</p><p class=\"ql-align-justify\">Sed nulla lorem, tincidunt sit amet imperdiet nec, dapibus sed nulla. Ut eu condimentum elit, vitae consequat diam. Nunc eget dolor ac velit condimentum varius id in ipsum. Ut ultricies mollis diam et consectetur. Praesent ornare sapien lorem, eget condimentum mi iaculis at. Aliquam erat volutpat. Ut aliquam odio sed mattis tincidunt. Pellentesque ac sapien ac tellus pretium volutpat a consectetur lacus. Aenean blandit nulla imperdiet blandit ultrices. Sed faucibus tristique felis sed laoreet. Suspendisse et vulputate dui, ac consectetur eros. Integer elementum dapibus urna, id accumsan dolor fermentum id. Aenean id urna malesuada ligula venenatis venenatis iaculis ac felis.</p><p class=\"ql-align-justify\">Donec hendrerit erat eget tincidunt finibus. Cras lacus odio, luctus sed elit non, pretium efficitur neque. Integer nec nunc sapien. Donec eu velit enim. Curabitur tincidunt lectus in tincidunt mollis. Donec ultrices dui augue, eu pulvinar arcu ultrices ac. Suspendisse eget neque nec orci mattis maximus at ut arcu. Vivamus leo ex, luctus eget lacus eget, rutrum condimentum massa. Vestibulum pulvinar ullamcorper erat eu tincidunt. Donec purus ante, auctor sit amet placerat sed, viverra ut leo. Aenean tristique massa non sodales viverra.</p><p class=\"ql-align-justify\">Quisque ac commodo eros. Etiam id ultricies mauris. Nam urna ex, viverra eu felis id, sodales tincidunt ipsum. Nulla pharetra in mauris fermentum convallis. Proin velit neque, consequat quis nunc nec, rutrum sollicitudin ipsum. Sed consequat rutrum commodo. Etiam tincidunt tellus vel leo euismod imperdiet. Suspendisse tempus sed tortor eget sollicitudin. Morbi feugiat, leo non euismod maximus, purus erat bibendum dui, ac fermentum arcu magna id tortor. Mauris mi ante, gravida non ex ut, venenatis ullamcorper nunc. Quisque feugiat justo ut lacus mattis aliquam. Curabitur euismod tincidunt turpis. Integer rutrum, nunc eu iaculis condimentum, massa odio facilisis velit, ut volutpat eros nisi ut risus. Nullam faucibus metus dolor, ut aliquet turpis condimentum non. Aliquam sit amet urna neque. Praesent facilisis blandit tincidunt.</p><p><br></p>', 0, '2025-04-19 13:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `filename`, `createdAt`) VALUES
(43, '5l2kFGpo9l8qHmn1bhyOVpI2X0ChdHQy.png', '2024-04-06 10:50:48'),
(44, 'C5K9ldid2VbQzGN0FJn7RmYvAldBYTp0.png', '2024-04-06 10:50:52'),
(45, 'sicqacUYe65Ja4uQpqneMb9OHFSvgEwW.png', '2024-04-06 10:50:55'),
(46, 'iS6Ck9qESObGxbHvsnbjZwg0u1tmk5aQ.png', '2024-04-06 10:50:57'),
(47, 'Y9biaHPQHuBThrSG7tkhBY0nTSAToOyS.png', '2024-04-06 10:51:01'),
(48, 'IpHtSvouRUz43GCggo7fGOUqXQOQnbZ5.png', '2024-04-06 10:51:04'),
(49, 'viwWPuRX1BmwvTvTmo4pjzBLPyJ9xC9d.png', '2024-04-06 10:51:07'),
(50, 'GDeA9DOAOqE3zLmKpOqGcla5erHunQgn.php', '2024-07-23 17:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `phonebook`
--

CREATE TABLE `phonebook` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `allow_tag` int(1) DEFAULT 0,
  `allow_note` int(1) DEFAULT 0,
  `allow_chatbot` int(1) DEFAULT 0,
  `contact_limit` varchar(250) DEFAULT NULL,
  `allow_api` int(1) DEFAULT 0,
  `is_trial` int(1) DEFAULT 0,
  `price` bigint(20) DEFAULT NULL,
  `price_strike` varchar(250) DEFAULT NULL,
  `plan_duration_in_days` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `qr_account` int(11) DEFAULT 0,
  `wa_warmer` int(11) DEFAULT 0,
  `rest_api_qr` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `title`, `short_description`, `allow_tag`, `allow_note`, `allow_chatbot`, `contact_limit`, `allow_api`, `is_trial`, `price`, `price_strike`, `plan_duration_in_days`, `createdAt`, `qr_account`, `wa_warmer`, `rest_api_qr`) VALUES
(17, 'Trial', 'This is a trial plan with all the featrues', 1, 1, 1, '100', 1, 1, 0, NULL, '10', '2025-04-19 13:50:55', 10, 1, 1),
(19, 'Premium', 'This ia one-year plan best for small agencies', 1, 1, 1, '100', 1, 0, 499, '299', '365', '2025-04-19 13:52:15', 10, 1, 1),
(20, 'Platinum', 'This plan comes with the one-year validity and cover everything', 1, 1, 1, '10000', 1, 0, 1899, '699', '365', '2025-04-19 13:52:57', 24, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quick_reply`
--

CREATE TABLE `quick_reply` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `msg` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `socket_id` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smtp`
--

CREATE TABLE `smtp` (
  `id` int(11) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `host` varchar(250) DEFAULT NULL,
  `port` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smtp`
--

INSERT INTO `smtp` (`id`, `email`, `host`, `port`, `password`, `createdAt`, `username`) VALUES
(1, 'email@smtp.com', 'email@smtp.com', '587', 'password', '2024-02-28 16:44:12', 'email@smtp.com');

-- --------------------------------------------------------

--
-- Table structure for table `telegram_session`
--

CREATE TABLE `telegram_session` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL,
  `session_id` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `api_id` varchar(250) NOT NULL,
  `api_hash` varchar(250) NOT NULL,
  `data` longtext NOT NULL,
  `session` longtext NOT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templets`
--

CREATE TABLE `templets` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `reviewer_name` varchar(250) DEFAULT NULL,
  `reviewer_position` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`id`, `title`, `description`, `reviewer_name`, `reviewer_position`, `createdAt`) VALUES
(1, '“Highly customisable and friendly\"', 'We work in the hotel business, so keeping in touch with people travelling is very easy using WhatsApp. WhatsCRm help us to have multiple people answering guests. It also allows us to automate basic replies such as the address', 'Eduardo Zeballos', 'CEO', '2024-02-27 14:12:05'),
(3, '\"Cutting-edge and Intuitive Communication Solution\"', '\"At our design studio, effective communication is key to delivering exceptional results for our clients. WhatsCRm has revolutionized our workflow by streamlining communication channels and allowing our team to collaborate seamlessly. With its intuitive interface and customizable features, we can effortlessly manage client inquiries, share project updates, and ensure timely responses. WhatsCRm has become an indispensable tool for enhancing productivity and client satisfaction.\"', 'Sophia Chen', 'Creative Director', '2024-03-01 15:44:21'),
(4, '\"Efficient and Versatile Messaging Platform\"', '\n\"Efficient and Versatile Messaging Platform\"\n\n\"Being in the real estate industry demands constant communication with clients and prospects. WhatsCRm has been a game-changer for our agency, providing us with an efficient and versatile messaging platform. We can easily organize client conversations, schedule property viewings, and follow up on leads all in one place. Its user-friendly interface and robust features have significantly boosted our team\'s productivity and client engagement.\"', 'Jonathan Rodriguez', 'Real Estate Agent', '2024-03-01 15:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role` varchar(250) DEFAULT 'user',
  `uid` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `mobile_with_country_code` varchar(250) DEFAULT NULL,
  `timezone` varchar(250) DEFAULT 'Asia/Kolkata',
  `plan` longtext DEFAULT NULL,
  `plan_expire` varchar(250) DEFAULT NULL,
  `trial` int(1) DEFAULT 0,
  `api_key` varchar(250) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `fcm_data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warmers`
--

CREATE TABLE `warmers` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `instances` longtext DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warmer_script`
--

CREATE TABLE `warmer_script` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warmer_script`
--

INSERT INTO `warmer_script` (`id`, `uid`, `message`, `createdAt`) VALUES
(1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey there', '2025-04-15 10:49:48'),
(2, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey there', '2025-04-15 10:49:50'),
(4, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey', '2025-04-15 11:04:30'),
(5, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey man', '2025-04-15 11:04:32'),
(6, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'how are you ', '2025-04-15 11:04:42'),
(7, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'i am good', '2025-04-15 11:04:44'),
(8, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'how are you doi', '2025-04-15 11:04:46'),
(9, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey', '2025-04-15 11:04:48'),
(10, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'yoa', '2025-04-15 11:04:50'),
(11, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'new', '2025-04-15 11:04:52'),
(12, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'message', '2025-04-15 11:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `wa_call_bot`
--

CREATE TABLE `wa_call_bot` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `flow_id` varchar(250) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wa_call_broadcasts`
--

CREATE TABLE `wa_call_broadcasts` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `campaign_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `flow_id` varchar(255) NOT NULL,
  `status` enum('draft','requesting_permissions','ready','running','paused','completed','failed') DEFAULT 'draft',
  `contacts` longtext NOT NULL,
  `call_delay` int(11) DEFAULT 5000,
  `max_concurrent_calls` int(11) DEFAULT 1,
  `retry_failed` tinyint(1) DEFAULT 0,
  `retry_count` int(11) DEFAULT 0,
  `total_contacts` int(11) DEFAULT 0,
  `permission_requested` int(11) DEFAULT 0,
  `permission_granted` int(11) DEFAULT 0,
  `permission_denied` int(11) DEFAULT 0,
  `calls_initiated` int(11) DEFAULT 0,
  `calls_completed` int(11) DEFAULT 0,
  `calls_failed` int(11) DEFAULT 0,
  `logs` longtext DEFAULT NULL,
  `meta_data` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `started_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wa_call_flows`
--

CREATE TABLE `wa_call_flows` (
  `id` int(11) NOT NULL,
  `is_active` int(11) DEFAULT 1,
  `uid` varchar(250) DEFAULT NULL,
  `flow_id` varchar(250) DEFAULT NULL,
  `source` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wa_call_logs`
--

CREATE TABLE `wa_call_logs` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `call_id` varchar(255) NOT NULL,
  `flow_id` varchar(255) DEFAULT NULL,
  `status` enum('connected','ended','failed') DEFAULT 'connected',
  `transcription_json` longtext DEFAULT NULL,
  `recording_user` varchar(255) DEFAULT NULL,
  `recording_assistant` varchar(255) DEFAULT NULL,
  `recording_stereo` varchar(255) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `meta_data` text DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `webhooks`
--

CREATE TABLE `webhooks` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `method` enum('GET','POST','PUT','DELETE') NOT NULL DEFAULT 'POST',
  `secret` varchar(255) DEFAULT NULL,
  `webhook_id` varchar(36) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `webhooks`
--

INSERT INTO `webhooks` (`id`, `uid`, `name`, `description`, `method`, `secret`, `webhook_id`, `is_active`, `created_at`, `updated_at`) VALUES
(5, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'woocommerce', 'this is for woo order update', 'POST', NULL, 'IGaUVF', 1, '2025-06-28 13:54:38', '2025-06-28 13:54:38'),
(6, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'Shopify webhook', 'this is for shopify webhook', 'POST', NULL, 'X6TgmQ', 1, '2025-06-28 14:04:13', '2025-06-28 14:04:13'),
(7, 'EeBzgZP5V0bs9UL5k7sx6H6ykIafrqZp', 'Test', 'Testing ', 'POST', NULL, '0Eh4gm', 1, '2025-12-08 06:11:21', '2025-12-08 06:11:41'),
(8, 'WlEekjMlfnFSTlLjjIpsXr5d06yh5mRt', 'test', 'test', 'POST', 'test123', 'YkUtbZ', 1, '2026-02-03 12:45:50', '2026-02-03 12:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `webhook_logs`
--

CREATE TABLE `webhook_logs` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `webhook_id` varchar(36) NOT NULL,
  `method` enum('GET','POST','PUT','DELETE') NOT NULL DEFAULT 'POST',
  `event_type` varchar(255) DEFAULT 'unknown',
  `payload` text DEFAULT NULL,
  `status` enum('RECEIVED','FAILED') NOT NULL DEFAULT 'RECEIVED',
  `error` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_private`
--

CREATE TABLE `web_private` (
  `id` int(11) NOT NULL,
  `pay_offline_id` varchar(250) DEFAULT NULL,
  `pay_offline_key` longtext DEFAULT NULL,
  `offline_active` int(1) DEFAULT 0,
  `pay_stripe_id` varchar(250) DEFAULT NULL,
  `pay_stripe_key` varchar(250) DEFAULT NULL,
  `stripe_active` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `pay_paypal_id` varchar(250) DEFAULT NULL,
  `pay_paypal_key` varchar(250) DEFAULT NULL,
  `paypal_active` varchar(250) DEFAULT NULL,
  `rz_id` varchar(250) DEFAULT NULL,
  `rz_key` varchar(250) DEFAULT NULL,
  `rz_active` varchar(250) DEFAULT NULL,
  `pay_paystack_id` varchar(250) DEFAULT NULL,
  `pay_paystack_key` varchar(250) DEFAULT NULL,
  `paystack_active` varchar(250) DEFAULT NULL,
  `qr_storage` varchar(250) DEFAULT 'local',
  `mongodb_string` longtext DEFAULT NULL,
  `embed_app_sec` varchar(250) DEFAULT NULL,
  `embed_app_id` varchar(250) DEFAULT NULL,
  `embed_app_config` varchar(250) DEFAULT NULL,
  `teleAppId` text DEFAULT NULL,
  `teleHash` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_private`
--

INSERT INTO `web_private` (`id`, `pay_offline_id`, `pay_offline_key`, `offline_active`, `pay_stripe_id`, `pay_stripe_key`, `stripe_active`, `createdAt`, `pay_paypal_id`, `pay_paypal_key`, `paypal_active`, `rz_id`, `rz_key`, `rz_active`, `pay_paystack_id`, `pay_paystack_key`, `paystack_active`, `qr_storage`, `mongodb_string`, `embed_app_sec`, `embed_app_id`, `embed_app_config`, `teleAppId`, `teleHash`) VALUES
(1, 'Pay offline', 'Pay offline on this account number xxxxxxxxx\nand send a screenshot to us on this email xxx@xxx.com', 1, 'xxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', 1, '2024-02-26 17:06:06', 'AfNGna9GM7u9H-WnMC-3eCKzOQwCBcLdmiMTswtIrpkEWeYuju6h6gk2STlBdmYNE52nWPnAvEZH-6Uu', 'ENwh2FQOJVFlJ2i360zWmHCWqQDIQBjz0opCok4kuD8AcTDNrk4PpkIKLdrGznu-hIu1UdNQV0oFZO1C', '1', 'xxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', '1', NULL, NULL, NULL, 'local', 'mongodb+srv://wacrm:jaYO24C2TJZTkao5@sessions.cgiss4u.mongodb.net/?retryWrites=true&w=majority&appName=sessions', '234729cb8fe33877342539f47ddca33e', '1533489467877260', '1631983291575709', '31473169', '1267a0139190705dfc7808724a643bec');

-- --------------------------------------------------------

--
-- Table structure for table `web_public`
--

CREATE TABLE `web_public` (
  `id` int(11) NOT NULL,
  `currency_code` varchar(250) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `app_name` varchar(250) DEFAULT NULL,
  `custom_home` varchar(250) DEFAULT NULL,
  `is_custom_home` int(1) DEFAULT 0,
  `meta_description` longtext DEFAULT NULL,
  `currency_symbol` varchar(250) DEFAULT NULL,
  `chatbot_screen_tutorial` varchar(250) DEFAULT NULL,
  `broadcast_screen_tutorial` varchar(250) DEFAULT NULL,
  `home_page_tutorial` varchar(250) DEFAULT NULL,
  `login_header_footer` int(1) DEFAULT 1,
  `exchange_rate` varchar(250) DEFAULT NULL,
  `google_client_id` varchar(250) DEFAULT NULL,
  `google_login_active` int(11) DEFAULT 1,
  `rtl` int(11) DEFAULT 0,
  `other` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_public`
--

INSERT INTO `web_public` (`id`, `currency_code`, `logo`, `app_name`, `custom_home`, `is_custom_home`, `meta_description`, `currency_symbol`, `chatbot_screen_tutorial`, `broadcast_screen_tutorial`, `home_page_tutorial`, `login_header_footer`, `exchange_rate`, `google_client_id`, `google_login_active`, `rtl`, `other`) VALUES
(1, 'EUR', 'FOJPDz2ggPeya6yDTBfhkKtxkubH05WZ.png', 'whatsCRM', 'https://google.com', 0, 'des updated', '$', 'https://youtu.be/Wg_23HLxdHc?si=yv5aIMY1OsnwUrNy', 'https://youtu.be/Wg_23HLxdHc?si=yv5aIMY1OsnwUrNy', 'https://youtu.be/rFNoXYE_efo', 1, '1', 'xxxxxxxxxxxxxxx', 0, 0, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_owner_uid` (`owner_uid`(150)),
  ADD KEY `idx_uid` (`uid`(150)),
  ADD KEY `idx_owner_active` (`owner_uid`(150),`is_active`),
  ADD KEY `idx_id` (`id`);

--
-- Indexes for table `agent_chats`
--
ALTER TABLE `agent_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_task`
--
ALTER TABLE `agent_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD UNIQUE KEY `idxunique` (`session`,`id`),
  ADD KEY `idxsession` (`session`),
  ADD KEY `idxid` (`id`);

--
-- Indexes for table `beta_api_logs`
--
ALTER TABLE `beta_api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beta_campaign`
--
ALTER TABLE `beta_campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beta_campaign_logs`
--
ALTER TABLE `beta_campaign_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beta_chatbot`
--
ALTER TABLE `beta_chatbot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid_active` (`uid`(150),`active`),
  ADD KEY `idx_uid_origin` (`uid`(100),`origin_id`(100)),
  ADD KEY `idx_uid_flow` (`uid`(120),`flow_id`(120)),
  ADD KEY `idx_uid_source_active` (`uid`(100),`source`(50),`active`);

--
-- Indexes for table `beta_chats`
--
ALTER TABLE `beta_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid_chatid` (`uid`(100),`chat_id`(100)),
  ADD KEY `idx_uid_origin` (`uid`(120),`origin`(50)),
  ADD KEY `idx_uid_updated` (`uid`(150)),
  ADD KEY `idx_sender_mobile` (`sender_mobile`(150)),
  ADD KEY `idx_uid_unread` (`uid`(150),`unread_count`),
  ADD KEY `idx_uid_origin_updated` (`uid`(80),`origin`(50));

--
-- Indexes for table `beta_conversation`
--
ALTER TABLE `beta_conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid_chat_route` (`uid`(50),`chat_id`(50),`route`(50)),
  ADD KEY `idx_uid_metachatid` (`uid`(100),`metaChatId`(100)),
  ADD KEY `idx_chat_timestamp` (`chat_id`(100)),
  ADD KEY `idx_uid_chat_timestamp` (`uid`(50),`chat_id`(50)),
  ADD KEY `idx_chat_type_route` (`chat_id`(80),`type`(50),`route`(50));

--
-- Indexes for table `beta_flows`
--
ALTER TABLE `beta_flows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid_active_source` (`uid`(120),`is_active`,`source`(50)),
  ADD KEY `idx_uid_flow` (`uid`(120),`flow_id`(120));

--
-- Indexes for table `broadcast`
--
ALTER TABLE `broadcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broadcast_log`
--
ALTER TABLE `broadcast_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_tags`
--
ALTER TABLE `chat_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`(150));

--
-- Indexes for table `chat_widget`
--
ALTER TABLE `chat_widget`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid_mobile` (`uid`(120),`mobile`(80)),
  ADD KEY `idx_uid` (`uid`(150));

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flow`
--
ALTER TABLE `flow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flow_data`
--
ALTER TABLE `flow_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flow_session`
--
ALTER TABLE `flow_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid_flow_sender` (`uid`(50),`flow_id`(50),`sender_mobile`(80)),
  ADD KEY `idx_uid_flow` (`uid`(120),`flow_id`(120)),
  ADD KEY `idx_uid_origin_flow` (`uid`(80),`origin`(50),`flow_id`(80));

--
-- Indexes for table `gen_links`
--
ALTER TABLE `gen_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `g_auth`
--
ALTER TABLE `g_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instance`
--
ALTER TABLE `instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uniqueid` (`uniqueId`(150)),
  ADD KEY `idx_uid_status` (`uid`(120),`status`(50)),
  ADD KEY `idx_uid` (`uid`(150));

--
-- Indexes for table `meta_api`
--
ALTER TABLE `meta_api`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`(150));

--
-- Indexes for table `meta_templet_media`
--
ALTER TABLE `meta_templet_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_app`
--
ALTER TABLE `mobile_app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phonebook`
--
ALTER TABLE `phonebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`(150));

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quick_reply`
--
ALTER TABLE `quick_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`(150));

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smtp`
--
ALTER TABLE `smtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telegram_session`
--
ALTER TABLE `telegram_session`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_id` (`session_id`) USING HASH;

--
-- Indexes for table `templets`
--
ALTER TABLE `templets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`(150));

--
-- Indexes for table `warmers`
--
ALTER TABLE `warmers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid_active` (`uid`(150),`is_active`);

--
-- Indexes for table `warmer_script`
--
ALTER TABLE `warmer_script`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`(150));

--
-- Indexes for table `wa_call_bot`
--
ALTER TABLE `wa_call_bot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wa_call_broadcasts`
--
ALTER TABLE `wa_call_broadcasts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_id` (`campaign_id`),
  ADD KEY `idx_uid` (`uid`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_campaign_id` (`campaign_id`);

--
-- Indexes for table `wa_call_flows`
--
ALTER TABLE `wa_call_flows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wa_call_logs`
--
ALTER TABLE `wa_call_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`),
  ADD KEY `idx_call_id` (`call_id`),
  ADD KEY `idx_flow_id` (`flow_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webhook_logs`
--
ALTER TABLE `webhook_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_private`
--
ALTER TABLE `web_private`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_public`
--
ALTER TABLE `web_public`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_chats`
--
ALTER TABLE `agent_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_task`
--
ALTER TABLE `agent_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `beta_api_logs`
--
ALTER TABLE `beta_api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beta_campaign`
--
ALTER TABLE `beta_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beta_campaign_logs`
--
ALTER TABLE `beta_campaign_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beta_chatbot`
--
ALTER TABLE `beta_chatbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `beta_chats`
--
ALTER TABLE `beta_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beta_conversation`
--
ALTER TABLE `beta_conversation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beta_flows`
--
ALTER TABLE `beta_flows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `broadcast`
--
ALTER TABLE `broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `broadcast_log`
--
ALTER TABLE `broadcast_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `chatbot`
--
ALTER TABLE `chatbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_tags`
--
ALTER TABLE `chat_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_widget`
--
ALTER TABLE `chat_widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `flow`
--
ALTER TABLE `flow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `flow_data`
--
ALTER TABLE `flow_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flow_session`
--
ALTER TABLE `flow_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gen_links`
--
ALTER TABLE `gen_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `g_auth`
--
ALTER TABLE `g_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instance`
--
ALTER TABLE `instance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meta_api`
--
ALTER TABLE `meta_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meta_templet_media`
--
ALTER TABLE `meta_templet_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_app`
--
ALTER TABLE `mobile_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `phonebook`
--
ALTER TABLE `phonebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `quick_reply`
--
ALTER TABLE `quick_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smtp`
--
ALTER TABLE `smtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `telegram_session`
--
ALTER TABLE `telegram_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `templets`
--
ALTER TABLE `templets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `warmers`
--
ALTER TABLE `warmers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `warmer_script`
--
ALTER TABLE `warmer_script`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wa_call_bot`
--
ALTER TABLE `wa_call_bot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wa_call_broadcasts`
--
ALTER TABLE `wa_call_broadcasts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `wa_call_flows`
--
ALTER TABLE `wa_call_flows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wa_call_logs`
--
ALTER TABLE `wa_call_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `webhook_logs`
--
ALTER TABLE `webhook_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `web_private`
--
ALTER TABLE `web_private`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `web_public`
--
ALTER TABLE `web_public`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
